-- How-to use this dissector:
--   lua support must be enabled in wireshark, check /etc/wireshark/init.lua 
--   ("disable_lua = true; do return end;" file must be commented or deleted)
--   $ wireshark -X lua_script:wireshark-dissector.lua
--   Start a capture or load a capture file
--   Right-click on a PPP packet, click 'Decode As...'
--   Go to the 'Transport' tab, choose 'PERLIMPINPIN' in the list
--   Click 'Apply', then 'Close'
--   Profit!

do
  local data_dis = Dissector.get("data")

  ---
  --- Main dissector
  ---

  local p_ppp = Proto("perlimpinpin", "Perlimpinpin")

  local vs_types = {
    [0x00] = 'system',
    [0x01] = 'log',
    [0x10] = 'room',
  }

  local vs_nodes = {
    [0x80] = 'Addanc Hreidmarr/routeur',
    [0x81] = 'Addanc Hreidmarr/strat',
    [0x82] = 'Addanc Hreidmarr/position',
    [0x83] = 'Addanc simulator',
    [0x84] = 'Addanc UI',

    [0xff] = 'Broadcast',
  }
  for i=0x00,0x0F do vs_nodes[i] = 'reserved' end
  for i=0x85,0x8F do vs_nodes[i] = 'Addanc' end


  local f_plsize = ProtoField.uint16("perlimpinpin.plsize", "Payload Size", base.DEC)
  local f_src = ProtoField.uint8("perlimpinpin.src", "Src", base.HEX, vs_nodes)
  local f_dst = ProtoField.uint8("perlimpinpin.dst", "Dst", base.HEX, vs_nodes)
  local f_type = ProtoField.uint8("perlimpinpin.type", "Type", base.HEX, vs_types)
  local f_header_crc = ProtoField.uint16("perlimpinpin.header_crc", "Header CRC", base.HEX)
  local f_payload_crc = ProtoField.uint16("perlimpinpin.payload_crc", "Payload CRC", base.HEX)

  p_ppp.fields = { f_plsize, f_src, f_dst, f_type, f_header_crc, f_payload_crc }

  function p_ppp.dissector(buf, pkt, root)
    pkt.cols.protocol = "PPP"

    local buf_len = buf:len()
    if buf(0,1):uint() ~= 0x50 then
      return nil
    end
    if buf_len < 8 then
      return DESEGMENT_ONE_MORE_SEGMENT
    end

    local plsize = buf(1,2):le_uint()
    local frame_size = 8 + plsize + 2
    if buf_len < frame_size then
      return frame_size
    end

    local tree = root:add(p_ppp)
    tree:add_le(f_plsize, plsize)
    tree:add_le(f_src, buf(3,1))
    tree:add_le(f_dst, buf(4,1))
    tree:add_le(f_type, buf(5,1))
    tree:add_le(f_header_crc, buf(6,2))
    tree:add_le(f_payload_crc, buf(frame_size-2,2))

    local typ = buf(5,1):uint()
    local dissector = vs_types[typ]
    if dissector ~= nil then
      dissector = Dissector.get("perlimpinpin." .. dissector)
    end
    if dissector == nil then
      dissector = data_dis
    end
    dissector:call(buf(8,plsize):tvb(), pkt, tree)
  end

  local tcp_table = DissectorTable.get("tcp.port")
  tcp_table:add(4000, p_ppp)  -- random port, just to register the dissector


  ---
  --- Payload dissectors
  ---

  --- system
  do
    local p_ppp_system = Proto("perlimpinpin.system", "Perlimpinpin System")

    local vs_system_ids = {
      [0] = 'ack',
      [1] = 'nak',
      [2] = 'ping',
      [3] = 'traceroute',
      [4] = 'name',
      [5] = 'stop',
      [6] = 'reset',
      [7] = 'supported-payloads',
    }

    local f_way = ProtoField.uint8("perlimpinpin.system.way", "Way", base.DEC, {[0]='response', [1]='request'}, 0x80)
    local f_id = ProtoField.uint8("perlimpinpin.system.id", "ID", base.DEC, vs_system_ids, 0x7F)
    local f_ping_value = ProtoField.uint8("perlimpinpin.system.ping_value", "Value", base.HEX_DEC)
    local f_traceroute_dist = ProtoField.uint8("perlimpinpin.system.traceroute.dist", "Distance", base.DEC)
    local f_name = ProtoField.string("perlimpinpin.system.name", "Name")

    p_ppp_system.fields = { f_way, f_id, f_ping_value, f_name }

    function p_ppp_system.dissector(buf, pkt, root)
      local tree = root:add(p_ppp_system)
      tree:add_le(f_way, buf(0,1))
      tree:add_le(f_id, buf(0,1))

      local id = buf(0,1):uint() % 0x80
      if id == 2 then
        tree:add_le(f_ping_value, buf(1,1))
      elseif id == 3 then
        tree:add_le(f_traceroute_dist, buf(1,1))
      elseif id == 4 then
        tree:add_le(f_name, buf(1))
      elseif id == 7 then
        --TODO
      end
    end
  end

  --- log
  do
    local p_ppp_log = Proto("perlimpinpin.log", "Perlimpinpin Log")

    local vs_log_severities = {
      [0] = 'debug',
      [1] = 'notice',
      [2] = 'info',
      [3] = 'warning',
      [4] = 'error',
    }

    local f_ack = ProtoField.uint8("perlimpinpin.log.ack", "Ack", base.DEC, {[0]='no', [1]='yes'}, 0x80)
    local f_severity = ProtoField.uint8("perlimpinpin.log.severity", "Severity", base.DEC, vs_log_severities, 0x7F)
    local f_msg = ProtoField.string("perlimpinpin.log.msg", "Message")

    p_ppp_log.fields = { f_ack, f_severity, f_msg }

    function p_ppp_log.dissector(buf, pkt, root)
      local tree = root:add(p_ppp_log)
      tree:add_le(f_ack, buf(0,1))
      tree:add_le(f_severity, buf(0,1))
      tree:add_le(f_msg, buf(1))
    end
  end

end


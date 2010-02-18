#!/usr/bin/env python

import struct
from cStringIO import StringIO



## Midi parsing


def midi_unpack(fmt, f):
  """Unpack from an I/O object."""
  fmt = '>'+fmt
  n = struct.calcsize(fmt)
  return struct.unpack(fmt, f.read(n))

def midi_unpack_varlen(f):
  """Read a variable length number."""
  n = 0
  while True:
    b, = midi_unpack('B', f)
    n = (n<<7) | (b & 0x7F)
    if not b & 0x80:
      return n


class MidiFile:
  """
  Midi file content.

  Attributes:
    format -- format type (0, 1 or 2)
    smpte_fps -- SMPTE frame number
    ticks_per_frame -- ticks per SMPTE frame
    ticks_per_beat -- ticks per quarter of note
    tracks -- tuple of MidiTrack objects

  """

  @classmethod
  def parse(cls, f):

    mf = cls()

    # header chunk
    ch_id, ch_size = midi_unpack('4sL', f)
    assert ch_id == "MThd", "invalid header chunk ID"
    assert ch_size == 6, "invalid header chunk size"
    format, nb_tracks, time_div = midi_unpack('3H', f)
    assert format in (0,1,2), "invalid format type"
    if format == 0:
      assert nb_tracks == 1, "invalid track number with format type 0"
    mf.format = format

    if time_div & 0x8000:
      fps = (time_div & 0x7F00) > 8
      assert fps in (24,25,29,30), "invalid SMPTE frame number"
      mf.smpte_fps = fps
      mf.ticks_per_frame = time_div & 0xFF
    else:
      mf.ticks_per_beat = time_div & ~0x8000

    # tracks
    mf.tracks = tuple( MidiTrack.parse(f) for i in range(nb_tracks) )

    return mf


  def get_sec_per_tick(self, tr=0):
    """Retrieve tick duration from a track.
    Return a list of (dt, tick_duration) pairs.
    """

    if hasattr(self, 'ticks_per_frame'):
      return [(0, 1 / (self.smpte_fps * self.ticks_per_frame))]
    assert hasattr(self, 'ticks_per_beat'), "no time division info"

    lspb = []  # seconds per beat
    dt = 0
    for e in self.tracks[tr].events:
      dt += e.dt
      if not isinstance(e, MidiMetaEvent): continue
      if e.type == 'SET_TEMPO':
        lspb.append( (dt, e.microsec_per_beat / 1000000.0) )
        dt = 0
    if len(lspb) == 0:
      lspb = [(0,60.0/120)]  # default: 120 bpm

    return list( (dt, float(spb)/self.ticks_per_beat) for dt,spb in lspb )



class MidiTrack:
  """
  Midi track content.

  Attributes:
    events -- tuple of MidiEvent objects

  """

  @classmethod
  def parse(cls, f):

    mt = cls()

    # track chunk
    ch_id, ch_size = midi_unpack('4sL', f)
    assert ch_id == "MTrk", "invalid track chunk ID"
    
    # events
    def gen_events(s):
      n = len(s)
      sio = StringIO(s)
      while sio.tell() < n:
        yield MidiEvent.parse(sio)
    mt.events = tuple( gen_events(f.read(ch_size)) )

    return mt



class MidiEvent:
  """
  Midi event.
  
  Attributes:
    dt -- event delta time

  """

  @classmethod
  def parse(cls, f):
    dt = midi_unpack_varlen(f)
    type, = midi_unpack('B', f)
    if type == 0xFF:
      me = MidiMetaEvent.parse(f)
    elif type in (0xF0, 0xF7):
      me = MidiSysExEvent.parse(f, type)
    else:
      me = MidiChannelEvent.parse(f, type)
    me.dt = dt
    return me



class MidiChannelEvent(MidiEvent):
  """
  Midi channel event.

  Attributes:
    type -- channel event type as a string (see CHANNEL_EVENT_TYPES)
    channel -- MIDI channel
    p1, p2 -- event parameters
    type specific fields

  """

  CHANNEL_EVENT_TYPES = {
      0x8 : 'NOTE_OFF',
      0x9 : 'NOTE_ON',
      0xA : 'NOTE_AFTERTOUCH',
      0xB : 'CONTROLLER',
      0xC : 'PROGRAM_CHANGE',
      0xD : 'CHANNEL_AFTERTOUCH',
      0xE : 'PITCH_BEND',
      }

  @classmethod
  def parse(cls, f, type):

    assert 0x80 <= type < 0xF0, "invalid channel event type"
    me = cls()

    ch_type = type >> 4
    me.type = cls.CHANNEL_EVENT_TYPES[ch_type]
    me.channel = type & 0xF
    me.p1, me.p2 = midi_unpack('BB', f)
    if ch_type in (0x8, 0x9):
      me.note, me.velocity = me.p1, me.p2
    elif ch_type == 0xA:
      me.note, me.aftertouch = me.p1, me.p2
    elif ch_type == 0xB:
      me.ctrl_type, me.ctrl_val = me.p1, me.p2
    elif ch_type == 0xC:
      me.prog_nb = me.p1
    elif ch_type == 0xD:
      me.aftertouch = me.p1
    elif ch_type == 0xE:
      me.pitch = me.p1 + (me.p2 << 4)

    return me



class MidiMetaEvent(MidiEvent):
  """
  Midi meta event.

  Attributes:
    type -- meta event type as a string (see META_EVENT_TYPES)
    data -- data as a string
    type specific fields

  """

  META_EVENT_TYPES = {
      0x00 : 'SEQUENCE_NUMBER',
      0x01 : 'TEXT_EVENT',
      0x02 : 'COPYRIGHT_NOTICE',
      0x03 : 'SEQUENCE_TRACK_NAME',
      0x04 : 'INSTRUMENT_NAME',
      0x05 : 'LYRICS',
      0x06 : 'MARKER',
      0x07 : 'CUE_POINT',
      0x20 : 'MIDI_CHANNEL_PREFIX',
      0x2f : 'END_OF_TRACK',
      0x51 : 'SET_TEMPO',
      0x54 : 'SMPTE_OFFSET',
      0x58 : 'TIME_SIGNATURE',
      0x59 : 'KEY_SIGNATURE',
      0x7F : 'SEQUENCER_SPECIFIC',
      }

  @classmethod
  def parse(cls, f):

    me = cls()

    type, = midi_unpack('B', f)
    assert type in cls.META_EVENT_TYPES, "invalid meta event type"
    me.type = cls.META_EVENT_TYPES[type]
    n = midi_unpack_varlen(f)
    me.data = f.read(n)

    if type == 0x00:
      assert len(me.data) == 2, "invalid meta sequence number event data length"
      me.number, = midi_unpack('H', StringIO(me.data))
    elif type == 0x20:
      assert len(me.data) == 1, "invalid meta MIDI channel prefix event data length"
      me.channel, = midi_unpack('B', StringIO(me.data))
      assert 0 <= me.channel < 16, "invalid meta MIDI channel prefix event channel"
    elif type == 0x2F:
      assert len(me.data) == 0, "invalid meta end of track event data length"
    elif type == 0x51:
      assert len(me.data) == 3, "invalid meta MIDI channel prefix event data length"
      a = midi_unpack('3B', StringIO(me.data))
      me.microsec_per_beat = int('%02x%02x%02x'% a, 16)
    elif type == 0x54:
      assert len(me.data) == 5, "invalid meta SMPTE offset event data length"
      a = midi_unpack('5B', StringIO(me.data))
      me.smpte_offset = {
          #XXX values are not checked
          'h': a[0], 'm': a[1], 's': a[2],
          'fr': a[3], 'subfr': a[4],
          }
    elif type == 0x58:
      assert len(me.data) == 4, "invalid meta time signature event data length"
      me.numer,me.denom,me.metro,me.nb32nds = midi_unpack('4B', StringIO(me.data))
    elif type == 0x59:
      assert len(me.data) == 2, "invalid meta key signature event data length"
      me.key,me.scale = midi_unpack('bB', StringIO(me.data))
      assert -7 <= me.key <= 7, "invalid meta key signature event key: %d" % me.key
      assert me.scale in (0,1), "invalid meta key signature event scale: %d" % me.scale

    return me



class MidiSysExEvent(MidiEvent):
  """
  Midi system exclusive event.

  Attributes:
    data -- data as a string
    type -- SysEx type, 0xF0 or 0xF7

  """

  @classmethod
  def parse(cls, f, type):

    assert type in (0xF0,0xF7), "invalid SysEx event type"
    me = cls()

    me.type = type
    n = midi_unpack_varlen(f)
    me.data = f.read(n)
    return me



## Midi processing

class SongNote:
  """Gather note information.

  Midi events are timed actions.
  Song notes are sounds with a given duration.
  For chords, freq and period give data of the first sound. freqs and periods
  contains all data. Volume is the average volume of all notes.
  For rests, freq and period are None, freqs and periods are empty lists.

  Attributes:
    freq -- note frequency, or None
    period -- note period (1/freq), or None
    duration -- note duration (in seconds)
    freqs -- list of frequencies (for chords)
    periods -- list of periods (for chords)

  """

  def __init__(self, notes=[], dt=0, vol=0.5):
    self.duration = dt
    self.freqs = list( self.note2freq(n) for n in notes )
    self.periods = list( 1/f for f in self.freqs )
    try:
      self.freq = self.freqs[0]
      self.period = self.periods[0]
    except IndexError:
      self.freq = None
      self.period = None
    assert 0 <= vol <= 1, "invalid volume"
    self.volume = float(vol)

  @classmethod
  def note2freq(cls, n):
    """Returns frequency of a MIDI note."""
    assert 0 <= n < 128, "invalid MIDI note: %d" % n
    return 440.0 * 2**((n-69)/12.0)

  @classmethod
  def track2notes(cls, track, lspt, octave=0):
    """Retrieve notes from a MidiTrack.

      track -- MidiTrack to convert
      lspt -- list of (dt, second per tick) pairs
      octave -- octave variation

    Return a list of SongNotes.
    Volume is retrieved from "main volume" controller events.
    """

    # Generator which filter events and group them by time offset.
    def gen_simultaneous(events, lspt):
      cur = []
      it_spt = iter(lspt)
      try:
        cur_dt_spt, cur_spt = it_spt.next()
        assert cur_dt_spt == 0, "not tempo info for first events"
      except StopIteration:
        raise ArgumentError("empty tempo info")
      try:
        next_dt_spt, next_spt = it_spt.next()
      except StopIteration:
        it_spt = None
        next_dt_spt, next_spt = None, None

      for e in events:
        cur_dt_spt += e.dt
        if not isinstance(e, MidiChannelEvent): continue
        assert e.channel==1, "multi channel not supported"
        if e.dt != 0 and len(cur) != 0:
          yield e.dt*cur_spt, cur
          cur = []

        if next_dt_spt is not None and cur_dt_spt >= next_dt_spt:
          cur_dt_spt, cur_spt = next_dt_spt, next_spt
          if iter is not None:
            try:
              next_dt_spt, next_spt = it_spt.next()
            except StopIteration:
              it_spt = None
              next_dt_spt, next_spt = None, None
          
        cur.append(e)
      if len(cur) != 0:
        yield 0, cur
      return

    notes = []  # returned list of notes
    notes_on = set()  # active midi notes
    vol = 0.5
    dt_prev = 0  # previous dt
    for dt, evs in gen_simultaneous(track.events, lspt):

      notes_off = set( e.note for e in evs if e.type == 'NOTE_OFF' )
      assert notes_off == notes_on, "simultaneous notes not part of a chord"
      notes.append( SongNote( list(n+12*octave for n in notes_on), dt_prev, vol) )
      dt_prev = dt

      notes_on = set( e.note for e in evs if e.type == 'NOTE_ON' )
      for e in evs:
        if e.type in ('NOTE_ON','NOTE_OFF'): continue
        if e.type == 'CONTROLLER' and e.ctrl_type == 7:
          vol = float(e.ctrl_val) / 127

    # add a final 'OFF'
    notes.append( SongNote([]) )

    return notes



if __name__ == '__main__':
  from optparse import OptionParser
  import time, sys

  parser = OptionParser(
      description="Convert MIDI to PWM frequencies",
      usage="%prog [OPTIONS] FILE",
      )
  parser.add_option('-t', '--tempo-scale', dest='tempo',
      help="tempo scale")
  parser.add_option('-g', '--note-gap', dest='gap',
      help="time between notes, milliseconds or ratio")
  parser.add_option('-v', '--volume', dest='volref',
      help="volume reference value (in %)")
  parser.add_option('-8', '--octave', dest='octave',
      help="change octave")
  parser.set_defaults(
      tempo=1.0,
      gap=0,
      volref = 0.5,
      octave = 0,
      )
  (opts, args) = parser.parse_args()
  opts.tempo = float(opts.tempo)
  opts.gap = float(opts.gap)
  opts.volref = float(opts.volref)/100  # convert
  opts.octave = int(opts.octave)

  if len(args) < 0:
    parser.parse_error("MIDI file missing")

  mf = MidiFile.parse( open(args[0], 'rb') )
  notes = SongNote.track2notes(mf.tracks[1], mf.get_sec_per_tick(), octave=opts.octave)

  #XXX output for Bookie (periodm12)
  for n in notes:
    if n.duration == 0: continue # required to avoid UART flooding
    if n.period is None:
      p1 = 0
      p2 = 0
    else:
      p1 = round(1000000*n.period)
      if len(n.periods) > 1 and False: #XXX disable chords, render is bad
        # chord
        p2 = round(1000000*sum(n.periods[1:])/(len(n.periods)-1))
      else:
        p2 = p1
    # note: low volume change chord rendering
    pm = p1+p2
    if n.volume < opts.volref:
      l = (pm, p1, 0)
    else:
      l = (pm, p1, p2)
    sys.stdout.write("%x\n%x\n%x\n" % l)
    sys.stdout.flush()

    t = n.duration * opts.tempo
    gap = 0
    if opts.gap and opts.gap < 1:
      gap = opts.gap * t
      t *= 1-opts.gap
    else:
      gap = opts.gap
    time.sleep( t )
    if gap:
      sys.stdout.write("0 0 0\n")
      sys.stdout.flush()
      time.sleep( opts.gap )



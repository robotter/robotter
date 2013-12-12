<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Hidden" color="15" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="frames">
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+24V">
<wire x1="1.27" y1="-0.635" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+24V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" prefix="+3V3">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+24V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+24V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="avr-7">
<packages>
<package name="TQFP100">
<description>&lt;b&gt;100-lead Thin Quad Flat Pack Package Outline&lt;/b&gt;</description>
<wire x1="-7" y1="6.25" x2="-6.25" y2="7" width="0.254" layer="21"/>
<wire x1="-6.25" y1="7" x2="6.75" y2="7" width="0.254" layer="21"/>
<wire x1="6.75" y1="7" x2="7" y2="6.75" width="0.254" layer="21"/>
<wire x1="7" y1="6.75" x2="7" y2="-6.75" width="0.254" layer="21"/>
<wire x1="7" y1="-6.75" x2="6.75" y2="-7" width="0.254" layer="21"/>
<wire x1="6.75" y1="-7" x2="-6.75" y2="-7" width="0.254" layer="21"/>
<wire x1="-6.75" y1="-7" x2="-7" y2="-6.75" width="0.254" layer="21"/>
<wire x1="-7" y1="-6.75" x2="-7" y2="6.25" width="0.254" layer="21"/>
<wire x1="-0.0099" y1="1.3299" x2="0.39" y2="0.9299" width="0.1016" layer="51" curve="-90" cap="flat"/>
<circle x="-6" y="6" radius="0.2499" width="0.254" layer="21"/>
<circle x="3.59" y="-0.7699" radius="0.4999" width="0.1016" layer="51"/>
<smd name="1" x="-8" y="6" dx="1.5" dy="0.3474" layer="1"/>
<smd name="2" x="-8" y="5.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="3" x="-8" y="5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="4" x="-8" y="4.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="5" x="-8" y="4" dx="1.5" dy="0.3474" layer="1"/>
<smd name="6" x="-8" y="3.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="7" x="-8" y="3" dx="1.5" dy="0.3474" layer="1"/>
<smd name="8" x="-8" y="2.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="9" x="-8" y="2" dx="1.5" dy="0.3474" layer="1"/>
<smd name="10" x="-8" y="1.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="11" x="-8" y="1" dx="1.5" dy="0.3474" layer="1"/>
<smd name="12" x="-8" y="0.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="13" x="-8" y="0" dx="1.5" dy="0.3474" layer="1"/>
<smd name="14" x="-8" y="-0.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="15" x="-8" y="-1" dx="1.5" dy="0.3474" layer="1"/>
<smd name="16" x="-8" y="-1.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="17" x="-8" y="-2" dx="1.5" dy="0.3474" layer="1"/>
<smd name="18" x="-8" y="-2.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="19" x="-8" y="-3" dx="1.5" dy="0.3474" layer="1"/>
<smd name="20" x="-8" y="-3.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="21" x="-8" y="-4" dx="1.5" dy="0.3474" layer="1"/>
<smd name="22" x="-8" y="-4.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="23" x="-8" y="-5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="24" x="-8" y="-5.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="25" x="-8" y="-6" dx="1.5" dy="0.3474" layer="1"/>
<smd name="26" x="-6" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="27" x="-5.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="28" x="-5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="29" x="-4.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="30" x="-4" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="31" x="-3.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="32" x="-3" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="33" x="-2.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="34" x="-2" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="35" x="-1.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="36" x="-1" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="37" x="-0.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="38" x="0" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="39" x="0.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="40" x="1" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="41" x="1.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="42" x="2" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="43" x="2.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="44" x="3" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="45" x="3.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="46" x="4" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="47" x="4.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="48" x="5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="49" x="5.5" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="50" x="6" y="-8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="51" x="8" y="-6" dx="1.5" dy="0.3474" layer="1"/>
<smd name="52" x="8" y="-5.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="53" x="8" y="-5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="54" x="8" y="-4.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="55" x="8" y="-4" dx="1.5" dy="0.3474" layer="1"/>
<smd name="56" x="8" y="-3.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="57" x="8" y="-3" dx="1.5" dy="0.3474" layer="1"/>
<smd name="58" x="8" y="-2.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="59" x="8" y="-2" dx="1.5" dy="0.3474" layer="1"/>
<smd name="60" x="8" y="-1.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="61" x="8" y="-1" dx="1.5" dy="0.3474" layer="1"/>
<smd name="62" x="8" y="-0.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="63" x="8" y="0" dx="1.5" dy="0.3474" layer="1"/>
<smd name="64" x="8" y="0.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="65" x="8" y="1" dx="1.5" dy="0.3474" layer="1"/>
<smd name="66" x="8" y="1.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="67" x="8" y="2" dx="1.5" dy="0.3474" layer="1"/>
<smd name="68" x="8" y="2.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="69" x="8" y="3" dx="1.5" dy="0.3474" layer="1"/>
<smd name="70" x="8" y="3.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="71" x="8" y="4" dx="1.5" dy="0.3474" layer="1"/>
<smd name="72" x="8" y="4.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="73" x="8" y="5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="74" x="8" y="5.5" dx="1.5" dy="0.3474" layer="1"/>
<smd name="75" x="8" y="6" dx="1.5" dy="0.3474" layer="1"/>
<smd name="76" x="6" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="77" x="5.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="78" x="5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="79" x="4.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="80" x="4" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="81" x="3.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="82" x="3" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="83" x="2.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="84" x="2" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="85" x="1.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="86" x="1" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="87" x="0.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="88" x="0" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="89" x="-0.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="90" x="-1" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="91" x="-1.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="92" x="-2" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="93" x="-2.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="94" x="-3" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="95" x="-3.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="96" x="-4" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="97" x="-4.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="98" x="-5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="99" x="-5.5" y="8" dx="0.3474" dy="1.5" layer="1"/>
<smd name="100" x="-6" y="8" dx="0.3474" dy="1.5" layer="1"/>
<text x="-6.395" y="9.2451" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.1801" y="2.8001" size="1.27" layer="27">&gt;VALUE</text>
<text x="-2.81" y="-2.4801" size="0.8128" layer="51">TQFP 100</text>
<text x="3.3899" y="-1.0701" size="0.6096" layer="51" ratio="15">R</text>
<text x="-2.302" y="1.8679" size="0.0254" layer="25">&gt;NAME</text>
<text x="-1.794" y="1.8679" size="0.0254" layer="27">&gt;VALUE</text>
<rectangle x1="-8.1999" y1="5.8499" x2="-7.1501" y2="6.1501" layer="51"/>
<rectangle x1="-8.1999" y1="5.35" x2="-7.1501" y2="5.65" layer="51"/>
<rectangle x1="-8.1999" y1="4.8499" x2="-7.1501" y2="5.1501" layer="51"/>
<rectangle x1="-8.1999" y1="4.35" x2="-7.1501" y2="4.65" layer="51"/>
<rectangle x1="-8.1999" y1="3.8499" x2="-7.1501" y2="4.1501" layer="51"/>
<rectangle x1="-8.1999" y1="3.35" x2="-7.1501" y2="3.65" layer="51"/>
<rectangle x1="-8.1999" y1="2.8499" x2="-7.1501" y2="3.1501" layer="51"/>
<rectangle x1="-8.1999" y1="2.35" x2="-7.1501" y2="2.65" layer="51"/>
<rectangle x1="-8.1999" y1="1.8499" x2="-7.1501" y2="2.1501" layer="51"/>
<rectangle x1="-8.1999" y1="1.35" x2="-7.1501" y2="1.65" layer="51"/>
<rectangle x1="-8.1999" y1="0.8499" x2="-7.1501" y2="1.1501" layer="51"/>
<rectangle x1="-8.1999" y1="0.35" x2="-7.1501" y2="0.65" layer="51"/>
<rectangle x1="-8.1999" y1="-0.1501" x2="-7.1501" y2="0.1501" layer="51"/>
<rectangle x1="-8.1999" y1="-0.65" x2="-7.1501" y2="-0.35" layer="51"/>
<rectangle x1="-8.1999" y1="-1.1501" x2="-7.1501" y2="-0.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-1.65" x2="-7.1501" y2="-1.35" layer="51"/>
<rectangle x1="-8.1999" y1="-2.1501" x2="-7.1501" y2="-1.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-2.65" x2="-7.1501" y2="-2.35" layer="51"/>
<rectangle x1="-8.1999" y1="-3.1501" x2="-7.1501" y2="-2.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-3.65" x2="-7.1501" y2="-3.35" layer="51"/>
<rectangle x1="-8.1999" y1="-4.1501" x2="-7.1501" y2="-3.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-4.65" x2="-7.1501" y2="-4.35" layer="51"/>
<rectangle x1="-8.1999" y1="-5.1501" x2="-7.1501" y2="-4.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-5.65" x2="-7.1501" y2="-5.35" layer="51"/>
<rectangle x1="-8.1999" y1="-6.1501" x2="-7.1501" y2="-5.8499" layer="51"/>
<rectangle x1="-6.1501" y1="-8.1999" x2="-5.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-5.65" y1="-8.1999" x2="-5.35" y2="-7.1501" layer="51"/>
<rectangle x1="-5.1501" y1="-8.1999" x2="-4.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-4.65" y1="-8.1999" x2="-4.35" y2="-7.1501" layer="51"/>
<rectangle x1="-4.1501" y1="-8.1999" x2="-3.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-3.65" y1="-8.1999" x2="-3.35" y2="-7.1501" layer="51"/>
<rectangle x1="-3.1501" y1="-8.1999" x2="-2.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-2.65" y1="-8.1999" x2="-2.35" y2="-7.1501" layer="51"/>
<rectangle x1="-2.1501" y1="-8.1999" x2="-1.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-1.65" y1="-8.1999" x2="-1.35" y2="-7.1501" layer="51"/>
<rectangle x1="-1.1501" y1="-8.1999" x2="-0.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-0.65" y1="-8.1999" x2="-0.35" y2="-7.1501" layer="51"/>
<rectangle x1="-0.1501" y1="-8.1999" x2="0.1501" y2="-7.1501" layer="51"/>
<rectangle x1="0.35" y1="-8.1999" x2="0.65" y2="-7.1501" layer="51"/>
<rectangle x1="0.8499" y1="-8.1999" x2="1.1501" y2="-7.1501" layer="51"/>
<rectangle x1="1.35" y1="-8.1999" x2="1.65" y2="-7.1501" layer="51"/>
<rectangle x1="1.8499" y1="-8.1999" x2="2.1501" y2="-7.1501" layer="51"/>
<rectangle x1="2.35" y1="-8.1999" x2="2.65" y2="-7.1501" layer="51"/>
<rectangle x1="2.8499" y1="-8.1999" x2="3.1501" y2="-7.1501" layer="51"/>
<rectangle x1="3.35" y1="-8.1999" x2="3.65" y2="-7.1501" layer="51"/>
<rectangle x1="3.8499" y1="-8.1999" x2="4.1501" y2="-7.1501" layer="51"/>
<rectangle x1="4.35" y1="-8.1999" x2="4.65" y2="-7.1501" layer="51"/>
<rectangle x1="4.8499" y1="-8.1999" x2="5.1501" y2="-7.1501" layer="51"/>
<rectangle x1="5.35" y1="-8.1999" x2="5.65" y2="-7.1501" layer="51"/>
<rectangle x1="5.8499" y1="-8.1999" x2="6.1501" y2="-7.1501" layer="51"/>
<rectangle x1="7.1501" y1="-6.1501" x2="8.1999" y2="-5.8499" layer="51"/>
<rectangle x1="7.1501" y1="-5.65" x2="8.1999" y2="-5.35" layer="51"/>
<rectangle x1="7.1501" y1="-5.1501" x2="8.1999" y2="-4.8499" layer="51"/>
<rectangle x1="7.1501" y1="-4.65" x2="8.1999" y2="-4.35" layer="51"/>
<rectangle x1="7.1501" y1="-4.1501" x2="8.1999" y2="-3.8499" layer="51"/>
<rectangle x1="7.1501" y1="-3.65" x2="8.1999" y2="-3.35" layer="51"/>
<rectangle x1="7.1501" y1="-3.1501" x2="8.1999" y2="-2.8499" layer="51"/>
<rectangle x1="7.1501" y1="-2.65" x2="8.1999" y2="-2.35" layer="51"/>
<rectangle x1="7.1501" y1="-2.1501" x2="8.1999" y2="-1.8499" layer="51"/>
<rectangle x1="7.1501" y1="-1.65" x2="8.1999" y2="-1.35" layer="51"/>
<rectangle x1="7.1501" y1="-1.1501" x2="8.1999" y2="-0.8499" layer="51"/>
<rectangle x1="7.1501" y1="-0.65" x2="8.1999" y2="-0.35" layer="51"/>
<rectangle x1="7.1501" y1="-0.1501" x2="8.1999" y2="0.1501" layer="51"/>
<rectangle x1="7.1501" y1="0.35" x2="8.1999" y2="0.65" layer="51"/>
<rectangle x1="7.1501" y1="0.8499" x2="8.1999" y2="1.1501" layer="51"/>
<rectangle x1="7.1501" y1="1.35" x2="8.1999" y2="1.65" layer="51"/>
<rectangle x1="7.1501" y1="1.8499" x2="8.1999" y2="2.1501" layer="51"/>
<rectangle x1="7.1501" y1="2.35" x2="8.1999" y2="2.65" layer="51"/>
<rectangle x1="7.1501" y1="2.8499" x2="8.1999" y2="3.1501" layer="51"/>
<rectangle x1="7.1501" y1="3.35" x2="8.1999" y2="3.65" layer="51"/>
<rectangle x1="7.1501" y1="3.8499" x2="8.1999" y2="4.1501" layer="51"/>
<rectangle x1="7.1501" y1="4.35" x2="8.1999" y2="4.65" layer="51"/>
<rectangle x1="7.1501" y1="4.8499" x2="8.1999" y2="5.1501" layer="51"/>
<rectangle x1="7.1501" y1="5.35" x2="8.1999" y2="5.65" layer="51"/>
<rectangle x1="7.1501" y1="5.8499" x2="8.1999" y2="6.1501" layer="51"/>
<rectangle x1="5.8499" y1="7.1501" x2="6.1501" y2="8.1999" layer="51"/>
<rectangle x1="5.35" y1="7.1501" x2="5.65" y2="8.1999" layer="51"/>
<rectangle x1="4.8499" y1="7.1501" x2="5.1501" y2="8.1999" layer="51"/>
<rectangle x1="4.35" y1="7.1501" x2="4.65" y2="8.1999" layer="51"/>
<rectangle x1="3.8499" y1="7.1501" x2="4.1501" y2="8.1999" layer="51"/>
<rectangle x1="3.35" y1="7.1501" x2="3.65" y2="8.1999" layer="51"/>
<rectangle x1="2.8499" y1="7.1501" x2="3.1501" y2="8.1999" layer="51"/>
<rectangle x1="2.35" y1="7.1501" x2="2.65" y2="8.1999" layer="51"/>
<rectangle x1="1.8499" y1="7.1501" x2="2.1501" y2="8.1999" layer="51"/>
<rectangle x1="1.35" y1="7.1501" x2="1.65" y2="8.1999" layer="51"/>
<rectangle x1="0.8499" y1="7.1501" x2="1.1501" y2="8.1999" layer="51"/>
<rectangle x1="0.35" y1="7.1501" x2="0.65" y2="8.1999" layer="51"/>
<rectangle x1="-0.1501" y1="7.1501" x2="0.1501" y2="8.1999" layer="51"/>
<rectangle x1="-0.65" y1="7.1501" x2="-0.35" y2="8.1999" layer="51"/>
<rectangle x1="-1.1501" y1="7.1501" x2="-0.8499" y2="8.1999" layer="51"/>
<rectangle x1="-1.65" y1="7.1501" x2="-1.35" y2="8.1999" layer="51"/>
<rectangle x1="-2.1501" y1="7.1501" x2="-1.8499" y2="8.1999" layer="51"/>
<rectangle x1="-2.65" y1="7.1501" x2="-2.35" y2="8.1999" layer="51"/>
<rectangle x1="-3.1501" y1="7.1501" x2="-2.8499" y2="8.1999" layer="51"/>
<rectangle x1="-3.65" y1="7.1501" x2="-3.35" y2="8.1999" layer="51"/>
<rectangle x1="-4.1501" y1="7.1501" x2="-3.8499" y2="8.1999" layer="51"/>
<rectangle x1="-4.65" y1="7.1501" x2="-4.35" y2="8.1999" layer="51"/>
<rectangle x1="-5.1501" y1="7.1501" x2="-4.8499" y2="8.1999" layer="51"/>
<rectangle x1="-5.65" y1="7.1501" x2="-5.35" y2="8.1999" layer="51"/>
<rectangle x1="-6.1501" y1="7.1501" x2="-5.8499" y2="8.1999" layer="51"/>
<polygon width="0.1" layer="51">
<vertex x="-3.81" y="-0.6701"/>
<vertex x="-2.81" y="1.3299"/>
<vertex x="-2.2101" y="1.3299"/>
<vertex x="-2.2101" y="-0.6701"/>
<vertex x="-2.6101" y="-0.6701"/>
<vertex x="-2.6101" y="0.73"/>
<vertex x="-3.2101" y="-0.4699"/>
<vertex x="-3.0099" y="-0.4699"/>
<vertex x="-3.0099" y="-0.6701"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-2.7099" y="1.6299"/>
<vertex x="-2.51" y="2.03"/>
<vertex x="3.0899" y="2.03"/>
<vertex x="3.0899" y="1.6299"/>
<vertex x="-1.51" y="1.6299"/>
<vertex x="-1.51" y="-0.6701"/>
<vertex x="-1.9101" y="-0.6701"/>
<vertex x="-1.9101" y="1.6299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-1.2101" y="1.3299"/>
<vertex x="-1.2101" y="-0.6701"/>
<vertex x="-0.81" y="-0.6701"/>
<vertex x="-0.81" y="1.13"/>
<vertex x="-0.6101" y="1.13"/>
<vertex x="-0.6101" y="-0.6701"/>
<vertex x="-0.2101" y="-0.6701"/>
<vertex x="-0.2101" y="1.13"/>
<vertex x="-0.0099" y="1.13"/>
<vertex x="-0.0099" y="-0.6701"/>
<vertex x="0.3899" y="-0.6701"/>
<vertex x="0.3899" y="0.9299"/>
<vertex x="0.2901" y="1.13"/>
<vertex x="0.19" y="1.2301"/>
<vertex x="-0.0099" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="0.6901" y="1.3299"/>
<vertex x="0.6901" y="-0.6701"/>
<vertex x="1.89" y="-0.6701"/>
<vertex x="1.89" y="-0.0701"/>
<vertex x="0.89" y="-0.0701"/>
<vertex x="0.89" y="0.13"/>
<vertex x="1.89" y="0.13"/>
<vertex x="1.89" y="0.5301"/>
<vertex x="0.89" y="0.5301"/>
<vertex x="0.89" y="0.73"/>
<vertex x="1.89" y="0.73"/>
<vertex x="1.89" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="2.19" y="1.3299"/>
<vertex x="2.19" y="-0.6701"/>
<vertex x="2.7899" y="-0.6701"/>
<vertex x="2.9901" y="-0.27"/>
<vertex x="2.59" y="-0.27"/>
<vertex x="2.59" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-3.81" y="-0.8699"/>
<vertex x="-3.81" y="-1.27"/>
<vertex x="2.49" y="-1.27"/>
<vertex x="2.6901" y="-0.8699"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="XMEGA-A1">
<wire x1="-25.4" y1="114.3" x2="27.94" y2="114.3" width="0.254" layer="94"/>
<wire x1="27.94" y1="114.3" x2="27.94" y2="-45.72" width="0.254" layer="94"/>
<wire x1="27.94" y1="-45.72" x2="-25.4" y2="-45.72" width="0.254" layer="94"/>
<wire x1="-25.4" y1="-45.72" x2="-25.4" y2="114.3" width="0.254" layer="94"/>
<text x="-25.4" y="115.57" size="1.9304" layer="95" ratio="5">&gt;NAME</text>
<text x="-7.366" y="112.014" size="1.9304" layer="96" ratio="5">&gt;VALUE</text>
<pin name="PA3(ADCA3)" x="-30.48" y="101.6" length="middle"/>
<pin name="PA4(ADCA4)" x="-30.48" y="99.06" length="middle"/>
<pin name="PA5(ADCA5)" x="-30.48" y="96.52" length="middle"/>
<pin name="PB1(ADCB1)" x="-30.48" y="81.28" length="middle"/>
<pin name="GND@1" x="12.7" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC@1" x="33.02" y="-17.78" length="middle" direction="pwr" rot="R180"/>
<pin name="PC1(OC0B/XCK0/SCL)" x="-30.48" y="55.88" length="middle"/>
<pin name="AVCC-B" x="33.02" y="-12.7" length="middle" direction="pwr" rot="R180"/>
<pin name="PA1(ADCA1)" x="-30.48" y="106.68" length="middle"/>
<pin name="PA2(ADCA2)" x="-30.48" y="104.14" length="middle"/>
<pin name="PB2(ADCB2/DAC0)" x="-30.48" y="78.74" length="middle"/>
<pin name="GND@2" x="10.16" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="PC0(OC0A/SDA)" x="-30.48" y="58.42" length="middle"/>
<pin name="PC2(OC0C/RXD0)" x="-30.48" y="53.34" length="middle"/>
<pin name="GND@3" x="7.62" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="PA0(ADCA0/AREFA)" x="-30.48" y="109.22" length="middle"/>
<pin name="PA6(ADCA6)" x="-30.48" y="93.98" length="middle"/>
<pin name="PB3(ADCB3/DAC1)" x="-30.48" y="76.2" length="middle"/>
<pin name="PC3(OC0D/TXD0)" x="-30.48" y="50.8" length="middle"/>
<pin name="PC4(OC1A/!SS!)" x="-30.48" y="48.26" length="middle"/>
<pin name="PC5(OC1B/MOSI/XCK1)" x="-30.48" y="45.72" length="middle"/>
<pin name="PR1(XTAL1)" x="-30.48" y="-33.02" length="middle"/>
<pin name="GND@4" x="5.08" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="PA7/(ADCA7/AC0-OUT)" x="-30.48" y="91.44" length="middle"/>
<pin name="PB0(ADCB0/AREFB)" x="-30.48" y="83.82" length="middle"/>
<pin name="PC6(MISO/RXD1)" x="-30.48" y="43.18" length="middle"/>
<pin name="PC7(SCK/TXD1/CLKO/EVO)" x="-30.48" y="40.64" length="middle"/>
<pin name="PR0(XTAL2)" x="-30.48" y="-27.94" length="middle"/>
<pin name="PDI-CLK/!RESET" x="-30.48" y="-22.86" length="middle" direction="in"/>
<pin name="PD4(OC1A/!SS!)" x="-30.48" y="22.86" length="middle"/>
<pin name="PD0(OC0A/SDA)" x="-30.48" y="33.02" length="middle"/>
<pin name="PDI-DATA" x="-30.48" y="-17.78" length="middle"/>
<pin name="PE2(OC0C/RXD0)" x="-30.48" y="2.54" length="middle"/>
<pin name="PE1(OC0B/XCK0/SCL)" x="-30.48" y="5.08" length="middle"/>
<pin name="PD7(TXD1/SCK/CLKO/EVO)" x="-30.48" y="15.24" length="middle"/>
<pin name="PD5(OC1B/XCK1/MOSI)" x="-30.48" y="20.32" length="middle"/>
<pin name="PD1(OC0B/XCK0/SCL)" x="-30.48" y="30.48" length="middle"/>
<pin name="VCC@2" x="33.02" y="-20.32" length="middle" direction="pwr" rot="R180"/>
<pin name="PE3(OC0D/TXD0)" x="-30.48" y="0" length="middle"/>
<pin name="VCC@3" x="33.02" y="-22.86" length="middle" direction="pwr" rot="R180"/>
<pin name="PE0(OC0A/SDA)" x="-30.48" y="7.62" length="middle"/>
<pin name="PD6(RXD1/MISO)" x="-30.48" y="17.78" length="middle"/>
<pin name="PD3(OC0D/TXD0)" x="-30.48" y="25.4" length="middle"/>
<pin name="PD2(OC0C/RXD0)" x="-30.48" y="27.94" length="middle"/>
<pin name="PB4(ADCB4/TMS)" x="-30.48" y="73.66" length="middle"/>
<pin name="PB5(ADCB5/TDI)" x="-30.48" y="71.12" length="middle"/>
<pin name="PB6(ADCB6/TCK)" x="-30.48" y="68.58" length="middle"/>
<pin name="PB7(ADCB7/AC0-OUT/TDO)" x="-30.48" y="66.04" length="middle"/>
<pin name="PE4(OC1A/!SS!)" x="-30.48" y="-2.54" length="middle"/>
<pin name="PE5(OC1B/XCK1/MOSI)" x="-30.48" y="-5.08" length="middle"/>
<pin name="PE6(RSC1/MISO/TOSC2)" x="-30.48" y="-7.62" length="middle"/>
<pin name="PE7(TSD1/SCK/CLKO/EVO/TOSC1)" x="-30.48" y="-10.16" length="middle"/>
<pin name="PF0(OC0A/SDA)" x="33.02" y="106.68" length="middle" rot="R180"/>
<pin name="PF1(OC0B/XCK0/SCL)" x="33.02" y="104.14" length="middle" rot="R180"/>
<pin name="PF2(OC0C/RXD0)" x="33.02" y="101.6" length="middle" rot="R180"/>
<pin name="PF3(OC0D/TXD0)" x="33.02" y="99.06" length="middle" rot="R180"/>
<pin name="PF4(OC1A/!SS!)" x="33.02" y="96.52" length="middle" rot="R180"/>
<pin name="PF5(OC1B/XCK1/MOSI)" x="33.02" y="93.98" length="middle" rot="R180"/>
<pin name="PF6(RXD1/MISO)" x="33.02" y="91.44" length="middle" rot="R180"/>
<pin name="PF7(TXD1/SCK)" x="33.02" y="88.9" length="middle" rot="R180"/>
<pin name="GND@5" x="2.54" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@6" x="0" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC@4" x="33.02" y="-25.4" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@5" x="33.02" y="-27.94" length="middle" direction="pwr" rot="R180"/>
<pin name="PH0(!WE!)" x="33.02" y="81.28" length="middle" rot="R180"/>
<pin name="PH1(!CAS!/!RE!)" x="33.02" y="78.74" length="middle" rot="R180"/>
<pin name="PH2(!RAS!/ALE1)" x="33.02" y="76.2" length="middle" rot="R180"/>
<pin name="PH3(!DOM!/ALE2)" x="33.02" y="73.66" length="middle" rot="R180"/>
<pin name="PH4(BA0/!CS0!/A16)" x="33.02" y="71.12" length="middle" rot="R180"/>
<pin name="PH5(BA1/!CS1!/A17)" x="33.02" y="68.58" length="middle" rot="R180"/>
<pin name="PH6(CKE/!CS2!/A18)" x="33.02" y="66.04" length="middle" rot="R180"/>
<pin name="PH7(CLK/!CS3!/A19)" x="33.02" y="63.5" length="middle" rot="R180"/>
<pin name="PJ0(D0/A0/A8)" x="33.02" y="55.88" length="middle" rot="R180"/>
<pin name="PJ1(D1/A1/A9)" x="33.02" y="53.34" length="middle" rot="R180"/>
<pin name="PJ2(D2/A2/A10)" x="33.02" y="50.8" length="middle" rot="R180"/>
<pin name="PJ3(D3/A3/A11)" x="33.02" y="48.26" length="middle" rot="R180"/>
<pin name="PJ4(A8/D4/A4/A12)" x="33.02" y="45.72" length="middle" rot="R180"/>
<pin name="PJ5(A9/D5/A5/A13)" x="33.02" y="43.18" length="middle" rot="R180"/>
<pin name="PJ6(A10/D6/A6/A14)" x="33.02" y="40.64" length="middle" rot="R180"/>
<pin name="PJ7(A11/D7/A7/A15)" x="33.02" y="38.1" length="middle" rot="R180"/>
<pin name="PK0(A0/A8/A16)" x="33.02" y="30.48" length="middle" rot="R180"/>
<pin name="PK1(A1/A9/A17)" x="33.02" y="27.94" length="middle" rot="R180"/>
<pin name="PK2(A2/A10/A18)" x="33.02" y="25.4" length="middle" rot="R180"/>
<pin name="PK3(A3/A11/A19)" x="33.02" y="22.86" length="middle" rot="R180"/>
<pin name="PK4(A4/A12/A20)" x="33.02" y="20.32" length="middle" rot="R180"/>
<pin name="PK5(A5/A13/A22)" x="33.02" y="17.78" length="middle" rot="R180"/>
<pin name="PK6(A6/A14/A22)" x="33.02" y="15.24" length="middle" rot="R180"/>
<pin name="PK7(A7/A15/A23)" x="33.02" y="12.7" length="middle" rot="R180"/>
<pin name="PQ0(TOSC1)" x="33.02" y="5.08" length="middle" rot="R180"/>
<pin name="PQ1(TOSC2)" x="33.02" y="2.54" length="middle" rot="R180"/>
<pin name="PQ2" x="33.02" y="0" length="middle" rot="R180"/>
<pin name="PQ3" x="33.02" y="-2.54" length="middle" rot="R180"/>
<pin name="GND@7" x="-2.54" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@8" x="-5.08" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@9" x="-7.62" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@10" x="-10.16" y="-50.8" length="middle" direction="pwr" rot="R90"/>
<pin name="AVCC-A" x="33.02" y="-10.16" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@6" x="33.02" y="-30.48" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@7" x="33.02" y="-33.02" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@8" x="33.02" y="-35.56" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XMEGA-A1">
<description>Atmel XMega A1 Series processor</description>
<gates>
<gate name="G$1" symbol="XMEGA-A1" x="0" y="-10.16"/>
</gates>
<devices>
<device name="TQFP" package="TQFP100">
<connects>
<connect gate="G$1" pin="AVCC-A" pad="94"/>
<connect gate="G$1" pin="AVCC-B" pad="4"/>
<connect gate="G$1" pin="GND@1" pad="93"/>
<connect gate="G$1" pin="GND@10" pad="84"/>
<connect gate="G$1" pin="GND@2" pad="3"/>
<connect gate="G$1" pin="GND@3" pad="13"/>
<connect gate="G$1" pin="GND@4" pad="23"/>
<connect gate="G$1" pin="GND@5" pad="33"/>
<connect gate="G$1" pin="GND@6" pad="43"/>
<connect gate="G$1" pin="GND@7" pad="53"/>
<connect gate="G$1" pin="GND@8" pad="63"/>
<connect gate="G$1" pin="GND@9" pad="73"/>
<connect gate="G$1" pin="PA0(ADCA0/AREFA)" pad="95"/>
<connect gate="G$1" pin="PA1(ADCA1)" pad="96"/>
<connect gate="G$1" pin="PA2(ADCA2)" pad="97"/>
<connect gate="G$1" pin="PA3(ADCA3)" pad="98"/>
<connect gate="G$1" pin="PA4(ADCA4)" pad="99"/>
<connect gate="G$1" pin="PA5(ADCA5)" pad="100"/>
<connect gate="G$1" pin="PA6(ADCA6)" pad="1"/>
<connect gate="G$1" pin="PA7/(ADCA7/AC0-OUT)" pad="2"/>
<connect gate="G$1" pin="PB0(ADCB0/AREFB)" pad="5"/>
<connect gate="G$1" pin="PB1(ADCB1)" pad="6"/>
<connect gate="G$1" pin="PB2(ADCB2/DAC0)" pad="7"/>
<connect gate="G$1" pin="PB3(ADCB3/DAC1)" pad="8"/>
<connect gate="G$1" pin="PB4(ADCB4/TMS)" pad="9"/>
<connect gate="G$1" pin="PB5(ADCB5/TDI)" pad="10"/>
<connect gate="G$1" pin="PB6(ADCB6/TCK)" pad="11"/>
<connect gate="G$1" pin="PB7(ADCB7/AC0-OUT/TDO)" pad="12"/>
<connect gate="G$1" pin="PC0(OC0A/SDA)" pad="15"/>
<connect gate="G$1" pin="PC1(OC0B/XCK0/SCL)" pad="16"/>
<connect gate="G$1" pin="PC2(OC0C/RXD0)" pad="17"/>
<connect gate="G$1" pin="PC3(OC0D/TXD0)" pad="18"/>
<connect gate="G$1" pin="PC4(OC1A/!SS!)" pad="19"/>
<connect gate="G$1" pin="PC5(OC1B/MOSI/XCK1)" pad="20"/>
<connect gate="G$1" pin="PC6(MISO/RXD1)" pad="21"/>
<connect gate="G$1" pin="PC7(SCK/TXD1/CLKO/EVO)" pad="22"/>
<connect gate="G$1" pin="PD0(OC0A/SDA)" pad="25"/>
<connect gate="G$1" pin="PD1(OC0B/XCK0/SCL)" pad="26"/>
<connect gate="G$1" pin="PD2(OC0C/RXD0)" pad="27"/>
<connect gate="G$1" pin="PD3(OC0D/TXD0)" pad="28"/>
<connect gate="G$1" pin="PD4(OC1A/!SS!)" pad="29"/>
<connect gate="G$1" pin="PD5(OC1B/XCK1/MOSI)" pad="30"/>
<connect gate="G$1" pin="PD6(RXD1/MISO)" pad="31"/>
<connect gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)" pad="32"/>
<connect gate="G$1" pin="PDI-CLK/!RESET" pad="90"/>
<connect gate="G$1" pin="PDI-DATA" pad="89"/>
<connect gate="G$1" pin="PE0(OC0A/SDA)" pad="35"/>
<connect gate="G$1" pin="PE1(OC0B/XCK0/SCL)" pad="36"/>
<connect gate="G$1" pin="PE2(OC0C/RXD0)" pad="37"/>
<connect gate="G$1" pin="PE3(OC0D/TXD0)" pad="38"/>
<connect gate="G$1" pin="PE4(OC1A/!SS!)" pad="39"/>
<connect gate="G$1" pin="PE5(OC1B/XCK1/MOSI)" pad="40"/>
<connect gate="G$1" pin="PE6(RSC1/MISO/TOSC2)" pad="41"/>
<connect gate="G$1" pin="PE7(TSD1/SCK/CLKO/EVO/TOSC1)" pad="42"/>
<connect gate="G$1" pin="PF0(OC0A/SDA)" pad="45"/>
<connect gate="G$1" pin="PF1(OC0B/XCK0/SCL)" pad="46"/>
<connect gate="G$1" pin="PF2(OC0C/RXD0)" pad="47"/>
<connect gate="G$1" pin="PF3(OC0D/TXD0)" pad="48"/>
<connect gate="G$1" pin="PF4(OC1A/!SS!)" pad="49"/>
<connect gate="G$1" pin="PF5(OC1B/XCK1/MOSI)" pad="50"/>
<connect gate="G$1" pin="PF6(RXD1/MISO)" pad="51"/>
<connect gate="G$1" pin="PF7(TXD1/SCK)" pad="52"/>
<connect gate="G$1" pin="PH0(!WE!)" pad="55"/>
<connect gate="G$1" pin="PH1(!CAS!/!RE!)" pad="56"/>
<connect gate="G$1" pin="PH2(!RAS!/ALE1)" pad="57"/>
<connect gate="G$1" pin="PH3(!DOM!/ALE2)" pad="58"/>
<connect gate="G$1" pin="PH4(BA0/!CS0!/A16)" pad="59"/>
<connect gate="G$1" pin="PH5(BA1/!CS1!/A17)" pad="60"/>
<connect gate="G$1" pin="PH6(CKE/!CS2!/A18)" pad="61"/>
<connect gate="G$1" pin="PH7(CLK/!CS3!/A19)" pad="62"/>
<connect gate="G$1" pin="PJ0(D0/A0/A8)" pad="65"/>
<connect gate="G$1" pin="PJ1(D1/A1/A9)" pad="66"/>
<connect gate="G$1" pin="PJ2(D2/A2/A10)" pad="67"/>
<connect gate="G$1" pin="PJ3(D3/A3/A11)" pad="68"/>
<connect gate="G$1" pin="PJ4(A8/D4/A4/A12)" pad="69"/>
<connect gate="G$1" pin="PJ5(A9/D5/A5/A13)" pad="70"/>
<connect gate="G$1" pin="PJ6(A10/D6/A6/A14)" pad="71"/>
<connect gate="G$1" pin="PJ7(A11/D7/A7/A15)" pad="72"/>
<connect gate="G$1" pin="PK0(A0/A8/A16)" pad="75"/>
<connect gate="G$1" pin="PK1(A1/A9/A17)" pad="76"/>
<connect gate="G$1" pin="PK2(A2/A10/A18)" pad="77"/>
<connect gate="G$1" pin="PK3(A3/A11/A19)" pad="78"/>
<connect gate="G$1" pin="PK4(A4/A12/A20)" pad="79"/>
<connect gate="G$1" pin="PK5(A5/A13/A22)" pad="80"/>
<connect gate="G$1" pin="PK6(A6/A14/A22)" pad="81"/>
<connect gate="G$1" pin="PK7(A7/A15/A23)" pad="82"/>
<connect gate="G$1" pin="PQ0(TOSC1)" pad="85"/>
<connect gate="G$1" pin="PQ1(TOSC2)" pad="86"/>
<connect gate="G$1" pin="PQ2" pad="87"/>
<connect gate="G$1" pin="PQ3" pad="88"/>
<connect gate="G$1" pin="PR0(XTAL2)" pad="91"/>
<connect gate="G$1" pin="PR1(XTAL1)" pad="92"/>
<connect gate="G$1" pin="VCC@1" pad="83"/>
<connect gate="G$1" pin="VCC@2" pad="74"/>
<connect gate="G$1" pin="VCC@3" pad="64"/>
<connect gate="G$1" pin="VCC@4" pad="54"/>
<connect gate="G$1" pin="VCC@5" pad="44"/>
<connect gate="G$1" pin="VCC@6" pad="34"/>
<connect gate="G$1" pin="VCC@7" pad="24"/>
<connect gate="G$1" pin="VCC@8" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_capacitor">
<packages>
<package name="C1210">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-0.9652" y1="1.2446" x2="0.9652" y2="1.2446" width="0.1016" layer="51"/>
<wire x1="-0.9652" y1="-1.2446" x2="0.9652" y2="-1.2446" width="0.1016" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-1.2954" x2="-0.9517" y2="1.3045" layer="51"/>
<rectangle x1="0.9517" y1="-1.3045" x2="1.7018" y2="1.2954" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="C0805">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="C1206">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="C0603">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="PANASONIC_G">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package G&lt;/b&gt;</description>
<wire x1="-5.1" y1="5.1" x2="2.8" y2="5.1" width="0.1016" layer="51"/>
<wire x1="2.8" y1="5.1" x2="5.1" y2="2.8" width="0.1016" layer="51"/>
<wire x1="5.1" y1="2.8" x2="5.1" y2="-2.8" width="0.1016" layer="51"/>
<wire x1="5.1" y1="-2.8" x2="2.8" y2="-5.1" width="0.1016" layer="51"/>
<wire x1="2.8" y1="-5.1" x2="-5.1" y2="-5.1" width="0.1016" layer="51"/>
<wire x1="-5.1" y1="-5.1" x2="-5.1" y2="5.1" width="0.1016" layer="51"/>
<wire x1="-5.1" y1="1" x2="-5.1" y2="5.1" width="0.1016" layer="21"/>
<wire x1="-5.1" y1="5.1" x2="2.8" y2="5.1" width="0.1016" layer="21"/>
<wire x1="2.8" y1="5.1" x2="5.1" y2="2.8" width="0.1016" layer="21"/>
<wire x1="5.1" y1="2.8" x2="5.1" y2="1" width="0.1016" layer="21"/>
<wire x1="5.1" y1="-1" x2="5.1" y2="-2.8" width="0.1016" layer="21"/>
<wire x1="5.1" y1="-2.8" x2="2.8" y2="-5.1" width="0.1016" layer="21"/>
<wire x1="2.8" y1="-5.1" x2="-5.1" y2="-5.1" width="0.1016" layer="21"/>
<wire x1="-5.1" y1="-5.1" x2="-5.1" y2="-1" width="0.1016" layer="21"/>
<wire x1="-4.85" y1="-1" x2="4.85" y2="-1" width="0.1016" layer="21" curve="156.699401"/>
<wire x1="-4.85" y1="1" x2="4.85" y2="1" width="0.1016" layer="21" curve="-156.699401"/>
<wire x1="-3.25" y1="3.7" x2="-3.25" y2="-3.65" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="4.95" width="0.1016" layer="51"/>
<smd name="-" x="-4.25" y="0" dx="3.9" dy="1.6" layer="1"/>
<smd name="+" x="4.25" y="0" dx="3.9" dy="1.6" layer="1"/>
<text x="-2.55" y="1.75" size="1.016" layer="25">&gt;NAME</text>
<text x="-2.55" y="-2.675" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-5.85" y1="-0.45" x2="-4.9" y2="0.45" layer="51"/>
<rectangle x1="4.9" y1="-0.45" x2="5.85" y2="0.45" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-3.3" y="3.6"/>
<vertex x="-4.05" y="2.75"/>
<vertex x="-4.65" y="1.55"/>
<vertex x="-4.85" y="0.45"/>
<vertex x="-4.85" y="-0.45"/>
<vertex x="-4.65" y="-1.55"/>
<vertex x="-4.05" y="-2.75"/>
<vertex x="-3.3" y="-3.6"/>
<vertex x="-3.3" y="3.55"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="C_">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="C_POL_">
<wire x1="-1.524" y1="1.651" x2="1.524" y2="1.651" width="0.254" layer="94"/>
<wire x1="1.524" y1="1.651" x2="1.524" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.524" y1="2.54" x2="-1.524" y2="1.651" width="0.254" layer="94"/>
<wire x1="-1.524" y1="2.54" x2="1.524" y2="2.54" width="0.254" layer="94"/>
<text x="1.143" y="3.0226" size="1.778" layer="95">&gt;NAME</text>
<text x="-0.5842" y="2.9464" size="1.27" layer="94" rot="R90">+</text>
<text x="1.143" y="-2.0574" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0" x2="1.651" y2="0.889" layer="94"/>
<pin name="-" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="+" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="10UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="-C_35V" package="C1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="758-3325 " constant="no"/>
<attribute name="VALUE" value="10µF 35V" constant="no"/>
</technology>
</technologies>
</device>
<device name="-C_25V" package="C1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="766-1185 " constant="no"/>
<attribute name="VALUE" value="10µF 25V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="100NF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 723-5534 " constant="no"/>
<attribute name="VALUE" value="100nF 50V" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="220-7966 " constant="no"/>
<attribute name="VALUE" value="100nF 50V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="D_25V" package="C1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 740-7574 " constant="no"/>
<attribute name="VALUE" value="1µF 25V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="10NF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="723-4982" constant="no"/>
<attribute name="VALUE" value="10nF 50V" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="264-4371" constant="no"/>
<attribute name="VALUE" value="100nF 50V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="15PF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 147-421 " constant="no"/>
<attribute name="VALUE" value="15pF_0603_100V" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="15pF_0603_100V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="330UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_POL_" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PANASONIC_G">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name="">
<attribute name="MANUFACTURER" value="EEEFK1V331P" constant="no"/>
<attribute name="RS" value="708-3475" constant="no"/>
<attribute name="VALUE" value="330µF 35V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_diode">
<packages>
<package name="CHIP-LED0805">
<description>&lt;b&gt;Hyper CHIPLED Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
LB R99A&lt;br&gt;
Source: http://www.osram.convergy.de/ ... lb_r99a.pdf</description>
<wire x1="-0.625" y1="0.45" x2="-0.625" y2="-0.45" width="0.1016" layer="51"/>
<wire x1="0.625" y1="0.45" x2="0.625" y2="-0.475" width="0.1016" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.675" y1="0" x2="-0.525" y2="0.3" layer="21"/>
<rectangle x1="0.525" y1="0" x2="0.675" y2="0.3" layer="21"/>
<rectangle x1="-0.15" y1="0" x2="0.15" y2="0.3" layer="21"/>
<rectangle x1="-0.675" y1="0.45" x2="0.675" y2="1.05" layer="51"/>
<rectangle x1="-0.675" y1="-1.05" x2="0.675" y2="-0.45" layer="51"/>
</package>
<package name="TO252">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-3.973" y1="5.983" x2="3.973" y2="5.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-5.983" x2="-3.973" y2="-5.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-5.983" x2="-3.973" y2="5.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="5.983" x2="3.973" y2="-5.983" width="0.0508" layer="39"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="4" x="0" y="2.5" dx="5.4" dy="6.2" layer="1"/>
<smd name="1" x="-2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<smd name="3" x="2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="21"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
</package>
<package name="SMA">
<description>&lt;b&gt;SMA&lt;/b&gt; CASE 403D-02&lt;p&gt;
Source: http://www.onsemi.com/pub_link/Collateral/MBRA340T3-D.PDF</description>
<wire x1="-2.25" y1="1.825" x2="2.25" y2="1.825" width="0.254" layer="21"/>
<wire x1="2.25" y1="-1.825" x2="-2.25" y2="-1.825" width="0.254" layer="21"/>
<wire x1="-2.25" y1="1.825" x2="-2.25" y2="1.25" width="0.254" layer="21"/>
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.254" layer="51"/>
<wire x1="-2.25" y1="-1.825" x2="-2.25" y2="-1.25" width="0.254" layer="21"/>
<wire x1="2.25" y1="-1.825" x2="2.25" y2="-1.25" width="0.254" layer="21" curve="-1.904406"/>
<wire x1="2.25" y1="1.825" x2="2.25" y2="1.25" width="0.254" layer="21"/>
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.254" layer="51"/>
<smd name="C" x="-2" y="0" dx="2" dy="2" layer="1"/>
<smd name="A" x="2" y="0" dx="2" dy="2" layer="1"/>
<text x="-2.75" y="2" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.75" y="-3.5" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.38" y1="-0.825" x2="2.8" y2="0.8" layer="51"/>
<rectangle x1="-2.8" y1="-0.8" x2="-2.38" y2="0.8" layer="51"/>
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="1.75" layer="51"/>
<rectangle x1="-1.5" y1="1.25" x2="-0.75" y2="1.75" layer="21"/>
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="-1.25" layer="21"/>
</package>
<package name="SOD-123_MINI-SMA">
<description>&lt;b&gt;Molded plasitc,JEDEC SOD-123/Mini SMA&lt;/b&gt;&lt;p&gt;
Source: Comchip CGRM4001-G.pdf</description>
<wire x1="-1.8725" y1="0.835" x2="1.8725" y2="0.835" width="0.127" layer="51"/>
<wire x1="-1.8725" y1="-0.835" x2="1.8725" y2="-0.835" width="0.127" layer="51"/>
<wire x1="-0.3175" y1="0" x2="0.3175" y2="-0.4763" width="0.127" layer="21"/>
<wire x1="0.3175" y1="-0.4763" x2="0.3175" y2="0" width="0.127" layer="21"/>
<wire x1="0.3175" y1="0" x2="0.3175" y2="0.4763" width="0.127" layer="21"/>
<wire x1="0.3175" y1="0.4763" x2="-0.3175" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="0" x2="-0.3175" y2="-0.4763" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="0" x2="-0.3175" y2="0.4763" width="0.127" layer="21"/>
<wire x1="0.3175" y1="0" x2="0.5613" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="0" x2="-0.5613" y2="0" width="0.127" layer="21"/>
<smd name="A" x="1.8" y="0" dx="1.5" dy="2.1" layer="1" rot="R180"/>
<smd name="C" x="-1.8" y="0" dx="1.5" dy="2.1" layer="1" rot="R180"/>
<text x="-3.048" y="1.143" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.048" y="-2.413" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.95" y1="-0.9" x2="-1.5875" y2="0.9" layer="51"/>
<rectangle x1="1.5875" y1="-0.9" x2="1.95" y2="0.9" layer="51"/>
<rectangle x1="-1.0249" y1="-0.9" x2="-0.6625" y2="0.9" layer="51"/>
</package>
<package name="SOD80C">
<description>&lt;B&gt;DIODE&lt;/B&gt;</description>
<wire x1="1.3208" y1="0.7874" x2="-1.3208" y2="0.7874" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.7874" x2="-1.3208" y2="-0.7874" width="0.1524" layer="51"/>
<wire x1="0.627" y1="0.6" x2="-0.373" y2="0" width="0.2032" layer="21"/>
<wire x1="-0.373" y1="0" x2="0.627" y2="-0.6" width="0.2032" layer="21"/>
<wire x1="0.627" y1="-0.6" x2="0.627" y2="0.6" width="0.2032" layer="21"/>
<smd name="C" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="A" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.524" y="1.143" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.524" y="-2.413" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8636" x2="-1.2954" y2="0.8636" layer="51"/>
<rectangle x1="1.2954" y1="-0.8636" x2="1.8542" y2="0.8636" layer="51"/>
<rectangle x1="-0.8636" y1="-0.7874" x2="-0.254" y2="0.7874" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
<symbol name="SCHOTTKY_2A">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="1.016" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.016" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<text x="-2.286" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.286" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A2" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="A1" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="SCHOTTKY">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="1.016" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.016" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.286" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.286" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="D">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="2.54" y="0.4826" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.3114" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="ZD">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-1.778" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.778" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED_" prefix="LED">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="G" package="CHIP-LED0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 692-0935 " constant="no"/>
<attribute name="VALUE" value="GREEN"/>
</technology>
</technologies>
</device>
<device name="Y" package="CHIP-LED0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="692-0925" constant="no"/>
<attribute name="VALUE" value="YELLOW" constant="no"/>
</technology>
</technologies>
</device>
<device name="R" package="CHIP-LED0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 692-0931" constant="no"/>
<attribute name="VALUE" value="RED" constant="no"/>
</technology>
</technologies>
</device>
<device name="B" package="CHIP-LED0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="692-0953" constant="no"/>
<attribute name="VALUE" value="BLUE" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="50WQ03" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="SCHOTTKY_2A" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO252">
<connects>
<connect gate="G$1" pin="A1" pad="1"/>
<connect gate="G$1" pin="A2" pad="3"/>
<connect gate="G$1" pin="C" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="302-167" constant="no"/>
<attribute name="VALUE" value="50WQ03" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="B160-13F" prefix="D">
<gates>
<gate name="G$1" symbol="SCHOTTKY" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SMA">
<connects>
<connect gate="G$1" pin="A" pad="C"/>
<connect gate="G$1" pin="C" pad="A"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="738-4765" constant="no"/>
<attribute name="VALUE" value="B160-13F" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CGRM400*-G" prefix="D">
<description>&lt;b&gt;Molded plasitc,JEDEC SOD-123/Mini SMA&lt;/b&gt;&lt;p&gt;
Source: Comchip CGRM4001-G.pdf</description>
<gates>
<gate name="G$1" symbol="D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOD-123_MINI-SMA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="4">
<attribute name="RS" value=" 545-2456" constant="no"/>
<attribute name="VALUE" value="MRA4004T3G" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BZV55-C3V3" prefix="D" uservalue="yes">
<description>Z-Diode</description>
<gates>
<gate name="G$1" symbol="ZD" x="0" y="0"/>
</gates>
<devices>
<device name="SOD80C" package="SOD80C">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="748-5029" constant="no"/>
<attribute name="VALUE" value="bzv55-c3v3" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_resistor">
<packages>
<package name="R0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R0603">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51"/>
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="0309/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.318" y1="-0.3048" x2="5.1816" y2="0.3048" layer="21"/>
<rectangle x1="-5.1816" y1="-0.3048" x2="-4.318" y2="0.3048" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="RES">
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="270" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 679-0071" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="740-9019" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="10K" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="740-8899" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 740-9072" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1K" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="213-2266" constant="no"/>
<attribute name="VALUE" value="1k" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 223-0427" constant="no"/>
<attribute name="VALUE" value="1k" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0.27" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="722-1046" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="75K" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="679-0695" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="679-1664" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3K09" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="708-7574" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="100_1W" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-1W" package="0309/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="707-8625" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="15K" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="740-8997" constant="no"/>
<attribute name="VALUE" value="15k 1%" constant="no"/>
</technology>
</technologies>
</device>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="740-8912" constant="no"/>
<attribute name="VALUE" value="15k 1%" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="4K7" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="740-8959" constant="no"/>
</technology>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="223-0528" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0" prefix="R">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="-F" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_ic">
<packages>
<package name="HC49UP">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<wire x1="-5.1091" y1="1.143" x2="-3.429" y2="2.0321" width="0.0508" layer="21" curve="-55.770993"/>
<wire x1="-5.715" y1="1.143" x2="-5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.032" x2="5.1091" y2="1.143" width="0.0508" layer="21" curve="-55.772485"/>
<wire x1="5.715" y1="1.143" x2="5.715" y2="2.159" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="-3.429" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="3.429" y1="-2.032" x2="-3.429" y2="-2.032" width="0.0508" layer="21"/>
<wire x1="-3.429" y1="1.27" x2="3.429" y2="1.27" width="0.0508" layer="21"/>
<wire x1="5.461" y1="-2.413" x2="-5.461" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-0.381" x2="6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.715" y1="0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="6.477" y1="-0.381" x2="6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="5.461" y1="-2.413" x2="5.715" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.715" y1="-1.143" x2="5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="5.715" y1="-2.159" x2="5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="3.9826" y2="-1.143" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="3.429" y1="1.27" x2="3.9826" y2="1.143" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="3.429" y1="-2.032" x2="5.109" y2="-1.1429" width="0.0508" layer="21" curve="55.771157"/>
<wire x1="3.9826" y1="-1.143" x2="3.9826" y2="1.143" width="0.0508" layer="51" curve="128.314524"/>
<wire x1="5.1091" y1="-1.143" x2="5.1091" y2="1.143" width="0.0508" layer="51" curve="68.456213"/>
<wire x1="-5.1091" y1="-1.143" x2="-3.429" y2="-2.032" width="0.0508" layer="21" curve="55.772485"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.9826" y2="1.143" width="0.0508" layer="51" curve="-128.314524"/>
<wire x1="-3.9826" y1="-1.143" x2="-3.429" y2="-1.27" width="0.0508" layer="21" curve="25.842828"/>
<wire x1="-3.9826" y1="1.143" x2="-3.429" y2="1.27" width="0.0508" layer="21" curve="-25.842828"/>
<wire x1="-6.477" y1="-0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.1091" y1="-1.143" x2="-5.1091" y2="1.143" width="0.0508" layer="51" curve="-68.456213"/>
<wire x1="-5.715" y1="-1.143" x2="-5.715" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-0.381" x2="-5.715" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-5.715" y2="1.143" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="-2.159" x2="-5.715" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.159" x2="-5.461" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.715" y1="-0.381" x2="-6.477" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="0.381" x2="-6.477" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="2.032" x2="3.429" y2="2.032" width="0.0508" layer="21"/>
<wire x1="5.461" y1="2.413" x2="-5.461" y2="2.413" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.413" x2="5.715" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.715" y1="2.159" x2="-5.461" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="-0.254" y1="0.635" x2="-0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.635" x2="0.254" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.635" x2="0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.635" x2="-0.254" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="-1.016" y2="0" width="0.0508" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.635" y2="0" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="0" x2="1.016" y2="0" width="0.0508" layer="21"/>
<smd name="1" x="-4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<smd name="2" x="4.826" y="0" dx="5.334" dy="1.9304" layer="1"/>
<text x="-5.715" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.604" y1="-3.048" x2="6.604" y2="3.048" layer="43"/>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline Package&lt;/b&gt; .150 SIOC&lt;p&gt;
Source: http://www.maxim-ic.com/package_drawings/21-0041B.pdf</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-4.064" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
<package name="XBEE">
<description>&lt;b&gt;XBEE&lt;/b&gt;&lt;p&gt;
Source: http://www.maxstream.net/products/xbee/datasheet_XBee_OEM_RF-Modules.pdf</description>
<wire x1="-12.1" y1="-11.975" x2="-12.1" y2="9.1" width="0.2032" layer="21"/>
<wire x1="-12.1" y1="9.1" x2="-5.775" y2="15.425" width="0.2032" layer="21"/>
<wire x1="-5.775" y1="15.425" x2="5.775" y2="15.425" width="0.2032" layer="21"/>
<wire x1="5.775" y1="15.425" x2="12.1" y2="9.1" width="0.2032" layer="21"/>
<wire x1="12.1" y1="9.1" x2="12.1" y2="-11.975" width="0.2032" layer="21"/>
<wire x1="12.1" y1="-11.975" x2="-12.1" y2="-11.975" width="0.2032" layer="21"/>
<wire x1="-8.3829" y1="2.8685" x2="7.4359" y2="2.8685" width="0.1524" layer="21"/>
<wire x1="-8.3829" y1="-2.4369" x2="7.4359" y2="-2.4369" width="0.1524" layer="21"/>
<wire x1="-7.4082" y1="2.1723" x2="-5.8764" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="2.1723" x2="-5.8764" y2="2.0887" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="2.0887" x2="-5.9182" y2="2.0052" width="0.1016" layer="21"/>
<wire x1="-5.9182" y1="2.0052" x2="-5.8764" y2="1.9355" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="1.9355" x2="-5.8764" y2="1.8659" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="1.8659" x2="-5.5283" y2="0.9886" width="0.1016" layer="21"/>
<wire x1="-5.5283" y1="0.9886" x2="-4.5396" y2="1.9634" width="0.1016" layer="21"/>
<wire x1="-4.5396" y1="1.9634" x2="-4.4839" y2="2.033" width="0.1016" layer="21"/>
<wire x1="-4.4839" y1="2.033" x2="-4.4422" y2="2.1166" width="0.1016" layer="21"/>
<wire x1="-4.4422" y1="2.1166" x2="-4.4282" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-4.4282" y1="2.1723" x2="-3.551" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-3.551" y1="2.1723" x2="-3.732" y2="2.0469" width="0.1016" layer="21"/>
<wire x1="-3.732" y1="2.0469" x2="-3.8712" y2="1.9495" width="0.1016" layer="21"/>
<wire x1="-3.8712" y1="1.9495" x2="-4.0662" y2="1.7824" width="0.1016" layer="21"/>
<wire x1="-4.0662" y1="1.7824" x2="-5.3751" y2="0.557" width="0.1016" layer="21"/>
<wire x1="-5.3751" y1="0.557" x2="-4.5953" y2="-1.3647" width="0.1016" layer="21"/>
<wire x1="-4.5953" y1="-1.3647" x2="-4.3725" y2="-1.671" width="0.1016" layer="21"/>
<wire x1="-4.3725" y1="-1.671" x2="-4.3308" y2="-1.671" width="0.1016" layer="21"/>
<wire x1="-4.3308" y1="-1.671" x2="-4.2472" y2="-1.5875" width="0.1016" layer="21"/>
<wire x1="-4.2472" y1="-1.5875" x2="-4.1358" y2="-1.2533" width="0.1016" layer="21"/>
<wire x1="-4.1358" y1="-1.2533" x2="-3.9687" y2="-0.6267" width="0.1016" layer="21"/>
<wire x1="-3.9687" y1="-0.6267" x2="-3.7738" y2="0.1671" width="0.1016" layer="21"/>
<wire x1="-3.7738" y1="0.1671" x2="-3.4117" y2="1.6431" width="0.1016" layer="21"/>
<wire x1="-3.4117" y1="1.6431" x2="-3.356" y2="1.8938" width="0.1016" layer="21"/>
<wire x1="-3.356" y1="1.8938" x2="-3.356" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-3.356" y1="2.1723" x2="-0.195" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-0.195" y1="2.1723" x2="-0.0279" y2="2.1305" width="0.1016" layer="21"/>
<wire x1="-0.0279" y1="2.1305" x2="0.0835" y2="2.0609" width="0.1016" layer="21"/>
<wire x1="0.0835" y1="2.0609" x2="0.167" y2="1.9077" width="0.1016" layer="21"/>
<wire x1="0.167" y1="1.9077" x2="0.2227" y2="1.7684" width="0.1016" layer="21"/>
<wire x1="0.2227" y1="1.7684" x2="0.2227" y2="1.5317" width="0.1016" layer="21"/>
<wire x1="0.2227" y1="1.5317" x2="0.1809" y2="1.4203" width="0.1016" layer="21"/>
<wire x1="0.1809" y1="1.4203" x2="0.0138" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="0.0138" y1="0.7241" x2="-0.0419" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="-0.0419" y1="0.5848" x2="-0.2507" y2="0.3759" width="0.1016" layer="21"/>
<wire x1="-0.2507" y1="0.3759" x2="-0.4178" y2="0.3063" width="0.1016" layer="21"/>
<wire x1="-0.4178" y1="0.3063" x2="-0.6406" y2="0.2506" width="0.1016" layer="21"/>
<wire x1="-0.6406" y1="0.2506" x2="-0.9191" y2="0.2506" width="0.1016" layer="21"/>
<wire x1="-0.9191" y1="0.2506" x2="-0.5153" y2="0.1949" width="0.1016" layer="21"/>
<wire x1="-0.5153" y1="0.1949" x2="-0.2229" y2="0.0557" width="0.1016" layer="21"/>
<wire x1="-0.2229" y1="0.0557" x2="-0.209" y2="0.0278" width="0.1016" layer="21"/>
<wire x1="-0.209" y1="0.0278" x2="-0.209" y2="-0.3482" width="0.1016" layer="21"/>
<wire x1="-0.209" y1="-0.3482" x2="-0.3621" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="-0.3621" y1="-0.9609" x2="-0.4596" y2="-1.114" width="0.1016" layer="21"/>
<wire x1="-0.4596" y1="-1.114" x2="-0.4875" y2="-1.2811" width="0.1016" layer="21"/>
<wire x1="-0.4875" y1="-1.2811" x2="-0.6963" y2="-1.5179" width="0.1016" layer="21"/>
<wire x1="-0.6963" y1="-1.5179" x2="-0.8634" y2="-1.6014" width="0.1016" layer="21"/>
<wire x1="-0.8634" y1="-1.6014" x2="-1.128" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-1.128" y1="-1.685" x2="-5.96" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-5.96" y1="-1.685" x2="-5.8764" y2="-1.5318" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="-1.5318" x2="-5.8764" y2="-1.4343" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="-1.4343" x2="-6.322" y2="-0.3342" width="0.1016" layer="21"/>
<wire x1="-6.322" y1="-0.3342" x2="-7.4778" y2="-1.4622" width="0.1016" layer="21"/>
<wire x1="-7.4778" y1="-1.4622" x2="-7.6031" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-7.6031" y1="-1.685" x2="-8.4247" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-8.4247" y1="-1.685" x2="-8.0766" y2="-1.4343" width="0.1016" layer="21"/>
<wire x1="-8.0766" y1="-1.4343" x2="-6.4613" y2="0.0835" width="0.1016" layer="21"/>
<wire x1="-6.4613" y1="0.0835" x2="-7.255" y2="2.0191" width="0.1016" layer="21"/>
<wire x1="-7.255" y1="2.0191" x2="-7.4082" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-2.2977" y1="1.6988" x2="-1.0166" y2="1.6988" width="0.1016" layer="21"/>
<wire x1="-1.0166" y1="1.6988" x2="-0.8913" y2="1.6292" width="0.1016" layer="21"/>
<wire x1="-0.8913" y1="1.6292" x2="-0.8774" y2="1.4064" width="0.1016" layer="21"/>
<wire x1="-0.8774" y1="1.4064" x2="-1.0723" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="-1.0723" y1="0.6684" x2="-1.1141" y2="0.5709" width="0.1016" layer="21"/>
<wire x1="-1.1141" y1="0.5709" x2="-1.1976" y2="0.5152" width="0.1016" layer="21"/>
<wire x1="-1.1976" y1="0.5152" x2="-2.5901" y2="0.5152" width="0.1016" layer="21"/>
<wire x1="-2.5901" y1="0.5152" x2="-2.2977" y2="1.6988" width="0.1016" layer="21"/>
<wire x1="-2.6876" y1="0.0139" x2="-1.4204" y2="0.0139" width="0.1016" layer="21"/>
<wire x1="-1.4204" y1="0.0139" x2="-1.309" y2="-0.0279" width="0.1016" layer="21"/>
<wire x1="-1.309" y1="-0.0279" x2="-1.2394" y2="-0.1254" width="0.1016" layer="21"/>
<wire x1="-1.2394" y1="-0.1254" x2="-1.2394" y2="-0.1671" width="0.1016" layer="21"/>
<wire x1="-1.2394" y1="-0.1671" x2="-1.4483" y2="-0.9887" width="0.1016" layer="21"/>
<wire x1="-1.4483" y1="-0.9887" x2="-1.504" y2="-1.0723" width="0.1016" layer="21"/>
<wire x1="-1.504" y1="-1.0723" x2="-1.6015" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="-1.6015" y1="-1.1837" x2="-1.6572" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="-1.6572" y1="-1.2115" x2="-3.0079" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="-3.0079" y1="-1.2115" x2="-2.6876" y2="0.0139" width="0.1016" layer="21"/>
<wire x1="1.3646" y1="-0.0975" x2="1.462" y2="0.4734" width="0.1016" layer="21"/>
<wire x1="1.462" y1="0.4734" x2="1.5038" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="1.5038" y1="0.5848" x2="1.5595" y2="0.6823" width="0.1016" layer="21"/>
<wire x1="1.5595" y1="0.6823" x2="1.6431" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="1.6431" y1="0.7241" x2="2.6317" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="2.6317" y1="0.7241" x2="2.6874" y2="0.7101" width="0.1016" layer="21"/>
<wire x1="2.6874" y1="0.7101" x2="2.7292" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="2.7292" y1="0.6684" x2="2.7292" y2="0.4873" width="0.1016" layer="21"/>
<wire x1="2.7292" y1="0.4873" x2="2.576" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="2.576" y1="-0.1114" x2="1.3785" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="1.3785" y1="-0.1114" x2="1.3646" y2="-0.0975" width="0.1016" layer="21"/>
<wire x1="3.1609" y1="-1.685" x2="0.4037" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="0.4037" y1="-1.685" x2="0.2923" y2="-1.6571" width="0.1016" layer="21"/>
<wire x1="0.2923" y1="-1.6571" x2="0.1809" y2="-1.5736" width="0.1016" layer="21"/>
<wire x1="0.1809" y1="-1.5736" x2="0.1113" y2="-1.4761" width="0.1016" layer="21"/>
<wire x1="0.1113" y1="-1.4761" x2="0.0695" y2="-1.3229" width="0.1016" layer="21"/>
<wire x1="0.0695" y1="-1.3229" x2="0.0695" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="0.0695" y1="-1.1837" x2="0.0974" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="0.0974" y1="-0.9609" x2="0.3759" y2="0.2785" width="0.1016" layer="21"/>
<wire x1="0.3759" y1="0.2785" x2="0.4177" y2="0.4316" width="0.1016" layer="21"/>
<wire x1="0.4177" y1="0.4316" x2="0.5848" y2="0.7658" width="0.1016" layer="21"/>
<wire x1="0.5848" y1="0.7658" x2="0.7101" y2="0.9469" width="0.1016" layer="21"/>
<wire x1="0.7101" y1="0.9469" x2="0.9329" y2="1.0861" width="0.1016" layer="21"/>
<wire x1="0.9329" y1="1.0861" x2="1.1" y2="1.1418" width="0.1016" layer="21"/>
<wire x1="1.1" y1="1.1418" x2="1.1835" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="1.1835" y1="1.1557" x2="3.3698" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="3.3698" y1="1.1557" x2="3.5229" y2="1.1" width="0.1016" layer="21"/>
<wire x1="3.5229" y1="1.1" x2="3.704" y2="0.9608" width="0.1016" layer="21"/>
<wire x1="3.704" y1="0.9608" x2="3.7597" y2="0.9051" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="0.9051" x2="3.7597" y2="0.4177" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="0.4177" x2="3.5229" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="3.5229" y1="-0.5431" x2="1.2392" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="1.2392" y1="-0.5431" x2="1.1278" y2="-1.0166" width="0.1016" layer="21"/>
<wire x1="1.1278" y1="-1.0166" x2="1.1" y2="-1.1001" width="0.1016" layer="21"/>
<wire x1="1.1" y1="-1.1001" x2="1.1139" y2="-1.1976" width="0.1016" layer="21"/>
<wire x1="1.1139" y1="-1.1976" x2="1.1696" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="1.1696" y1="-1.2394" x2="3.1748" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="3.1748" y1="-1.2394" x2="3.3558" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="3.3558" y1="-1.2115" x2="3.1609" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="5.0686" y1="-0.0975" x2="5.166" y2="0.4734" width="0.1016" layer="21"/>
<wire x1="5.166" y1="0.4734" x2="5.2078" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="5.2078" y1="0.5848" x2="5.2635" y2="0.6823" width="0.1016" layer="21"/>
<wire x1="5.2635" y1="0.6823" x2="5.3471" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="5.3471" y1="0.7241" x2="6.3357" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="6.3357" y1="0.7241" x2="6.3914" y2="0.7101" width="0.1016" layer="21"/>
<wire x1="6.3914" y1="0.7101" x2="6.4332" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="6.4332" y1="0.6684" x2="6.4332" y2="0.4873" width="0.1016" layer="21"/>
<wire x1="6.4332" y1="0.4873" x2="6.28" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="6.28" y1="-0.1114" x2="5.0825" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="5.0825" y1="-0.1114" x2="5.0686" y2="-0.0975" width="0.1016" layer="21"/>
<wire x1="6.8649" y1="-1.685" x2="4.1077" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="4.1077" y1="-1.685" x2="3.9963" y2="-1.6571" width="0.1016" layer="21"/>
<wire x1="3.9963" y1="-1.6571" x2="3.8849" y2="-1.5736" width="0.1016" layer="21"/>
<wire x1="3.8849" y1="-1.5736" x2="3.8153" y2="-1.4761" width="0.1016" layer="21"/>
<wire x1="3.8153" y1="-1.4761" x2="3.7735" y2="-1.3229" width="0.1016" layer="21"/>
<wire x1="3.7735" y1="-1.3229" x2="3.7735" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="3.7735" y1="-1.1837" x2="3.8014" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="3.8014" y1="-0.9609" x2="4.0799" y2="0.2785" width="0.1016" layer="21"/>
<wire x1="4.0799" y1="0.2785" x2="4.1217" y2="0.4316" width="0.1016" layer="21"/>
<wire x1="4.1217" y1="0.4316" x2="4.2888" y2="0.7658" width="0.1016" layer="21"/>
<wire x1="4.2888" y1="0.7658" x2="4.4141" y2="0.9469" width="0.1016" layer="21"/>
<wire x1="4.4141" y1="0.9469" x2="4.6369" y2="1.0861" width="0.1016" layer="21"/>
<wire x1="4.6369" y1="1.0861" x2="4.804" y2="1.1418" width="0.1016" layer="21"/>
<wire x1="4.804" y1="1.1418" x2="4.8875" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="4.8875" y1="1.1557" x2="7.0738" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="7.0738" y1="1.1557" x2="7.2269" y2="1.1" width="0.1016" layer="21"/>
<wire x1="7.2269" y1="1.1" x2="7.408" y2="0.9608" width="0.1016" layer="21"/>
<wire x1="7.408" y1="0.9608" x2="7.4637" y2="0.9051" width="0.1016" layer="21"/>
<wire x1="7.4637" y1="0.9051" x2="7.4637" y2="0.4177" width="0.1016" layer="21"/>
<wire x1="7.4637" y1="0.4177" x2="7.2269" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="7.2269" y1="-0.5431" x2="4.9432" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="4.9432" y1="-0.5431" x2="4.8318" y2="-1.0166" width="0.1016" layer="21"/>
<wire x1="4.8318" y1="-1.0166" x2="4.804" y2="-1.1001" width="0.1016" layer="21"/>
<wire x1="4.804" y1="-1.1001" x2="4.8179" y2="-1.1976" width="0.1016" layer="21"/>
<wire x1="4.8179" y1="-1.1976" x2="4.8736" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="4.8736" y1="-1.2394" x2="6.8788" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="6.8788" y1="-1.2394" x2="7.0598" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="7.0598" y1="-1.2115" x2="6.8649" y2="-1.685" width="0.1016" layer="21"/>
<pad name="1" x="-11" y="9" drill="0.8" diameter="1.27"/>
<pad name="2" x="-11" y="7" drill="0.8" diameter="1.27"/>
<pad name="3" x="-11" y="5" drill="0.8" diameter="1.27"/>
<pad name="4" x="-11" y="3" drill="0.8" diameter="1.27"/>
<pad name="5" x="-11" y="1" drill="0.8" diameter="1.27"/>
<pad name="6" x="-11" y="-1" drill="0.8" diameter="1.27"/>
<pad name="7" x="-11" y="-3" drill="0.8" diameter="1.27"/>
<pad name="8" x="-11" y="-5" drill="0.8" diameter="1.27"/>
<pad name="9" x="-11" y="-7" drill="0.8" diameter="1.27"/>
<pad name="10" x="-11" y="-9" drill="0.8" diameter="1.27"/>
<pad name="11" x="11" y="-9" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="12" x="11" y="-7" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="13" x="11" y="-5" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="14" x="11" y="-3" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="15" x="11" y="-1" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="16" x="11" y="1" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="17" x="11" y="3" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="18" x="11" y="5" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="19" x="11" y="7" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="20" x="11" y="9" drill="0.8" diameter="1.27" rot="R180"/>
<text x="-11.43" y="13.97" size="1.27" layer="25">&gt;NAME</text>
<text x="-11.43" y="-13.97" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="XBEE-PRO">
<description>&lt;b&gt;XBEE Pro&lt;/b&gt;&lt;p&gt;
Source: http://www.maxstream.net/products/xbee/datasheet_XBee_OEM_RF-Modules.pdf</description>
<wire x1="-12.1" y1="-17.305" x2="-12.1" y2="9.1" width="0.2032" layer="21"/>
<wire x1="-12.1" y1="9.1" x2="-5.775" y2="15.425" width="0.2032" layer="21"/>
<wire x1="-5.775" y1="15.425" x2="5.775" y2="15.425" width="0.2032" layer="21"/>
<wire x1="5.775" y1="15.425" x2="12.1" y2="9.1" width="0.2032" layer="21"/>
<wire x1="12.1" y1="9.1" x2="12.1" y2="-17.305" width="0.2032" layer="21"/>
<wire x1="12.1" y1="-17.305" x2="-12.1" y2="-17.305" width="0.2032" layer="21"/>
<wire x1="-8.3829" y1="2.8685" x2="7.4359" y2="2.8685" width="0.1524" layer="21"/>
<wire x1="-8.3829" y1="-2.4369" x2="7.4359" y2="-2.4369" width="0.1524" layer="21"/>
<wire x1="-7.4082" y1="2.1723" x2="-5.8764" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="2.1723" x2="-5.8764" y2="2.0887" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="2.0887" x2="-5.9182" y2="2.0052" width="0.1016" layer="21"/>
<wire x1="-5.9182" y1="2.0052" x2="-5.8764" y2="1.9355" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="1.9355" x2="-5.8764" y2="1.8659" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="1.8659" x2="-5.5283" y2="0.9886" width="0.1016" layer="21"/>
<wire x1="-5.5283" y1="0.9886" x2="-4.5396" y2="1.9634" width="0.1016" layer="21"/>
<wire x1="-4.5396" y1="1.9634" x2="-4.4839" y2="2.033" width="0.1016" layer="21"/>
<wire x1="-4.4839" y1="2.033" x2="-4.4422" y2="2.1166" width="0.1016" layer="21"/>
<wire x1="-4.4422" y1="2.1166" x2="-4.4282" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-4.4282" y1="2.1723" x2="-3.551" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-3.551" y1="2.1723" x2="-3.732" y2="2.0469" width="0.1016" layer="21"/>
<wire x1="-3.732" y1="2.0469" x2="-3.8712" y2="1.9495" width="0.1016" layer="21"/>
<wire x1="-3.8712" y1="1.9495" x2="-4.0662" y2="1.7824" width="0.1016" layer="21"/>
<wire x1="-4.0662" y1="1.7824" x2="-5.3751" y2="0.557" width="0.1016" layer="21"/>
<wire x1="-5.3751" y1="0.557" x2="-4.5953" y2="-1.3647" width="0.1016" layer="21"/>
<wire x1="-4.5953" y1="-1.3647" x2="-4.3725" y2="-1.671" width="0.1016" layer="21"/>
<wire x1="-4.3725" y1="-1.671" x2="-4.3308" y2="-1.671" width="0.1016" layer="21"/>
<wire x1="-4.3308" y1="-1.671" x2="-4.2472" y2="-1.5875" width="0.1016" layer="21"/>
<wire x1="-4.2472" y1="-1.5875" x2="-4.1358" y2="-1.2533" width="0.1016" layer="21"/>
<wire x1="-4.1358" y1="-1.2533" x2="-3.9687" y2="-0.6267" width="0.1016" layer="21"/>
<wire x1="-3.9687" y1="-0.6267" x2="-3.7738" y2="0.1671" width="0.1016" layer="21"/>
<wire x1="-3.7738" y1="0.1671" x2="-3.4117" y2="1.6431" width="0.1016" layer="21"/>
<wire x1="-3.4117" y1="1.6431" x2="-3.356" y2="1.8938" width="0.1016" layer="21"/>
<wire x1="-3.356" y1="1.8938" x2="-3.356" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-3.356" y1="2.1723" x2="-0.195" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-0.195" y1="2.1723" x2="-0.0279" y2="2.1305" width="0.1016" layer="21"/>
<wire x1="-0.0279" y1="2.1305" x2="0.0835" y2="2.0609" width="0.1016" layer="21"/>
<wire x1="0.0835" y1="2.0609" x2="0.167" y2="1.9077" width="0.1016" layer="21"/>
<wire x1="0.167" y1="1.9077" x2="0.2227" y2="1.7684" width="0.1016" layer="21"/>
<wire x1="0.2227" y1="1.7684" x2="0.2227" y2="1.5317" width="0.1016" layer="21"/>
<wire x1="0.2227" y1="1.5317" x2="0.1809" y2="1.4203" width="0.1016" layer="21"/>
<wire x1="0.1809" y1="1.4203" x2="0.0138" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="0.0138" y1="0.7241" x2="-0.0419" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="-0.0419" y1="0.5848" x2="-0.2507" y2="0.3759" width="0.1016" layer="21"/>
<wire x1="-0.2507" y1="0.3759" x2="-0.4178" y2="0.3063" width="0.1016" layer="21"/>
<wire x1="-0.4178" y1="0.3063" x2="-0.6406" y2="0.2506" width="0.1016" layer="21"/>
<wire x1="-0.6406" y1="0.2506" x2="-0.9191" y2="0.2506" width="0.1016" layer="21"/>
<wire x1="-0.9191" y1="0.2506" x2="-0.5153" y2="0.1949" width="0.1016" layer="21"/>
<wire x1="-0.5153" y1="0.1949" x2="-0.2229" y2="0.0557" width="0.1016" layer="21"/>
<wire x1="-0.2229" y1="0.0557" x2="-0.209" y2="0.0278" width="0.1016" layer="21"/>
<wire x1="-0.209" y1="0.0278" x2="-0.209" y2="-0.3482" width="0.1016" layer="21"/>
<wire x1="-0.209" y1="-0.3482" x2="-0.3621" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="-0.3621" y1="-0.9609" x2="-0.4596" y2="-1.114" width="0.1016" layer="21"/>
<wire x1="-0.4596" y1="-1.114" x2="-0.4875" y2="-1.2811" width="0.1016" layer="21"/>
<wire x1="-0.4875" y1="-1.2811" x2="-0.6963" y2="-1.5179" width="0.1016" layer="21"/>
<wire x1="-0.6963" y1="-1.5179" x2="-0.8634" y2="-1.6014" width="0.1016" layer="21"/>
<wire x1="-0.8634" y1="-1.6014" x2="-1.128" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-1.128" y1="-1.685" x2="-5.96" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-5.96" y1="-1.685" x2="-5.8764" y2="-1.5318" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="-1.5318" x2="-5.8764" y2="-1.4343" width="0.1016" layer="21"/>
<wire x1="-5.8764" y1="-1.4343" x2="-6.322" y2="-0.3342" width="0.1016" layer="21"/>
<wire x1="-6.322" y1="-0.3342" x2="-7.4778" y2="-1.4622" width="0.1016" layer="21"/>
<wire x1="-7.4778" y1="-1.4622" x2="-7.6031" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-7.6031" y1="-1.685" x2="-8.4247" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="-8.4247" y1="-1.685" x2="-8.0766" y2="-1.4343" width="0.1016" layer="21"/>
<wire x1="-8.0766" y1="-1.4343" x2="-6.4613" y2="0.0835" width="0.1016" layer="21"/>
<wire x1="-6.4613" y1="0.0835" x2="-7.255" y2="2.0191" width="0.1016" layer="21"/>
<wire x1="-7.255" y1="2.0191" x2="-7.4082" y2="2.1723" width="0.1016" layer="21"/>
<wire x1="-2.2977" y1="1.6988" x2="-1.0166" y2="1.6988" width="0.1016" layer="21"/>
<wire x1="-1.0166" y1="1.6988" x2="-0.8913" y2="1.6292" width="0.1016" layer="21"/>
<wire x1="-0.8913" y1="1.6292" x2="-0.8774" y2="1.4064" width="0.1016" layer="21"/>
<wire x1="-0.8774" y1="1.4064" x2="-1.0723" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="-1.0723" y1="0.6684" x2="-1.1141" y2="0.5709" width="0.1016" layer="21"/>
<wire x1="-1.1141" y1="0.5709" x2="-1.1976" y2="0.5152" width="0.1016" layer="21"/>
<wire x1="-1.1976" y1="0.5152" x2="-2.5901" y2="0.5152" width="0.1016" layer="21"/>
<wire x1="-2.5901" y1="0.5152" x2="-2.2977" y2="1.6988" width="0.1016" layer="21"/>
<wire x1="-2.6876" y1="0.0139" x2="-1.4204" y2="0.0139" width="0.1016" layer="21"/>
<wire x1="-1.4204" y1="0.0139" x2="-1.309" y2="-0.0279" width="0.1016" layer="21"/>
<wire x1="-1.309" y1="-0.0279" x2="-1.2394" y2="-0.1254" width="0.1016" layer="21"/>
<wire x1="-1.2394" y1="-0.1254" x2="-1.2394" y2="-0.1671" width="0.1016" layer="21"/>
<wire x1="-1.2394" y1="-0.1671" x2="-1.4483" y2="-0.9887" width="0.1016" layer="21"/>
<wire x1="-1.4483" y1="-0.9887" x2="-1.504" y2="-1.0723" width="0.1016" layer="21"/>
<wire x1="-1.504" y1="-1.0723" x2="-1.6015" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="-1.6015" y1="-1.1837" x2="-1.6572" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="-1.6572" y1="-1.2115" x2="-3.0079" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="-3.0079" y1="-1.2115" x2="-2.6876" y2="0.0139" width="0.1016" layer="21"/>
<wire x1="1.3646" y1="-0.0975" x2="1.462" y2="0.4734" width="0.1016" layer="21"/>
<wire x1="1.462" y1="0.4734" x2="1.5038" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="1.5038" y1="0.5848" x2="1.5595" y2="0.6823" width="0.1016" layer="21"/>
<wire x1="1.5595" y1="0.6823" x2="1.6431" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="1.6431" y1="0.7241" x2="2.6317" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="2.6317" y1="0.7241" x2="2.6874" y2="0.7101" width="0.1016" layer="21"/>
<wire x1="2.6874" y1="0.7101" x2="2.7292" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="2.7292" y1="0.6684" x2="2.7292" y2="0.4873" width="0.1016" layer="21"/>
<wire x1="2.7292" y1="0.4873" x2="2.576" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="2.576" y1="-0.1114" x2="1.3785" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="1.3785" y1="-0.1114" x2="1.3646" y2="-0.0975" width="0.1016" layer="21"/>
<wire x1="3.1609" y1="-1.685" x2="0.4037" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="0.4037" y1="-1.685" x2="0.2923" y2="-1.6571" width="0.1016" layer="21"/>
<wire x1="0.2923" y1="-1.6571" x2="0.1809" y2="-1.5736" width="0.1016" layer="21"/>
<wire x1="0.1809" y1="-1.5736" x2="0.1113" y2="-1.4761" width="0.1016" layer="21"/>
<wire x1="0.1113" y1="-1.4761" x2="0.0695" y2="-1.3229" width="0.1016" layer="21"/>
<wire x1="0.0695" y1="-1.3229" x2="0.0695" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="0.0695" y1="-1.1837" x2="0.0974" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="0.0974" y1="-0.9609" x2="0.3759" y2="0.2785" width="0.1016" layer="21"/>
<wire x1="0.3759" y1="0.2785" x2="0.4177" y2="0.4316" width="0.1016" layer="21"/>
<wire x1="0.4177" y1="0.4316" x2="0.5848" y2="0.7658" width="0.1016" layer="21"/>
<wire x1="0.5848" y1="0.7658" x2="0.7101" y2="0.9469" width="0.1016" layer="21"/>
<wire x1="0.7101" y1="0.9469" x2="0.9329" y2="1.0861" width="0.1016" layer="21"/>
<wire x1="0.9329" y1="1.0861" x2="1.1" y2="1.1418" width="0.1016" layer="21"/>
<wire x1="1.1" y1="1.1418" x2="1.1835" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="1.1835" y1="1.1557" x2="3.3698" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="3.3698" y1="1.1557" x2="3.5229" y2="1.1" width="0.1016" layer="21"/>
<wire x1="3.5229" y1="1.1" x2="3.704" y2="0.9608" width="0.1016" layer="21"/>
<wire x1="3.704" y1="0.9608" x2="3.7597" y2="0.9051" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="0.9051" x2="3.7597" y2="0.4177" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="0.4177" x2="3.5229" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="3.5229" y1="-0.5431" x2="1.2392" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="1.2392" y1="-0.5431" x2="1.1278" y2="-1.0166" width="0.1016" layer="21"/>
<wire x1="1.1278" y1="-1.0166" x2="1.1" y2="-1.1001" width="0.1016" layer="21"/>
<wire x1="1.1" y1="-1.1001" x2="1.1139" y2="-1.1976" width="0.1016" layer="21"/>
<wire x1="1.1139" y1="-1.1976" x2="1.1696" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="1.1696" y1="-1.2394" x2="3.1748" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="3.1748" y1="-1.2394" x2="3.3558" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="3.3558" y1="-1.2115" x2="3.1609" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="5.0686" y1="-0.0975" x2="5.166" y2="0.4734" width="0.1016" layer="21"/>
<wire x1="5.166" y1="0.4734" x2="5.2078" y2="0.5848" width="0.1016" layer="21"/>
<wire x1="5.2078" y1="0.5848" x2="5.2635" y2="0.6823" width="0.1016" layer="21"/>
<wire x1="5.2635" y1="0.6823" x2="5.3471" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="5.3471" y1="0.7241" x2="6.3357" y2="0.7241" width="0.1016" layer="21"/>
<wire x1="6.3357" y1="0.7241" x2="6.3914" y2="0.7101" width="0.1016" layer="21"/>
<wire x1="6.3914" y1="0.7101" x2="6.4332" y2="0.6684" width="0.1016" layer="21"/>
<wire x1="6.4332" y1="0.6684" x2="6.4332" y2="0.4873" width="0.1016" layer="21"/>
<wire x1="6.4332" y1="0.4873" x2="6.28" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="6.28" y1="-0.1114" x2="5.0825" y2="-0.1114" width="0.1016" layer="21"/>
<wire x1="5.0825" y1="-0.1114" x2="5.0686" y2="-0.0975" width="0.1016" layer="21"/>
<wire x1="6.8649" y1="-1.685" x2="4.1077" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="4.1077" y1="-1.685" x2="3.9963" y2="-1.6571" width="0.1016" layer="21"/>
<wire x1="3.9963" y1="-1.6571" x2="3.8849" y2="-1.5736" width="0.1016" layer="21"/>
<wire x1="3.8849" y1="-1.5736" x2="3.8153" y2="-1.4761" width="0.1016" layer="21"/>
<wire x1="3.8153" y1="-1.4761" x2="3.7735" y2="-1.3229" width="0.1016" layer="21"/>
<wire x1="3.7735" y1="-1.3229" x2="3.7735" y2="-1.1837" width="0.1016" layer="21"/>
<wire x1="3.7735" y1="-1.1837" x2="3.8014" y2="-0.9609" width="0.1016" layer="21"/>
<wire x1="3.8014" y1="-0.9609" x2="4.0799" y2="0.2785" width="0.1016" layer="21"/>
<wire x1="4.0799" y1="0.2785" x2="4.1217" y2="0.4316" width="0.1016" layer="21"/>
<wire x1="4.1217" y1="0.4316" x2="4.2888" y2="0.7658" width="0.1016" layer="21"/>
<wire x1="4.2888" y1="0.7658" x2="4.4141" y2="0.9469" width="0.1016" layer="21"/>
<wire x1="4.4141" y1="0.9469" x2="4.6369" y2="1.0861" width="0.1016" layer="21"/>
<wire x1="4.6369" y1="1.0861" x2="4.804" y2="1.1418" width="0.1016" layer="21"/>
<wire x1="4.804" y1="1.1418" x2="4.8875" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="4.8875" y1="1.1557" x2="7.0738" y2="1.1557" width="0.1016" layer="21"/>
<wire x1="7.0738" y1="1.1557" x2="7.2269" y2="1.1" width="0.1016" layer="21"/>
<wire x1="7.2269" y1="1.1" x2="7.408" y2="0.9608" width="0.1016" layer="21"/>
<wire x1="7.408" y1="0.9608" x2="7.4637" y2="0.9051" width="0.1016" layer="21"/>
<wire x1="7.4637" y1="0.9051" x2="7.4637" y2="0.4177" width="0.1016" layer="21"/>
<wire x1="7.4637" y1="0.4177" x2="7.2269" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="7.2269" y1="-0.5431" x2="4.9432" y2="-0.5431" width="0.1016" layer="21"/>
<wire x1="4.9432" y1="-0.5431" x2="4.8318" y2="-1.0166" width="0.1016" layer="21"/>
<wire x1="4.8318" y1="-1.0166" x2="4.804" y2="-1.1001" width="0.1016" layer="21"/>
<wire x1="4.804" y1="-1.1001" x2="4.8179" y2="-1.1976" width="0.1016" layer="21"/>
<wire x1="4.8179" y1="-1.1976" x2="4.8736" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="4.8736" y1="-1.2394" x2="6.8788" y2="-1.2394" width="0.1016" layer="21"/>
<wire x1="6.8788" y1="-1.2394" x2="7.0598" y2="-1.2115" width="0.1016" layer="21"/>
<wire x1="7.0598" y1="-1.2115" x2="6.8649" y2="-1.685" width="0.1016" layer="21"/>
<wire x1="0.2923" y1="-3.4117" x2="0.4177" y2="-3.4117" width="0.1016" layer="21"/>
<wire x1="0.4177" y1="-3.4117" x2="0.5291" y2="-3.3281" width="0.1016" layer="21"/>
<wire x1="0.5291" y1="-3.3281" x2="0.6405" y2="-3.2167" width="0.1016" layer="21"/>
<wire x1="0.6405" y1="-3.2167" x2="0.7658" y2="-3.2863" width="0.1016" layer="21"/>
<wire x1="0.7658" y1="-3.2863" x2="1.2671" y2="-3.2863" width="0.1016" layer="21"/>
<wire x1="1.2671" y1="-3.2863" x2="1.6709" y2="-3.3281" width="0.1016" layer="21"/>
<wire x1="1.6709" y1="-3.3281" x2="1.9494" y2="-3.4952" width="0.1016" layer="21"/>
<wire x1="1.9494" y1="-3.4952" x2="2.019" y2="-3.6205" width="0.1016" layer="21"/>
<wire x1="2.019" y1="-3.6205" x2="2.019" y2="-3.6762" width="0.1016" layer="21"/>
<wire x1="2.019" y1="-3.6762" x2="1.9633" y2="-3.8016" width="0.1016" layer="21"/>
<wire x1="1.9633" y1="-3.8016" x2="1.8798" y2="-3.899" width="0.1016" layer="21"/>
<wire x1="1.8798" y1="-3.899" x2="1.7127" y2="-4.0104" width="0.1016" layer="21"/>
<wire x1="1.7127" y1="-4.0104" x2="1.1" y2="-4.3168" width="0.1016" layer="21"/>
<wire x1="1.1" y1="-4.3168" x2="0.7797" y2="-4.4421" width="0.1016" layer="21"/>
<wire x1="0.7797" y1="-4.4421" x2="0.5291" y2="-4.4978" width="0.1016" layer="21"/>
<wire x1="0.5291" y1="-4.4978" x2="0.4455" y2="-4.5117" width="0.1016" layer="21"/>
<wire x1="0.4455" y1="-4.5117" x2="0.348" y2="-4.5117" width="0.1016" layer="21"/>
<wire x1="0.348" y1="-4.5117" x2="0.3063" y2="-4.6371" width="0.1016" layer="21"/>
<wire x1="0.3063" y1="-4.6371" x2="0.2227" y2="-4.8877" width="0.1016" layer="21"/>
<wire x1="0.2227" y1="-4.8877" x2="0.1531" y2="-5.1105" width="0.1016" layer="21"/>
<wire x1="0.1531" y1="-5.1105" x2="0.0974" y2="-5.208" width="0.1016" layer="21"/>
<wire x1="0.0974" y1="-5.208" x2="0.0695" y2="-5.2637" width="0.1016" layer="21"/>
<wire x1="0.0695" y1="-5.2637" x2="0.0138" y2="-5.2915" width="0.1016" layer="21"/>
<wire x1="0.0138" y1="-5.2915" x2="-0.0558" y2="-5.2498" width="0.1016" layer="21"/>
<wire x1="-0.0558" y1="-5.2498" x2="-0.1115" y2="-5.1662" width="0.1016" layer="21"/>
<wire x1="-0.1115" y1="-5.1662" x2="-0.1115" y2="-5.0687" width="0.1016" layer="21"/>
<wire x1="-0.1115" y1="-5.0687" x2="-0.0836" y2="-4.9573" width="0.1016" layer="21"/>
<wire x1="-0.0836" y1="-4.9573" x2="0.0417" y2="-4.6928" width="0.1016" layer="21"/>
<wire x1="0.0417" y1="-4.6928" x2="0.1252" y2="-4.4978" width="0.1016" layer="21"/>
<wire x1="0.1252" y1="-4.4978" x2="0.1531" y2="-4.3168" width="0.1016" layer="21"/>
<wire x1="0.1531" y1="-4.3168" x2="0.1949" y2="-4.1497" width="0.1016" layer="21"/>
<wire x1="0.1949" y1="-4.1497" x2="0.2645" y2="-3.9269" width="0.1016" layer="21"/>
<wire x1="0.2645" y1="-3.9269" x2="0.3341" y2="-3.7598" width="0.1016" layer="21"/>
<wire x1="0.3341" y1="-3.7598" x2="0.4037" y2="-3.6484" width="0.1016" layer="21"/>
<wire x1="0.4037" y1="-3.6484" x2="0.2923" y2="-3.6484" width="0.1016" layer="21"/>
<wire x1="0.2923" y1="-3.6484" x2="0.2923" y2="-3.4117" width="0.1016" layer="21"/>
<wire x1="0.7797" y1="-3.5648" x2="1.4899" y2="-3.5648" width="0.1016" layer="21"/>
<wire x1="1.4899" y1="-3.5648" x2="1.657" y2="-3.6345" width="0.1016" layer="21"/>
<wire x1="1.657" y1="-3.6345" x2="1.6988" y2="-3.6623" width="0.1016" layer="21"/>
<wire x1="1.6988" y1="-3.6623" x2="1.6848" y2="-3.7041" width="0.1016" layer="21"/>
<wire x1="1.6848" y1="-3.7041" x2="1.6152" y2="-3.7598" width="0.1016" layer="21"/>
<wire x1="1.6152" y1="-3.7598" x2="1.3924" y2="-3.8712" width="0.1016" layer="21"/>
<wire x1="1.3924" y1="-3.8712" x2="1.2114" y2="-3.9965" width="0.1016" layer="21"/>
<wire x1="1.2114" y1="-3.9965" x2="0.9607" y2="-4.0661" width="0.1016" layer="21"/>
<wire x1="0.9607" y1="-4.0661" x2="0.7797" y2="-4.1358" width="0.1016" layer="21"/>
<wire x1="0.7797" y1="-4.1358" x2="0.6683" y2="-4.1497" width="0.1016" layer="21"/>
<wire x1="0.6683" y1="-4.1497" x2="0.5012" y2="-4.1497" width="0.1016" layer="21"/>
<wire x1="0.5012" y1="-4.1497" x2="0.7519" y2="-3.6345" width="0.1016" layer="21"/>
<wire x1="0.7519" y1="-3.6345" x2="0.7797" y2="-3.5648" width="0.1016" layer="21"/>
<wire x1="2.6596" y1="-3.6345" x2="2.6178" y2="-3.5788" width="0.1016" layer="21"/>
<wire x1="2.6178" y1="-3.5788" x2="2.5482" y2="-3.537" width="0.1016" layer="21"/>
<wire x1="2.5482" y1="-3.537" x2="2.5203" y2="-3.4813" width="0.1016" layer="21"/>
<wire x1="2.5203" y1="-3.4813" x2="2.5343" y2="-3.3977" width="0.1016" layer="21"/>
<wire x1="2.5343" y1="-3.3977" x2="2.6178" y2="-3.3142" width="0.1016" layer="21"/>
<wire x1="2.6178" y1="-3.3142" x2="2.771" y2="-3.2585" width="0.1016" layer="21"/>
<wire x1="2.771" y1="-3.2585" x2="2.952" y2="-3.1889" width="0.1016" layer="21"/>
<wire x1="2.952" y1="-3.1889" x2="3.7597" y2="-3.1889" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="-3.1889" x2="3.9268" y2="-3.2306" width="0.1016" layer="21"/>
<wire x1="3.9268" y1="-3.2306" x2="4.1217" y2="-3.3003" width="0.1016" layer="21"/>
<wire x1="4.1217" y1="-3.3003" x2="4.2331" y2="-3.3699" width="0.1016" layer="21"/>
<wire x1="4.2331" y1="-3.3699" x2="4.3306" y2="-3.4813" width="0.1016" layer="21"/>
<wire x1="4.3306" y1="-3.4813" x2="4.3584" y2="-3.5509" width="0.1016" layer="21"/>
<wire x1="4.3584" y1="-3.5509" x2="4.2888" y2="-3.6762" width="0.1016" layer="21"/>
<wire x1="4.2888" y1="-3.6762" x2="4.2888" y2="-3.7876" width="0.1016" layer="21"/>
<wire x1="4.2888" y1="-3.7876" x2="4.1774" y2="-3.899" width="0.1016" layer="21"/>
<wire x1="4.1774" y1="-3.899" x2="4.0242" y2="-3.9965" width="0.1016" layer="21"/>
<wire x1="4.0242" y1="-3.9965" x2="3.7179" y2="-4.1358" width="0.1016" layer="21"/>
<wire x1="3.7179" y1="-4.1358" x2="3.4255" y2="-4.3168" width="0.1016" layer="21"/>
<wire x1="3.4255" y1="-4.3168" x2="3.2862" y2="-4.4003" width="0.1016" layer="21"/>
<wire x1="3.2862" y1="-4.4003" x2="3.4951" y2="-4.6092" width="0.1016" layer="21"/>
<wire x1="3.4951" y1="-4.6092" x2="3.7597" y2="-4.7902" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="-4.7902" x2="3.9546" y2="-4.9434" width="0.1016" layer="21"/>
<wire x1="3.9546" y1="-4.9434" x2="4.066" y2="-5.0827" width="0.1016" layer="21"/>
<wire x1="4.066" y1="-5.0827" x2="4.1217" y2="-5.2219" width="0.1016" layer="21"/>
<wire x1="4.1217" y1="-5.2219" x2="4.1356" y2="-5.3055" width="0.1016" layer="21"/>
<wire x1="4.1356" y1="-5.3055" x2="4.0939" y2="-5.389" width="0.1016" layer="21"/>
<wire x1="4.0939" y1="-5.389" x2="4.0521" y2="-5.4029" width="0.1016" layer="21"/>
<wire x1="4.0521" y1="-5.4029" x2="3.9407" y2="-5.3194" width="0.1016" layer="21"/>
<wire x1="3.9407" y1="-5.3194" x2="3.3976" y2="-4.8877" width="0.1016" layer="21"/>
<wire x1="3.3976" y1="-4.8877" x2="2.8824" y2="-4.5396" width="0.1016" layer="21"/>
<wire x1="2.8824" y1="-4.5396" x2="2.7849" y2="-4.5396" width="0.1016" layer="21"/>
<wire x1="2.7849" y1="-4.5396" x2="2.7571" y2="-4.6371" width="0.1016" layer="21"/>
<wire x1="2.7571" y1="-4.6371" x2="2.6596" y2="-4.9156" width="0.1016" layer="21"/>
<wire x1="2.6596" y1="-4.9156" x2="2.576" y2="-5.1662" width="0.1016" layer="21"/>
<wire x1="2.576" y1="-5.1662" x2="2.5203" y2="-5.3055" width="0.1016" layer="21"/>
<wire x1="2.5203" y1="-5.3055" x2="2.5203" y2="-5.389" width="0.1016" layer="21"/>
<wire x1="2.5203" y1="-5.389" x2="2.3672" y2="-5.2498" width="0.1016" layer="21"/>
<wire x1="2.3672" y1="-5.2498" x2="2.3532" y2="-5.0409" width="0.1016" layer="21"/>
<wire x1="2.3532" y1="-5.0409" x2="2.3811" y2="-4.9016" width="0.1016" layer="21"/>
<wire x1="2.3811" y1="-4.9016" x2="2.5064" y2="-4.456" width="0.1016" layer="21"/>
<wire x1="2.5064" y1="-4.456" x2="2.576" y2="-4.2054" width="0.1016" layer="21"/>
<wire x1="2.576" y1="-4.2054" x2="2.7292" y2="-3.8573" width="0.1016" layer="21"/>
<wire x1="2.7292" y1="-3.8573" x2="2.8267" y2="-3.6762" width="0.1016" layer="21"/>
<wire x1="2.8267" y1="-3.6762" x2="2.8685" y2="-3.5788" width="0.1016" layer="21"/>
<wire x1="2.8685" y1="-3.5788" x2="2.771" y2="-3.5648" width="0.1016" layer="21"/>
<wire x1="2.771" y1="-3.5648" x2="2.6596" y2="-3.6484" width="0.1016" layer="21"/>
<wire x1="2.6596" y1="-3.6484" x2="2.6596" y2="-3.6345" width="0.1016" layer="21"/>
<wire x1="3.2584" y1="-3.5231" x2="3.7597" y2="-3.5231" width="0.1016" layer="21"/>
<wire x1="3.7597" y1="-3.5231" x2="3.9268" y2="-3.5509" width="0.1016" layer="21"/>
<wire x1="3.9268" y1="-3.5509" x2="3.9685" y2="-3.6345" width="0.1016" layer="21"/>
<wire x1="3.9685" y1="-3.6345" x2="3.8711" y2="-3.6623" width="0.1016" layer="21"/>
<wire x1="3.8711" y1="-3.6623" x2="3.7318" y2="-3.8016" width="0.1016" layer="21"/>
<wire x1="3.7318" y1="-3.8016" x2="3.5369" y2="-3.913" width="0.1016" layer="21"/>
<wire x1="3.5369" y1="-3.913" x2="3.3558" y2="-4.0104" width="0.1016" layer="21"/>
<wire x1="3.3558" y1="-4.0104" x2="3.147" y2="-4.0522" width="0.1016" layer="21"/>
<wire x1="3.147" y1="-4.0522" x2="2.9799" y2="-4.1358" width="0.1016" layer="21"/>
<wire x1="2.9799" y1="-4.1358" x2="3.2444" y2="-3.6623" width="0.1016" layer="21"/>
<wire x1="3.2444" y1="-3.6623" x2="3.2584" y2="-3.5231" width="0.1016" layer="21"/>
<wire x1="5.8484" y1="-3.6623" x2="6.1965" y2="-3.6623" width="0.1016" layer="21"/>
<wire x1="6.1965" y1="-3.6623" x2="6.3636" y2="-3.718" width="0.1016" layer="21"/>
<wire x1="6.3636" y1="-3.718" x2="6.67" y2="-4.0383" width="0.1016" layer="21"/>
<wire x1="6.67" y1="-4.0383" x2="6.67" y2="-4.3725" width="0.1016" layer="21"/>
<wire x1="6.67" y1="-4.3725" x2="6.3915" y2="-4.5674" width="0.1016" layer="21"/>
<wire x1="6.3915" y1="-4.5674" x2="6.0991" y2="-4.7345" width="0.1016" layer="21"/>
<wire x1="6.0991" y1="-4.7345" x2="5.7509" y2="-4.8459" width="0.1016" layer="21"/>
<wire x1="5.7509" y1="-4.8459" x2="5.4167" y2="-4.9713" width="0.1016" layer="21"/>
<wire x1="5.4167" y1="-4.9713" x2="5.0825" y2="-4.9852" width="0.1016" layer="21"/>
<wire x1="5.0825" y1="-4.9852" x2="4.9572" y2="-4.9156" width="0.1016" layer="21"/>
<wire x1="4.9572" y1="-4.9156" x2="4.9711" y2="-4.7763" width="0.1016" layer="21"/>
<wire x1="4.9711" y1="-4.7763" x2="5.0965" y2="-4.3725" width="0.1016" layer="21"/>
<wire x1="5.0965" y1="-4.3725" x2="5.3332" y2="-4.0522" width="0.1016" layer="21"/>
<wire x1="5.3332" y1="-4.0522" x2="5.6952" y2="-3.7737" width="0.1016" layer="21"/>
<wire x1="5.6952" y1="-3.7737" x2="5.8484" y2="-3.6623" width="0.1016" layer="21"/>
<wire x1="6.0016" y1="-3.1889" x2="6.1408" y2="-3.2446" width="0.1016" layer="21"/>
<wire x1="6.1408" y1="-3.2446" x2="6.2383" y2="-3.356" width="0.1016" layer="21"/>
<wire x1="6.2383" y1="-3.356" x2="6.2522" y2="-3.4256" width="0.1016" layer="21"/>
<wire x1="6.2522" y1="-3.4256" x2="6.4472" y2="-3.4813" width="0.1016" layer="21"/>
<wire x1="6.4472" y1="-3.4813" x2="6.7257" y2="-3.6762" width="0.1016" layer="21"/>
<wire x1="6.7257" y1="-3.6762" x2="6.9624" y2="-3.8712" width="0.1016" layer="21"/>
<wire x1="6.9624" y1="-3.8712" x2="7.032" y2="-4.1358" width="0.1016" layer="21"/>
<wire x1="7.032" y1="-4.1358" x2="7.0042" y2="-4.3168" width="0.1016" layer="21"/>
<wire x1="7.0042" y1="-4.3168" x2="6.851" y2="-4.5953" width="0.1016" layer="21"/>
<wire x1="6.851" y1="-4.5953" x2="6.5864" y2="-4.8042" width="0.1016" layer="21"/>
<wire x1="6.5864" y1="-4.8042" x2="6.3915" y2="-4.9991" width="0.1016" layer="21"/>
<wire x1="6.3915" y1="-4.9991" x2="6.0294" y2="-5.0827" width="0.1016" layer="21"/>
<wire x1="6.0294" y1="-5.0827" x2="5.7649" y2="-5.2498" width="0.1016" layer="21"/>
<wire x1="5.7649" y1="-5.2498" x2="5.361" y2="-5.3055" width="0.1016" layer="21"/>
<wire x1="5.361" y1="-5.3055" x2="5.0408" y2="-5.3055" width="0.1016" layer="21"/>
<wire x1="5.0408" y1="-5.3055" x2="4.804" y2="-5.1523" width="0.1016" layer="21"/>
<wire x1="4.804" y1="-5.1523" x2="4.6648" y2="-4.8877" width="0.1016" layer="21"/>
<wire x1="4.6648" y1="-4.8877" x2="4.6787" y2="-4.6092" width="0.1016" layer="21"/>
<wire x1="4.6787" y1="-4.6092" x2="4.7483" y2="-4.275" width="0.1016" layer="21"/>
<wire x1="4.7483" y1="-4.275" x2="4.7901" y2="-4.1636" width="0.1016" layer="21"/>
<wire x1="4.7901" y1="-4.1636" x2="5.1661" y2="-3.7876" width="0.1016" layer="21"/>
<wire x1="5.1661" y1="-3.7876" x2="5.6952" y2="-3.342" width="0.1016" layer="21"/>
<wire x1="5.6952" y1="-3.342" x2="5.9877" y2="-3.1889" width="0.1016" layer="21"/>
<pad name="1" x="-11" y="9" drill="0.8" diameter="1.27"/>
<pad name="2" x="-11" y="7" drill="0.8" diameter="1.27"/>
<pad name="3" x="-11" y="5" drill="0.8" diameter="1.27"/>
<pad name="4" x="-11" y="3" drill="0.8" diameter="1.27"/>
<pad name="5" x="-11" y="1" drill="0.8" diameter="1.27"/>
<pad name="6" x="-11" y="-1" drill="0.8" diameter="1.27"/>
<pad name="7" x="-11" y="-3" drill="0.8" diameter="1.27"/>
<pad name="8" x="-11" y="-5" drill="0.8" diameter="1.27"/>
<pad name="9" x="-11" y="-7" drill="0.8" diameter="1.27"/>
<pad name="10" x="-11" y="-9" drill="0.8" diameter="1.27"/>
<pad name="11" x="11" y="-9" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="12" x="11" y="-7" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="13" x="11" y="-5" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="14" x="11" y="-3" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="15" x="11" y="-1" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="16" x="11" y="1" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="17" x="11" y="3" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="18" x="11" y="5" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="19" x="11" y="7" drill="0.8" diameter="1.27" rot="R180"/>
<pad name="20" x="11" y="9" drill="0.8" diameter="1.27" rot="R180"/>
<text x="-11.43" y="13.97" size="1.27" layer="25">&gt;NAME</text>
<text x="-11.43" y="-19.3" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MSOP10_THERMAL">
<wire x1="-1.55" y1="1.4" x2="1.55" y2="1.4" width="0.127" layer="21"/>
<wire x1="1.55" y1="1.4" x2="1.55" y2="-1.4" width="0.127" layer="21"/>
<wire x1="1.55" y1="-1.4" x2="-1.55" y2="-1.4" width="0.127" layer="21"/>
<wire x1="-1.55" y1="-1.4" x2="-1.55" y2="1.4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="0.5" x2="-1.5" y2="-0.5" width="0.127" layer="21" curve="-180"/>
<smd name="1" x="-1" y="-2.127" dx="0.3" dy="1.25" layer="1"/>
<smd name="2" x="-0.5" y="-2.127" dx="0.3" dy="1.25" layer="1"/>
<smd name="3" x="0" y="-2.127" dx="0.3" dy="1.25" layer="1"/>
<smd name="4" x="0.5" y="-2.127" dx="0.3" dy="1.25" layer="1"/>
<smd name="5" x="1" y="-2.127" dx="0.3" dy="1.25" layer="1"/>
<smd name="6" x="1" y="2.127" dx="0.3" dy="1.25" layer="1" rot="R180"/>
<smd name="7" x="0.5" y="2.127" dx="0.3" dy="1.25" layer="1" rot="R180"/>
<smd name="8" x="0" y="2.127" dx="0.3" dy="1.25" layer="1" rot="R180"/>
<smd name="9" x="-0.5" y="2.127" dx="0.3" dy="1.25" layer="1" rot="R180"/>
<smd name="10" x="-1" y="2.127" dx="0.3" dy="1.25" layer="1" rot="R180"/>
<text x="3" y="-3" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-2" y="-3" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-1.3" y1="-0.9" x2="1.3" y2="0.9" layer="1"/>
</package>
<package name="SOT23-BEC">
<description>TO-236 ITT Intermetall</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.127" layer="51"/>
<smd name="C" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="E" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="B" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="TSOP-6">
<smd name="1" x="-0.95" y="-1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<smd name="2" x="0" y="-1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<smd name="3" x="0.95" y="-1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<smd name="4" x="0.95" y="1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<smd name="5" x="0" y="1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<smd name="6" x="-0.95" y="1.45" dx="1.5" dy="0.7" layer="1" rot="R90"/>
<wire x1="-1.6" y1="0.6" x2="1.6" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="0.6" x2="1.6" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="-0.6" x2="-1.6" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-0.6" x2="-1.6" y2="0.6" width="0.127" layer="21"/>
<circle x="-1.9" y="-1" radius="0.1" width="0.4064" layer="21"/>
<rectangle x1="-1.6" y1="-0.6" x2="-1" y2="0.6" layer="21"/>
</package>
<package name="TSSOP24">
<wire x1="-3.95" y1="-2.25" x2="3.95" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="3.95" y1="2.25" x2="-3.95" y2="2.25" width="0.2032" layer="21"/>
<wire x1="-3.95" y1="2.25" x2="-3.95" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="3.95" y1="-2.25" x2="3.95" y2="2.25" width="0.2032" layer="21"/>
<circle x="-3.25" y="-1.6" radius="0.325" width="0" layer="21"/>
<smd name="1" x="-3.575" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="2" x="-2.925" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="3" x="-2.275" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="4" x="-1.625" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="5" x="-0.975" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="6" x="-0.325" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="7" x="0.325" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="8" x="0.975" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="9" x="1.625" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="10" x="2.275" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="15" x="2.275" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="16" x="1.625" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="17" x="0.975" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="18" x="0.325" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="19" x="-0.325" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="20" x="-0.975" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="21" x="-1.625" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="22" x="-2.275" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="23" x="-2.925" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="24" x="-3.575" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="11" x="2.925" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="12" x="3.575" y="-3" dx="0.3" dy="0.75" layer="1"/>
<smd name="13" x="3.575" y="3" dx="0.3" dy="0.75" layer="1"/>
<smd name="14" x="2.925" y="3" dx="0.3" dy="0.75" layer="1"/>
<text x="-4.25" y="-3" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.65" y="-3" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="GP1S58VJ000F">
<pad name="TRANSISTOR_C" x="-5.15" y="1.27" drill="0.8" shape="octagon" rot="R180"/>
<pad name="TRANSISTOR_E" x="-5.15" y="-1.27" drill="0.8" shape="octagon" rot="R180"/>
<pad name="LED_C" x="5.15" y="1.27" drill="0.8" shape="long" rot="R180"/>
<pad name="LED_A" x="5.15" y="-1.27" drill="0.8" shape="long" rot="R180"/>
<hole x="-6.5" y="0" drill="0.7"/>
<hole x="2.5" y="2" drill="0.7"/>
<wire x1="-7" y1="2.6" x2="-7" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-7" y1="-2.6" x2="-2.5" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2.6" x2="2.5" y2="-2.6" width="0.127" layer="21"/>
<wire x1="2.5" y1="-2.6" x2="7" y2="-2.6" width="0.127" layer="21"/>
<wire x1="7" y1="-2.6" x2="7" y2="2.6" width="0.127" layer="21"/>
<wire x1="7" y1="2.6" x2="2.5" y2="2.6" width="0.127" layer="21"/>
<wire x1="2.5" y1="2.6" x2="-2.5" y2="2.6" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.6" x2="-7" y2="2.6" width="0.127" layer="21"/>
<wire x1="-2.5" y1="2.6" x2="-2.5" y2="-2.6" width="0.127" layer="21"/>
<wire x1="2.5" y1="-2.6" x2="2.5" y2="2.6" width="0.127" layer="21"/>
<text x="-6.985" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.985" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="Q">
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="1.778" x2="1.016" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="-1.778" width="0.254" layer="94"/>
<text x="2.54" y="1.016" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.159" y="-1.143" size="0.8636" layer="93">1</text>
<text x="1.524" y="-1.143" size="0.8636" layer="93">2</text>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="MAX232">
<wire x1="-10.16" y1="15.24" x2="10.16" y2="15.24" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="10.16" y2="15.24" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-17.78" x2="-10.16" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="15.24" x2="-10.16" y2="-17.78" width="0.4064" layer="94"/>
<text x="-10.16" y="15.875" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="C1+" x="-15.24" y="12.7" length="middle"/>
<pin name="C1-" x="-15.24" y="7.62" length="middle"/>
<pin name="C2+" x="-15.24" y="2.54" length="middle"/>
<pin name="C2-" x="-15.24" y="-2.54" length="middle"/>
<pin name="T1IN" x="-15.24" y="-7.62" length="middle" direction="in" swaplevel="1"/>
<pin name="T2IN" x="-15.24" y="-10.16" length="middle" direction="in" swaplevel="1"/>
<pin name="R1OUT" x="-15.24" y="-12.7" length="middle" direction="out" swaplevel="1"/>
<pin name="R2OUT" x="-15.24" y="-15.24" length="middle" direction="out" swaplevel="1"/>
<pin name="V+" x="15.24" y="10.16" length="middle" rot="R180"/>
<pin name="V-" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="T1OUT" x="15.24" y="-7.62" length="middle" direction="out" swaplevel="1" rot="R180"/>
<pin name="T2OUT" x="15.24" y="-10.16" length="middle" direction="out" swaplevel="1" rot="R180"/>
<pin name="R1IN" x="15.24" y="-12.7" length="middle" direction="in" swaplevel="1" rot="R180"/>
<pin name="R2IN" x="15.24" y="-15.24" length="middle" direction="in" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="VCC-GND">
<text x="1.524" y="-5.08" size="1.016" layer="95" rot="R90">GND</text>
<text x="1.524" y="2.54" size="1.016" layer="95" rot="R90">VCC</text>
<text x="-0.762" y="-0.762" size="1.778" layer="95">&gt;NAME</text>
<pin name="VCC" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
<symbol name="XBEE">
<wire x1="-12.7" y1="27.94" x2="-12.7" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-30.48" x2="15.24" y2="-30.48" width="0.254" layer="94"/>
<wire x1="15.24" y1="-30.48" x2="15.24" y2="27.94" width="0.254" layer="94"/>
<wire x1="15.24" y1="27.94" x2="-12.7" y2="27.94" width="0.254" layer="94"/>
<text x="-12.7" y="29.21" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="-33.02" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="-15.24" y="25.4" length="short" direction="pwr"/>
<pin name="DOUT" x="-15.24" y="7.62" length="short" direction="out"/>
<pin name="DIN/!CONFIG" x="-15.24" y="10.16" length="short" direction="in"/>
<pin name="CD/DOUT_EN/DO8" x="-15.24" y="2.54" length="short" direction="out"/>
<pin name="!RESET" x="-15.24" y="22.86" length="short" direction="in"/>
<pin name="PWM0/RSSI" x="-15.24" y="15.24" length="short" direction="out"/>
<pin name="!DTR!/SLEEP_RQ/DI8" x="-15.24" y="0" length="short"/>
<pin name="GND" x="-15.24" y="-27.94" length="short" direction="pwr"/>
<pin name="RF_TX/AD4/DIO4" x="-15.24" y="-10.16" length="short"/>
<pin name="!CTS!/DIO7" x="-15.24" y="-2.54" length="short"/>
<pin name="ON/!SLEEP" x="-15.24" y="17.78" length="short" direction="out"/>
<pin name="VREF" x="-15.24" y="-25.4" length="short" direction="in"/>
<pin name="ASSOC/AD5/DIO5" x="-15.24" y="-7.62" length="short"/>
<pin name="!RTS!/AD6/DIO6" x="-15.24" y="-5.08" length="short"/>
<pin name="COORD_SEL/AD3/DIO3" x="-15.24" y="-12.7" length="short"/>
<pin name="AD2/DIO2" x="-15.24" y="-15.24" length="short"/>
<pin name="AD1/DIO1" x="-15.24" y="-17.78" length="short"/>
<pin name="AD0/DIO0" x="-15.24" y="-20.32" length="short"/>
</symbol>
<symbol name="LM25011">
<wire x1="-7.62" y1="17.78" x2="7.62" y2="17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="17.78" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-12.7" x2="-7.62" y2="17.78" width="0.254" layer="94"/>
<text x="-7.62" y="19.05" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VIN" x="-10.16" y="10.16" length="short" direction="in"/>
<pin name="CS" x="10.16" y="5.08" length="short" direction="out" rot="R180"/>
<pin name="FB" x="10.16" y="-10.16" length="short" direction="in" rot="R180"/>
<pin name="RT" x="-10.16" y="0" length="short" direction="in"/>
<pin name="SGND" x="0" y="-15.24" length="short" direction="pwr" rot="R90"/>
<pin name="SS" x="-10.16" y="-10.16" length="short" direction="pwr"/>
<pin name="SW" x="10.16" y="10.16" length="short" direction="out" rot="R180"/>
<pin name="CSG" x="10.16" y="-2.54" length="short" direction="in" rot="R180"/>
<pin name="PGD" x="-10.16" y="-2.54" length="short" direction="in"/>
<pin name="BST" x="10.16" y="15.24" length="short" direction="in" rot="R180"/>
</symbol>
<symbol name="NPN">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.54" y1="-2.04" x2="0.308" y2="-1.424" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="E" x="2.54" y="-5.08" visible="off" length="short" direction="pas" swaplevel="3" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="off" length="short" direction="pas" swaplevel="2" rot="R270"/>
</symbol>
<symbol name="P-MOS">
<wire x1="0" y1="0" x2="-1.016" y2="0.381" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0.381" x2="-1.016" y2="-0.381" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="-0.381" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.794" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.381" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="-0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-0.254" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="2.794" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.794" x2="0" y2="2.794" width="0.1524" layer="94"/>
<wire x1="0.762" y1="-0.762" x2="1.778" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-0.762" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="0.762" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0" x2="1.778" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-2.032" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="2.032" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="0" x2="-0.889" y2="-0.127" width="0.254" layer="94"/>
<wire x1="-0.889" y1="-0.127" x2="-0.889" y2="0.127" width="0.254" layer="94"/>
<wire x1="-0.889" y1="0.127" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="1.016" y1="-0.635" x2="1.524" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.524" y1="-0.635" x2="1.27" y2="-0.254" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.254" x2="1.016" y2="-0.635" width="0.254" layer="94"/>
<circle x="0" y="2.794" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="2.032" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="-2.54" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.54" x2="-1.524" y2="-1.27" layer="94"/>
<rectangle x1="-2.032" y1="1.27" x2="-1.524" y2="2.54" layer="94"/>
<rectangle x1="-2.032" y1="-0.762" x2="-1.524" y2="0.762" layer="94"/>
<pin name="G" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="D@0" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="D@1" x="2.54" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="D@2" x="5.08" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<wire x1="7.62" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<pin name="D@3" x="7.62" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<circle x="2.54" y="-2.54" radius="0.3592" width="0" layer="94"/>
<circle x="5.08" y="-2.54" radius="0.3592" width="0" layer="94"/>
</symbol>
<symbol name="74LVC4245">
<wire x1="-17.78" y1="15.24" x2="17.78" y2="15.24" width="0.254" layer="94"/>
<wire x1="17.78" y1="-17.78" x2="-17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-17.78" x2="-17.78" y2="15.24" width="0.254" layer="94"/>
<wire x1="17.78" y1="-17.78" x2="17.78" y2="15.24" width="0.254" layer="94"/>
<text x="5.08" y="16.51" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IO_VL4" x="-22.86" y="0" length="middle" swaplevel="1"/>
<pin name="IO_VL5" x="-22.86" y="-2.54" length="middle" swaplevel="1"/>
<pin name="IO_VCC6" x="22.86" y="-5.08" length="middle" swaplevel="1" rot="R180"/>
<pin name="GND@0" x="5.08" y="-22.86" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC" x="2.54" y="20.32" length="middle" direction="pwr" rot="R270"/>
<pin name="IO_VL6" x="-22.86" y="-5.08" length="middle" swaplevel="1"/>
<pin name="IO_VL7" x="-22.86" y="-7.62" length="middle" swaplevel="1"/>
<pin name="IO_VCC7" x="22.86" y="-7.62" length="middle" swaplevel="1" rot="R180"/>
<pin name="VL@0" x="-2.54" y="20.32" length="middle" direction="pwr" rot="R270"/>
<pin name="IO_VL0" x="-22.86" y="10.16" length="middle" swaplevel="1"/>
<pin name="IO_VL1" x="-22.86" y="7.62" length="middle" swaplevel="1"/>
<pin name="IO_VL2" x="-22.86" y="5.08" length="middle" swaplevel="1"/>
<pin name="IO_VL3" x="-22.86" y="2.54" length="middle" swaplevel="1"/>
<pin name="IO_VCC0" x="22.86" y="10.16" length="middle" swaplevel="1" rot="R180"/>
<pin name="IO_VCC1" x="22.86" y="7.62" length="middle" swaplevel="1" rot="R180"/>
<pin name="IO_VCC2" x="22.86" y="5.08" length="middle" swaplevel="1" rot="R180"/>
<pin name="IO_VCC3" x="22.86" y="2.54" length="middle" swaplevel="1" rot="R180"/>
<pin name="IO_VCC4" x="22.86" y="0" length="middle" swaplevel="1" rot="R180"/>
<pin name="IO_VCC5" x="22.86" y="-2.54" length="middle" swaplevel="1" rot="R180"/>
<pin name="DIR_H_TO_L" x="-22.86" y="-12.7" length="middle"/>
<pin name="/OE" x="-22.86" y="-15.24" length="middle" function="dot"/>
<pin name="GND@1" x="2.54" y="-22.86" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@2" x="0" y="-22.86" length="middle" direction="pwr" rot="R90"/>
<pin name="VL@1" x="-5.08" y="20.32" length="middle" direction="pwr" rot="R270"/>
</symbol>
<symbol name="PHOTOINTERRUPTER">
<wire x1="-10.16" y1="5.08" x2="-2.54" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="5.08" width="0.4064" layer="94"/>
<wire x1="2.54" y1="5.08" x2="10.16" y2="5.08" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="5.08" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="2.54" width="0.4064" layer="94"/>
<text x="2.54" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-10.16" y1="2.54" x2="-10.16" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="-2.54" x2="-10.16" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="4.572" y1="-2.54" x2="6.35" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="6.35" y1="-0.762" x2="5.207" y2="-1.143" width="0.1524" layer="94"/>
<wire x1="5.207" y1="-1.143" x2="5.969" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="5.969" y1="-1.905" x2="6.35" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="6.477" y1="1.143" x2="5.334" y2="0.762" width="0.1524" layer="94"/>
<wire x1="5.334" y1="0.762" x2="6.096" y2="0" width="0.1524" layer="94"/>
<wire x1="6.096" y1="0" x2="6.477" y2="1.143" width="0.1524" layer="94"/>
<wire x1="4.699" y1="-0.635" x2="6.477" y2="1.143" width="0.1524" layer="94"/>
<wire x1="10.16" y1="2.54" x2="7.62" y2="0" width="0.1524" layer="94"/>
<wire x1="7.62" y1="0" x2="9.906" y2="-2.286" width="0.1524" layer="94"/>
<wire x1="9.398" y1="-1.016" x2="9.906" y2="-2.286" width="0.1524" layer="94"/>
<wire x1="9.906" y1="-2.286" x2="10.16" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="9.906" y1="-2.286" x2="8.636" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="8.636" y1="-1.778" x2="9.398" y2="-1.016" width="0.1524" layer="94"/>
<rectangle x1="7.239" y1="-2.54" x2="8.001" y2="2.54" layer="94"/>
<pin name="TRANSISTOR_E" x="12.7" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="TRANSISTOR_C" x="12.7" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-8.89" y1="1.27" x2="-7.62" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-1.27" x2="-6.35" y2="1.27" width="0.254" layer="94"/>
<wire x1="-8.89" y1="-1.27" x2="-7.62" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-1.27" x2="-6.35" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-8.89" y1="1.27" x2="-7.62" y2="1.27" width="0.254" layer="94"/>
<wire x1="-7.62" y1="1.27" x2="-6.35" y2="1.27" width="0.254" layer="94"/>
<wire x1="-5.588" y1="-0.508" x2="-4.191" y2="0.889" width="0.1524" layer="94"/>
<wire x1="-5.715" y1="0.635" x2="-4.318" y2="2.032" width="0.1524" layer="94"/>
<pin name="LED_C" x="-12.7" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="LED_A" x="-12.7" y="2.54" visible="off" length="short" direction="pas"/>
<polygon width="0.1524" layer="94">
<vertex x="-4.191" y="0.889"/>
<vertex x="-4.572" y="0"/>
<vertex x="-5.08" y="0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-4.318" y="2.032"/>
<vertex x="-4.699" y="1.143"/>
<vertex x="-5.207" y="1.651"/>
</polygon>
<wire x1="-10.16" y1="2.54" x2="-7.62" y2="2.54" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-2.54" x2="-7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="1.27" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-7.62" y2="-1.27" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CRYSTAL_" prefix="Q" uservalue="yes">
<description>&lt;b&gt;CRYSTAL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="Q" x="0" y="0"/>
</gates>
<devices>
<device name="25MHZ_HC49UP" package="HC49UP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="16MHZ_HC49UP" package="HC49UP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 547-6531" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MAX3232" prefix="IC">
<description>&lt;b&gt;True RS-232 Transceivers&lt;/b&gt; 3.0V to 5.5V, Low-Power&lt;p&gt;
up to 1Mbps,  Using Four 0.1µF External Capacitors&lt;br&gt;
Source: http://pdfserv.maxim-ic.com/en/ds/MAX3222-MAX3241.pdf</description>
<gates>
<gate name="G$1" symbol="MAX232" x="0" y="0" swaplevel="1"/>
<gate name="P" symbol="VCC-GND" x="25.4" y="-5.08" addlevel="request"/>
</gates>
<devices>
<device name="SE" package="SO16">
<connects>
<connect gate="G$1" pin="C1+" pad="1"/>
<connect gate="G$1" pin="C1-" pad="3"/>
<connect gate="G$1" pin="C2+" pad="4"/>
<connect gate="G$1" pin="C2-" pad="5"/>
<connect gate="G$1" pin="R1IN" pad="13"/>
<connect gate="G$1" pin="R1OUT" pad="12"/>
<connect gate="G$1" pin="R2IN" pad="8"/>
<connect gate="G$1" pin="R2OUT" pad="9"/>
<connect gate="G$1" pin="T1IN" pad="11"/>
<connect gate="G$1" pin="T1OUT" pad="14"/>
<connect gate="G$1" pin="T2IN" pad="10"/>
<connect gate="G$1" pin="T2OUT" pad="7"/>
<connect gate="G$1" pin="V+" pad="2"/>
<connect gate="G$1" pin="V-" pad="6"/>
<connect gate="P" pin="GND" pad="15"/>
<connect gate="P" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name="C">
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
<technology name="E">
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="XBEE" prefix="XB">
<description>&lt;b&gt;XBee (TM) /XBee-PRO(TM) OEM RF Modules&lt;/b&gt;&lt;p&gt;
Source: MaxStream, Inc. xbee_productmanual.pdf</description>
<gates>
<gate name="G$1" symbol="XBEE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XBEE">
<connects>
<connect gate="G$1" pin="!CTS!/DIO7" pad="12"/>
<connect gate="G$1" pin="!DTR!/SLEEP_RQ/DI8" pad="9"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!RTS!/AD6/DIO6" pad="16"/>
<connect gate="G$1" pin="AD0/DIO0" pad="20"/>
<connect gate="G$1" pin="AD1/DIO1" pad="19"/>
<connect gate="G$1" pin="AD2/DIO2" pad="18"/>
<connect gate="G$1" pin="ASSOC/AD5/DIO5" pad="15"/>
<connect gate="G$1" pin="CD/DOUT_EN/DO8" pad="4"/>
<connect gate="G$1" pin="COORD_SEL/AD3/DIO3" pad="17"/>
<connect gate="G$1" pin="DIN/!CONFIG" pad="3"/>
<connect gate="G$1" pin="DOUT" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="ON/!SLEEP" pad="13"/>
<connect gate="G$1" pin="PWM0/RSSI" pad="6"/>
<connect gate="G$1" pin="RF_TX/AD4/DIO4" pad="11"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF" pad="14"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="XBP24-Z7UIT-004" constant="no"/>
<attribute name="OC_FARNELL" value="1751799" constant="no"/>
<attribute name="OC_NEWARK" value="34R5507" constant="no"/>
</technology>
</technologies>
</device>
<device name="-PRO" package="XBEE-PRO">
<connects>
<connect gate="G$1" pin="!CTS!/DIO7" pad="12"/>
<connect gate="G$1" pin="!DTR!/SLEEP_RQ/DI8" pad="9"/>
<connect gate="G$1" pin="!RESET" pad="5"/>
<connect gate="G$1" pin="!RTS!/AD6/DIO6" pad="16"/>
<connect gate="G$1" pin="AD0/DIO0" pad="20"/>
<connect gate="G$1" pin="AD1/DIO1" pad="19"/>
<connect gate="G$1" pin="AD2/DIO2" pad="18"/>
<connect gate="G$1" pin="ASSOC/AD5/DIO5" pad="15"/>
<connect gate="G$1" pin="CD/DOUT_EN/DO8" pad="4"/>
<connect gate="G$1" pin="COORD_SEL/AD3/DIO3" pad="17"/>
<connect gate="G$1" pin="DIN/!CONFIG" pad="3"/>
<connect gate="G$1" pin="DOUT" pad="2"/>
<connect gate="G$1" pin="GND" pad="10"/>
<connect gate="G$1" pin="ON/!SLEEP" pad="13"/>
<connect gate="G$1" pin="PWM0/RSSI" pad="6"/>
<connect gate="G$1" pin="RF_TX/AD4/DIO4" pad="11"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VREF" pad="14"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1337916" constant="no"/>
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="XBP24-AWI-001" constant="no"/>
<attribute name="OC_NEWARK" value="42M2667" constant="no"/>
<attribute name="RS" value="436-496" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM25011" prefix="IC" uservalue="yes">
<description>42V 2A step down switching regulator
&lt;br&gt;

http://www.ti.com/product/lm25011</description>
<gates>
<gate name="G$1" symbol="LM25011" x="0" y="0"/>
</gates>
<devices>
<device name="MY" package="MSOP10_THERMAL">
<connects>
<connect gate="G$1" pin="BST" pad="10"/>
<connect gate="G$1" pin="CS" pad="8"/>
<connect gate="G$1" pin="CSG" pad="7"/>
<connect gate="G$1" pin="FB" pad="6"/>
<connect gate="G$1" pin="PGD" pad="3"/>
<connect gate="G$1" pin="RT" pad="2"/>
<connect gate="G$1" pin="SGND" pad="5"/>
<connect gate="G$1" pin="SS" pad="4"/>
<connect gate="G$1" pin="SW" pad="9"/>
<connect gate="G$1" pin="VIN" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="761-4883" constant="no"/>
<attribute name="VALUE" value="LM25011MY" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="*-NPN-" prefix="T" uservalue="yes">
<description>NPN Transistror</description>
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="SOT23-BEC" package="SOT23-BEC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="MMBT2222ALT1">
<attribute name="RS" value="544-9400" constant="no"/>
<attribute name="VALUE" value="mmbt2222" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NTGS4111" prefix="T">
<gates>
<gate name="G$1" symbol="P-MOS" x="-2.54" y="0"/>
</gates>
<devices>
<device name="PT1G" package="TSOP-6">
<connects>
<connect gate="G$1" pin="D@0" pad="1"/>
<connect gate="G$1" pin="D@1" pad="2"/>
<connect gate="G$1" pin="D@2" pad="5"/>
<connect gate="G$1" pin="D@3" pad="6"/>
<connect gate="G$1" pin="G" pad="3"/>
<connect gate="G$1" pin="S" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="780-0567" constant="no"/>
<attribute name="VALUE" value="NTGS4111PT1G" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74LVC4245" prefix="IC">
<description>octal transceiver buffer</description>
<gates>
<gate name="G$1" symbol="74LVC4245" x="0" y="2.54"/>
</gates>
<devices>
<device name="A" package="TSSOP24">
<connects>
<connect gate="G$1" pin="/OE" pad="22"/>
<connect gate="G$1" pin="DIR_H_TO_L" pad="2"/>
<connect gate="G$1" pin="GND@0" pad="11"/>
<connect gate="G$1" pin="GND@1" pad="12"/>
<connect gate="G$1" pin="GND@2" pad="13"/>
<connect gate="G$1" pin="IO_VCC0" pad="3"/>
<connect gate="G$1" pin="IO_VCC1" pad="4"/>
<connect gate="G$1" pin="IO_VCC2" pad="5"/>
<connect gate="G$1" pin="IO_VCC3" pad="6"/>
<connect gate="G$1" pin="IO_VCC4" pad="7"/>
<connect gate="G$1" pin="IO_VCC5" pad="8"/>
<connect gate="G$1" pin="IO_VCC6" pad="9"/>
<connect gate="G$1" pin="IO_VCC7" pad="10"/>
<connect gate="G$1" pin="IO_VL0" pad="21"/>
<connect gate="G$1" pin="IO_VL1" pad="20"/>
<connect gate="G$1" pin="IO_VL2" pad="19"/>
<connect gate="G$1" pin="IO_VL3" pad="18"/>
<connect gate="G$1" pin="IO_VL4" pad="17"/>
<connect gate="G$1" pin="IO_VL5" pad="16"/>
<connect gate="G$1" pin="IO_VL6" pad="15"/>
<connect gate="G$1" pin="IO_VL7" pad="14"/>
<connect gate="G$1" pin="VCC" pad="1"/>
<connect gate="G$1" pin="VL@0" pad="23"/>
<connect gate="G$1" pin="VL@1" pad="24"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GP1S58VJ000F" prefix="PH">
<description>photo interrupter</description>
<gates>
<gate name="G$1" symbol="PHOTOINTERRUPTER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="GP1S58VJ000F">
<connects>
<connect gate="G$1" pin="LED_A" pad="LED_A"/>
<connect gate="G$1" pin="LED_C" pad="LED_C"/>
<connect gate="G$1" pin="TRANSISTOR_C" pad="TRANSISTOR_C"/>
<connect gate="G$1" pin="TRANSISTOR_E" pad="TRANSISTOR_E"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="667-5039" constant="no"/>
<attribute name="VALUE" value="GP1S58VJ000F" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_connector">
<packages>
<package name="ML6">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<wire x1="-6.35" y1="3.175" x2="6.35" y2="3.175" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-3.175" x2="6.35" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="3.175" x2="-6.35" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="4.445" x2="-6.35" y2="4.445" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-4.445" x2="7.62" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="4.445" x2="-7.62" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="2.032" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="-2.032" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-6.35" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="6.35" y1="4.445" x2="6.35" y2="4.699" width="0.1524" layer="21"/>
<wire x1="6.35" y1="4.699" x2="5.08" y2="4.699" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.445" x2="5.08" y2="4.699" width="0.1524" layer="21"/>
<wire x1="6.35" y1="4.445" x2="7.62" y2="4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.699" x2="-0.635" y2="4.699" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.699" x2="0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.445" x2="5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="4.699" x2="-0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.699" x2="-6.35" y2="4.699" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="4.699" x2="-6.35" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.699" x2="-5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.445" x2="-0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-4.445" x2="2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-4.445" x2="-2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-3.175" x2="2.032" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.175" x2="2.032" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.429" x2="2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.429" x2="6.604" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="6.604" y1="-3.429" x2="6.604" y2="3.429" width="0.0508" layer="21"/>
<wire x1="6.604" y1="3.429" x2="-6.604" y2="3.429" width="0.0508" layer="21"/>
<wire x1="-6.604" y1="3.429" x2="-6.604" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-6.604" y1="-3.429" x2="-2.032" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="-3.429" x2="-2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-4.445" x2="-2.54" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-4.318" x2="-2.54" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-4.318" x2="-3.81" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-4.445" x2="-3.81" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-4.445" x2="-7.62" y2="-4.445" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="2" x="-2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="0" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="0" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="2.54" y="1.27" drill="0.9144" shape="octagon"/>
<text x="-7.62" y="5.08" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="0.635" y="5.08" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.08" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-5.08" y="0.635" size="1.27" layer="21" ratio="10">2</text>
<text x="-0.381" y="-4.064" size="1.27" layer="21" ratio="10">6</text>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
</package>
<package name="ML6L">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<wire x1="-5.08" y1="10.287" x2="-2.54" y2="10.287" width="0.254" layer="21"/>
<wire x1="-2.54" y1="10.287" x2="-3.81" y2="7.747" width="0.254" layer="21"/>
<wire x1="-3.81" y1="7.747" x2="-5.08" y2="10.287" width="0.254" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="2.159" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="7.62" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.429" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="4.445" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.032" x2="-1.905" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="2.032" x2="-0.635" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.032" x2="0.635" y2="2.032" width="0.1524" layer="51"/>
<wire x1="0.635" y1="2.032" x2="1.905" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="51"/>
<wire x1="0" y1="10.16" x2="0" y2="10.414" width="0.508" layer="21"/>
<wire x1="3.302" y1="10.287" x2="3.302" y2="7.493" width="0.1524" layer="21"/>
<wire x1="3.302" y1="7.493" x2="7.112" y2="7.493" width="0.1524" layer="21"/>
<wire x1="7.112" y1="10.287" x2="7.112" y2="7.493" width="0.1524" layer="21"/>
<wire x1="7.112" y1="10.287" x2="3.302" y2="10.287" width="0.1524" layer="21"/>
<wire x1="7.62" y1="10.922" x2="7.62" y2="2.032" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.032" x2="6.477" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="-7.62" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="10.922" x2="-7.62" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.032" x2="-6.477" y2="2.032" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.032" x2="5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="5.461" y1="1.397" x2="6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="6.477" y1="2.032" x2="6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="6.477" y1="2.032" x2="5.461" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="2.032" x2="-5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="2.032" x2="-3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="1.397" x2="-6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="2.032" x2="-6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="2.032" x2="-5.461" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="2" x="-2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="0" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="0" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="2.54" y="1.27" drill="0.9144" shape="octagon"/>
<text x="-4.6228" y="-1.6764" size="1.27" layer="21" ratio="10">1</text>
<text x="-4.6482" y="0.3556" size="1.27" layer="21" ratio="10">2</text>
<text x="-7.6454" y="11.43" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="0.6096" y="11.43" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.572" y="8.128" size="1.524" layer="21" ratio="10">6</text>
<rectangle x1="-0.254" y1="4.445" x2="0.254" y2="10.287" layer="21"/>
<rectangle x1="-4.953" y1="9.779" x2="-2.667" y2="10.287" layer="21"/>
<rectangle x1="-4.699" y1="9.271" x2="-2.921" y2="9.779" layer="21"/>
<rectangle x1="-4.445" y1="8.763" x2="-3.175" y2="9.271" layer="21"/>
<rectangle x1="-4.191" y1="8.255" x2="-3.429" y2="8.763" layer="21"/>
<rectangle x1="-3.937" y1="8.001" x2="-3.683" y2="8.255" layer="21"/>
<rectangle x1="-2.794" y1="-0.381" x2="-2.286" y2="0.381" layer="21"/>
<rectangle x1="-0.254" y1="-0.381" x2="0.254" y2="0.381" layer="21"/>
<rectangle x1="2.286" y1="-0.381" x2="2.794" y2="0.381" layer="21"/>
</package>
<package name="794618-8">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 3.0 mm&lt;p&gt;
Source: ENG_CD_794618_E1.pdf</description>
<wire x1="-6.4" y1="4.525" x2="-5.675" y2="4.525" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="4.525" x2="-6.4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="-4.5" x2="6.4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="6.4" y1="-4.5" x2="6.4" y2="4.525" width="0.2032" layer="21"/>
<wire x1="6.4" y1="4.525" x2="5.6" y2="4.525" width="0.2032" layer="21"/>
<wire x1="5.6" y1="4.525" x2="5.075" y2="4.525" width="0.2032" layer="51"/>
<wire x1="5.075" y1="4.525" x2="5.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="5.075" y1="3.4" x2="3.925" y2="3.4" width="0.2032" layer="51"/>
<wire x1="3.925" y1="3.4" x2="3.925" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-2.55" y1="4.175" x2="-3.425" y2="4.175" width="0.2032" layer="21"/>
<wire x1="-3.425" y1="4.175" x2="-3.925" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-3.925" y1="4.175" x2="-3.925" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-3.925" y1="3.4" x2="-5.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-5.075" y1="3.4" x2="-5.075" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-5.075" y1="4.525" x2="-5.675" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-6.5" y1="1.45" x2="-7.25" y2="1.45" width="0.2032" layer="25"/>
<wire x1="-7.25" y1="1.45" x2="-7.975" y2="1.025" width="0.2032" layer="25"/>
<wire x1="-7.975" y1="1.025" x2="-7.975" y2="-0.425" width="0.2032" layer="25"/>
<wire x1="-7.975" y1="-0.425" x2="-7.25" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-7.25" y1="-0.85" x2="-7.025" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-7.025" y1="-0.85" x2="-7.025" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-7.025" y1="-0.35" x2="-6.5" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-7.4" y1="-0.7" x2="-7.4" y2="1.3" width="0.2032" layer="25"/>
<wire x1="6.5" y1="-1.45" x2="7.25" y2="-1.45" width="0.2032" layer="25"/>
<wire x1="7.25" y1="-1.45" x2="7.975" y2="-1.025" width="0.2032" layer="25"/>
<wire x1="7.975" y1="-1.025" x2="7.975" y2="0.425" width="0.2032" layer="25"/>
<wire x1="7.975" y1="0.425" x2="7.25" y2="0.85" width="0.2032" layer="25"/>
<wire x1="7.25" y1="0.85" x2="7.025" y2="0.85" width="0.2032" layer="25"/>
<wire x1="7.025" y1="0.85" x2="7.025" y2="0.35" width="0.2032" layer="25"/>
<wire x1="7.025" y1="0.35" x2="6.5" y2="0.35" width="0.2032" layer="25"/>
<wire x1="7.4" y1="-1.3" x2="7.4" y2="0.7" width="0.2032" layer="25"/>
<wire x1="-1.8" y1="-4.4" x2="-1.8" y2="-1.2" width="0.2032" layer="25"/>
<wire x1="-1.8" y1="-1.2" x2="1.8" y2="-1.2" width="0.2032" layer="25"/>
<wire x1="1.8" y1="-1.2" x2="1.8" y2="-4.4" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-2.65" x2="1.2" y2="-2.65" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-2.65" x2="1.2" y2="-1.75" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-1.75" x2="-1.2" y2="-1.75" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-1.75" x2="-1.2" y2="-2.65" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-2.65" x2="-1.2" y2="-3.775" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-3.775" x2="-1.425" y2="-4.45" width="0.2032" layer="25" curve="-36.869898"/>
<wire x1="1.2" y1="-2.65" x2="1.2" y2="-3.775" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-3.775" x2="1.425" y2="-4.45" width="0.2032" layer="25" curve="36.869898"/>
<wire x1="-0.925" y1="3.4" x2="-2.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-2.075" y1="3.4" x2="-2.075" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-0.925" y1="4.175" x2="-0.925" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-0.425" y1="4.175" x2="-0.925" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-2.075" y1="4.175" x2="-2.55" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.45" y1="4.175" x2="-0.425" y2="4.175" width="0.2032" layer="21"/>
<wire x1="3.45" y1="4.175" x2="2.575" y2="4.175" width="0.2032" layer="21"/>
<wire x1="2.575" y1="4.175" x2="2.075" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.925" y1="4.175" x2="0.45" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.925" y1="3.4" x2="0.925" y2="4.175" width="0.2032" layer="51"/>
<wire x1="2.075" y1="3.4" x2="0.925" y2="3.4" width="0.2032" layer="51"/>
<wire x1="2.075" y1="4.175" x2="2.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="3.925" y1="4.175" x2="3.45" y2="4.175" width="0.2032" layer="51"/>
<pad name="1" x="4.5" y="4.32" drill="1" diameter="1.6764"/>
<pad name="2" x="1.5" y="4.32" drill="1" diameter="1.6764"/>
<pad name="3" x="-1.5" y="4.32" drill="1" diameter="1.6764"/>
<pad name="4" x="-4.5" y="4.32" drill="1" diameter="1.6764"/>
<text x="-5.89" y="8.08" size="1.27" layer="25">&gt;NAME</text>
<text x="10.5" y="-4.5" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="4.1875" y1="3.5125" x2="4.825" y2="5" layer="51"/>
<rectangle x1="-1.8125" y1="3.5125" x2="-1.1751" y2="4.9999" layer="51"/>
<rectangle x1="1.1875" y1="3.5125" x2="1.8249" y2="4.9999" layer="51"/>
<rectangle x1="-4.8125" y1="3.5125" x2="-4.1875" y2="4.9999" layer="51"/>
<hole x="-2.35" y="0" drill="3"/>
<hole x="2.35" y="0" drill="3"/>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-4.865" y="2.14"/>
<vertex x="-4.71" y="2.14"/>
<vertex x="-4.6875" y="2.225"/>
<vertex x="-4.47" y="2.28"/>
<vertex x="-4.51" y="2.14"/>
<vertex x="-4.32" y="2.14"/>
<vertex x="-4.35" y="2.04"/>
<vertex x="-4.54" y="2.04"/>
<vertex x="-4.61" y="1.81" curve="107.492325"/>
<vertex x="-4.565" y="1.75" curve="-1.23212"/>
<vertex x="-4.445" y="1.75"/>
<vertex x="-4.475" y="1.64"/>
<vertex x="-4.755" y="1.64" curve="-115.057615"/>
<vertex x="-4.825" y="1.75"/>
<vertex x="-4.74" y="2.04"/>
<vertex x="-4.895" y="2.04"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-4.23" y="2.14"/>
<vertex x="-4.03" y="2.14"/>
<vertex x="-4.12" y="1.845" curve="114.249552"/>
<vertex x="-4.04" y="1.75"/>
<vertex x="-3.96" y="1.75"/>
<vertex x="-3.84" y="2.14"/>
<vertex x="-3.645" y="2.14"/>
<vertex x="-3.86" y="1.435"/>
<vertex x="-4.055" y="1.435"/>
<vertex x="-3.995" y="1.64"/>
<vertex x="-4.285" y="1.64" curve="-114.113525"/>
<vertex x="-4.35" y="1.74"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-3.16" y="1.96"/>
<vertex x="-2.94" y="1.96"/>
<vertex x="-2.925" y="2.01" curve="105.642164"/>
<vertex x="-3.02" y="2.14"/>
<vertex x="-3.42" y="2.14" curve="70.280225"/>
<vertex x="-3.555" y="2.045"/>
<vertex x="-3.63" y="1.805" curve="106.773065"/>
<vertex x="-3.51" y="1.64"/>
<vertex x="-3.11" y="1.64" curve="71.682021"/>
<vertex x="-3.02" y="1.705"/>
<vertex x="-2.985" y="1.825"/>
<vertex x="-3.2" y="1.825"/>
<vertex x="-3.215" y="1.78" curve="-75.804848"/>
<vertex x="-3.26" y="1.75"/>
<vertex x="-3.355" y="1.75" curve="-106.260205"/>
<vertex x="-3.4" y="1.81"/>
<vertex x="-3.35" y="1.98" curve="-70.964895"/>
<vertex x="-3.28" y="2.035"/>
<vertex x="-3.195" y="2.035" curve="-112.619865"/>
<vertex x="-3.155" y="1.975"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-2.45" y="1.825"/>
<vertex x="-2.23" y="1.825"/>
<vertex x="-2.175" y="2.005" curve="105.642164"/>
<vertex x="-2.27" y="2.135"/>
<vertex x="-2.67" y="2.135" curve="70.280225"/>
<vertex x="-2.805" y="2.04"/>
<vertex x="-2.88" y="1.8" curve="106.773065"/>
<vertex x="-2.76" y="1.635"/>
<vertex x="-2.36" y="1.635" curve="71.682021"/>
<vertex x="-2.27" y="1.7"/>
<vertex x="-2.23" y="1.825"/>
<vertex x="-2.45" y="1.82"/>
<vertex x="-2.465" y="1.775" curve="-75.804848"/>
<vertex x="-2.51" y="1.745"/>
<vertex x="-2.605" y="1.745" curve="-106.260205"/>
<vertex x="-2.65" y="1.805"/>
<vertex x="-2.6" y="1.975" curve="-70.964895"/>
<vertex x="-2.53" y="2.03"/>
<vertex x="-2.445" y="2.03" curve="-112.619865"/>
<vertex x="-2.405" y="1.97"/>
</polygon>
<pad name="5" x="4.5" y="7.32" drill="1" diameter="1.6764"/>
<pad name="6" x="1.5" y="7.32" drill="1" diameter="1.6764"/>
<pad name="7" x="-1.5" y="7.32" drill="1" diameter="1.6764"/>
<pad name="8" x="-4.5" y="7.32" drill="1" diameter="1.6764"/>
</package>
<package name="1445055-2">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 3.0 mm&lt;p&gt;
Source: ENG_CD_1445055_A.pdf</description>
<wire x1="-3.4" y1="4.525" x2="-2.675" y2="4.525" width="0.2032" layer="21"/>
<wire x1="-3.4" y1="4.525" x2="-3.4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-3.4" y1="-4.5" x2="3.4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="3.4" y1="-4.5" x2="3.4" y2="4.525" width="0.2032" layer="21"/>
<wire x1="3.4" y1="4.525" x2="2.6" y2="4.525" width="0.2032" layer="21"/>
<wire x1="2.6" y1="4.525" x2="2.075" y2="4.525" width="0.2032" layer="51"/>
<wire x1="2.075" y1="4.525" x2="2.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="2.075" y1="3.4" x2="0.925" y2="3.4" width="0.2032" layer="51"/>
<wire x1="0.925" y1="3.4" x2="0.925" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.925" y1="4.175" x2="0.45" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.45" y1="4.175" x2="-0.425" y2="4.175" width="0.2032" layer="21"/>
<wire x1="-0.425" y1="4.175" x2="-0.95" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-0.95" y1="4.175" x2="-0.95" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-0.95" y1="3.4" x2="-2.075" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-2.075" y1="3.4" x2="-2.075" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-2.075" y1="4.525" x2="-2.675" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-3.5" y1="1.45" x2="-4.25" y2="1.45" width="0.2032" layer="25"/>
<wire x1="-4.25" y1="1.45" x2="-4.975" y2="1.025" width="0.2032" layer="25"/>
<wire x1="-4.975" y1="1.025" x2="-4.975" y2="-0.425" width="0.2032" layer="25"/>
<wire x1="-4.975" y1="-0.425" x2="-4.25" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-4.25" y1="-0.85" x2="-4.025" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-4.025" y1="-0.85" x2="-4.025" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-4.025" y1="-0.35" x2="-3.5" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-4.4" y1="-0.7" x2="-4.4" y2="1.3" width="0.2032" layer="25"/>
<wire x1="3.5" y1="-1.45" x2="4.25" y2="-1.45" width="0.2032" layer="25"/>
<wire x1="4.25" y1="-1.45" x2="4.975" y2="-1.025" width="0.2032" layer="25"/>
<wire x1="4.975" y1="-1.025" x2="4.975" y2="0.425" width="0.2032" layer="25"/>
<wire x1="4.975" y1="0.425" x2="4.25" y2="0.85" width="0.2032" layer="25"/>
<wire x1="4.25" y1="0.85" x2="4.025" y2="0.85" width="0.2032" layer="25"/>
<wire x1="4.025" y1="0.85" x2="4.025" y2="0.35" width="0.2032" layer="25"/>
<wire x1="4.025" y1="0.35" x2="3.5" y2="0.35" width="0.2032" layer="25"/>
<wire x1="4.4" y1="-1.3" x2="4.4" y2="0.7" width="0.2032" layer="25"/>
<wire x1="-1.8" y1="-4.4" x2="-1.8" y2="-1.2" width="0.2032" layer="25"/>
<wire x1="-1.8" y1="-1.2" x2="1.8" y2="-1.2" width="0.2032" layer="25"/>
<wire x1="1.8" y1="-1.2" x2="1.8" y2="-4.4" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-2.65" x2="1.2" y2="-2.65" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-2.65" x2="1.2" y2="-1.75" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-1.75" x2="-1.2" y2="-1.75" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-1.75" x2="-1.2" y2="-2.65" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-2.65" x2="-1.2" y2="-3.775" width="0.2032" layer="25"/>
<wire x1="-1.2" y1="-3.775" x2="-1.425" y2="-4.45" width="0.2032" layer="25" curve="-36.869898"/>
<wire x1="1.2" y1="-2.65" x2="1.2" y2="-3.775" width="0.2032" layer="25"/>
<wire x1="1.2" y1="-3.775" x2="1.425" y2="-4.45" width="0.2032" layer="25" curve="36.869898"/>
<pad name="1" x="1.5" y="4.32" drill="1" diameter="1.6764"/>
<pad name="2" x="-1.5" y="4.32" drill="1" diameter="1.6764"/>
<text x="0" y="5.54" size="1.27" layer="25">&gt;NAME</text>
<text x="7.5" y="-4.5" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.8125" y1="3.5125" x2="-1.1875" y2="5" layer="51"/>
<rectangle x1="1.1875" y1="3.5125" x2="1.825" y2="5" layer="51"/>
<hole x="0" y="0" drill="3"/>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-1.865" y="2.14"/>
<vertex x="-1.71" y="2.14"/>
<vertex x="-1.6875" y="2.225"/>
<vertex x="-1.47" y="2.28"/>
<vertex x="-1.51" y="2.14"/>
<vertex x="-1.32" y="2.14"/>
<vertex x="-1.35" y="2.04"/>
<vertex x="-1.54" y="2.04"/>
<vertex x="-1.61" y="1.81" curve="107.492325"/>
<vertex x="-1.565" y="1.75" curve="-1.23212"/>
<vertex x="-1.445" y="1.75"/>
<vertex x="-1.475" y="1.64"/>
<vertex x="-1.755" y="1.64" curve="-115.057615"/>
<vertex x="-1.825" y="1.75"/>
<vertex x="-1.74" y="2.04"/>
<vertex x="-1.895" y="2.04"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-1.23" y="2.14"/>
<vertex x="-1.03" y="2.14"/>
<vertex x="-1.12" y="1.845" curve="114.079551"/>
<vertex x="-1.04" y="1.75"/>
<vertex x="-0.96" y="1.75"/>
<vertex x="-0.84" y="2.14"/>
<vertex x="-0.645" y="2.14"/>
<vertex x="-0.86" y="1.435"/>
<vertex x="-1.055" y="1.435"/>
<vertex x="-0.995" y="1.64"/>
<vertex x="-1.18" y="1.64"/>
<vertex x="-1.285" y="1.64" curve="-113.952265"/>
<vertex x="-1.35" y="1.74"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-0.16" y="1.96"/>
<vertex x="0.06" y="1.96"/>
<vertex x="0.075" y="2.01" curve="105.754161"/>
<vertex x="-0.02" y="2.14"/>
<vertex x="-0.42" y="2.14" curve="70.280225"/>
<vertex x="-0.555" y="2.045"/>
<vertex x="-0.63" y="1.805" curve="106.773065"/>
<vertex x="-0.51" y="1.64"/>
<vertex x="-0.11" y="1.64" curve="71.682021"/>
<vertex x="-0.02" y="1.705"/>
<vertex x="0.015" y="1.825"/>
<vertex x="-0.2" y="1.825"/>
<vertex x="-0.215" y="1.78" curve="-75.804848"/>
<vertex x="-0.26" y="1.75"/>
<vertex x="-0.355" y="1.75" curve="-106.260205"/>
<vertex x="-0.4" y="1.81"/>
<vertex x="-0.35" y="1.98" curve="-70.964895"/>
<vertex x="-0.28" y="2.035"/>
<vertex x="-0.195" y="2.035" curve="-112.619865"/>
<vertex x="-0.155" y="1.975"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="0.55" y="1.825"/>
<vertex x="0.77" y="1.825"/>
<vertex x="0.825" y="2.005" curve="105.642164"/>
<vertex x="0.73" y="2.135"/>
<vertex x="0.33" y="2.135" curve="70.280225"/>
<vertex x="0.195" y="2.04"/>
<vertex x="0.12" y="1.8" curve="106.773065"/>
<vertex x="0.24" y="1.635"/>
<vertex x="0.64" y="1.635" curve="71.682021"/>
<vertex x="0.73" y="1.7"/>
<vertex x="0.77" y="1.825"/>
<vertex x="0.55" y="1.82"/>
<vertex x="0.535" y="1.775" curve="-75.804848"/>
<vertex x="0.49" y="1.745"/>
<vertex x="0.395" y="1.745" curve="-106.260205"/>
<vertex x="0.35" y="1.805"/>
<vertex x="0.4" y="1.975" curve="-70.964895"/>
<vertex x="0.47" y="2.03"/>
<vertex x="0.555" y="2.03" curve="-112.619865"/>
<vertex x="0.595" y="1.97"/>
</polygon>
</package>
<package name="794681-4">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 1.5mm&lt;p&gt;
Dual Row Through Hole Vertical Metal Through Hole Holddowns&lt;br&gt;
Source: ENG_CD_794681_E.pdf</description>
<wire x1="-3.325" y1="3.325" x2="3.325" y2="3.325" width="0.2032" layer="21"/>
<wire x1="3.325" y1="3.325" x2="3.325" y2="-3.325" width="0.2032" layer="21"/>
<wire x1="3.325" y1="-3.325" x2="-3.325" y2="-3.325" width="0.2032" layer="21"/>
<wire x1="-3.325" y1="-3.325" x2="-3.325" y2="3.325" width="0.2032" layer="21"/>
<wire x1="-4" y1="-2" x2="-4.9" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="-1.1" x2="-4.9" y2="1.1" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="1.1" x2="-4" y2="2" width="0.2032" layer="21"/>
<wire x1="4" y1="2" x2="4.9" y2="1.1" width="0.2032" layer="21"/>
<wire x1="4.9" y1="1.1" x2="4.9" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="4.9" y1="-1.1" x2="4" y2="-2" width="0.2032" layer="21"/>
<wire x1="-4" y1="2" x2="-4" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="1.5" x2="-4" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="-1.5" x2="-4" y2="-2" width="0.2032" layer="21"/>
<wire x1="4" y1="2" x2="4" y2="1.5" width="0.2032" layer="21"/>
<wire x1="4" y1="1.5" x2="4" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="4" y1="-1.5" x2="4" y2="-2" width="0.2032" layer="21"/>
<wire x1="4" y1="-1.5" x2="3.5" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="4" y1="1.5" x2="3.5" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="1.5" x2="-3.5" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="-1.5" x2="-3.5" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="0.9" y1="-3.95" x2="0.9" y2="-3.425" width="0.2032" layer="21"/>
<wire x1="0.9" y1="-3.95" x2="-0.9" y2="-3.95" width="0.2032" layer="21"/>
<wire x1="-0.9" y1="-3.95" x2="-0.9" y2="-3.4" width="0.2032" layer="21"/>
<wire x1="1.55" y1="3.325" x2="0.775" y2="4.1" width="0.2032" layer="21" curve="-90"/>
<wire x1="0.775" y1="4.1" x2="0.775" y2="4.5" width="0.2032" layer="21"/>
<wire x1="-0.775" y1="4.5" x2="0.775" y2="4.5" width="0.2032" layer="21"/>
<wire x1="-0.775" y1="4.1" x2="-0.775" y2="4.5" width="0.2032" layer="21"/>
<wire x1="-0.775" y1="4.1" x2="-1.55" y2="3.325" width="0.2032" layer="21" curve="-90"/>
<wire x1="0.75" y1="4" x2="-0.75" y2="4" width="0.2032" layer="21"/>
<wire x1="0.75" y1="0.25" x2="2.75" y2="0.25" width="0.2032" layer="21"/>
<wire x1="2.75" y1="0.25" x2="2.75" y2="2.75" width="0.2032" layer="21"/>
<wire x1="2.75" y1="2.75" x2="0.25" y2="2.75" width="0.2032" layer="21"/>
<wire x1="0.25" y1="2.75" x2="0.25" y2="0.75" width="0.2032" layer="21"/>
<wire x1="0.25" y1="-0.25" x2="0.25" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="0.25" y1="-2.75" x2="2.25" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="2.75" y1="-2.25" x2="2.75" y2="-0.25" width="0.2032" layer="21"/>
<wire x1="-2.25" y1="0.25" x2="-0.25" y2="0.25" width="0.2032" layer="21"/>
<wire x1="-0.25" y1="2.75" x2="-2.75" y2="2.75" width="0.2032" layer="21"/>
<wire x1="-2.75" y1="2.75" x2="-2.75" y2="0.75" width="0.2032" layer="21"/>
<wire x1="-2.75" y1="-0.25" x2="-2.75" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="-2.75" y1="-2.75" x2="-0.25" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="2.25" y1="-2.75" x2="2.75" y2="-2.25" width="0.2032" layer="21"/>
<wire x1="0.75" y1="0.25" x2="0.25" y2="0.75" width="0.2032" layer="21"/>
<wire x1="-2.25" y1="0.25" x2="-2.75" y2="0.75" width="0.2032" layer="21"/>
<wire x1="-0.25" y1="2.75" x2="-0.25" y2="0.25" width="0.2032" layer="21"/>
<wire x1="-0.25" y1="-0.25" x2="-0.25" y2="-2.75" width="0.2032" layer="21"/>
<wire x1="-2.75" y1="-0.25" x2="-0.25" y2="-0.25" width="0.2032" layer="21"/>
<wire x1="0.25" y1="-0.25" x2="2.75" y2="-0.25" width="0.2032" layer="21"/>
<pad name="1" x="1.5" y="-1.5" drill="1" diameter="1.778"/>
<pad name="2" x="1.5" y="1.5" drill="1" diameter="1.778"/>
<pad name="3" x="-1.5" y="-1.5" drill="1" diameter="1.778"/>
<pad name="4" x="-1.5" y="1.5" drill="1" diameter="1.778"/>
<text x="-1.5" y="-6" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="4.5" size="1.27" layer="27">&gt;VALUE</text>
<hole x="3.63" y="0" drill="2.4"/>
<hole x="-3.67" y="0" drill="2.4"/>
</package>
</packages>
<symbols>
<symbol name="06P">
<wire x1="8.89" y1="-5.08" x2="-8.89" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-8.89" y1="5.08" x2="-8.89" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-5.08" x2="8.89" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-8.89" y1="5.08" x2="8.89" y2="5.08" width="0.4064" layer="94"/>
<text x="-3.81" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="CLK" x="-12.7" y="-2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="VCC" x="12.7" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="NC." x="12.7" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="NC" x="-12.7" y="0" length="middle" direction="pas" swaplevel="1"/>
<pin name="GND" x="12.7" y="-2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="DATA" x="-12.7" y="2.54" length="middle" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="P8-2">
<wire x1="3.81" y1="-1.27" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="8.89" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="8.89" x2="3.81" y2="8.89" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="8.89" width="0.254" layer="94"/>
<circle x="-2.54" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="-2.54" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="2.54" radius="0.635" width="0.254" layer="94"/>
<text x="-5.08" y="-3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.524" y="-0.508" size="1.27" layer="95">1</text>
<text x="-1.524" y="1.778" size="1.27" layer="95">2</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="5" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="6" x="5.08" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="-5.08" y="5.08" visible="off" length="short" direction="pas"/>
<pin name="4" x="-5.08" y="7.62" visible="off" length="short" direction="pas"/>
<pin name="8" x="5.08" y="7.62" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="7" x="5.08" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<text x="1.016" y="-0.508" size="1.27" layer="95">5</text>
<text x="1.016" y="1.778" size="1.27" layer="95">6</text>
<circle x="-2.54" y="5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="-2.54" y="7.62" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="7.62" radius="0.635" width="0.254" layer="94"/>
<text x="-1.524" y="4.572" size="1.27" layer="95">3</text>
<text x="-1.524" y="6.858" size="1.27" layer="95">4</text>
<text x="1.016" y="4.572" size="1.27" layer="95">7</text>
<text x="1.016" y="6.858" size="1.27" layer="95">8</text>
</symbol>
<symbol name="P2">
<wire x1="1.27" y1="-1.27" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="3.81" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="3.81" x2="1.27" y2="3.81" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="3.81" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.778" y="-0.508" size="1.27" layer="95">1</text>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="2" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="P4-2">
<wire x1="3.81" y1="-1.27" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="3.81" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="3.81" x2="3.81" y2="3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="3.81" width="0.254" layer="94"/>
<circle x="-2.54" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="-2.54" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="2.54" radius="0.635" width="0.254" layer="94"/>
<text x="-5.08" y="-3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.524" y="-0.508" size="1.27" layer="95">1</text>
<text x="1.524" y="0.762" size="1.27" layer="95" rot="R180">2</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="4" x="5.08" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PDI_ATMEL" prefix="SV" uservalue="yes">
<description>Ref Harting : 09 18 506 7323
Atmel pdi connector</description>
<gates>
<gate name="1" symbol="06P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ML6">
<connects>
<connect gate="1" pin="CLK" pad="5"/>
<connect gate="1" pin="DATA" pad="1"/>
<connect gate="1" pin="GND" pad="6"/>
<connect gate="1" pin="NC" pad="3"/>
<connect gate="1" pin="NC." pad="4"/>
<connect gate="1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="L" package="ML6L">
<connects>
<connect gate="1" pin="CLK" pad="5"/>
<connect gate="1" pin="DATA" pad="1"/>
<connect gate="1" pin="GND" pad="6"/>
<connect gate="1" pin="NC" pad="3"/>
<connect gate="1" pin="NC." pad="4"/>
<connect gate="1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="693-5242 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="794618-8" prefix="J">
<gates>
<gate name="G$1" symbol="P8-2" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="794618-8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="495-9451" constant="no"/>
<attribute name="VALUE" value="794618-8" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1445055-2" prefix="J">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 1.5 mm&lt;p&gt;
Source: ENG_CD_1445055_A.pdf</description>
<gates>
<gate name="G$1" symbol="P2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1445055-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 495-9580" constant="no"/>
<attribute name="VALUE" value="1445055-2" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="794681-4" prefix="J">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 1.5mm&lt;p&gt;
Dual Row Through Hole Vertical Metal Through Hole Holddowns&lt;br&gt;
Source: ENG_CD_794681_E.pdf</description>
<gates>
<gate name="G$1" symbol="P4-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="794681-4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="495-9344" constant="no"/>
<attribute name="VALUE" value="794630-4" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<packages>
<package name="6410-02">
<description>&lt;b&gt;MOLEX 2.54mm KK  CONNECTOR&lt;/b&gt;</description>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="2.921" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="-2.54" y1="2.921" x2="-1.27" y2="2.921" width="0.254" layer="21"/>
<wire x1="-1.016" y1="2.921" x2="-1.27" y2="2.921" width="0.127" layer="21"/>
<wire x1="-1.27" y1="2.921" x2="0" y2="2.921" width="0.254" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="2.54" y1="2.921" x2="0" y2="2.921" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-2.921" x2="0" y2="-2.921" width="0.254" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.921" width="0.254" layer="21"/>
<wire x1="2.54" y1="-2.921" x2="1.905" y2="-2.921" width="0.127" layer="21"/>
<wire x1="1.905" y1="-2.921" x2="0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.921" x2="0" y2="-2.921" width="0.127" layer="21"/>
<wire x1="-2.286" y1="-2.921" x2="-1.905" y2="-2.921" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-2.921" x2="-1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.921" x2="-1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.286" x2="-0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.286" x2="-0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.921" x2="0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.921" x2="0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.286" x2="1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.921" x2="2.54" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="2.921" width="0.254" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.016" y2="1.905" width="0.254" layer="21"/>
<wire x1="-1.016" y1="1.905" x2="1.016" y2="1.905" width="0.254" layer="21"/>
<wire x1="1.016" y1="1.905" x2="1.27" y2="1.905" width="0.254" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="2.921" width="0.254" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.016" y2="1.397" width="0.254" layer="21"/>
<wire x1="-1.016" y1="2.921" x2="-1.016" y2="1.905" width="0.254" layer="21"/>
<wire x1="-1.016" y1="1.397" x2="1.016" y2="1.397" width="0.254" layer="21"/>
<wire x1="1.016" y1="1.397" x2="1.27" y2="1.905" width="0.254" layer="21"/>
<wire x1="1.016" y1="2.921" x2="1.016" y2="1.905" width="0.254" layer="21"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.5131" y="3.2751" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="3.2751" y="-0.6111" size="1.27" layer="21" ratio="14">1</text>
<text x="-3.7099" y="-0.6873" size="1.27" layer="21" ratio="14">2</text>
<text x="-2.5131" y="-4.5989" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="7395-02">
<description>&lt;b&gt;MOLEX 2.54mm KK RA CONNECTOR&lt;/b&gt;
&lt;br&gt;Fixed Orientation</description>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="-1.905" width="0.254" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="-0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-1.905" x2="-0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-1.905" x2="-2.54" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-5.08" x2="-1.651" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-1.651" y1="-5.08" x2="1.27" y2="-5.08" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="-13.081" width="0.254" layer="21"/>
<wire x1="1.27" y1="-13.081" x2="1.016" y2="-13.589" width="0.254" layer="21"/>
<wire x1="1.016" y1="-13.589" x2="-0.0508" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-5.08" x2="-1.27" y2="-13.081" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-13.081" x2="-1.016" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-1.016" y1="-13.589" x2="-0.0508" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-0.0508" y1="-13.589" x2="0.0508" y2="-13.589" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="0.889" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-1.651" y1="-5.08" x2="-1.651" y2="-11.303" width="0.254" layer="21"/>
<wire x1="-1.651" y1="-11.303" x2="-1.3208" y2="-11.6586" width="0.254" layer="21"/>
<wire x1="1.651" y1="-5.08" x2="1.651" y2="-11.303" width="0.254" layer="21"/>
<wire x1="1.651" y1="-11.303" x2="1.3208" y2="-11.6586" width="0.254" layer="21"/>
<pad name="1" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="2.6401" y="2.9479" size="1.016" layer="25" ratio="10" rot="R180">&gt;NAME</text>
<text x="0.7859" y="-3.4021" size="1.27" layer="21" ratio="14" rot="R270">1</text>
<text x="-1.7033" y="-3.2751" size="1.27" layer="21" ratio="14" rot="R270">2</text>
<text x="3.4021" y="-2.4399" size="0.8128" layer="27" ratio="10" rot="R270">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-2.5146" x2="1.524" y2="-0.2794" layer="51"/>
<rectangle x1="-1.524" y1="-2.5146" x2="-1.016" y2="-0.2794" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-?-02" prefix="J">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (.1 inch) pitch header</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="05-7028" package="7395-02">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="9731601" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="27-2021" package="6410-02">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="holes">
<packages>
<package name="2,8-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 2.8 mm, round</description>
<wire x1="0" y1="2.921" x2="0" y2="2.667" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.667" x2="0" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-1.778" y1="0" x2="0" y2="-1.778" width="2.286" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.778" x2="1.778" y2="0" width="2.286" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.635" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="39"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="40"/>
<circle x="0" y="0" radius="3.175" width="0.8128" layer="43"/>
<circle x="0" y="0" radius="1.5" width="0.2032" layer="21"/>
<pad name="B2,8" x="0" y="0" drill="2.8" diameter="5.334"/>
</package>
<package name="3,0-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.0 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="39"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.6" width="0.2032" layer="21"/>
<pad name="B3,0" x="0" y="0" drill="3" diameter="5.842"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,0</text>
</package>
<package name="3,2-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.2 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.7" width="0.1524" layer="21"/>
<pad name="B3,2" x="0" y="0" drill="3.2" diameter="5.842"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,2</text>
</package>
<package name="3,3-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.3 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.27" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.7" width="0.2032" layer="21"/>
<pad name="B3,3" x="0" y="0" drill="3.3" diameter="5.842"/>
</package>
<package name="3,6-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 3.6 mm, round</description>
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3.429" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3.683" width="1.397" layer="39"/>
<circle x="0" y="0" radius="3.683" width="1.397" layer="40"/>
<circle x="0" y="0" radius="3.556" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.9" width="0.2032" layer="21"/>
<pad name="B3,6" x="0" y="0" drill="3.6" diameter="5.842"/>
</package>
<package name="4,1-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.1 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="5.08" width="2" layer="43"/>
<circle x="0" y="0" radius="2.15" width="0.2032" layer="21"/>
<pad name="B4,1" x="0" y="0" drill="4.1" diameter="8"/>
</package>
<package name="4,3-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.3 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.25" width="0.1524" layer="21"/>
<pad name="B4,3" x="0" y="0" drill="4.3" diameter="9"/>
</package>
<package name="4,5-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 4.5 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.35" width="0.1524" layer="21"/>
<pad name="B4,5" x="0" y="0" drill="4.5" diameter="9"/>
</package>
<package name="5,0-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 5.0 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.6" width="0.1524" layer="21"/>
<pad name="B5" x="0" y="0" drill="5" diameter="9"/>
</package>
<package name="5,5-PAD">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt; 5.5 mm, round</description>
<wire x1="-2.54" y1="0" x2="0" y2="-2.54" width="3.9116" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="2.54" y2="0" width="3.9116" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="4.4958" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="5.588" width="2" layer="43"/>
<circle x="0" y="0" radius="5.588" width="2" layer="39"/>
<circle x="0" y="0" radius="5.588" width="2" layer="40"/>
<circle x="0" y="0" radius="2.85" width="0.1524" layer="21"/>
<pad name="B5,5" x="0" y="0" drill="5.5" diameter="9"/>
</package>
</packages>
<symbols>
<symbol name="MOUNT-PAD">
<wire x1="0.254" y1="2.032" x2="2.032" y2="0.254" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="0.254" x2="-0.254" y2="2.032" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="-0.254" x2="-0.254" y2="-2.032" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<wire x1="0.254" y1="-2.032" x2="2.032" y2="-0.254" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<circle x="0" y="0" radius="1.524" width="0.0508" layer="94"/>
<text x="2.794" y="0.5842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.794" y="-2.4638" size="1.778" layer="96">&gt;VALUE</text>
<pin name="MOUNT" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOUNT-PAD-ROUND" prefix="H">
<description>&lt;b&gt;MOUNTING PAD&lt;/b&gt;, round</description>
<gates>
<gate name="G$1" symbol="MOUNT-PAD" x="0" y="0"/>
</gates>
<devices>
<device name="2.8" package="2,8-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B2,8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.0" package="3,0-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.2" package="3,2-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.3" package="3,3-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.6" package="3,6-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B3,6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.1" package="4,1-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.3" package="4,3-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.5" package="4,5-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B4,5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.0" package="5,0-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5.5" package="5,5-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B5,5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="rcl">
<packages>
<package name="R0402">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0603">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51"/>
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R0805W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R1005">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="R1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1524" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1206W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1210">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8999" x2="0.3" y2="0.8999" layer="35"/>
</package>
<package name="R1210W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="R2010">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2010W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2012W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2512">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R2512W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.896" y="0" dx="2" dy="2.1" layer="1"/>
<smd name="2" x="2.896" y="0" dx="2" dy="2.1" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3216W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3225">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R3225W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R5025">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R5025W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.1" y="0" dx="1" dy="3.2" layer="1"/>
<smd name="2" x="3.1" y="0" dx="1" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M1406">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="M2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M2309">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M3516">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.4001" y1="-0.7" x2="0.4001" y2="0.7" layer="35"/>
</package>
<package name="M5923">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="0207/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 10 mm</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.048" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="0207/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 12 mm</description>
<wire x1="6.35" y1="0" x2="5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="4.445" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-4.445" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.3086" y2="0.3048" layer="21"/>
<rectangle x1="-5.3086" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
</package>
<package name="0207/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 15mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.715" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-5.715" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="5.715" y1="-0.3048" x2="6.5786" y2="0.3048" layer="21"/>
<rectangle x1="-6.5786" y1="-0.3048" x2="-5.715" y2="0.3048" layer="21"/>
</package>
<package name="0207/2V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="-0.381" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="0" width="0.6096" layer="21"/>
<wire x1="0.381" y1="0" x2="1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.27" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-0.0508" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0508" y="-2.2352" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/5V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-0.889" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.762" y1="0" x2="0.762" y2="0" width="0.6096" layer="21"/>
<wire x1="0.889" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<circle x="-2.54" y="0" radius="1.27" width="0.1016" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.143" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.143" y="-2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 7.5 mm</description>
<wire x1="-3.81" y1="0" x2="-3.429" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0" x2="3.81" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.5588" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.429" y1="-0.3048" x2="-3.175" y2="0.3048" layer="51"/>
<rectangle x1="3.175" y1="-0.3048" x2="3.429" y2="0.3048" layer="51"/>
</package>
<package name="0309/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 10mm</description>
<wire x1="-4.699" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="5.08" y1="0" x2="4.699" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.6228" y1="-0.3048" x2="-4.318" y2="0.3048" layer="51"/>
<rectangle x1="4.318" y1="-0.3048" x2="4.6228" y2="0.3048" layer="51"/>
</package>
<package name="0309/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.318" y1="-0.3048" x2="5.1816" y2="0.3048" layer="21"/>
<rectangle x1="-5.1816" y1="-0.3048" x2="-4.318" y2="0.3048" layer="21"/>
</package>
<package name="0309V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 2.5 mm</description>
<wire x1="1.27" y1="0" x2="0.635" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.524" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="0.254" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.254" y="-2.2098" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.254" y1="-0.3048" x2="0.5588" y2="0.3048" layer="51"/>
<rectangle x1="-0.635" y1="-0.3048" x2="-0.3302" y2="0.3048" layer="51"/>
<rectangle x1="-0.3302" y1="-0.3048" x2="0.254" y2="0.3048" layer="21"/>
</package>
<package name="0411/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.762" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.762" layer="51"/>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.3594" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
<rectangle x1="5.08" y1="-0.381" x2="5.3594" y2="0.381" layer="21"/>
</package>
<package name="0411/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 15 mm</description>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0" x2="-6.35" y2="0" width="0.762" layer="51"/>
<wire x1="6.35" y1="0" x2="7.62" y2="0" width="0.762" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5.08" y1="-0.381" x2="6.477" y2="0.381" layer="21"/>
<rectangle x1="-6.477" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
</package>
<package name="0411V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 3.81 mm</description>
<wire x1="1.27" y1="0" x2="0.3048" y2="0" width="0.762" layer="51"/>
<wire x1="-1.5748" y1="0" x2="-2.54" y2="0" width="0.762" layer="51"/>
<circle x="-2.54" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.9144" shape="octagon"/>
<text x="-0.508" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.5334" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.4732" y1="-0.381" x2="0.2032" y2="0.381" layer="21"/>
</package>
<package name="0414/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="1.905" x2="-5.842" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-5.842" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="-2.159" x2="6.096" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="2.159" x2="6.096" y2="1.905" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-6.096" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="2.159" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.032" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-2.159" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.032" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="-4.826" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="-4.826" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="5.842" y1="2.159" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-2.159" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-1.905" x2="6.096" y2="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="2.5654" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.4064" x2="6.5024" y2="0.4064" layer="21"/>
<rectangle x1="-6.5024" y1="-0.4064" x2="-6.096" y2="0.4064" layer="21"/>
</package>
<package name="0414V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.159" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.381" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.381" y="-2.3622" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.2954" y2="0.4064" layer="21"/>
</package>
<package name="0617/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 17.5 mm</description>
<wire x1="-8.89" y1="0" x2="-8.636" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.636" y1="0" x2="8.89" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.016" shape="octagon"/>
<text x="-8.128" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.096" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-8.5344" y1="-0.4064" x2="-8.2296" y2="0.4064" layer="51"/>
<rectangle x1="8.2296" y1="-0.4064" x2="8.5344" y2="0.4064" layer="51"/>
</package>
<package name="0617/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 22.5 mm</description>
<wire x1="-10.287" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.287" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.255" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.1854" y1="-0.4064" x2="-8.255" y2="0.4064" layer="21"/>
<rectangle x1="8.255" y1="-0.4064" x2="10.1854" y2="0.4064" layer="21"/>
</package>
<package name="0617V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="3.048" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="0.635" y="1.4224" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.635" y="-2.6162" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.3208" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="0922/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 22.5 mm</description>
<wire x1="11.43" y1="0" x2="10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-11.43" y1="0" x2="-10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-10.16" y1="-4.191" x2="-10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="4.572" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="4.318" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="-4.572" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="-4.318" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="-8.636" y2="4.318" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="-8.636" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="9.779" y1="4.572" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-4.572" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-4.191" x2="10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-4.191" x2="-9.779" y2="-4.572" width="0.1524" layer="21" curve="90"/>
<wire x1="-10.16" y1="4.191" x2="-9.779" y2="4.572" width="0.1524" layer="21" curve="-90"/>
<wire x1="9.779" y1="-4.572" x2="10.16" y2="-4.191" width="0.1524" layer="21" curve="90"/>
<wire x1="9.779" y1="4.572" x2="10.16" y2="4.191" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-10.16" y="5.1054" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.7188" y1="-0.4064" x2="-10.16" y2="0.4064" layer="51"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-10.16" y2="0.4064" layer="21"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.7188" y2="0.4064" layer="51"/>
</package>
<package name="P0613V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.286" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.254" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.254" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="P0613/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.032" x2="-6.223" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.032" x2="-6.223" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="-2.286" x2="6.477" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="2.286" x2="6.477" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.223" y1="2.286" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.159" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-6.223" y1="-2.286" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-2.159" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="-5.207" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="-5.207" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.223" y1="2.286" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="6.223" y1="-2.286" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="0.635" width="0.1524" layer="51"/>
<wire x1="6.477" y1="2.032" x2="6.477" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.032" x2="-6.477" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.477" y="2.6924" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.0358" y1="-0.4064" x2="-6.477" y2="0.4064" layer="51"/>
<rectangle x1="6.477" y1="-0.4064" x2="7.0358" y2="0.4064" layer="51"/>
</package>
<package name="P0817/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 22.5 mm</description>
<wire x1="-10.414" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="-3.429" x2="-8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="3.81" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="3.556" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-3.81" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-3.556" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="-6.985" y2="3.556" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="-6.985" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.128" y1="3.81" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="8.128" y1="-3.81" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.429" x2="8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.414" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="3.429" x2="-8.128" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.509" y1="-3.429" x2="-8.128" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="8.128" y1="3.81" x2="8.509" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.128" y1="-3.81" x2="8.509" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.382" y="4.2164" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.223" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="6.604" y="-2.2606" size="1.27" layer="51" ratio="10" rot="R90">0817</text>
<rectangle x1="8.509" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-8.509" y2="0.4064" layer="21"/>
</package>
<package name="P0817V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 6.35 mm</description>
<wire x1="-3.81" y1="0" x2="-5.08" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="3.81" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.27" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="octagon"/>
<text x="-1.016" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.016" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.032" size="1.016" layer="21" ratio="12">0817</text>
<rectangle x1="-3.81" y1="-0.4064" x2="0" y2="0.4064" layer="21"/>
</package>
<package name="V234/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V234, grid 12.5 mm</description>
<wire x1="-4.953" y1="1.524" x2="-4.699" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.778" x2="4.953" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-1.778" x2="4.953" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.953" y1="-1.524" x2="-4.699" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="1.778" x2="4.699" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="1.524" x2="-4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.778" x2="-4.699" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.953" y1="1.524" x2="4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.8128" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.016" shape="octagon"/>
<text x="-4.953" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.953" y1="-0.4064" x2="5.4102" y2="0.4064" layer="21"/>
<rectangle x1="-5.4102" y1="-0.4064" x2="-4.953" y2="0.4064" layer="21"/>
</package>
<package name="V235/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V235, grid 17.78 mm</description>
<wire x1="-6.731" y1="2.921" x2="6.731" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="2.54" x2="-7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.921" x2="-6.731" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="7.112" y1="2.54" x2="7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="7.874" y2="0" width="1.016" layer="51"/>
<wire x1="-7.874" y1="0" x2="-8.89" y2="0" width="1.016" layer="51"/>
<wire x1="-7.112" y1="-2.54" x2="-6.731" y2="-2.921" width="0.1524" layer="21" curve="90"/>
<wire x1="6.731" y1="2.921" x2="7.112" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.731" y1="-2.921" x2="7.112" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-7.112" y1="2.54" x2="-6.731" y2="2.921" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-8.89" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.1938" shape="octagon"/>
<text x="-6.858" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.842" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="7.112" y1="-0.508" x2="7.747" y2="0.508" layer="21"/>
<rectangle x1="-7.747" y1="-0.508" x2="-7.112" y2="0.508" layer="21"/>
</package>
<package name="V526-0">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V526-0, grid 2.5 mm</description>
<wire x1="-2.54" y1="1.016" x2="-2.286" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="1.27" x2="2.54" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="-1.27" x2="2.54" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.54" y1="-1.016" x2="-2.286" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.27" x2="-2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.27" x2="2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="-2.54" y2="-1.016" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.413" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.413" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102R">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102W">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<smd name="2" x="0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204R">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.938" y1="0.6" x2="-0.938" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.938" y1="-0.6" x2="0.938" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204W">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.684" y1="0.6" x2="-0.684" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.684" y1="-0.6" x2="0.684" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207R">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.2125" y1="1" x2="-1.2125" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.2125" y1="-1" x2="1.2125" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<smd name="2" x="2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<text x="-2.2225" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.2225" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207W">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.149" y1="1" x2="-1.149" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.149" y1="-1" x2="1.149" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<smd name="2" x="2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<text x="-2.54" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="0922V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 7.5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.81" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.508" y="1.6764" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.508" y="-2.9972" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.54" size="1.016" layer="21" ratio="12">0922</text>
<rectangle x1="-3.81" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="RDH/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type RDH, grid 15 mm</description>
<wire x1="-7.62" y1="0" x2="-6.858" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="3.048" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="2.794" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-3.048" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.794" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="-4.953" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="-4.953" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.048" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.048" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.667" x2="-6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-2.667" x2="6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.858" y1="0" x2="7.62" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.667" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="3.048" x2="6.477" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.667" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="6.096" y1="-3.048" x2="6.477" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.572" y="-1.7272" size="1.27" layer="51" ratio="10" rot="R90">RDH</text>
<rectangle x1="-6.7564" y1="-0.4064" x2="-6.4516" y2="0.4064" layer="51"/>
<rectangle x1="6.4516" y1="-0.4064" x2="6.7564" y2="0.4064" layer="51"/>
</package>
<package name="MINI_MELF-0102AX">
<description>&lt;b&gt;Mini MELF 0102 Axial&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.6" width="0" layer="51"/>
<circle x="0" y="0" radius="0.6" width="0" layer="52"/>
<smd name="1" x="0" y="0" dx="1.9" dy="1.9" layer="1" roundness="100"/>
<smd name="2" x="0" y="0" dx="1.9" dy="1.9" layer="16" roundness="100"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
<hole x="0" y="0" drill="1.3"/>
</package>
<package name="R0201">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; chip&lt;p&gt;
Source: http://www.vishay.com/docs/20008/dcrcw.pdf</description>
<smd name="1" x="-0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<smd name="2" x="0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.15" y2="0.15" layer="51"/>
<rectangle x1="0.15" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="-0.15" x2="0.15" y2="0.15" layer="21"/>
</package>
<package name="VTA52">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR52&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-15.24" y1="0" x2="-13.97" y2="0" width="0.6096" layer="51"/>
<wire x1="12.6225" y1="0.025" x2="12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="4.725" x2="-12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="4.725" x2="-12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="0.025" x2="-12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="-4.65" x2="12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="-4.65" x2="12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0" x2="15.24" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-13.97" y1="-0.3048" x2="-12.5675" y2="0.3048" layer="21"/>
<rectangle x1="12.5675" y1="-0.3048" x2="13.97" y2="0.3048" layer="21"/>
</package>
<package name="VTA53">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR53&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="4.7" x2="-9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="4.7" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-4.675" x2="9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-4.675" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA54">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR54&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="3.3" x2="-9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="3.3" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-3.3" x2="9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-3.3" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-8.255" y1="0" x2="-6.985" y2="0" width="0.6096" layer="51"/>
<wire x1="6.405" y1="0" x2="6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="3.3" x2="-6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="3.3" x2="-6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="0" x2="-6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="-3.3" x2="6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="-3.3" x2="6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="6.985" y1="0" x2="8.255" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-8.255" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="8.255" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.985" y1="-0.3048" x2="-6.35" y2="0.3048" layer="21"/>
<rectangle x1="6.35" y1="-0.3048" x2="6.985" y2="0.3048" layer="21"/>
</package>
<package name="VTA56">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR56&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="4.5" y1="0" x2="4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="3.3" x2="-4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="0" x2="-4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="-3.3" x2="4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="-3.3" x2="4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.08" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.08" y2="0.3048" layer="21"/>
</package>
<package name="VMTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-5.08" y1="0" x2="-4.26" y2="0" width="0.6096" layer="51"/>
<wire x1="3.3375" y1="-1.45" x2="3.3375" y2="1.45" width="0.1524" layer="21"/>
<wire x1="3.3375" y1="1.45" x2="-3.3625" y2="1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="1.45" x2="-3.3625" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="-1.45" x2="3.3375" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="4.235" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.1" shape="octagon"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.26" y1="-0.3048" x2="-3.3075" y2="0.3048" layer="21"/>
<rectangle x1="3.2825" y1="-0.3048" x2="4.235" y2="0.3048" layer="21"/>
</package>
<package name="VMTB60">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC60&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.585" y2="0" width="0.6096" layer="51"/>
<wire x1="4.6875" y1="-1.95" x2="4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="4.6875" y1="1.95" x2="-4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="1.95" x2="-4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="-1.95" x2="4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="5.585" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-4.445" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.585" y1="-0.3048" x2="-4.6325" y2="0.3048" layer="21"/>
<rectangle x1="4.6325" y1="-0.3048" x2="5.585" y2="0.3048" layer="21"/>
</package>
<package name="R4527">
<description>&lt;b&gt;Package 4527&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com/docs/31059/wsrhigh.pdf</description>
<wire x1="-5.675" y1="-3.375" x2="5.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.65" y1="-3.375" x2="5.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.65" y1="3.375" x2="-5.675" y2="3.375" width="0.2032" layer="21"/>
<wire x1="-5.675" y1="3.375" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<smd name="1" x="-4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.715" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.715" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0001">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.075" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="1.606" x2="3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-2.544" y="2.229" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.501" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0002">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.55" y1="3.375" x2="-5.55" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.55" y1="-3.375" x2="5.55" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.55" y1="-3.375" x2="5.55" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.55" y1="3.375" x2="-5.55" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.65" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.65" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC01/2">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="-1.475" width="0.2032" layer="51"/>
<wire x1="-2.45" y1="-1.475" x2="2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="1.475" width="0.2032" layer="51"/>
<wire x1="2.45" y1="1.475" x2="-2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="1.106" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="-1.106" x2="-2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="1.106" x2="2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="-1.106" width="0.2032" layer="21"/>
<smd name="1" x="-2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<smd name="2" x="2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<text x="-2.544" y="1.904" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.176" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC2515">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.05" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.05" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="1.606" x2="3.05" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-3.2" y="2.15" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.2" y="-3.4" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC4527">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.675" y1="3.4" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.675" y1="-3.375" x2="5.675" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.675" y1="-3.375" x2="5.675" y2="3.4" width="0.2032" layer="51"/>
<wire x1="5.675" y1="3.4" x2="-5.675" y2="3.4" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.775" y="3.925" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.775" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC6927">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-8.65" y1="3.375" x2="-8.65" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-8.65" y1="-3.375" x2="8.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="8.65" y1="-3.375" x2="8.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="8.65" y1="3.375" x2="-8.65" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-7.95" y="0.025" dx="3.94" dy="5.97" layer="1"/>
<smd name="2" x="7.95" y="0" dx="3.94" dy="5.97" layer="1"/>
<text x="-8.75" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.75" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="R1218">
<description>&lt;b&gt;CRCW1218 Thick Film, Rectangular Chip Resistors&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com .. dcrcw.pdf</description>
<wire x1="-0.913" y1="-2.219" x2="0.939" y2="-2.219" width="0.1524" layer="51"/>
<wire x1="0.913" y1="2.219" x2="-0.939" y2="2.219" width="0.1524" layer="51"/>
<smd name="1" x="-1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<smd name="2" x="1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-2.3" x2="-0.9009" y2="2.3" layer="51"/>
<rectangle x1="0.9144" y1="-2.3" x2="1.6645" y2="2.3" layer="51"/>
</package>
<package name="0204/5">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-1.778" y1="0.635" x2="-1.524" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.524" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="-0.889" x2="1.778" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="0.889" x2="1.778" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.778" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="0.889" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.762" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.889" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="-1.143" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="-1.143" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.889" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.889" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.635" x2="1.778" y2="0.635" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.0066" y="1.1684" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-0.254" x2="-1.778" y2="0.254" layer="51"/>
<rectangle x1="1.778" y1="-0.254" x2="2.032" y2="0.254" layer="51"/>
</package>
<package name="0204/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 7.5 mm</description>
<wire x1="3.81" y1="0" x2="2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0.762" x2="-2.286" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.286" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.016" x2="2.54" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.016" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.889" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.016" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-0.889" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="-1.778" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="-1.778" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.016" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.016" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.54" y1="-0.254" x2="2.921" y2="0.254" layer="21"/>
<rectangle x1="-2.921" y1="-0.254" x2="-2.54" y2="0.254" layer="21"/>
</package>
<package name="0204V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.508" layer="51"/>
<wire x1="-0.127" y1="0" x2="0.127" y2="0" width="0.508" layer="21"/>
<circle x="-1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="0" radius="0.635" width="0.0508" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.1336" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="1812X7R">
<description>&lt;b&gt;Chip Monolithic Ceramic Capacitors&lt;/b&gt; Medium Voltage High Capacitance for General Use&lt;p&gt;
Source: http://www.murata.com .. GRM43DR72E224KW01.pdf</description>
<wire x1="-1.1" y1="1.5" x2="1.1" y2="1.5" width="0.2032" layer="51"/>
<wire x1="1.1" y1="-1.5" x2="-1.1" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="-0.6" y1="1.5" x2="0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-1.5" x2="-0.6" y2="-1.5" width="0.2032" layer="21"/>
<smd name="1" x="-1.425" y="0" dx="0.8" dy="3.5" layer="1"/>
<smd name="2" x="1.425" y="0" dx="0.8" dy="3.5" layer="1" rot="R180"/>
<text x="-1.9456" y="1.9958" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.9456" y="-3.7738" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.6" x2="-1.1" y2="1.6" layer="51"/>
<rectangle x1="1.1" y1="-1.6" x2="1.4" y2="1.6" layer="51" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="R-EU">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R-EU_" prefix="R" uservalue="yes">
<description>&lt;B&gt;RESISTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="R-EU" x="0" y="0"/>
</gates>
<devices>
<device name="R0402" package="R0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0603" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805W" package="R0805W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1005" package="R1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206W" package="R1206W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210" package="R1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210W" package="R1210W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010" package="R2010">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010W" package="R2010W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012" package="R2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012W" package="R2012W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512W" package="R2512W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216" package="R3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216W" package="R3216W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225" package="R3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225W" package="R3225W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025" package="R5025">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025W" package="R5025W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332" package="R6332">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332W" package="R6332W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M0805" package="M0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1206" package="M1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1406" package="M1406">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2012" package="M2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2309" package="M2309">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3216" package="M3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3516" package="M3516">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M5923" package="M5923">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/5" package="0204/5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/7" package="0204/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/2V" package="0204V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/10" package="0207/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/12" package="0207/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/15" package="0207/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/2V" package="0207/2V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/5V" package="0207/5V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/7" package="0207/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/10" package="0309/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/12" package="0309/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/V" package="0309V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/12" package="0411/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/15" package="0411/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/3V" package="0411V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/15" package="0414/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/5V" package="0414V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/17" package="0617/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/22" package="0617/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/5V" package="0617V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922/22" package="0922/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/5V" package="P0613V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/15" package="P0613/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/22" package="P0817/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/7V" package="P0817V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V234/12" package="V234/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V235/17" package="V235/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V526-0" package="V526-0">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102R" package="MINI_MELF-0102R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102W" package="MINI_MELF-0102W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204R" package="MINI_MELF-0204R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204W" package="MINI_MELF-0204W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207R" package="MINI_MELF-0207R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207W" package="MINI_MELF-0207W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922V" package="0922V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RDH/15" package="RDH/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102AX" package="MINI_MELF-0102AX">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0201" package="R0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA52" package="VTA52">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA53" package="VTA53">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA54" package="VTA54">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA55" package="VTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA56" package="VTA56">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTA55" package="VMTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTB60" package="VMTB60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R4527" package="R4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0001" package="WSC0001">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0002" package="WSC0002">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC01/2" package="WSC01/2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC2515" package="WSC2515">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC4527" package="WSC4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC6927" package="WSC6927">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1218" package="R1218">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1812X7R" package="1812X7R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_others">
<description>Tiny6410 board</description>
<packages>
<package name="2MS1T2B4M6QNS">
<wire x1="-5" y1="1.25" x2="-5" y2="-14.68" width="0.127" layer="21"/>
<wire x1="-5" y1="-14.68" x2="-1.27" y2="-14.68" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-14.68" x2="1.27" y2="-14.68" width="0.127" layer="21"/>
<wire x1="1.27" y1="-14.68" x2="5" y2="-14.68" width="0.127" layer="21"/>
<wire x1="5" y1="-14.68" x2="5" y2="1.25" width="0.127" layer="21"/>
<wire x1="5" y1="1.25" x2="-5" y2="1.25" width="0.127" layer="21"/>
<pad name="3" x="-2.54" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="0" y="0" drill="1.1" shape="octagon"/>
<pad name="1" x="2.54" y="0" drill="1.1" shape="octagon"/>
<pad name="NC0" x="-2.54" y="-5.08" drill="1.1" diameter="2.1844" shape="octagon"/>
<pad name="NC1" x="2.54" y="-5.08" drill="1.1" diameter="2.1844" shape="octagon"/>
<wire x1="-1.27" y1="-15.24" x2="-3.81" y2="-18.34" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-19.61" x2="1.27" y2="-15.24" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-19.61" x2="-3.81" y2="-18.34" width="0.127" layer="21" curve="-180"/>
<wire x1="-1.27" y1="-15.24" x2="-1.27" y2="-14.68" width="0.127" layer="21"/>
<wire x1="1.27" y1="-15.24" x2="1.27" y2="-14.68" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="SWICTH_SPDT">
<wire x1="2.54" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-2.54" y2="-2.794" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-2.54" y2="2.794" width="0.254" layer="94" style="shortdash"/>
<text x="0" y="-2.54" size="1.27" layer="94">A</text>
<text x="0" y="1.27" size="1.27" layer="94">B</text>
<text x="-2.54" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3" x="-5.08" y="-2.54" visible="off" length="short"/>
<pin name="2" x="-5.08" y="2.54" visible="off" length="short"/>
<pin name="1" x="5.08" y="0" visible="off" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2MS1T2B4M6QNS" prefix="J">
<gates>
<gate name="G$1" symbol="SWICTH_SPDT" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="2MS1T2B4M6QNS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="734-7220" constant="no"/>
<attribute name="VALUE" value="2MS1T2B4M6QNS" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_inductor">
<packages>
<package name="SDR0805">
<smd name="1" x="0" y="-2.65" dx="8" dy="2.7" layer="1"/>
<smd name="2" x="0" y="2.65" dx="8" dy="2.7" layer="1"/>
<text x="-3.4495" y="4.1575" size="1.27" layer="27">&gt;VALUE</text>
<text x="-3.5765" y="-5.4275" size="1.27" layer="25">&gt;NAME</text>
<wire x1="3.7" y1="1.1" x2="3.7" y2="-1.1" width="0.127" layer="21" curve="-33.114143"/>
<wire x1="-3.7" y1="-1.1" x2="-3.7" y2="1.1" width="0.127" layer="21" curve="-33.114143"/>
</package>
</packages>
<symbols>
<symbol name="-L">
<text x="-3.81" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-1.27" y1="-2.54" x2="1.27" y2="2.54" layer="94" rot="R270"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SDR0805" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="-270KL" package="SDR0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 736-1282" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="linear">
<description>&lt;b&gt;Linear Devices&lt;/b&gt;&lt;p&gt;
Operational amplifiers,  comparators, voltage regulators, ADCs, DACs, etc.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DPACK_3">
<description>&lt;b&gt;DPAK&lt;/b&gt;&lt;p&gt;Style 3 (Motorola)</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="4" x="0" y="2.5" dx="5.4" dy="6.2" layer="1"/>
<smd name="1" x="-2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<smd name="3" x="2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="21"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="78XX">
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="7.62" y1="2.54" x2="-7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<text x="-7.62" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.032" y="-4.318" size="1.524" layer="95">GND</text>
<pin name="VI" x="-10.16" y="0" length="short" direction="in"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="VO" x="10.16" y="0" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="NCV78M" prefix="IC">
<description>&lt;b&gt;500 mA Positive Voltage Regulators&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.onsemi.com/pub_link/Collateral/MC78M00-D.PDF"&gt;Data sheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="78XX" x="0" y="2.54"/>
</gates>
<devices>
<device name="" package="DPACK_3">
<connects>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VI" pad="1"/>
<connect gate="G$1" pin="VO" pad="3"/>
</connects>
<technologies>
<technology name="05BDTRKG"/>
<technology name="08BDTRKG"/>
<technology name="12BDTRKG"/>
<technology name="15BDTG"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME4" library="frames" deviceset="A4L-LOC" device=""/>
<part name="IC2" library="avr-7" deviceset="XMEGA-A1" device="TQFP" value="XMEGA128-A1"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="FRAME6" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V14" library="supply1" deviceset="+3V3" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="+3V15" library="supply1" deviceset="+3V3" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R6" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R7" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R8" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="K1" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K2" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K3" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K4" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="PDI_ATMEL" library="robotter_connector" deviceset="PDI_ATMEL" device=""/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="P+11" library="supply1" deviceset="+5V" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="+3V24" library="supply1" deviceset="+3V3" device=""/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="H3" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="H4" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="GND53" library="supply1" deviceset="GND" device=""/>
<part name="FRAME8" library="frames" deviceset="A4L-LOC" device=""/>
<part name="GND64" library="supply1" deviceset="GND" device=""/>
<part name="D2" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R21" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND69" library="supply1" deviceset="GND" device=""/>
<part name="IR_SENSOR0" library="robotter_connector" deviceset="794681-4" device=""/>
<part name="P+33" library="supply1" deviceset="+24V" device="" value="Vbat"/>
<part name="GND70" library="supply1" deviceset="GND" device=""/>
<part name="GND71" library="supply1" deviceset="GND" device=""/>
<part name="GND72" library="supply1" deviceset="GND" device=""/>
<part name="GND73" library="supply1" deviceset="GND" device=""/>
<part name="R28" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND74" library="supply1" deviceset="GND" device=""/>
<part name="GND78" library="supply1" deviceset="GND" device=""/>
<part name="R29" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="R25" library="rcl" deviceset="R-EU_" device="R0603" value="0"/>
<part name="T2" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="P+12" library="supply1" deviceset="+24V" device="" value="Vbat"/>
<part name="T3" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="RUN" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="ERROR" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="COM" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="MOT0" library="con-molex" deviceset="22-?-02" device="27-2021"/>
<part name="D3" library="robotter_diode" deviceset="CGRM400*-G" device="" technology="4"/>
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device=""/>
<part name="D5" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R33" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="IR_SENSOR1" library="robotter_connector" deviceset="794681-4" device=""/>
<part name="P+2" library="supply1" deviceset="+24V" device="" value="Vbat"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R34" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="R41" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="R42" library="rcl" deviceset="R-EU_" device="R0603" value="0"/>
<part name="T5" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="P+3" library="supply1" deviceset="+24V" device="" value="Vbat"/>
<part name="T6" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="MOT1" library="con-molex" deviceset="22-?-02" device="27-2021"/>
<part name="D6" library="robotter_diode" deviceset="CGRM400*-G" device="" technology="4"/>
<part name="R1" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R2" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R48" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R49" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="K5" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K6" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K7" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K8" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="XB1" library="robotter_ic" deviceset="XBEE" device="-PRO"/>
<part name="BAL0" library="robotter_connector" deviceset="794618-8" device=""/>
<part name="BAL1" library="robotter_connector" deviceset="794618-8" device=""/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="J1" library="robotter_connector" deviceset="1445055-2" device=""/>
<part name="D7" library="robotter_diode" deviceset="50WQ03" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="J2" library="robotter_others" deviceset="2MS1T2B4M6QNS" device=""/>
<part name="T8" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="R50" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="R53" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="RF" library="robotter_diode" deviceset="LED_" device="Y" value="YELLOW"/>
<part name="R54" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="SYNC1" library="robotter_diode" deviceset="LED_" device="B"/>
<part name="R55" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R56" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="LOW_BATT" library="robotter_diode" deviceset="LED_" device="R"/>
<part name="SYNC0" library="robotter_diode" deviceset="LED_" device="B"/>
<part name="R57" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="IC4" library="robotter_ic" deviceset="LM25011" device="MY" value="LM25011MY"/>
<part name="R27" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R31" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R38" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R45" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="C22" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C30" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C31" library="robotter_capacitor" deviceset="10NF" device="-F" value="10nF 50V"/>
<part name="C32" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C33" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="D8" library="robotter_diode" deviceset="B160-13F" device="" value="B160-13F"/>
<part name="L1" library="robotter_inductor" deviceset="SDR0805" device="-270KL"/>
<part name="R22" library="robotter_resistor" deviceset="0.27" device="-F"/>
<part name="R58" library="robotter_resistor" deviceset="75K" device="-F"/>
<part name="R60" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R61" library="robotter_resistor" deviceset="3K09" device="-F"/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="IC3" library="linear" deviceset="NCV78M" device="" technology="05BDTRKG"/>
<part name="C21" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C34" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="R59" library="robotter_resistor" deviceset="100_1W" device="-1W"/>
<part name="FRAME3" library="frames" deviceset="A4L-LOC" device=""/>
<part name="R3" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R4" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R62" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R63" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R51" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R52" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R23" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R24" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R26" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R30" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R32" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R35" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R37" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R39" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R40" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R46" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="C27" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C28" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C29" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C12" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C13" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C14" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C15" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C16" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C8" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C17" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="C18" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="C19" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C20" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C23" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C24" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C25" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R13" library="robotter_resistor" deviceset="15K" device="-E" value="15k 1%"/>
<part name="R14" library="robotter_resistor" deviceset="1K" device="-E" value="1k"/>
<part name="C2" library="robotter_capacitor" deviceset="330UF" device="" value="330µF 35V"/>
<part name="T9" library="robotter_ic" deviceset="NTGS4111" device="PT1G" value="NTGS4111PT1G"/>
<part name="T4" library="robotter_ic" deviceset="NTGS4111" device="PT1G" value="NTGS4111PT1G"/>
<part name="T1" library="robotter_ic" deviceset="NTGS4111" device="PT1G" value="NTGS4111PT1G"/>
<part name="R64" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R43" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="IC6" library="robotter_ic" deviceset="74LVC4245" device="A"/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="+3V5" library="supply1" deviceset="+3V3" device=""/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="C35" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C36" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R44" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R65" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R66" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R67" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="IC5" library="robotter_ic" deviceset="74LVC4245" device="A"/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="+3V7" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V8" library="supply1" deviceset="+3V3" device=""/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="C37" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C38" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R68" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R69" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R70" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R71" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="PH1" library="robotter_ic" deviceset="GP1S58VJ000F" device="" value="GP1S58VJ000F"/>
<part name="C39" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V9" library="supply1" deviceset="+3V3" device=""/>
<part name="R16" library="robotter_resistor" deviceset="4K7" device="-F"/>
<part name="R17" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="C26" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="PH2" library="robotter_ic" deviceset="GP1S58VJ000F" device="" value="GP1S58VJ000F"/>
<part name="C40" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="+3V10" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V11" library="supply1" deviceset="+3V3" device=""/>
<part name="R12" library="robotter_resistor" deviceset="4K7" device="-F"/>
<part name="R18" library="robotter_resistor" deviceset="270" device="-F"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="12.7" y="170.18" size="1.778" layer="91">voir si ces éléments ne sont pas a placer sur une carte dédiée avec ventilateur et  top tour</text>
<text x="17.78" y="-175.26" size="1.778" layer="91">voir si ces éléments ne sont pas a placer sur une carte dédiée avec ventilateur et  top tour</text>
<text x="289.56" y="-111.76" size="1.778" layer="91">leds a supprimer si la carte n'est pas horizontale</text>
<text x="332.74" y="276.86" size="1.778" layer="91">3v3  &lt;-  5v</text>
<text x="436.88" y="276.86" size="1.778" layer="91">3v3  -&gt;  5v</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="185.42"/>
<instance part="FRAME4" gate="G$1" x="266.7" y="0"/>
<instance part="IC2" gate="G$1" x="78.74" y="243.84" smashed="yes">
<attribute name="NAME" x="96.52" y="195.58" size="1.9304" layer="95" ratio="5"/>
<attribute name="VALUE" x="96.52" y="193.04" size="1.9304" layer="96" ratio="5"/>
</instance>
<instance part="GND1" gate="1" x="142.24" y="200.66" smashed="yes">
<attribute name="VALUE" x="139.7" y="198.12" size="1.778" layer="96"/>
</instance>
<instance part="GND2" gate="1" x="78.74" y="190.5"/>
<instance part="+3V1" gate="G$1" x="180.34" y="231.14" smashed="yes">
<attribute name="VALUE" x="177.8" y="231.14" size="1.778" layer="96"/>
</instance>
<instance part="FRAME6" gate="G$1" x="266.7" y="185.42"/>
<instance part="+3V14" gate="G$1" x="15.24" y="223.52"/>
<instance part="Q1" gate="G$1" x="33.02" y="208.28" smashed="yes">
<attribute name="NAME" x="38.1" y="207.264" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="35.56" y="205.74" size="1.778" layer="96"/>
</instance>
<instance part="GND10" gate="1" x="33.02" y="195.58"/>
<instance part="+3V15" gate="G$1" x="142.24" y="243.84" smashed="yes">
<attribute name="VALUE" x="139.7" y="243.84" size="1.778" layer="96"/>
</instance>
<instance part="GND11" gate="1" x="142.24" y="231.14" smashed="yes">
<attribute name="VALUE" x="139.7" y="228.6" size="1.778" layer="96"/>
</instance>
<instance part="R5" gate="G$1" x="304.8" y="-154.94" smashed="yes">
<attribute name="NAME" x="297.18" y="-154.94" size="1.778" layer="95"/>
<attribute name="VALUE" x="307.34" y="-154.94" size="1.778" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="317.5" y="-157.48" smashed="yes">
<attribute name="NAME" x="309.88" y="-157.48" size="1.778" layer="95"/>
<attribute name="VALUE" x="320.04" y="-157.48" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="330.2" y="-160.02" smashed="yes">
<attribute name="NAME" x="322.58" y="-160.02" size="1.778" layer="95"/>
<attribute name="VALUE" x="332.74" y="-160.02" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="342.9" y="-162.56" smashed="yes">
<attribute name="NAME" x="335.28" y="-162.56" size="1.778" layer="95"/>
<attribute name="VALUE" x="345.44" y="-162.56" size="1.778" layer="96"/>
</instance>
<instance part="K1" gate="G$1" x="353.06" y="-154.94" smashed="yes" rot="R90">
<attribute name="NAME" x="345.44" y="-154.94" size="1.778" layer="95"/>
<attribute name="VALUE" x="358.14" y="-154.94" size="1.778" layer="96"/>
</instance>
<instance part="K2" gate="G$1" x="365.76" y="-157.48" smashed="yes" rot="R90">
<attribute name="NAME" x="358.14" y="-157.48" size="1.778" layer="95"/>
<attribute name="VALUE" x="370.84" y="-157.48" size="1.778" layer="96"/>
</instance>
<instance part="K3" gate="G$1" x="378.46" y="-160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="370.84" y="-160.02" size="1.778" layer="95"/>
<attribute name="VALUE" x="383.54" y="-160.02" size="1.778" layer="96"/>
</instance>
<instance part="K4" gate="G$1" x="391.16" y="-162.56" smashed="yes" rot="R90">
<attribute name="NAME" x="383.54" y="-162.56" size="1.778" layer="95"/>
<attribute name="VALUE" x="396.24" y="-162.56" size="1.778" layer="96"/>
</instance>
<instance part="GND19" gate="1" x="419.1" y="-175.26"/>
<instance part="+3V2" gate="G$1" x="172.72" y="358.14" rot="MR0"/>
<instance part="PDI_ATMEL" gate="1" x="223.52" y="337.82"/>
<instance part="+3V3" gate="G$1" x="241.3" y="345.44"/>
<instance part="GND20" gate="1" x="241.3" y="330.2"/>
<instance part="+3V17" gate="G$1" x="508" y="127"/>
<instance part="P+11" gate="1" x="508" y="73.66"/>
<instance part="GND31" gate="1" x="444.5" y="58.42"/>
<instance part="GND16" gate="1" x="439.42" y="304.8" rot="MR0"/>
<instance part="GND22" gate="1" x="459.74" y="330.2" rot="MR0"/>
<instance part="IC1" gate="G$1" x="462.28" y="307.34" rot="MR0"/>
<instance part="IC1" gate="P" x="464.82" y="340.36" rot="MR0"/>
<instance part="+3V24" gate="G$1" x="459.74" y="353.06" smashed="yes" rot="MR0">
<attribute name="VALUE" x="462.28" y="353.06" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="H1" gate="G$1" x="391.16" y="15.24" rot="R90"/>
<instance part="H3" gate="G$1" x="408.94" y="15.24" rot="R90"/>
<instance part="H4" gate="G$1" x="416.56" y="15.24" rot="R90"/>
<instance part="GND53" gate="1" x="403.86" y="10.16"/>
<instance part="FRAME8" gate="G$1" x="0" y="0"/>
<instance part="GND64" gate="1" x="142.24" y="152.4"/>
<instance part="D2" gate="G$1" x="165.1" y="83.82" rot="R90"/>
<instance part="R21" gate="G$1" x="177.8" y="83.82" rot="R90"/>
<instance part="GND69" gate="1" x="170.18" y="76.2"/>
<instance part="IR_SENSOR0" gate="G$1" x="88.9" y="88.9"/>
<instance part="P+33" gate="1" x="50.8" y="114.3"/>
<instance part="GND70" gate="1" x="73.66" y="99.06"/>
<instance part="GND71" gate="1" x="71.12" y="152.4"/>
<instance part="GND72" gate="1" x="88.9" y="73.66"/>
<instance part="GND73" gate="1" x="114.3" y="129.54"/>
<instance part="R28" gate="G$1" x="111.76" y="83.82" rot="R90"/>
<instance part="GND74" gate="1" x="76.2" y="43.18" smashed="yes">
<attribute name="VALUE" x="73.66" y="40.64" size="1.778" layer="96"/>
</instance>
<instance part="GND78" gate="1" x="50.8" y="71.12"/>
<instance part="R29" gate="G$1" x="104.14" y="81.28" rot="R90"/>
<instance part="R25" gate="G$1" x="104.14" y="96.52" rot="R90"/>
<instance part="T2" gate="G$1" x="48.26" y="83.82" smashed="yes">
<attribute name="NAME" x="50.8" y="86.36" size="1.778" layer="95"/>
<attribute name="VALUE" x="50.8" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="P+12" gate="1" x="76.2" y="60.96"/>
<instance part="T3" gate="G$1" x="81.28" y="30.48" smashed="yes">
<attribute name="NAME" x="83.82" y="33.02" size="1.778" layer="95"/>
<attribute name="VALUE" x="83.82" y="30.48" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="83.82" y="17.78" smashed="yes">
<attribute name="VALUE" x="81.28" y="15.24" size="1.778" layer="96"/>
</instance>
<instance part="R9" gate="G$1" x="134.62" y="274.32" smashed="yes">
<attribute name="NAME" x="127" y="274.32" size="1.778" layer="95"/>
<attribute name="VALUE" x="137.16" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="R10" gate="G$1" x="147.32" y="271.78" smashed="yes">
<attribute name="NAME" x="139.7" y="271.78" size="1.778" layer="95"/>
<attribute name="VALUE" x="149.86" y="271.78" size="1.778" layer="96"/>
</instance>
<instance part="R11" gate="G$1" x="160.02" y="269.24" smashed="yes">
<attribute name="NAME" x="152.4" y="269.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="162.56" y="269.24" size="1.778" layer="96"/>
</instance>
<instance part="RUN" gate="G$1" x="170.18" y="274.32" smashed="yes" rot="R90">
<attribute name="NAME" x="162.56" y="274.32" size="1.778" layer="95"/>
<attribute name="VALUE" x="175.26" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="ERROR" gate="G$1" x="182.88" y="271.78" smashed="yes" rot="R90">
<attribute name="NAME" x="175.26" y="271.78" size="1.778" layer="95"/>
<attribute name="VALUE" x="187.96" y="271.78" size="1.778" layer="96"/>
</instance>
<instance part="COM" gate="G$1" x="195.58" y="269.24" smashed="yes" rot="R90">
<attribute name="NAME" x="187.96" y="269.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="200.66" y="269.24" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="236.22" y="259.08"/>
<instance part="H2" gate="G$1" x="398.78" y="15.24" rot="R90"/>
<instance part="MOT0" gate="-1" x="109.22" y="35.56"/>
<instance part="MOT0" gate="-2" x="109.22" y="40.64"/>
<instance part="D3" gate="G$1" x="83.82" y="45.72" rot="R90"/>
<instance part="FRAME2" gate="G$1" x="0" y="-185.42"/>
<instance part="D5" gate="G$1" x="177.8" y="-91.44" rot="R90"/>
<instance part="R33" gate="G$1" x="193.04" y="-91.44" rot="R90"/>
<instance part="GND6" gate="1" x="185.42" y="-99.06"/>
<instance part="IR_SENSOR1" gate="G$1" x="99.06" y="-86.36"/>
<instance part="P+2" gate="1" x="60.96" y="-60.96"/>
<instance part="GND7" gate="1" x="83.82" y="-76.2"/>
<instance part="GND9" gate="1" x="99.06" y="-101.6"/>
<instance part="R34" gate="G$1" x="121.92" y="-91.44" rot="R90"/>
<instance part="GND13" gate="1" x="86.36" y="-132.08" smashed="yes">
<attribute name="VALUE" x="83.82" y="-134.62" size="1.778" layer="96"/>
</instance>
<instance part="GND14" gate="1" x="60.96" y="-104.14"/>
<instance part="R41" gate="G$1" x="114.3" y="-93.98" rot="R90"/>
<instance part="R42" gate="G$1" x="114.3" y="-78.74" rot="R90"/>
<instance part="T5" gate="G$1" x="58.42" y="-91.44" smashed="yes">
<attribute name="NAME" x="60.96" y="-88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="60.96" y="-91.44" size="1.778" layer="96"/>
</instance>
<instance part="P+3" gate="1" x="86.36" y="-114.3"/>
<instance part="T6" gate="G$1" x="91.44" y="-144.78" smashed="yes">
<attribute name="NAME" x="93.98" y="-142.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="93.98" y="-144.78" size="1.778" layer="96"/>
</instance>
<instance part="GND15" gate="1" x="93.98" y="-157.48" smashed="yes">
<attribute name="VALUE" x="91.44" y="-160.02" size="1.778" layer="96"/>
</instance>
<instance part="MOT1" gate="-1" x="119.38" y="-139.7"/>
<instance part="MOT1" gate="-2" x="119.38" y="-134.62"/>
<instance part="D6" gate="G$1" x="93.98" y="-129.54" rot="R90"/>
<instance part="R1" gate="G$1" x="304.8" y="-127" smashed="yes">
<attribute name="NAME" x="297.18" y="-127" size="1.778" layer="95"/>
<attribute name="VALUE" x="307.34" y="-127" size="1.778" layer="96"/>
</instance>
<instance part="R2" gate="G$1" x="317.5" y="-129.54" smashed="yes">
<attribute name="NAME" x="309.88" y="-129.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="320.04" y="-129.54" size="1.778" layer="96"/>
</instance>
<instance part="R48" gate="G$1" x="330.2" y="-132.08" smashed="yes">
<attribute name="NAME" x="322.58" y="-132.08" size="1.778" layer="95"/>
<attribute name="VALUE" x="332.74" y="-132.08" size="1.778" layer="96"/>
</instance>
<instance part="R49" gate="G$1" x="342.9" y="-134.62" smashed="yes">
<attribute name="NAME" x="335.28" y="-134.62" size="1.778" layer="95"/>
<attribute name="VALUE" x="345.44" y="-134.62" size="1.778" layer="96"/>
</instance>
<instance part="K5" gate="G$1" x="353.06" y="-127" smashed="yes" rot="R90">
<attribute name="NAME" x="345.44" y="-127" size="1.778" layer="95"/>
<attribute name="VALUE" x="358.14" y="-127" size="1.778" layer="96"/>
</instance>
<instance part="K6" gate="G$1" x="365.76" y="-129.54" smashed="yes" rot="R90">
<attribute name="NAME" x="358.14" y="-129.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="370.84" y="-129.54" size="1.778" layer="96"/>
</instance>
<instance part="K7" gate="G$1" x="378.46" y="-132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="370.84" y="-132.08" size="1.778" layer="95"/>
<attribute name="VALUE" x="383.54" y="-132.08" size="1.778" layer="96"/>
</instance>
<instance part="K8" gate="G$1" x="391.16" y="-134.62" smashed="yes" rot="R90">
<attribute name="NAME" x="383.54" y="-134.62" size="1.778" layer="95"/>
<attribute name="VALUE" x="396.24" y="-134.62" size="1.778" layer="96"/>
</instance>
<instance part="GND17" gate="1" x="419.1" y="-147.32"/>
<instance part="XB1" gate="G$1" x="373.38" y="322.58"/>
<instance part="BAL0" gate="G$1" x="317.5" y="198.12"/>
<instance part="BAL1" gate="G$1" x="386.08" y="198.12"/>
<instance part="+3V4" gate="G$1" x="299.72" y="353.06"/>
<instance part="GND18" gate="1" x="317.5" y="340.36"/>
<instance part="GND21" gate="1" x="350.52" y="292.1"/>
<instance part="J1" gate="G$1" x="287.02" y="147.32" rot="MR0"/>
<instance part="D7" gate="G$1" x="307.34" y="152.4"/>
<instance part="GND23" gate="1" x="312.42" y="114.3"/>
<instance part="J2" gate="G$1" x="299.72" y="137.16"/>
<instance part="T8" gate="G$1" x="320.04" y="127" smashed="yes">
<attribute name="NAME" x="322.58" y="129.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="322.58" y="127" size="1.778" layer="96"/>
</instance>
<instance part="R50" gate="G$1" x="312.42" y="127"/>
<instance part="R53" gate="G$1" x="304.8" y="121.92" rot="R90"/>
<instance part="RF" gate="G$1" x="180.34" y="289.56" rot="R90"/>
<instance part="R54" gate="G$1" x="139.7" y="289.56"/>
<instance part="SYNC1" gate="G$1" x="208.28" y="284.48" rot="R90"/>
<instance part="R55" gate="G$1" x="165.1" y="284.48" rot="R180"/>
<instance part="R56" gate="G$1" x="175.26" y="281.94"/>
<instance part="LOW_BATT" gate="G$1" x="223.52" y="281.94" rot="R90"/>
<instance part="SYNC0" gate="G$1" x="195.58" y="287.02" rot="R90"/>
<instance part="R57" gate="G$1" x="152.4" y="287.02" rot="R180"/>
<instance part="IC4" gate="G$1" x="444.5" y="114.3"/>
<instance part="R27" gate="G$1" x="40.64" y="83.82"/>
<instance part="R31" gate="G$1" x="73.66" y="30.48"/>
<instance part="R38" gate="G$1" x="50.8" y="-91.44"/>
<instance part="R45" gate="G$1" x="83.82" y="-144.78"/>
<instance part="C22" gate="G$1" x="396.24" y="114.3"/>
<instance part="C30" gate="G$1" x="408.94" y="121.92"/>
<instance part="C31" gate="G$1" x="426.72" y="101.6"/>
<instance part="C32" gate="G$1" x="462.28" y="129.54" smashed="yes">
<attribute name="NAME" x="463.804" y="129.921" size="1.778" layer="95"/>
<attribute name="VALUE" x="463.804" y="132.461" size="1.778" layer="96"/>
</instance>
<instance part="C33" gate="G$1" x="500.38" y="109.22"/>
<instance part="D8" gate="G$1" x="462.28" y="121.92" smashed="yes" rot="R90">
<attribute name="NAME" x="460.375" y="119.634" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="465.074" y="118.491" size="1.778" layer="96"/>
</instance>
<instance part="L1" gate="G$1" x="472.44" y="124.46" smashed="yes">
<attribute name="NAME" x="468.63" y="127" size="1.778" layer="95"/>
<attribute name="VALUE" x="476.25" y="125.73" size="1.778" layer="96"/>
</instance>
<instance part="R22" gate="G$1" x="462.28" y="114.3" smashed="yes" rot="R90">
<attribute name="NAME" x="464.82" y="114.3" size="1.778" layer="95"/>
<attribute name="VALUE" x="464.82" y="111.76" size="1.778" layer="96"/>
</instance>
<instance part="R58" gate="G$1" x="429.26" y="119.38" rot="R90"/>
<instance part="R60" gate="G$1" x="487.68" y="99.06" rot="R270"/>
<instance part="R61" gate="G$1" x="487.68" y="114.3" rot="R270"/>
<instance part="GND24" gate="1" x="444.5" y="88.9"/>
<instance part="GND25" gate="1" x="462.28" y="106.68"/>
<instance part="IC3" gate="G$1" x="444.5" y="71.12"/>
<instance part="C21" gate="G$1" x="421.64" y="68.58"/>
<instance part="C34" gate="G$1" x="464.82" y="68.58"/>
<instance part="R59" gate="G$1" x="403.86" y="71.12"/>
<instance part="FRAME3" gate="G$1" x="266.7" y="-185.42"/>
<instance part="R3" gate="G$1" x="165.1" y="340.36" rot="R90"/>
<instance part="R4" gate="G$1" x="172.72" y="337.82" rot="R90"/>
<instance part="R62" gate="G$1" x="147.32" y="350.52" rot="R270"/>
<instance part="R63" gate="G$1" x="154.94" y="347.98" rot="R270"/>
<instance part="R51" gate="G$1" x="322.58" y="137.16" rot="R90"/>
<instance part="R52" gate="G$1" x="322.58" y="147.32" rot="R90"/>
<instance part="R23" gate="G$1" x="111.76" y="101.6" rot="R90"/>
<instance part="R24" gate="G$1" x="50.8" y="104.14" rot="R90"/>
<instance part="R26" gate="G$1" x="50.8" y="93.98" rot="R90"/>
<instance part="R30" gate="G$1" x="35.56" y="78.74" rot="R90"/>
<instance part="R32" gate="G$1" x="66.04" y="25.4" rot="R90"/>
<instance part="R35" gate="G$1" x="45.72" y="-96.52" rot="R90"/>
<instance part="R37" gate="G$1" x="76.2" y="-149.86" rot="R90"/>
<instance part="R39" gate="G$1" x="121.92" y="-73.66" rot="R90"/>
<instance part="R40" gate="G$1" x="60.96" y="-81.28" rot="R90"/>
<instance part="R46" gate="G$1" x="60.96" y="-71.12" rot="R90"/>
<instance part="C27" gate="G$1" x="299.72" y="347.98"/>
<instance part="C28" gate="G$1" x="317.5" y="347.98"/>
<instance part="C29" gate="G$1" x="335.28" y="347.98"/>
<instance part="C1" gate="G$1" x="436.88" y="317.5"/>
<instance part="C3" gate="G$1" x="444.5" y="312.42"/>
<instance part="C4" gate="G$1" x="485.14" y="309.88"/>
<instance part="C5" gate="G$1" x="490.22" y="320.04"/>
<instance part="C6" gate="G$1" x="454.66" y="342.9"/>
<instance part="C9" gate="G$1" x="114.3" y="208.28"/>
<instance part="C10" gate="G$1" x="121.92" y="210.82"/>
<instance part="C11" gate="G$1" x="129.54" y="213.36"/>
<instance part="C12" gate="G$1" x="137.16" y="215.9"/>
<instance part="C13" gate="G$1" x="144.78" y="218.44"/>
<instance part="C14" gate="G$1" x="152.4" y="220.98"/>
<instance part="C15" gate="G$1" x="160.02" y="223.52"/>
<instance part="C16" gate="G$1" x="167.64" y="226.06"/>
<instance part="C7" gate="G$1" x="132.08" y="238.76"/>
<instance part="C8" gate="G$1" x="144.78" y="238.76"/>
<instance part="C17" gate="G$1" x="27.94" y="203.2"/>
<instance part="C18" gate="G$1" x="38.1" y="203.2"/>
<instance part="C19" gate="G$1" x="71.12" y="160.02"/>
<instance part="C20" gate="G$1" x="73.66" y="106.68"/>
<instance part="C23" gate="G$1" x="76.2" y="50.8"/>
<instance part="C24" gate="G$1" x="86.36" y="-124.46"/>
<instance part="C25" gate="G$1" x="83.82" y="-68.58"/>
<instance part="R15" gate="G$1" x="20.32" y="220.98"/>
<instance part="R13" gate="G$1" x="358.14" y="139.7" rot="R90"/>
<instance part="R14" gate="G$1" x="358.14" y="121.92" rot="R90"/>
<instance part="C2" gate="G$1" x="340.36" y="144.78"/>
<instance part="T9" gate="G$1" x="330.2" y="152.4" rot="R90"/>
<instance part="T4" gate="G$1" x="71.12" y="-66.04" rot="R90"/>
<instance part="T1" gate="G$1" x="60.96" y="109.22" rot="R90"/>
<instance part="R64" gate="G$1" x="157.48" y="88.9"/>
<instance part="R43" gate="G$1" x="167.64" y="-86.36"/>
<instance part="IC6" gate="G$1" x="444.5" y="243.84"/>
<instance part="P+4" gate="1" x="467.36" y="274.32" smashed="yes">
<attribute name="VALUE" x="464.82" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="+3V5" gate="G$1" x="421.64" y="274.32" smashed="yes">
<attribute name="VALUE" x="419.1" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="GND27" gate="1" x="421.64" y="261.62"/>
<instance part="GND28" gate="1" x="467.36" y="261.62"/>
<instance part="GND29" gate="1" x="447.04" y="215.9"/>
<instance part="C35" gate="G$1" x="421.64" y="269.24"/>
<instance part="C36" gate="G$1" x="467.36" y="269.24"/>
<instance part="R44" gate="G$1" x="487.68" y="248.92" smashed="yes">
<attribute name="NAME" x="485.14" y="251.46" size="1.778" layer="95"/>
<attribute name="VALUE" x="492.76" y="250.19" size="1.778" layer="96"/>
</instance>
<instance part="R65" gate="G$1" x="474.98" y="246.38"/>
<instance part="R66" gate="G$1" x="482.6" y="243.84" smashed="yes">
<attribute name="NAME" x="480.06" y="246.38" size="1.778" layer="95"/>
<attribute name="VALUE" x="487.68" y="245.11" size="1.778" layer="96"/>
</instance>
<instance part="R67" gate="G$1" x="495.3" y="241.3" smashed="yes">
<attribute name="NAME" x="495.3" y="236.22" size="1.778" layer="95"/>
<attribute name="VALUE" x="500.38" y="237.49" size="1.778" layer="96"/>
</instance>
<instance part="IC5" gate="G$1" x="340.36" y="243.84"/>
<instance part="P+5" gate="1" x="363.22" y="274.32" smashed="yes">
<attribute name="VALUE" x="360.68" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="+3V7" gate="G$1" x="317.5" y="274.32" smashed="yes">
<attribute name="VALUE" x="314.96" y="274.32" size="1.778" layer="96"/>
</instance>
<instance part="+3V8" gate="G$1" x="312.42" y="233.68"/>
<instance part="GND32" gate="1" x="317.5" y="261.62"/>
<instance part="GND33" gate="1" x="363.22" y="261.62"/>
<instance part="GND34" gate="1" x="342.9" y="215.9"/>
<instance part="C37" gate="G$1" x="317.5" y="269.24"/>
<instance part="C38" gate="G$1" x="363.22" y="269.24"/>
<instance part="R68" gate="G$1" x="302.26" y="248.92"/>
<instance part="R69" gate="G$1" x="309.88" y="246.38"/>
<instance part="R70" gate="G$1" x="302.26" y="243.84"/>
<instance part="R71" gate="G$1" x="309.88" y="241.3"/>
<instance part="PH1" gate="G$1" x="114.3" y="142.24"/>
<instance part="C39" gate="G$1" x="142.24" y="160.02"/>
<instance part="+3V6" gate="G$1" x="71.12" y="165.1"/>
<instance part="+3V9" gate="G$1" x="142.24" y="165.1"/>
<instance part="R16" gate="G$1" x="127" y="154.94" rot="R90"/>
<instance part="R17" gate="G$1" x="101.6" y="154.94" rot="R90"/>
<instance part="GND5" gate="1" x="154.94" y="-33.02"/>
<instance part="GND8" gate="1" x="83.82" y="-33.02"/>
<instance part="GND12" gate="1" x="127" y="-55.88"/>
<instance part="C26" gate="G$1" x="83.82" y="-25.4"/>
<instance part="PH2" gate="G$1" x="127" y="-43.18"/>
<instance part="C40" gate="G$1" x="154.94" y="-25.4"/>
<instance part="+3V10" gate="G$1" x="83.82" y="-20.32"/>
<instance part="+3V11" gate="G$1" x="154.94" y="-20.32"/>
<instance part="R12" gate="G$1" x="139.7" y="-30.48" rot="R90"/>
<instance part="R18" gate="G$1" x="114.3" y="-30.48" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="167.64" y1="220.98" x2="167.64" y2="203.2" width="0.1524" layer="91"/>
<wire x1="167.64" y1="203.2" x2="160.02" y2="203.2" width="0.1524" layer="91"/>
<wire x1="160.02" y1="203.2" x2="152.4" y2="203.2" width="0.1524" layer="91"/>
<wire x1="152.4" y1="203.2" x2="144.78" y2="203.2" width="0.1524" layer="91"/>
<wire x1="144.78" y1="203.2" x2="142.24" y2="203.2" width="0.1524" layer="91"/>
<wire x1="142.24" y1="203.2" x2="137.16" y2="203.2" width="0.1524" layer="91"/>
<wire x1="137.16" y1="203.2" x2="129.54" y2="203.2" width="0.1524" layer="91"/>
<wire x1="129.54" y1="203.2" x2="121.92" y2="203.2" width="0.1524" layer="91"/>
<wire x1="121.92" y1="203.2" x2="114.3" y2="203.2" width="0.1524" layer="91"/>
<wire x1="152.4" y1="215.9" x2="152.4" y2="203.2" width="0.1524" layer="91"/>
<wire x1="144.78" y1="213.36" x2="144.78" y2="203.2" width="0.1524" layer="91"/>
<wire x1="137.16" y1="210.82" x2="137.16" y2="203.2" width="0.1524" layer="91"/>
<wire x1="129.54" y1="208.28" x2="129.54" y2="203.2" width="0.1524" layer="91"/>
<wire x1="121.92" y1="205.74" x2="121.92" y2="203.2" width="0.1524" layer="91"/>
<wire x1="160.02" y1="218.44" x2="160.02" y2="203.2" width="0.1524" layer="91"/>
<junction x="121.92" y="203.2"/>
<junction x="160.02" y="203.2"/>
<junction x="152.4" y="203.2"/>
<junction x="144.78" y="203.2"/>
<junction x="137.16" y="203.2"/>
<junction x="129.54" y="203.2"/>
<junction x="142.24" y="203.2"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="C16" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="68.58" y1="193.04" x2="71.12" y2="193.04" width="0.1524" layer="91"/>
<wire x1="71.12" y1="193.04" x2="73.66" y2="193.04" width="0.1524" layer="91"/>
<wire x1="73.66" y1="193.04" x2="76.2" y2="193.04" width="0.1524" layer="91"/>
<wire x1="78.74" y1="193.04" x2="81.28" y2="193.04" width="0.1524" layer="91"/>
<wire x1="81.28" y1="193.04" x2="83.82" y2="193.04" width="0.1524" layer="91"/>
<wire x1="83.82" y1="193.04" x2="86.36" y2="193.04" width="0.1524" layer="91"/>
<wire x1="86.36" y1="193.04" x2="88.9" y2="193.04" width="0.1524" layer="91"/>
<wire x1="88.9" y1="193.04" x2="91.44" y2="193.04" width="0.1524" layer="91"/>
<wire x1="78.74" y1="193.04" x2="76.2" y2="193.04" width="0.1524" layer="91"/>
<junction x="71.12" y="193.04"/>
<junction x="78.74" y="193.04"/>
<junction x="73.66" y="193.04"/>
<junction x="78.74" y="193.04"/>
<junction x="81.28" y="193.04"/>
<junction x="83.82" y="193.04"/>
<junction x="86.36" y="193.04"/>
<junction x="88.9" y="193.04"/>
<junction x="76.2" y="193.04"/>
<pinref part="IC2" gate="G$1" pin="GND@10"/>
<pinref part="IC2" gate="G$1" pin="GND@1"/>
<pinref part="IC2" gate="G$1" pin="GND@9"/>
<pinref part="IC2" gate="G$1" pin="GND@7"/>
<pinref part="IC2" gate="G$1" pin="GND@8"/>
<pinref part="IC2" gate="G$1" pin="GND@6"/>
<pinref part="IC2" gate="G$1" pin="GND@5"/>
<pinref part="IC2" gate="G$1" pin="GND@4"/>
<pinref part="IC2" gate="G$1" pin="GND@3"/>
<pinref part="IC2" gate="G$1" pin="GND@2"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="38.1" y1="198.12" x2="33.02" y2="198.12" width="0.1524" layer="91"/>
<wire x1="33.02" y1="198.12" x2="27.94" y2="198.12" width="0.1524" layer="91"/>
<junction x="33.02" y="198.12"/>
<pinref part="GND10" gate="1" pin="GND"/>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="C18" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="132.08" y1="233.68" x2="142.24" y2="233.68" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="144.78" y1="233.68" x2="142.24" y2="233.68" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<junction x="142.24" y="233.68"/>
</segment>
<segment>
<wire x1="358.14" y1="-154.94" x2="419.1" y2="-154.94" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-154.94" x2="419.1" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-157.48" x2="419.1" y2="-160.02" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-160.02" x2="419.1" y2="-162.56" width="0.1524" layer="91"/>
<wire x1="396.24" y1="-162.56" x2="419.1" y2="-162.56" width="0.1524" layer="91"/>
<wire x1="383.54" y1="-160.02" x2="419.1" y2="-160.02" width="0.1524" layer="91"/>
<wire x1="370.84" y1="-157.48" x2="419.1" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-162.56" x2="419.1" y2="-172.72" width="0.1524" layer="91"/>
<junction x="419.1" y="-160.02"/>
<junction x="419.1" y="-157.48"/>
<junction x="419.1" y="-162.56"/>
<pinref part="K1" gate="G$1" pin="C"/>
<pinref part="K4" gate="G$1" pin="C"/>
<pinref part="K3" gate="G$1" pin="C"/>
<pinref part="K2" gate="G$1" pin="C"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="236.22" y1="335.28" x2="241.3" y2="335.28" width="0.1524" layer="91"/>
<wire x1="241.3" y1="335.28" x2="241.3" y2="332.74" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="444.5" y1="307.34" x2="439.42" y2="307.34" width="0.1524" layer="91"/>
<wire x1="439.42" y1="307.34" x2="436.88" y2="307.34" width="0.1524" layer="91"/>
<wire x1="436.88" y1="307.34" x2="436.88" y2="312.42" width="0.1524" layer="91"/>
<junction x="439.42" y="307.34"/>
<pinref part="GND16" gate="1" pin="GND"/>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="464.82" y1="332.74" x2="459.74" y2="332.74" width="0.1524" layer="91"/>
<wire x1="459.74" y1="332.74" x2="454.66" y2="332.74" width="0.1524" layer="91"/>
<wire x1="454.66" y1="332.74" x2="454.66" y2="337.82" width="0.1524" layer="91"/>
<junction x="459.74" y="332.74"/>
<pinref part="IC1" gate="P" pin="GND"/>
<pinref part="GND22" gate="1" pin="GND"/>
<pinref part="C6" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="391.16" y1="12.7" x2="398.78" y2="12.7" width="0.1524" layer="91"/>
<wire x1="398.78" y1="12.7" x2="403.86" y2="12.7" width="0.1524" layer="91"/>
<wire x1="403.86" y1="12.7" x2="416.56" y2="12.7" width="0.1524" layer="91"/>
<wire x1="403.86" y1="12.7" x2="408.94" y2="12.7" width="0.1524" layer="91"/>
<junction x="403.86" y="12.7"/>
<junction x="403.86" y="12.7"/>
<junction x="398.78" y="12.7"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="H4" gate="G$1" pin="MOUNT"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<pinref part="GND53" gate="1" pin="GND"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
</segment>
<segment>
<wire x1="177.8" y1="78.74" x2="170.18" y2="78.74" width="0.1524" layer="91"/>
<wire x1="170.18" y1="78.74" x2="165.1" y2="78.74" width="0.1524" layer="91"/>
<wire x1="165.1" y1="78.74" x2="165.1" y2="81.28" width="0.1524" layer="91"/>
<junction x="170.18" y="78.74"/>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="GND69" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="83.82" y1="88.9" x2="83.82" y2="76.2" width="0.1524" layer="91"/>
<wire x1="83.82" y1="76.2" x2="88.9" y2="76.2" width="0.1524" layer="91"/>
<wire x1="88.9" y1="76.2" x2="104.14" y2="76.2" width="0.1524" layer="91"/>
<wire x1="104.14" y1="76.2" x2="111.76" y2="76.2" width="0.1524" layer="91"/>
<wire x1="111.76" y1="76.2" x2="111.76" y2="78.74" width="0.1524" layer="91"/>
<junction x="88.9" y="76.2"/>
<junction x="104.14" y="76.2"/>
<pinref part="IR_SENSOR0" gate="G$1" pin="1"/>
<pinref part="R28" gate="G$1" pin="1"/>
<pinref part="GND72" gate="1" pin="GND"/>
<pinref part="R29" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="50.8" y1="73.66" x2="50.8" y2="78.74" width="0.1524" layer="91"/>
<wire x1="35.56" y1="73.66" x2="50.8" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND78" gate="1" pin="GND"/>
<pinref part="T2" gate="G$1" pin="E"/>
<junction x="50.8" y="73.66"/>
<pinref part="R30" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="66.04" y1="20.32" x2="83.82" y2="20.32" width="0.1524" layer="91"/>
<wire x1="83.82" y1="20.32" x2="83.82" y2="25.4" width="0.1524" layer="91"/>
<junction x="83.82" y="20.32"/>
<pinref part="T3" gate="G$1" pin="E"/>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="R32" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="175.26" y1="274.32" x2="236.22" y2="274.32" width="0.1524" layer="91"/>
<wire x1="236.22" y1="274.32" x2="236.22" y2="271.78" width="0.1524" layer="91"/>
<wire x1="236.22" y1="271.78" x2="236.22" y2="269.24" width="0.1524" layer="91"/>
<wire x1="200.66" y1="269.24" x2="236.22" y2="269.24" width="0.1524" layer="91"/>
<wire x1="187.96" y1="271.78" x2="236.22" y2="271.78" width="0.1524" layer="91"/>
<wire x1="236.22" y1="269.24" x2="236.22" y2="261.62" width="0.1524" layer="91"/>
<junction x="236.22" y="269.24"/>
<junction x="236.22" y="271.78"/>
<pinref part="RUN" gate="G$1" pin="C"/>
<pinref part="COM" gate="G$1" pin="C"/>
<pinref part="ERROR" gate="G$1" pin="C"/>
<pinref part="GND4" gate="1" pin="GND"/>
<pinref part="RF" gate="G$1" pin="C"/>
<wire x1="185.42" y1="289.56" x2="236.22" y2="289.56" width="0.1524" layer="91"/>
<wire x1="236.22" y1="289.56" x2="236.22" y2="287.02" width="0.1524" layer="91"/>
<junction x="236.22" y="274.32"/>
<pinref part="SYNC1" gate="G$1" pin="C"/>
<wire x1="236.22" y1="287.02" x2="236.22" y2="284.48" width="0.1524" layer="91"/>
<wire x1="236.22" y1="284.48" x2="236.22" y2="281.94" width="0.1524" layer="91"/>
<wire x1="236.22" y1="281.94" x2="236.22" y2="274.32" width="0.1524" layer="91"/>
<wire x1="213.36" y1="284.48" x2="236.22" y2="284.48" width="0.1524" layer="91"/>
<pinref part="LOW_BATT" gate="G$1" pin="C"/>
<wire x1="228.6" y1="281.94" x2="236.22" y2="281.94" width="0.1524" layer="91"/>
<junction x="236.22" y="281.94"/>
<junction x="236.22" y="284.48"/>
<pinref part="SYNC0" gate="G$1" pin="C"/>
<wire x1="200.66" y1="287.02" x2="236.22" y2="287.02" width="0.1524" layer="91"/>
<junction x="236.22" y="287.02"/>
</segment>
<segment>
<wire x1="193.04" y1="-96.52" x2="185.42" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-96.52" x2="177.8" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-96.52" x2="177.8" y2="-93.98" width="0.1524" layer="91"/>
<junction x="185.42" y="-96.52"/>
<pinref part="R33" gate="G$1" pin="1"/>
<pinref part="D5" gate="G$1" pin="A"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="93.98" y1="-86.36" x2="93.98" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-99.06" x2="99.06" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="99.06" y1="-99.06" x2="114.3" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-99.06" x2="121.92" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-99.06" x2="121.92" y2="-96.52" width="0.1524" layer="91"/>
<junction x="99.06" y="-99.06"/>
<junction x="114.3" y="-99.06"/>
<pinref part="IR_SENSOR1" gate="G$1" pin="1"/>
<pinref part="R34" gate="G$1" pin="1"/>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="R41" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="60.96" y1="-101.6" x2="60.96" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="45.72" y1="-101.6" x2="60.96" y2="-101.6" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
<pinref part="T5" gate="G$1" pin="E"/>
<junction x="60.96" y="-101.6"/>
<pinref part="R35" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="76.2" y1="-154.94" x2="93.98" y2="-154.94" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-154.94" x2="93.98" y2="-149.86" width="0.1524" layer="91"/>
<junction x="93.98" y="-154.94"/>
<pinref part="T6" gate="G$1" pin="E"/>
<pinref part="GND15" gate="1" pin="GND"/>
<pinref part="R37" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="358.14" y1="-127" x2="419.1" y2="-127" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-127" x2="419.1" y2="-129.54" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-129.54" x2="419.1" y2="-132.08" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-132.08" x2="419.1" y2="-134.62" width="0.1524" layer="91"/>
<wire x1="396.24" y1="-134.62" x2="419.1" y2="-134.62" width="0.1524" layer="91"/>
<wire x1="383.54" y1="-132.08" x2="419.1" y2="-132.08" width="0.1524" layer="91"/>
<wire x1="370.84" y1="-129.54" x2="419.1" y2="-129.54" width="0.1524" layer="91"/>
<wire x1="419.1" y1="-134.62" x2="419.1" y2="-144.78" width="0.1524" layer="91"/>
<junction x="419.1" y="-132.08"/>
<junction x="419.1" y="-129.54"/>
<junction x="419.1" y="-134.62"/>
<pinref part="K5" gate="G$1" pin="C"/>
<pinref part="K8" gate="G$1" pin="C"/>
<pinref part="K7" gate="G$1" pin="C"/>
<pinref part="K6" gate="G$1" pin="C"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="BAL0" gate="G$1" pin="1"/>
<wire x1="312.42" y1="198.12" x2="289.56" y2="198.12" width="0.1524" layer="91"/>
<label x="289.56" y="198.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BAL1" gate="G$1" pin="1"/>
<wire x1="381" y1="198.12" x2="358.14" y2="198.12" width="0.1524" layer="91"/>
<label x="358.14" y="198.12" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="335.28" y1="342.9" x2="317.5" y2="342.9" width="0.1524" layer="91"/>
<junction x="317.5" y="342.9"/>
<pinref part="GND18" gate="1" pin="GND"/>
<wire x1="317.5" y1="342.9" x2="299.72" y2="342.9" width="0.1524" layer="91"/>
<junction x="317.5" y="342.9"/>
<pinref part="C27" gate="G$1" pin="2"/>
<pinref part="C28" gate="G$1" pin="2"/>
<pinref part="C29" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="XB1" gate="G$1" pin="GND"/>
<pinref part="GND21" gate="1" pin="GND"/>
<wire x1="350.52" y1="294.64" x2="358.14" y2="294.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="358.14" y1="116.84" x2="340.36" y2="116.84" width="0.1524" layer="91"/>
<wire x1="340.36" y1="116.84" x2="322.58" y2="116.84" width="0.1524" layer="91"/>
<wire x1="322.58" y1="116.84" x2="312.42" y2="116.84" width="0.1524" layer="91"/>
<wire x1="312.42" y1="116.84" x2="304.8" y2="116.84" width="0.1524" layer="91"/>
<wire x1="304.8" y1="116.84" x2="289.56" y2="116.84" width="0.1524" layer="91"/>
<wire x1="289.56" y1="116.84" x2="289.56" y2="147.32" width="0.1524" layer="91"/>
<wire x1="340.36" y1="142.24" x2="340.36" y2="116.84" width="0.1524" layer="91"/>
<pinref part="GND23" gate="1" pin="GND"/>
<junction x="312.42" y="116.84"/>
<junction x="340.36" y="116.84"/>
<pinref part="T8" gate="G$1" pin="E"/>
<wire x1="322.58" y1="121.92" x2="322.58" y2="116.84" width="0.1524" layer="91"/>
<junction x="322.58" y="116.84"/>
<pinref part="R53" gate="G$1" pin="1"/>
<junction x="304.8" y="116.84"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="C2" gate="G$1" pin="-"/>
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="GND24" gate="1" pin="GND"/>
<wire x1="396.24" y1="109.22" x2="396.24" y2="91.44" width="0.1524" layer="91"/>
<wire x1="396.24" y1="91.44" x2="408.94" y2="91.44" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="SGND"/>
<wire x1="408.94" y1="91.44" x2="426.72" y2="91.44" width="0.1524" layer="91"/>
<wire x1="426.72" y1="91.44" x2="444.5" y2="91.44" width="0.1524" layer="91"/>
<wire x1="444.5" y1="91.44" x2="444.5" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C31" gate="G$1" pin="2"/>
<wire x1="426.72" y1="96.52" x2="426.72" y2="91.44" width="0.1524" layer="91"/>
<wire x1="444.5" y1="91.44" x2="487.68" y2="91.44" width="0.1524" layer="91"/>
<pinref part="R60" gate="G$1" pin="2"/>
<wire x1="487.68" y1="91.44" x2="487.68" y2="93.98" width="0.1524" layer="91"/>
<junction x="426.72" y="91.44"/>
<junction x="444.5" y="91.44"/>
<pinref part="C30" gate="G$1" pin="2"/>
<wire x1="408.94" y1="116.84" x2="408.94" y2="91.44" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="500.38" y1="104.14" x2="500.38" y2="91.44" width="0.1524" layer="91"/>
<wire x1="500.38" y1="91.44" x2="487.68" y2="91.44" width="0.1524" layer="91"/>
<junction x="487.68" y="91.44"/>
<junction x="408.94" y="91.44"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="CSG"/>
<wire x1="454.66" y1="111.76" x2="454.66" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="454.66" y1="109.22" x2="462.28" y2="109.22" width="0.1524" layer="91"/>
<pinref part="GND25" gate="1" pin="GND"/>
<junction x="462.28" y="109.22"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND31" gate="1" pin="GND"/>
<wire x1="444.5" y1="60.96" x2="444.5" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="421.64" y1="63.5" x2="421.64" y2="60.96" width="0.1524" layer="91"/>
<wire x1="421.64" y1="60.96" x2="444.5" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C34" gate="G$1" pin="2"/>
<wire x1="464.82" y1="63.5" x2="464.82" y2="60.96" width="0.1524" layer="91"/>
<wire x1="464.82" y1="60.96" x2="444.5" y2="60.96" width="0.1524" layer="91"/>
<junction x="444.5" y="60.96"/>
</segment>
<segment>
<pinref part="GND71" gate="1" pin="GND"/>
<pinref part="C19" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND70" gate="1" pin="GND"/>
<pinref part="C20" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND74" gate="1" pin="GND"/>
<pinref part="C23" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND13" gate="1" pin="GND"/>
<pinref part="C24" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="C25" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="GND@2"/>
<pinref part="IC6" gate="G$1" pin="GND@1"/>
<wire x1="444.5" y1="220.98" x2="447.04" y2="220.98" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@0"/>
<wire x1="449.58" y1="220.98" x2="447.04" y2="220.98" width="0.1524" layer="91"/>
<pinref part="GND29" gate="1" pin="GND"/>
<wire x1="447.04" y1="220.98" x2="447.04" y2="218.44" width="0.1524" layer="91"/>
<junction x="447.04" y="220.98"/>
<pinref part="IC6" gate="G$1" pin="/OE"/>
<wire x1="421.64" y1="228.6" x2="421.64" y2="220.98" width="0.1524" layer="91"/>
<wire x1="421.64" y1="220.98" x2="444.5" y2="220.98" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="DIR_H_TO_L"/>
<wire x1="421.64" y1="231.14" x2="421.64" y2="228.6" width="0.1524" layer="91"/>
<junction x="421.64" y="228.6"/>
<junction x="444.5" y="220.98"/>
</segment>
<segment>
<pinref part="GND27" gate="1" pin="GND"/>
<pinref part="C35" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="2"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="GND@2"/>
<pinref part="IC5" gate="G$1" pin="GND@1"/>
<wire x1="340.36" y1="220.98" x2="342.9" y2="220.98" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND@0"/>
<wire x1="345.44" y1="220.98" x2="342.9" y2="220.98" width="0.1524" layer="91"/>
<pinref part="GND34" gate="1" pin="GND"/>
<wire x1="342.9" y1="220.98" x2="342.9" y2="218.44" width="0.1524" layer="91"/>
<junction x="342.9" y="220.98"/>
<pinref part="IC5" gate="G$1" pin="/OE"/>
<wire x1="317.5" y1="228.6" x2="317.5" y2="220.98" width="0.1524" layer="91"/>
<wire x1="317.5" y1="220.98" x2="340.36" y2="220.98" width="0.1524" layer="91"/>
<junction x="340.36" y="220.98"/>
</segment>
<segment>
<pinref part="GND32" gate="1" pin="GND"/>
<pinref part="C37" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C38" gate="G$1" pin="2"/>
<pinref part="GND33" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PH1" gate="G$1" pin="LED_C"/>
<wire x1="101.6" y1="139.7" x2="101.6" y2="132.08" width="0.1524" layer="91"/>
<pinref part="PH1" gate="G$1" pin="TRANSISTOR_E"/>
<wire x1="101.6" y1="132.08" x2="114.3" y2="132.08" width="0.1524" layer="91"/>
<wire x1="114.3" y1="132.08" x2="127" y2="132.08" width="0.1524" layer="91"/>
<wire x1="127" y1="132.08" x2="127" y2="139.7" width="0.1524" layer="91"/>
<pinref part="GND73" gate="1" pin="GND"/>
<junction x="114.3" y="132.08"/>
</segment>
<segment>
<pinref part="C39" gate="G$1" pin="2"/>
<pinref part="GND64" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND8" gate="1" pin="GND"/>
<pinref part="C26" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="PH2" gate="G$1" pin="LED_C"/>
<wire x1="114.3" y1="-45.72" x2="114.3" y2="-53.34" width="0.1524" layer="91"/>
<pinref part="PH2" gate="G$1" pin="TRANSISTOR_E"/>
<wire x1="114.3" y1="-53.34" x2="127" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="127" y1="-53.34" x2="139.7" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-53.34" x2="139.7" y2="-45.72" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
<junction x="127" y="-53.34"/>
</segment>
<segment>
<pinref part="C40" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="111.76" y1="223.52" x2="111.76" y2="226.06" width="0.1524" layer="91"/>
<wire x1="111.76" y1="220.98" x2="111.76" y2="223.52" width="0.1524" layer="91"/>
<wire x1="111.76" y1="218.44" x2="111.76" y2="220.98" width="0.1524" layer="91"/>
<wire x1="111.76" y1="215.9" x2="111.76" y2="218.44" width="0.1524" layer="91"/>
<wire x1="111.76" y1="213.36" x2="111.76" y2="215.9" width="0.1524" layer="91"/>
<wire x1="111.76" y1="210.82" x2="111.76" y2="213.36" width="0.1524" layer="91"/>
<wire x1="111.76" y1="208.28" x2="111.76" y2="210.82" width="0.1524" layer="91"/>
<wire x1="111.76" y1="226.06" x2="111.76" y2="228.6" width="0.1524" layer="91"/>
<wire x1="111.76" y1="228.6" x2="114.3" y2="228.6" width="0.1524" layer="91"/>
<wire x1="114.3" y1="228.6" x2="121.92" y2="228.6" width="0.1524" layer="91"/>
<wire x1="121.92" y1="228.6" x2="129.54" y2="228.6" width="0.1524" layer="91"/>
<wire x1="129.54" y1="228.6" x2="137.16" y2="228.6" width="0.1524" layer="91"/>
<wire x1="137.16" y1="228.6" x2="144.78" y2="228.6" width="0.1524" layer="91"/>
<wire x1="144.78" y1="228.6" x2="152.4" y2="228.6" width="0.1524" layer="91"/>
<wire x1="152.4" y1="228.6" x2="160.02" y2="228.6" width="0.1524" layer="91"/>
<wire x1="160.02" y1="228.6" x2="160.02" y2="226.06" width="0.1524" layer="91"/>
<wire x1="160.02" y1="228.6" x2="167.64" y2="228.6" width="0.1524" layer="91"/>
<wire x1="167.64" y1="228.6" x2="180.34" y2="228.6" width="0.1524" layer="91"/>
<wire x1="114.3" y1="210.82" x2="114.3" y2="228.6" width="0.1524" layer="91"/>
<wire x1="121.92" y1="213.36" x2="121.92" y2="228.6" width="0.1524" layer="91"/>
<wire x1="129.54" y1="215.9" x2="129.54" y2="228.6" width="0.1524" layer="91"/>
<wire x1="137.16" y1="218.44" x2="137.16" y2="228.6" width="0.1524" layer="91"/>
<wire x1="144.78" y1="220.98" x2="144.78" y2="228.6" width="0.1524" layer="91"/>
<wire x1="152.4" y1="223.52" x2="152.4" y2="228.6" width="0.1524" layer="91"/>
<junction x="111.76" y="223.52"/>
<junction x="111.76" y="220.98"/>
<junction x="111.76" y="218.44"/>
<junction x="111.76" y="215.9"/>
<junction x="111.76" y="213.36"/>
<junction x="111.76" y="210.82"/>
<junction x="114.3" y="228.6"/>
<junction x="121.92" y="228.6"/>
<junction x="129.54" y="228.6"/>
<junction x="137.16" y="228.6"/>
<junction x="144.78" y="228.6"/>
<junction x="152.4" y="228.6"/>
<junction x="160.02" y="228.6"/>
<junction x="111.76" y="226.06"/>
<pinref part="IC2" gate="G$1" pin="VCC@1"/>
<pinref part="IC2" gate="G$1" pin="VCC@2"/>
<pinref part="IC2" gate="G$1" pin="VCC@3"/>
<pinref part="IC2" gate="G$1" pin="VCC@4"/>
<pinref part="IC2" gate="G$1" pin="VCC@5"/>
<pinref part="IC2" gate="G$1" pin="VCC@6"/>
<pinref part="IC2" gate="G$1" pin="VCC@7"/>
<pinref part="IC2" gate="G$1" pin="VCC@8"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="C11" gate="G$1" pin="1"/>
<pinref part="C12" gate="G$1" pin="1"/>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="C14" gate="G$1" pin="1"/>
<pinref part="C15" gate="G$1" pin="1"/>
<pinref part="C16" gate="G$1" pin="1"/>
<junction x="167.64" y="228.6"/>
</segment>
<segment>
<wire x1="142.24" y1="241.3" x2="132.08" y2="241.3" width="0.1524" layer="91"/>
<wire x1="132.08" y1="241.3" x2="121.92" y2="241.3" width="0.1524" layer="91"/>
<wire x1="121.92" y1="241.3" x2="121.92" y2="233.68" width="0.1524" layer="91"/>
<wire x1="121.92" y1="233.68" x2="111.76" y2="233.68" width="0.1524" layer="91"/>
<wire x1="111.76" y1="231.14" x2="111.76" y2="233.68" width="0.1524" layer="91"/>
<junction x="111.76" y="233.68"/>
<pinref part="+3V15" gate="G$1" pin="+3V3"/>
<pinref part="IC2" gate="G$1" pin="AVCC-A"/>
<pinref part="IC2" gate="G$1" pin="AVCC-B"/>
<pinref part="C7" gate="G$1" pin="1"/>
<junction x="132.08" y="241.3"/>
<wire x1="144.78" y1="241.3" x2="142.24" y2="241.3" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<junction x="142.24" y="241.3"/>
</segment>
<segment>
<wire x1="172.72" y1="355.6" x2="172.72" y2="342.9" width="0.1524" layer="91"/>
<wire x1="165.1" y1="345.44" x2="165.1" y2="355.6" width="0.1524" layer="91"/>
<wire x1="165.1" y1="355.6" x2="172.72" y2="355.6" width="0.1524" layer="91"/>
<junction x="172.72" y="355.6"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="R62" gate="G$1" pin="1"/>
<wire x1="147.32" y1="355.6" x2="154.94" y2="355.6" width="0.1524" layer="91"/>
<pinref part="R63" gate="G$1" pin="1"/>
<wire x1="154.94" y1="355.6" x2="165.1" y2="355.6" width="0.1524" layer="91"/>
<wire x1="154.94" y1="353.06" x2="154.94" y2="355.6" width="0.1524" layer="91"/>
<junction x="154.94" y="355.6"/>
<junction x="165.1" y="355.6"/>
</segment>
<segment>
<wire x1="236.22" y1="340.36" x2="241.3" y2="340.36" width="0.1524" layer="91"/>
<wire x1="241.3" y1="340.36" x2="241.3" y2="342.9" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="VCC"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="459.74" y1="350.52" x2="459.74" y2="347.98" width="0.1524" layer="91"/>
<wire x1="454.66" y1="345.44" x2="454.66" y2="347.98" width="0.1524" layer="91"/>
<wire x1="454.66" y1="347.98" x2="459.74" y2="347.98" width="0.1524" layer="91"/>
<wire x1="459.74" y1="347.98" x2="464.82" y2="347.98" width="0.1524" layer="91"/>
<junction x="459.74" y="347.98"/>
<pinref part="+3V24" gate="G$1" pin="+3V3"/>
<pinref part="IC1" gate="P" pin="VCC"/>
<pinref part="C6" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="299.72" y1="350.52" x2="317.5" y2="350.52" width="0.1524" layer="91"/>
<pinref part="XB1" gate="G$1" pin="VCC"/>
<wire x1="317.5" y1="350.52" x2="335.28" y2="350.52" width="0.1524" layer="91"/>
<wire x1="335.28" y1="350.52" x2="358.14" y2="350.52" width="0.1524" layer="91"/>
<wire x1="358.14" y1="350.52" x2="358.14" y2="347.98" width="0.1524" layer="91"/>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<pinref part="C27" gate="G$1" pin="1"/>
<junction x="299.72" y="350.52"/>
<pinref part="C28" gate="G$1" pin="1"/>
<junction x="317.5" y="350.52"/>
<pinref part="C29" gate="G$1" pin="1"/>
<junction x="335.28" y="350.52"/>
</segment>
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<wire x1="477.52" y1="124.46" x2="487.68" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="1"/>
<wire x1="487.68" y1="124.46" x2="487.68" y2="119.38" width="0.1524" layer="91"/>
<wire x1="487.68" y1="124.46" x2="500.38" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="500.38" y1="124.46" x2="508" y2="124.46" width="0.1524" layer="91"/>
<wire x1="500.38" y1="111.76" x2="500.38" y2="124.46" width="0.1524" layer="91"/>
<junction x="500.38" y="124.46"/>
<junction x="487.68" y="124.46"/>
<pinref part="+3V17" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+3V14" gate="G$1" pin="+3V3"/>
<pinref part="R15" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="VL@1"/>
<pinref part="IC6" gate="G$1" pin="VL@0"/>
<wire x1="439.42" y1="264.16" x2="441.96" y2="264.16" width="0.1524" layer="91"/>
<wire x1="441.96" y1="264.16" x2="441.96" y2="271.78" width="0.1524" layer="91"/>
<wire x1="441.96" y1="271.78" x2="421.64" y2="271.78" width="0.1524" layer="91"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
<junction x="441.96" y="264.16"/>
<pinref part="C35" gate="G$1" pin="1"/>
<junction x="421.64" y="271.78"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="VL@1"/>
<pinref part="IC5" gate="G$1" pin="VL@0"/>
<wire x1="335.28" y1="264.16" x2="337.82" y2="264.16" width="0.1524" layer="91"/>
<wire x1="337.82" y1="264.16" x2="337.82" y2="271.78" width="0.1524" layer="91"/>
<wire x1="337.82" y1="271.78" x2="317.5" y2="271.78" width="0.1524" layer="91"/>
<pinref part="+3V7" gate="G$1" pin="+3V3"/>
<junction x="337.82" y="264.16"/>
<pinref part="C37" gate="G$1" pin="1"/>
<junction x="317.5" y="271.78"/>
</segment>
<segment>
<pinref part="+3V8" gate="G$1" pin="+3V3"/>
<pinref part="IC5" gate="G$1" pin="DIR_H_TO_L"/>
<wire x1="312.42" y1="231.14" x2="317.5" y2="231.14" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C39" gate="G$1" pin="1"/>
<pinref part="+3V9" gate="G$1" pin="+3V3"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="142.24" y1="162.56" x2="127" y2="162.56" width="0.1524" layer="91"/>
<wire x1="127" y1="162.56" x2="127" y2="160.02" width="0.1524" layer="91"/>
<junction x="142.24" y="162.56"/>
</segment>
<segment>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="71.12" y1="162.56" x2="101.6" y2="162.56" width="0.1524" layer="91"/>
<wire x1="101.6" y1="162.56" x2="101.6" y2="160.02" width="0.1524" layer="91"/>
<junction x="71.12" y="162.56"/>
<pinref part="R17" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C40" gate="G$1" pin="1"/>
<pinref part="+3V11" gate="G$1" pin="+3V3"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="154.94" y1="-22.86" x2="139.7" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-22.86" x2="139.7" y2="-25.4" width="0.1524" layer="91"/>
<junction x="154.94" y="-22.86"/>
</segment>
<segment>
<pinref part="+3V10" gate="G$1" pin="+3V3"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="83.82" y1="-22.86" x2="114.3" y2="-22.86" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-22.86" x2="114.3" y2="-25.4" width="0.1524" layer="91"/>
<junction x="83.82" y="-22.86"/>
<pinref part="R18" gate="G$1" pin="2"/>
</segment>
</net>
<net name="/RESET_3V3" class="0">
<segment>
<wire x1="48.26" y1="220.98" x2="25.4" y2="220.98" width="0.1524" layer="91"/>
<label x="25.4" y="220.98" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PDI-CLK/!RESET"/>
<pinref part="R15" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="210.82" y1="335.28" x2="190.5" y2="335.28" width="0.1524" layer="91"/>
<label x="190.5" y="335.28" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="CLK"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<wire x1="27.94" y1="205.74" x2="27.94" y2="208.28" width="0.1524" layer="91"/>
<wire x1="27.94" y1="208.28" x2="27.94" y2="215.9" width="0.1524" layer="91"/>
<wire x1="27.94" y1="215.9" x2="48.26" y2="215.9" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PR0(XTAL2)"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="208.28" x2="27.94" y2="208.28" width="0.1524" layer="91"/>
<junction x="27.94" y="208.28"/>
<pinref part="C17" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<wire x1="48.26" y1="210.82" x2="38.1" y2="210.82" width="0.1524" layer="91"/>
<wire x1="38.1" y1="210.82" x2="38.1" y2="208.28" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PR1(XTAL1)"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="38.1" y1="208.28" x2="38.1" y2="205.74" width="0.1524" layer="91"/>
<wire x1="35.56" y1="208.28" x2="38.1" y2="208.28" width="0.1524" layer="91"/>
<junction x="38.1" y="208.28"/>
<pinref part="C18" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$91" class="0">
<segment>
<wire x1="309.88" y1="-154.94" x2="350.52" y2="-154.94" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="K1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$92" class="0">
<segment>
<wire x1="322.58" y1="-157.48" x2="363.22" y2="-157.48" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="K2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$93" class="0">
<segment>
<wire x1="335.28" y1="-160.02" x2="375.92" y2="-160.02" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="K3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<wire x1="347.98" y1="-162.56" x2="388.62" y2="-162.56" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="K4" gate="G$1" pin="A"/>
</segment>
</net>
<net name="PDI_DATA_3V3" class="0">
<segment>
<wire x1="48.26" y1="226.06" x2="20.32" y2="226.06" width="0.1524" layer="91"/>
<label x="20.32" y="226.06" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PDI-DATA"/>
</segment>
<segment>
<wire x1="210.82" y1="340.36" x2="190.5" y2="340.36" width="0.1524" layer="91"/>
<label x="190.5" y="340.36" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="DATA"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="490.22" y1="322.58" x2="477.52" y2="322.58" width="0.1524" layer="91"/>
<wire x1="477.52" y1="322.58" x2="477.52" y2="320.04" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="C1+"/>
<pinref part="C5" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="477.52" y1="314.96" x2="490.22" y2="314.96" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="C1-"/>
<pinref part="C5" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="485.14" y1="312.42" x2="477.52" y2="312.42" width="0.1524" layer="91"/>
<wire x1="477.52" y1="312.42" x2="477.52" y2="309.88" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="C2+"/>
<pinref part="C4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="477.52" y1="304.8" x2="485.14" y2="304.8" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="C2-"/>
<pinref part="C4" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="436.88" y1="320.04" x2="447.04" y2="320.04" width="0.1524" layer="91"/>
<wire x1="447.04" y1="320.04" x2="447.04" y2="317.5" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="V+"/>
<pinref part="C1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="444.5" y1="314.96" x2="447.04" y2="314.96" width="0.1524" layer="91"/>
<wire x1="447.04" y1="314.96" x2="447.04" y2="312.42" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="V-"/>
<pinref part="C3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="LED_EAST" class="0">
<segment>
<wire x1="279.4" y1="-157.48" x2="312.42" y2="-157.48" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<label x="279.4" y="-157.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH1(!CAS!/!RE!)"/>
<wire x1="111.76" y1="322.58" x2="132.08" y2="322.58" width="0.1524" layer="91"/>
<label x="114.3" y="322.58" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="279.4" y1="-129.54" x2="312.42" y2="-129.54" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<label x="279.4" y="-129.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="ON/OFF_SENSOR_0_3V3" class="0">
<segment>
<wire x1="35.56" y1="83.82" x2="5.08" y2="83.82" width="0.1524" layer="91"/>
<label x="5.08" y="83.82" size="1.778" layer="95"/>
<pinref part="R27" gate="G$1" pin="1"/>
<pinref part="R30" gate="G$1" pin="2"/>
<junction x="35.56" y="83.82"/>
</segment>
<segment>
<wire x1="5.08" y1="269.24" x2="48.26" y2="269.24" width="0.1524" layer="91"/>
<label x="5.08" y="269.24" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PD3(OC0D/TXD0)"/>
</segment>
</net>
<net name="IR_SENSOR_OUTPUT_0_3V3" class="0">
<segment>
<wire x1="5.08" y1="297.18" x2="48.26" y2="297.18" width="0.1524" layer="91"/>
<label x="5.08" y="297.18" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PC2(OC0C/RXD0)"/>
</segment>
</net>
<net name="MOTOR_M_0" class="0">
<segment>
<wire x1="106.68" y1="35.56" x2="83.82" y2="35.56" width="0.1524" layer="91"/>
<label x="88.9" y="35.56" size="1.778" layer="95"/>
<pinref part="T3" gate="G$1" pin="C"/>
<pinref part="MOT0" gate="-1" pin="S"/>
<pinref part="D3" gate="G$1" pin="A"/>
<wire x1="83.82" y1="35.56" x2="83.82" y2="43.18" width="0.1524" layer="91"/>
<junction x="83.82" y="35.56"/>
</segment>
</net>
<net name="N$125" class="0">
<segment>
<wire x1="66.04" y1="109.22" x2="73.66" y2="109.22" width="0.1524" layer="91"/>
<wire x1="73.66" y1="109.22" x2="83.82" y2="109.22" width="0.1524" layer="91"/>
<wire x1="83.82" y1="109.22" x2="83.82" y2="91.44" width="0.1524" layer="91"/>
<wire x1="111.76" y1="106.68" x2="111.76" y2="109.22" width="0.1524" layer="91"/>
<wire x1="83.82" y1="109.22" x2="104.14" y2="109.22" width="0.1524" layer="91"/>
<wire x1="104.14" y1="109.22" x2="111.76" y2="109.22" width="0.1524" layer="91"/>
<wire x1="66.04" y1="116.84" x2="66.04" y2="114.3" width="0.1524" layer="91"/>
<wire x1="66.04" y1="114.3" x2="66.04" y2="111.76" width="0.1524" layer="91"/>
<wire x1="66.04" y1="111.76" x2="66.04" y2="109.22" width="0.1524" layer="91"/>
<wire x1="104.14" y1="101.6" x2="104.14" y2="109.22" width="0.1524" layer="91"/>
<junction x="83.82" y="109.22"/>
<junction x="104.14" y="109.22"/>
<pinref part="IR_SENSOR0" gate="G$1" pin="3"/>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="R23" gate="G$1" pin="2"/>
<pinref part="C20" gate="G$1" pin="1"/>
<junction x="73.66" y="109.22"/>
<pinref part="T1" gate="G$1" pin="D@0"/>
<junction x="66.04" y="109.22"/>
<pinref part="T1" gate="G$1" pin="D@1"/>
<junction x="66.04" y="111.76"/>
<pinref part="T1" gate="G$1" pin="D@2"/>
<junction x="66.04" y="114.3"/>
<pinref part="T1" gate="G$1" pin="D@3"/>
</segment>
</net>
<net name="N$128" class="0">
<segment>
<wire x1="50.8" y1="99.06" x2="58.42" y2="99.06" width="0.1524" layer="91"/>
<wire x1="58.42" y1="99.06" x2="58.42" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="1"/>
<pinref part="R26" gate="G$1" pin="2"/>
<junction x="50.8" y="99.06"/>
<pinref part="T1" gate="G$1" pin="G"/>
</segment>
</net>
<net name="N$129" class="0">
<segment>
<wire x1="104.14" y1="86.36" x2="104.14" y2="91.44" width="0.1524" layer="91"/>
<wire x1="104.14" y1="91.44" x2="93.98" y2="91.44" width="0.1524" layer="91"/>
<junction x="104.14" y="91.44"/>
<pinref part="R29" gate="G$1" pin="2"/>
<pinref part="R25" gate="G$1" pin="1"/>
<pinref part="IR_SENSOR0" gate="G$1" pin="4"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="139.7" y1="274.32" x2="167.64" y2="274.32" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="RUN" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="152.4" y1="271.78" x2="180.34" y2="271.78" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="ERROR" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="165.1" y1="269.24" x2="193.04" y2="269.24" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="2"/>
<pinref part="COM" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="111.76" y1="274.32" x2="129.54" y2="274.32" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK0(A0/A8/A16)"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="111.76" y1="271.78" x2="142.24" y2="271.78" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK1(A1/A9/A17)"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="111.76" y1="269.24" x2="154.94" y2="269.24" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK2(A2/A10/A18)"/>
</segment>
</net>
<net name="LED_NORTH" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="299.72" y1="-154.94" x2="279.4" y2="-154.94" width="0.1524" layer="91"/>
<label x="279.4" y="-154.94" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH7(CLK/!CS3!/A19)"/>
<wire x1="111.76" y1="307.34" x2="132.08" y2="307.34" width="0.1524" layer="91"/>
<label x="114.3" y="307.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="299.72" y1="-127" x2="279.4" y2="-127" width="0.1524" layer="91"/>
<label x="279.4" y="-127" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_WEST" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="325.12" y1="-160.02" x2="279.4" y2="-160.02" width="0.1524" layer="91"/>
<label x="279.4" y="-160.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA0(ADCA0/AREFA)"/>
<wire x1="7.62" y1="353.06" x2="48.26" y2="353.06" width="0.1524" layer="91"/>
<label x="7.62" y="353.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R48" gate="G$1" pin="1"/>
<wire x1="325.12" y1="-132.08" x2="279.4" y2="-132.08" width="0.1524" layer="91"/>
<label x="279.4" y="-132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_SOUTH" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="337.82" y1="-162.56" x2="279.4" y2="-162.56" width="0.1524" layer="91"/>
<label x="279.4" y="-162.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PJ3(D3/A3/A11)"/>
<wire x1="111.76" y1="292.1" x2="132.08" y2="292.1" width="0.1524" layer="91"/>
<label x="114.3" y="292.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R49" gate="G$1" pin="1"/>
<wire x1="337.82" y1="-134.62" x2="279.4" y2="-134.62" width="0.1524" layer="91"/>
<label x="279.4" y="-134.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="76.2" y1="-66.04" x2="83.82" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="83.82" y1="-66.04" x2="93.98" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-66.04" x2="93.98" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-68.58" x2="121.92" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-66.04" x2="114.3" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-66.04" x2="121.92" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-58.42" x2="76.2" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-60.96" x2="76.2" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-63.5" x2="76.2" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-73.66" x2="114.3" y2="-66.04" width="0.1524" layer="91"/>
<junction x="93.98" y="-66.04"/>
<junction x="114.3" y="-66.04"/>
<pinref part="IR_SENSOR1" gate="G$1" pin="3"/>
<pinref part="R42" gate="G$1" pin="2"/>
<pinref part="R39" gate="G$1" pin="2"/>
<pinref part="C25" gate="G$1" pin="1"/>
<junction x="83.82" y="-66.04"/>
<pinref part="T4" gate="G$1" pin="D@0"/>
<junction x="76.2" y="-66.04"/>
<pinref part="T4" gate="G$1" pin="D@1"/>
<junction x="76.2" y="-63.5"/>
<pinref part="T4" gate="G$1" pin="D@2"/>
<junction x="76.2" y="-60.96"/>
<pinref part="T4" gate="G$1" pin="D@3"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="60.96" y1="-76.2" x2="68.58" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-76.2" x2="68.58" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="R40" gate="G$1" pin="2"/>
<pinref part="R46" gate="G$1" pin="1"/>
<junction x="60.96" y="-76.2"/>
<pinref part="T4" gate="G$1" pin="G"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="114.3" y1="-88.9" x2="114.3" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-83.82" x2="104.14" y2="-83.82" width="0.1524" layer="91"/>
<junction x="114.3" y="-83.82"/>
<pinref part="R41" gate="G$1" pin="2"/>
<pinref part="R42" gate="G$1" pin="1"/>
<pinref part="IR_SENSOR1" gate="G$1" pin="4"/>
</segment>
</net>
<net name="IR_SENSOR_1_OUTPUT_3V3" class="0">
<segment>
<wire x1="193.04" y1="-86.36" x2="210.82" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-86.36" x2="177.8" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-86.36" x2="193.04" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-88.9" x2="177.8" y2="-86.36" width="0.1524" layer="91"/>
<junction x="193.04" y="-86.36"/>
<junction x="177.8" y="-86.36"/>
<label x="198.12" y="-86.36" size="1.778" layer="95"/>
<pinref part="R33" gate="G$1" pin="2"/>
<pinref part="D5" gate="G$1" pin="C"/>
<pinref part="R43" gate="G$1" pin="2"/>
</segment>
</net>
<net name="ON/OFF_SENSOR_1_3V3" class="0">
<segment>
<wire x1="45.72" y1="-91.44" x2="10.16" y2="-91.44" width="0.1524" layer="91"/>
<label x="10.16" y="-91.44" size="1.778" layer="95"/>
<pinref part="R38" gate="G$1" pin="1"/>
<pinref part="R35" gate="G$1" pin="2"/>
<junction x="45.72" y="-91.44"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD4(OC1A/!SS!)"/>
<wire x1="48.26" y1="266.7" x2="5.08" y2="266.7" width="0.1524" layer="91"/>
<label x="5.08" y="266.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOTOR_PWM_1_3V3" class="0">
<segment>
<wire x1="78.74" y1="-144.78" x2="76.2" y2="-144.78" width="0.1524" layer="91"/>
<label x="53.34" y="-144.78" size="1.778" layer="95"/>
<pinref part="R45" gate="G$1" pin="1"/>
<pinref part="R37" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-144.78" x2="53.34" y2="-144.78" width="0.1524" layer="91"/>
<junction x="76.2" y="-144.78"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD1(OC0B/XCK0/SCL)"/>
<wire x1="48.26" y1="274.32" x2="5.08" y2="274.32" width="0.1524" layer="91"/>
<label x="5.08" y="274.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOTOR_M_1" class="0">
<segment>
<wire x1="116.84" y1="-139.7" x2="93.98" y2="-139.7" width="0.1524" layer="91"/>
<label x="99.06" y="-139.7" size="1.778" layer="95"/>
<pinref part="T6" gate="G$1" pin="C"/>
<pinref part="MOT1" gate="-1" pin="S"/>
<pinref part="D6" gate="G$1" pin="A"/>
<wire x1="93.98" y1="-139.7" x2="93.98" y2="-132.08" width="0.1524" layer="91"/>
<junction x="93.98" y="-139.7"/>
</segment>
</net>
<net name="IR_SENSOR_1_OUTPUT_24V" class="0">
<segment>
<wire x1="104.14" y1="-86.36" x2="121.92" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-86.36" x2="121.92" y2="-78.74" width="0.1524" layer="91"/>
<junction x="121.92" y="-86.36"/>
<label x="124.46" y="-86.36" size="1.778" layer="95"/>
<pinref part="IR_SENSOR1" gate="G$1" pin="2"/>
<pinref part="R34" gate="G$1" pin="2"/>
<wire x1="121.92" y1="-86.36" x2="162.56" y2="-86.36" width="0.1524" layer="91"/>
<pinref part="R39" gate="G$1" pin="1"/>
<pinref part="R43" gate="G$1" pin="1"/>
</segment>
</net>
<net name="MOTOR_PWM_0_3V3" class="0">
<segment>
<wire x1="68.58" y1="30.48" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<label x="43.18" y="30.48" size="1.778" layer="95"/>
<pinref part="R31" gate="G$1" pin="1"/>
<pinref part="R32" gate="G$1" pin="2"/>
<wire x1="66.04" y1="30.48" x2="43.18" y2="30.48" width="0.1524" layer="91"/>
<junction x="66.04" y="30.48"/>
</segment>
<segment>
<wire x1="5.08" y1="276.86" x2="48.26" y2="276.86" width="0.1524" layer="91"/>
<label x="5.08" y="276.86" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PD0(OC0A/SDA)"/>
</segment>
</net>
<net name="IR_SENSOR_0_OUTPUT_24V" class="0">
<segment>
<wire x1="93.98" y1="88.9" x2="111.76" y2="88.9" width="0.1524" layer="91"/>
<wire x1="111.76" y1="88.9" x2="111.76" y2="96.52" width="0.1524" layer="91"/>
<junction x="111.76" y="88.9"/>
<label x="114.3" y="88.9" size="1.778" layer="95"/>
<pinref part="IR_SENSOR0" gate="G$1" pin="2"/>
<pinref part="R28" gate="G$1" pin="2"/>
<wire x1="152.4" y1="88.9" x2="111.76" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="1"/>
<pinref part="R64" gate="G$1" pin="1"/>
</segment>
</net>
<net name="MIRROR_INDEX_0_3V3" class="0">
<segment>
<label x="139.7" y="144.78" size="1.778" layer="95"/>
<pinref part="PH1" gate="G$1" pin="TRANSISTOR_C"/>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="127" y1="149.86" x2="127" y2="144.78" width="0.1524" layer="91"/>
<wire x1="127" y1="144.78" x2="165.1" y2="144.78" width="0.1524" layer="91"/>
<junction x="127" y="144.78"/>
</segment>
<segment>
<wire x1="5.08" y1="294.64" x2="48.26" y2="294.64" width="0.1524" layer="91"/>
<label x="5.08" y="294.64" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PC3(OC0D/TXD0)"/>
</segment>
</net>
<net name="IR_SENSOR_0_OUTPUT_3V3" class="0">
<segment>
<wire x1="177.8" y1="88.9" x2="195.58" y2="88.9" width="0.1524" layer="91"/>
<wire x1="162.56" y1="88.9" x2="165.1" y2="88.9" width="0.1524" layer="91"/>
<wire x1="165.1" y1="88.9" x2="177.8" y2="88.9" width="0.1524" layer="91"/>
<wire x1="165.1" y1="86.36" x2="165.1" y2="88.9" width="0.1524" layer="91"/>
<junction x="177.8" y="88.9"/>
<junction x="165.1" y="88.9"/>
<label x="182.88" y="88.9" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="2"/>
<pinref part="D2" gate="G$1" pin="C"/>
<pinref part="R64" gate="G$1" pin="2"/>
</segment>
</net>
<net name="IR_SENSOR_OUTPUT_1_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PE2(OC0C/RXD0)"/>
<wire x1="48.26" y1="246.38" x2="5.08" y2="246.38" width="0.1524" layer="91"/>
<label x="5.08" y="246.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="MIRROR_INDEX_10_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PE3(OC0D/TXD0)"/>
<wire x1="48.26" y1="243.84" x2="5.08" y2="243.84" width="0.1524" layer="91"/>
<label x="5.08" y="243.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="309.88" y1="-127" x2="350.52" y2="-127" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="K5" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="322.58" y1="-129.54" x2="363.22" y2="-129.54" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="K6" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<wire x1="335.28" y1="-132.08" x2="375.92" y2="-132.08" width="0.1524" layer="91"/>
<pinref part="R48" gate="G$1" pin="2"/>
<pinref part="K7" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<wire x1="347.98" y1="-134.62" x2="388.62" y2="-134.62" width="0.1524" layer="91"/>
<pinref part="R49" gate="G$1" pin="2"/>
<pinref part="K8" gate="G$1" pin="A"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="5"/>
<wire x1="322.58" y1="198.12" x2="345.44" y2="198.12" width="0.1524" layer="91"/>
<label x="325.12" y="198.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BAL1" gate="G$1" pin="5"/>
<wire x1="391.16" y1="198.12" x2="414.02" y2="198.12" width="0.1524" layer="91"/>
<label x="393.7" y="198.12" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="335.28" y1="152.4" x2="340.36" y2="152.4" width="0.1524" layer="91"/>
<wire x1="340.36" y1="152.4" x2="358.14" y2="152.4" width="0.1524" layer="91"/>
<wire x1="358.14" y1="152.4" x2="358.14" y2="144.78" width="0.1524" layer="91"/>
<label x="365.76" y="152.4" size="1.778" layer="95"/>
<junction x="358.14" y="152.4"/>
<wire x1="335.28" y1="154.94" x2="335.28" y2="152.4" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="VIN"/>
<pinref part="R58" gate="G$1" pin="2"/>
<wire x1="429.26" y1="124.46" x2="434.34" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="1"/>
<wire x1="429.26" y1="124.46" x2="408.94" y2="124.46" width="0.1524" layer="91"/>
<wire x1="408.94" y1="124.46" x2="396.24" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="396.24" y1="124.46" x2="396.24" y2="116.84" width="0.1524" layer="91"/>
<wire x1="358.14" y1="152.4" x2="391.16" y2="152.4" width="0.1524" layer="91"/>
<junction x="396.24" y="124.46"/>
<junction x="429.26" y="124.46"/>
<junction x="408.94" y="124.46"/>
<wire x1="391.16" y1="152.4" x2="391.16" y2="124.46" width="0.1524" layer="91"/>
<wire x1="391.16" y1="124.46" x2="391.16" y2="71.12" width="0.1524" layer="91"/>
<wire x1="391.16" y1="71.12" x2="398.78" y2="71.12" width="0.1524" layer="91"/>
<wire x1="396.24" y1="124.46" x2="391.16" y2="124.46" width="0.1524" layer="91"/>
<junction x="391.16" y="124.46"/>
<pinref part="R59" gate="G$1" pin="1"/>
<pinref part="R13" gate="G$1" pin="2"/>
<pinref part="C2" gate="G$1" pin="+"/>
<wire x1="340.36" y1="149.86" x2="340.36" y2="152.4" width="0.1524" layer="91"/>
<junction x="340.36" y="152.4"/>
<pinref part="T9" gate="G$1" pin="D@0"/>
<junction x="335.28" y="152.4"/>
<pinref part="T9" gate="G$1" pin="D@1"/>
<pinref part="T9" gate="G$1" pin="D@3"/>
<wire x1="335.28" y1="154.94" x2="335.28" y2="157.48" width="0.1524" layer="91"/>
<junction x="335.28" y="154.94"/>
<pinref part="T9" gate="G$1" pin="D@2"/>
<junction x="335.28" y="157.48"/>
<wire x1="335.28" y1="157.48" x2="335.28" y2="160.02" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="66.04" y1="-66.04" x2="60.96" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-66.04" x2="60.96" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="P+2" gate="1" pin="+24V"/>
<pinref part="R46" gate="G$1" pin="2"/>
<junction x="60.96" y="-66.04"/>
<pinref part="T4" gate="G$1" pin="S"/>
</segment>
<segment>
<wire x1="86.36" y1="-121.92" x2="86.36" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-121.92" x2="93.98" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-121.92" x2="86.36" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="116.84" y1="-134.62" x2="116.84" y2="-121.92" width="0.1524" layer="91"/>
<pinref part="P+3" gate="1" pin="+24V"/>
<pinref part="MOT1" gate="-2" pin="S"/>
<pinref part="D6" gate="G$1" pin="C"/>
<wire x1="93.98" y1="-127" x2="93.98" y2="-121.92" width="0.1524" layer="91"/>
<junction x="93.98" y="-121.92"/>
<pinref part="C24" gate="G$1" pin="1"/>
<junction x="86.36" y="-121.92"/>
</segment>
<segment>
<wire x1="76.2" y1="53.34" x2="76.2" y2="58.42" width="0.1524" layer="91"/>
<wire x1="106.68" y1="53.34" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<wire x1="83.82" y1="53.34" x2="76.2" y2="53.34" width="0.1524" layer="91"/>
<wire x1="106.68" y1="40.64" x2="106.68" y2="53.34" width="0.1524" layer="91"/>
<pinref part="P+12" gate="1" pin="+24V"/>
<pinref part="MOT0" gate="-2" pin="S"/>
<pinref part="D3" gate="G$1" pin="C"/>
<wire x1="83.82" y1="48.26" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<junction x="83.82" y="53.34"/>
<pinref part="C23" gate="G$1" pin="1"/>
<junction x="76.2" y="53.34"/>
</segment>
<segment>
<wire x1="55.88" y1="109.22" x2="50.8" y2="109.22" width="0.1524" layer="91"/>
<wire x1="50.8" y1="109.22" x2="50.8" y2="111.76" width="0.1524" layer="91"/>
<pinref part="P+33" gate="1" pin="+24V"/>
<pinref part="R24" gate="G$1" pin="2"/>
<junction x="50.8" y="109.22"/>
<pinref part="T1" gate="G$1" pin="S"/>
</segment>
</net>
<net name="SYNC_IN_0_5V" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="7"/>
<wire x1="322.58" y1="203.2" x2="345.44" y2="203.2" width="0.1524" layer="91"/>
<label x="325.12" y="203.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VCC6"/>
<wire x1="363.22" y1="238.76" x2="381" y2="238.76" width="0.1524" layer="91"/>
<label x="365.76" y="238.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_0_RS232" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="8"/>
<wire x1="322.58" y1="205.74" x2="345.44" y2="205.74" width="0.1524" layer="91"/>
<label x="325.12" y="205.74" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="447.04" y1="294.64" x2="429.26" y2="294.64" width="0.1524" layer="91"/>
<label x="441.96" y="294.64" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="TX_0_RS232" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="4"/>
<wire x1="312.42" y1="205.74" x2="289.56" y2="205.74" width="0.1524" layer="91"/>
<label x="289.56" y="205.74" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="447.04" y1="299.72" x2="429.26" y2="299.72" width="0.1524" layer="91"/>
<label x="441.96" y="299.72" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1OUT"/>
</segment>
</net>
<net name="SYNC_OUT_0_5V" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="3"/>
<wire x1="312.42" y1="203.2" x2="289.56" y2="203.2" width="0.1524" layer="91"/>
<label x="289.56" y="203.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VCC6"/>
<wire x1="467.36" y1="238.76" x2="485.14" y2="238.76" width="0.1524" layer="91"/>
<label x="469.9" y="238.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="INT0_1_5V" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="2"/>
<wire x1="381" y1="200.66" x2="358.14" y2="200.66" width="0.1524" layer="91"/>
<label x="358.14" y="200.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R66" gate="G$1" pin="2"/>
<wire x1="487.68" y1="243.84" x2="520.7" y2="243.84" width="0.1524" layer="91"/>
<label x="508" y="243.84" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="363.22" y1="243.84" x2="383.54" y2="243.84" width="0.1524" layer="91"/>
<label x="370.84" y="243.84" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="IO_VCC4"/>
</segment>
</net>
<net name="INT0_0_5V" class="0">
<segment>
<pinref part="BAL0" gate="G$1" pin="2"/>
<wire x1="312.42" y1="200.66" x2="289.56" y2="200.66" width="0.1524" layer="91"/>
<label x="289.56" y="200.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R67" gate="G$1" pin="2"/>
<wire x1="500.38" y1="241.3" x2="520.7" y2="241.3" width="0.1524" layer="91"/>
<label x="508" y="241.3" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="363.22" y1="241.3" x2="383.54" y2="241.3" width="0.1524" layer="91"/>
<label x="370.84" y="241.3" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="IO_VCC5"/>
</segment>
</net>
<net name="INT1_1_5V" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="6"/>
<wire x1="391.16" y1="200.66" x2="414.02" y2="200.66" width="0.1524" layer="91"/>
<label x="393.7" y="200.66" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R44" gate="G$1" pin="2"/>
<wire x1="492.76" y1="248.92" x2="520.7" y2="248.92" width="0.1524" layer="91"/>
<label x="508" y="248.92" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="363.22" y1="248.92" x2="383.54" y2="248.92" width="0.1524" layer="91"/>
<label x="370.84" y="248.92" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="IO_VCC2"/>
</segment>
</net>
<net name="SYNC_OUT_1_5V" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="3"/>
<wire x1="381" y1="203.2" x2="358.14" y2="203.2" width="0.1524" layer="91"/>
<label x="358.14" y="203.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VCC7"/>
<wire x1="467.36" y1="236.22" x2="485.14" y2="236.22" width="0.1524" layer="91"/>
<label x="469.9" y="236.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="SYNC_IN_1_5V" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="7"/>
<wire x1="391.16" y1="203.2" x2="414.02" y2="203.2" width="0.1524" layer="91"/>
<label x="393.7" y="203.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VCC7"/>
<wire x1="363.22" y1="236.22" x2="381" y2="236.22" width="0.1524" layer="91"/>
<label x="365.76" y="236.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_1_RS232" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="8"/>
<wire x1="391.16" y1="205.74" x2="414.02" y2="205.74" width="0.1524" layer="91"/>
<label x="393.7" y="205.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="R2IN"/>
<wire x1="447.04" y1="292.1" x2="429.26" y2="292.1" width="0.1524" layer="91"/>
<label x="426.72" y="292.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX_1_RS232" class="0">
<segment>
<pinref part="BAL1" gate="G$1" pin="4"/>
<wire x1="381" y1="205.74" x2="358.14" y2="205.74" width="0.1524" layer="91"/>
<label x="358.14" y="205.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="T2OUT"/>
<wire x1="447.04" y1="297.18" x2="429.26" y2="297.18" width="0.1524" layer="91"/>
<label x="426.72" y="297.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_1_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="R2OUT"/>
<wire x1="477.52" y1="292.1" x2="492.76" y2="292.1" width="0.1524" layer="91"/>
<label x="480.06" y="292.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PF2(OC0C/RXD0)"/>
<wire x1="111.76" y1="345.44" x2="147.32" y2="345.44" width="0.1524" layer="91"/>
<label x="116.84" y="345.44" size="1.778" layer="95"/>
<pinref part="R62" gate="G$1" pin="2"/>
</segment>
</net>
<net name="TX_1_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="T2IN"/>
<wire x1="477.52" y1="297.18" x2="492.76" y2="297.18" width="0.1524" layer="91"/>
<label x="480.06" y="297.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PF3(OC0D/TXD0)"/>
<wire x1="111.76" y1="342.9" x2="154.94" y2="342.9" width="0.1524" layer="91"/>
<label x="116.84" y="342.9" size="1.778" layer="95"/>
<pinref part="R63" gate="G$1" pin="2"/>
</segment>
</net>
<net name="TX_0_3V3" class="0">
<segment>
<wire x1="477.52" y1="299.72" x2="492.76" y2="299.72" width="0.1524" layer="91"/>
<label x="492.76" y="299.72" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1IN"/>
</segment>
<segment>
<wire x1="111.76" y1="332.74" x2="172.72" y2="332.74" width="0.1524" layer="91"/>
<label x="129.54" y="332.74" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF7(TXD1/SCK)"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RX_0_3V3" class="0">
<segment>
<wire x1="477.52" y1="294.64" x2="492.76" y2="294.64" width="0.1524" layer="91"/>
<label x="492.76" y="294.64" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1OUT"/>
</segment>
<segment>
<wire x1="165.1" y1="335.28" x2="111.76" y2="335.28" width="0.1524" layer="91"/>
<label x="129.54" y="335.28" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF6(RXD1/MISO)"/>
<pinref part="R3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="XBEE_TX_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="DIN/!CONFIG"/>
<wire x1="358.14" y1="332.74" x2="332.74" y2="332.74" width="0.1524" layer="91"/>
<label x="332.74" y="332.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)"/>
<wire x1="48.26" y1="259.08" x2="7.62" y2="259.08" width="0.1524" layer="91"/>
<label x="7.62" y="259.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_RX_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="DOUT"/>
<wire x1="358.14" y1="330.2" x2="332.74" y2="330.2" width="0.1524" layer="91"/>
<label x="332.74" y="330.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD6(RXD1/MISO)"/>
<wire x1="7.62" y1="261.62" x2="48.26" y2="261.62" width="0.1524" layer="91"/>
<label x="7.62" y="261.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_CTS_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="!CTS!/DIO7"/>
<wire x1="358.14" y1="320.04" x2="332.74" y2="320.04" width="0.1524" layer="91"/>
<label x="332.74" y="320.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH2(!RAS!/ALE1)"/>
<wire x1="111.76" y1="320.04" x2="132.08" y2="320.04" width="0.1524" layer="91"/>
<label x="114.3" y="320.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_RTS_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="!RTS!/AD6/DIO6"/>
<wire x1="358.14" y1="317.5" x2="332.74" y2="317.5" width="0.1524" layer="91"/>
<label x="332.74" y="317.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH3(!DOM!/ALE2)"/>
<wire x1="111.76" y1="317.5" x2="132.08" y2="317.5" width="0.1524" layer="91"/>
<label x="114.3" y="317.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="D7" gate="G$1" pin="A2"/>
<pinref part="D7" gate="G$1" pin="A1"/>
<wire x1="302.26" y1="154.94" x2="302.26" y2="149.86" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="289.56" y1="149.86" x2="294.64" y2="149.86" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="294.64" y1="149.86" x2="302.26" y2="149.86" width="0.1524" layer="91"/>
<wire x1="294.64" y1="149.86" x2="294.64" y2="139.7" width="0.1524" layer="91"/>
<junction x="294.64" y="149.86"/>
<junction x="302.26" y="149.86"/>
</segment>
</net>
<net name="BATTERY_MONITOR_0-1V" class="0">
<segment>
<wire x1="358.14" y1="127" x2="358.14" y2="129.54" width="0.1524" layer="91"/>
<wire x1="358.14" y1="129.54" x2="358.14" y2="134.62" width="0.1524" layer="91"/>
<wire x1="358.14" y1="129.54" x2="381" y2="129.54" width="0.1524" layer="91"/>
<junction x="358.14" y="129.54"/>
<label x="360.68" y="129.54" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="R14" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA2(ADCA2)"/>
<wire x1="48.26" y1="347.98" x2="7.62" y2="347.98" width="0.1524" layer="91"/>
<label x="7.62" y="347.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<wire x1="322.58" y1="142.24" x2="327.66" y2="142.24" width="0.1524" layer="91"/>
<wire x1="327.66" y1="142.24" x2="327.66" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R51" gate="G$1" pin="2"/>
<pinref part="R52" gate="G$1" pin="1"/>
<junction x="322.58" y="142.24"/>
<pinref part="T9" gate="G$1" pin="G"/>
</segment>
</net>
<net name="ON/OFF_SENSOR_1_3V1" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="304.8" y1="137.16" x2="304.8" y2="127" width="0.1524" layer="91"/>
<wire x1="304.8" y1="127" x2="307.34" y2="127" width="0.1524" layer="91"/>
<pinref part="R50" gate="G$1" pin="1"/>
<pinref part="R53" gate="G$1" pin="2"/>
<junction x="304.8" y="127"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="D7" gate="G$1" pin="C"/>
<wire x1="309.88" y1="152.4" x2="322.58" y2="152.4" width="0.1524" layer="91"/>
<pinref part="R52" gate="G$1" pin="2"/>
<wire x1="322.58" y1="152.4" x2="325.12" y2="152.4" width="0.1524" layer="91"/>
<junction x="322.58" y="152.4"/>
<pinref part="T9" gate="G$1" pin="S"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="T8" gate="G$1" pin="B"/>
<pinref part="R50" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="RF" gate="G$1" pin="A"/>
<pinref part="R54" gate="G$1" pin="2"/>
<wire x1="144.78" y1="289.56" x2="177.8" y2="289.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PJ4(A8/D4/A4/A12)"/>
<pinref part="R54" gate="G$1" pin="1"/>
<wire x1="111.76" y1="289.56" x2="134.62" y2="289.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="R55" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="PJ6(A10/D6/A6/A14)"/>
<wire x1="160.02" y1="284.48" x2="111.76" y2="284.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PJ7(A11/D7/A7/A15)"/>
<pinref part="R56" gate="G$1" pin="1"/>
<wire x1="111.76" y1="281.94" x2="170.18" y2="281.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="R55" gate="G$1" pin="1"/>
<pinref part="SYNC1" gate="G$1" pin="A"/>
<wire x1="170.18" y1="284.48" x2="205.74" y2="284.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="R56" gate="G$1" pin="2"/>
<pinref part="LOW_BATT" gate="G$1" pin="A"/>
<wire x1="180.34" y1="281.94" x2="220.98" y2="281.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="SYNC0" gate="G$1" pin="A"/>
<pinref part="R57" gate="G$1" pin="1"/>
<wire x1="157.48" y1="287.02" x2="193.04" y2="287.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PJ5(A9/D5/A5/A13)"/>
<pinref part="R57" gate="G$1" pin="2"/>
<wire x1="111.76" y1="287.02" x2="147.32" y2="287.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="B"/>
<pinref part="R27" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="B"/>
<pinref part="R31" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="T5" gate="G$1" pin="B"/>
<pinref part="R38" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="T6" gate="G$1" pin="B"/>
<pinref part="R45" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SW"/>
<pinref part="D8" gate="G$1" pin="C"/>
<wire x1="462.28" y1="124.46" x2="454.66" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<junction x="462.28" y="124.46"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="462.28" y1="124.46" x2="467.36" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="CS"/>
<pinref part="D8" gate="G$1" pin="A"/>
<wire x1="462.28" y1="119.38" x2="454.66" y2="119.38" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="2"/>
<junction x="462.28" y="119.38"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="RT"/>
<pinref part="R58" gate="G$1" pin="1"/>
<wire x1="429.26" y1="114.3" x2="434.34" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SS"/>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="434.34" y1="104.14" x2="426.72" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="FB"/>
<pinref part="R60" gate="G$1" pin="1"/>
<wire x1="454.66" y1="104.14" x2="487.68" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="2"/>
<wire x1="487.68" y1="109.22" x2="487.68" y2="104.14" width="0.1524" layer="91"/>
<junction x="487.68" y="104.14"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="BST"/>
<wire x1="454.66" y1="129.54" x2="457.2" y2="129.54" width="0.1524" layer="91"/>
<wire x1="457.2" y1="129.54" x2="457.2" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="457.2" y1="132.08" x2="462.28" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="408.94" y1="71.12" x2="421.64" y2="71.12" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="VI"/>
<wire x1="421.64" y1="71.12" x2="434.34" y2="71.12" width="0.1524" layer="91"/>
<junction x="421.64" y="71.12"/>
<pinref part="R59" gate="G$1" pin="2"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="VO"/>
<pinref part="C34" gate="G$1" pin="1"/>
<wire x1="454.66" y1="71.12" x2="464.82" y2="71.12" width="0.1524" layer="91"/>
<pinref part="P+11" gate="1" pin="+5V"/>
<wire x1="464.82" y1="71.12" x2="508" y2="71.12" width="0.1524" layer="91"/>
<junction x="464.82" y="71.12"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="VCC"/>
<wire x1="447.04" y1="264.16" x2="447.04" y2="271.78" width="0.1524" layer="91"/>
<wire x1="447.04" y1="271.78" x2="467.36" y2="271.78" width="0.1524" layer="91"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<pinref part="C36" gate="G$1" pin="1"/>
<junction x="467.36" y="271.78"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="VCC"/>
<wire x1="342.9" y1="264.16" x2="342.9" y2="271.78" width="0.1524" layer="91"/>
<wire x1="342.9" y1="271.78" x2="363.22" y2="271.78" width="0.1524" layer="91"/>
<pinref part="P+5" gate="1" pin="+5V"/>
<pinref part="C38" gate="G$1" pin="1"/>
<junction x="363.22" y="271.78"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="T8" gate="G$1" pin="C"/>
<pinref part="R51" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="C"/>
<pinref part="R26" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="T5" gate="G$1" pin="C"/>
<pinref part="R40" gate="G$1" pin="1"/>
</segment>
</net>
<net name="SYNC_OUT_1_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL7"/>
<wire x1="421.64" y1="236.22" x2="396.24" y2="236.22" width="0.1524" layer="91"/>
<label x="396.24" y="236.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="SYNC_OUT_0_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL6"/>
<wire x1="421.64" y1="238.76" x2="396.24" y2="238.76" width="0.1524" layer="91"/>
<label x="396.24" y="238.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="INT0_0_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL5"/>
<wire x1="421.64" y1="241.3" x2="401.32" y2="241.3" width="0.1524" layer="91"/>
<label x="401.32" y="241.3" size="1.778" layer="95"/>
</segment>
<segment>
<label x="279.4" y="241.3" size="1.778" layer="95"/>
<pinref part="R71" gate="G$1" pin="1"/>
<wire x1="304.8" y1="241.3" x2="279.4" y2="241.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INT0_1_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL4"/>
<wire x1="421.64" y1="243.84" x2="401.32" y2="243.84" width="0.1524" layer="91"/>
<label x="401.32" y="243.84" size="1.778" layer="95"/>
</segment>
<segment>
<label x="279.4" y="243.84" size="1.778" layer="95"/>
<pinref part="R70" gate="G$1" pin="1"/>
<wire x1="297.18" y1="243.84" x2="279.4" y2="243.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INT1_0_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL3"/>
<wire x1="421.64" y1="246.38" x2="401.32" y2="246.38" width="0.1524" layer="91"/>
<label x="401.32" y="246.38" size="1.778" layer="95"/>
</segment>
<segment>
<label x="279.4" y="246.38" size="1.778" layer="95"/>
<pinref part="R69" gate="G$1" pin="1"/>
<wire x1="304.8" y1="246.38" x2="279.4" y2="246.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INT1_1_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL2"/>
<wire x1="421.64" y1="248.92" x2="401.32" y2="248.92" width="0.1524" layer="91"/>
<label x="401.32" y="248.92" size="1.778" layer="95"/>
</segment>
<segment>
<label x="279.4" y="248.92" size="1.778" layer="95"/>
<pinref part="R68" gate="G$1" pin="1"/>
<wire x1="297.18" y1="248.92" x2="279.4" y2="248.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$47" class="0">
<segment>
<pinref part="R44" gate="G$1" pin="1"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC2"/>
<wire x1="482.6" y1="248.92" x2="467.36" y2="248.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INT1_0_5V" class="0">
<segment>
<pinref part="R65" gate="G$1" pin="2"/>
<wire x1="480.06" y1="246.38" x2="520.7" y2="246.38" width="0.1524" layer="91"/>
<label x="508" y="246.38" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BAL0" gate="G$1" pin="6"/>
<wire x1="322.58" y1="200.66" x2="345.44" y2="200.66" width="0.1524" layer="91"/>
<label x="325.12" y="200.66" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="363.22" y1="246.38" x2="383.54" y2="246.38" width="0.1524" layer="91"/>
<label x="370.84" y="246.38" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="IO_VCC3"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VCC3"/>
<pinref part="R65" gate="G$1" pin="1"/>
<wire x1="469.9" y1="246.38" x2="467.36" y2="246.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$54" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VCC5"/>
<pinref part="R67" gate="G$1" pin="1"/>
<wire x1="490.22" y1="241.3" x2="467.36" y2="241.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VCC4"/>
<pinref part="R66" gate="G$1" pin="1"/>
<wire x1="477.52" y1="243.84" x2="467.36" y2="243.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SYNC_IN_0_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL6"/>
<wire x1="317.5" y1="238.76" x2="281.94" y2="238.76" width="0.1524" layer="91"/>
<label x="281.94" y="238.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="SYNC_IN_1_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL7"/>
<wire x1="317.5" y1="236.22" x2="281.94" y2="236.22" width="0.1524" layer="91"/>
<label x="281.94" y="236.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL2"/>
<wire x1="317.5" y1="248.92" x2="307.34" y2="248.92" width="0.1524" layer="91"/>
<pinref part="R68" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL4"/>
<wire x1="317.5" y1="243.84" x2="307.34" y2="243.84" width="0.1524" layer="91"/>
<pinref part="R70" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL3"/>
<wire x1="317.5" y1="246.38" x2="314.96" y2="246.38" width="0.1524" layer="91"/>
<pinref part="R69" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="IO_VL5"/>
<wire x1="317.5" y1="241.3" x2="314.96" y2="241.3" width="0.1524" layer="91"/>
<pinref part="R71" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="PH1" gate="G$1" pin="LED_A"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="101.6" y1="149.86" x2="101.6" y2="144.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="PH2" gate="G$1" pin="LED_A"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="114.3" y1="-35.56" x2="114.3" y2="-40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MIRROR_INDEX_1_3V3" class="0">
<segment>
<label x="152.4" y="-40.64" size="1.778" layer="95"/>
<pinref part="PH2" gate="G$1" pin="TRANSISTOR_C"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="139.7" y1="-35.56" x2="139.7" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-40.64" x2="177.8" y2="-40.64" width="0.1524" layer="91"/>
<junction x="139.7" y="-40.64"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

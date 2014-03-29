<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
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
<package name="PANASONIC_F">
<description>&lt;b&gt;Panasonic Aluminium Electrolytic Capacitor VS-Serie Package F&lt;/b&gt;</description>
<wire x1="-4.1" y1="4.1" x2="1.8" y2="4.1" width="0.1016" layer="51"/>
<wire x1="1.8" y1="4.1" x2="4.1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="4.1" y1="1.8" x2="4.1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="4.1" y1="-1.8" x2="1.8" y2="-4.1" width="0.1016" layer="51"/>
<wire x1="1.8" y1="-4.1" x2="-4.1" y2="-4.1" width="0.1016" layer="51"/>
<wire x1="-4.1" y1="-4.1" x2="-4.1" y2="4.1" width="0.1016" layer="51"/>
<wire x1="-4.1" y1="1" x2="-4.1" y2="4.1" width="0.1016" layer="21"/>
<wire x1="-4.1" y1="4.1" x2="1.8" y2="4.1" width="0.1016" layer="21"/>
<wire x1="1.8" y1="4.1" x2="4.1" y2="1.8" width="0.1016" layer="21"/>
<wire x1="4.1" y1="1.8" x2="4.1" y2="1" width="0.1016" layer="21"/>
<wire x1="4.1" y1="-1" x2="4.1" y2="-1.8" width="0.1016" layer="21"/>
<wire x1="4.1" y1="-1.8" x2="1.8" y2="-4.1" width="0.1016" layer="21"/>
<wire x1="1.8" y1="-4.1" x2="-4.1" y2="-4.1" width="0.1016" layer="21"/>
<wire x1="-4.1" y1="-4.1" x2="-4.1" y2="-1" width="0.1016" layer="21"/>
<wire x1="-2.2" y1="3.25" x2="-2.2" y2="-3.25" width="0.1016" layer="51"/>
<wire x1="-3.85" y1="0.9" x2="3.85" y2="0.9" width="0.1016" layer="21" curve="-153.684915"/>
<wire x1="-3.85" y1="-0.9" x2="3.85" y2="-0.9" width="0.1016" layer="21" curve="153.684915"/>
<circle x="0" y="0" radius="4" width="0.001" layer="51"/>
<circle x="0" y="0" radius="3.95" width="0.1016" layer="51"/>
<smd name="-" x="-3.55" y="0" dx="4" dy="1.6" layer="1"/>
<smd name="+" x="3.55" y="0" dx="4" dy="1.6" layer="1"/>
<text x="-1.75" y="1.3" size="1.016" layer="25">&gt;NAME</text>
<text x="-1.75" y="-2.375" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-4.85" y1="-0.45" x2="-3.9" y2="0.45" layer="51"/>
<rectangle x1="3.9" y1="-0.45" x2="4.85" y2="0.45" layer="51"/>
<polygon width="0.1016" layer="51">
<vertex x="-2.25" y="3.2"/>
<vertex x="-3" y="2.5"/>
<vertex x="-3.6" y="1.5"/>
<vertex x="-3.85" y="0.65"/>
<vertex x="-3.85" y="-0.65"/>
<vertex x="-3.55" y="-1.6"/>
<vertex x="-2.95" y="-2.55"/>
<vertex x="-2.25" y="-3.2"/>
<vertex x="-2.25" y="3.15"/>
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
<attribute name="MOUSER" value="81-GRM188F51H104ZA01" constant="no"/>
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
<attribute name="MOUSER" value="81-GRM40Y104Z50D" constant="no"/>
<attribute name="RS" value="220-7966 " constant="no"/>
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
<attribute name="MOUSER" value="581-06031A150K4T2A " constant="no"/>
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
<attribute name="MOUSER" value="" constant="no"/>
<attribute name="VALUE" value="15pF_0603_100V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
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
<attribute name="MOUSER" value="963-GMK325BJ106MN-T" constant="no"/>
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
<attribute name="MOUSER" value="963-TMK316BJ106KL-T" constant="no"/>
<attribute name="RS" value="766-1185 " constant="no"/>
<attribute name="VALUE" value="10µF 25V" constant="no"/>
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
<attribute name="MOUSER" value="81-GCM188R71H103KA7D" constant="no"/>
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
<deviceset name="220UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_POL_" x="0" y="-2.54"/>
</gates>
<devices>
<device name="F_35V" package="PANASONIC_F">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="667-EEE-FP1V221AP" constant="no"/>
<attribute name="RS" value="568-828" constant="no"/>
<attribute name="VALUE" value="220µF 35V" constant="no"/>
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
<symbol name="DIODE">
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.397" y1="1.905" x2="1.397" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.3114" y="2.6416" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.5654" y="-4.4958" size="1.778" layer="96">&gt;VALUE</text>
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
<attribute name="MOUSER" value="859-LTST-C171GKT" constant="no"/>
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
<attribute name="MOUSER" value="859-LTST-C170YKT" constant="no"/>
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
<attribute name="MOUSER" value="859-LTST-C171EKT" constant="no"/>
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
<attribute name="MOUSER" value="859-LTST-C171TBKT" constant="no"/>
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
<attribute name="MOUSER" value="844-50WQ03FNPBF" constant="no"/>
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
<attribute name="MOUSER" value="621-B160-F" constant="no"/>
<attribute name="RS" value="738-4765" constant="no"/>
<attribute name="VALUE" value="B160-13F" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MBRA340T3" prefix="D">
<description>&lt;b&gt;Surface Mount Schottky Power Rectifier&lt;/b&gt;&lt;p&gt;
Source: http://www.onsemi.com/pub_link/Collateral/MBRA340T3-D.PDF</description>
<gates>
<gate name="G$1" symbol="DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SMA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="863-MBRA340T3G" constant="no"/>
<attribute name="RS" value="688-0502" constant="no"/>
<attribute name="VALUE" value="MBRA340T3" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0603J-270-E3" constant="no"/>
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
<attribute name="MOUSER" value="652-CR0805-FX2700GLF" constant="no"/>
<attribute name="RS" value="740-9019" constant="no"/>
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
<attribute name="MOUSER" value="667-ERA-3AEB3091V" constant="no"/>
<attribute name="RS" value="708-7574" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0603-1.0K-E3" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0805-1.0K-E3" constant="no"/>
<attribute name="RS" value=" 223-0427" constant="no"/>
<attribute name="VALUE" value="1k" constant="no"/>
</technology>
</technologies>
</device>
<device name="-A" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="279-35201K0JT" constant="no"/>
<attribute name="RS" value="224-0395" constant="no"/>
<attribute name="VALUE" value="1k 1W" constant="no"/>
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
<attribute name="MOUSER" value="652-CR0603-JW-472GLF" constant="no"/>
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
<attribute name="MOUSER" value="279-CRG0805F4K7" constant="no"/>
<attribute name="RS" value="223-0528" constant="no"/>
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
<attribute name="MOUSER" value="652-CR0603-JW-103ELF" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW080510K0FKEB" constant="no"/>
<attribute name="RS" value=" 740-9072" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="6K8" prefix="R">
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
<attribute name="MOUSER" value="652-CR0603-JW-682GLF" constant="no"/>
<attribute name="RS" value="740-8969" constant="no"/>
<attribute name="VALUE" value="6k8" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0805-6.8K-E3" constant="no"/>
<attribute name="RS" value="679-1651" constant="no"/>
<attribute name="VALUE" value="6k8" constant="no"/>
</technology>
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
<package name="TO263">
<smd name="4" x="0" y="1.85" dx="10.8" dy="9" layer="1"/>
<smd name="1" x="-2.54" y="-8.15" dx="2.5" dy="1.1" layer="1" rot="R90"/>
<smd name="2" x="0" y="-8.15" dx="2.5" dy="1.1" layer="1" rot="R90"/>
<smd name="3" x="2.54" y="-8.15" dx="2.5" dy="1.1" layer="1" rot="R90"/>
<text x="0" y="6.35" size="1.27" layer="25">&gt;NAME</text>
<text x="7.62" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
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
<package name="SOT23-6">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt; 6 lead</description>
<wire x1="1.422" y1="-0.781" x2="-1.423" y2="-0.781" width="0.1524" layer="51"/>
<wire x1="-1.423" y1="-0.781" x2="-1.423" y2="0.781" width="0.1524" layer="21"/>
<wire x1="-1.423" y1="0.781" x2="1.422" y2="0.781" width="0.1524" layer="51"/>
<wire x1="1.422" y1="0.781" x2="1.422" y2="-0.781" width="0.1524" layer="21"/>
<circle x="-1.15" y="-0.5" radius="0.1" width="0" layer="21"/>
<smd name="1" x="-0.95" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="2" x="0" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="3" x="0.95" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="4" x="0.95" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="5" x="0" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="6" x="-0.95" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<text x="-1.397" y="-2.872" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.397" y="1.802" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="-1.2" y1="-1.4" x2="-0.7" y2="-0.8" layer="51"/>
<rectangle x1="-0.25" y1="-1.4" x2="0.25" y2="-0.8" layer="51"/>
<rectangle x1="0.7" y1="-1.4" x2="1.2" y2="-0.8" layer="51"/>
<rectangle x1="0.7" y1="0.8" x2="1.2" y2="1.4" layer="51"/>
<rectangle x1="-0.25" y1="0.8" x2="0.25" y2="1.4" layer="51"/>
<rectangle x1="-1.2" y1="0.8" x2="-0.7" y2="1.4" layer="51"/>
</package>
<package name="482A">
<wire x1="5.4102" y1="5.4102" x2="5.4102" y2="-5.4102" width="0.2032" layer="21"/>
<wire x1="5.4102" y1="-5.4102" x2="-3.81" y2="-5.4102" width="0.2032" layer="21"/>
<wire x1="-3.81" y1="-5.4102" x2="-5.4102" y2="-3.81" width="0.2032" layer="21"/>
<wire x1="-5.4102" y1="-3.81" x2="-5.4102" y2="5.4102" width="0.2032" layer="21"/>
<wire x1="-5.4102" y1="5.4102" x2="5.4102" y2="5.4102" width="0.2032" layer="21"/>
<circle x="-5.842" y="-6.35" radius="0.254" width="0.381" layer="21"/>
<smd name="2" x="-1.27" y="-9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="7" x="-1.27" y="9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="1" x="-3.81" y="-9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="3" x="1.27" y="-9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="4" x="3.81" y="-9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="8" x="-3.81" y="9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="6" x="1.27" y="9.382" dx="1.524" dy="4.54" layer="1"/>
<smd name="5" x="3.81" y="9.382" dx="1.524" dy="4.54" layer="1"/>
<text x="-5.715" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.985" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<circle x="0" y="0" radius="5.6896" width="0.127" layer="21"/>
<circle x="0" y="0" radius="1.6002" width="0.127" layer="21"/>
</package>
<package name="SOT23">
<description>&lt;b&gt;SOT-23&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="TO263-5">
<description>&lt;b&gt;TO-263&lt;/b&gt;</description>
<wire x1="5.094" y1="7.165" x2="5.094" y2="-2.88" width="0.2032" layer="51"/>
<wire x1="5.094" y1="-2.88" x2="-5.094" y2="-2.88" width="0.2032" layer="21"/>
<wire x1="-5.094" y1="-2.88" x2="-5.094" y2="7.165" width="0.2032" layer="51"/>
<wire x1="-5.094" y1="7.165" x2="5.094" y2="7.165" width="0.2032" layer="51"/>
<wire x1="-5.105" y1="7.267" x2="-5.105" y2="7.678" width="0.2032" layer="51"/>
<wire x1="-5.105" y1="7.678" x2="-3.378" y2="8.135" width="0.2032" layer="51"/>
<wire x1="-3.378" y1="8.135" x2="3.378" y2="8.135" width="0.2032" layer="51"/>
<wire x1="3.378" y1="8.135" x2="5.105" y2="7.678" width="0.2032" layer="51"/>
<wire x1="5.105" y1="7.678" x2="5.105" y2="7.267" width="0.2032" layer="51"/>
<wire x1="5.105" y1="7.267" x2="-5.105" y2="7.267" width="0.2032" layer="51"/>
<smd name="6" x="0" y="2.54" dx="10.8" dy="10.41" layer="1"/>
<smd name="1" x="-3.4036" y="-5.7912" dx="1.0668" dy="2.159" layer="1"/>
<smd name="2" x="-1.7018" y="-5.7912" dx="1.0668" dy="2.159" layer="1"/>
<smd name="3" x="0" y="-5.7912" dx="1.0668" dy="2.159" layer="1"/>
<smd name="4" x="1.7018" y="-5.7912" dx="1.0668" dy="2.159" layer="1"/>
<smd name="5" x="3.4036" y="-5.7912" dx="1.0668" dy="2.159" layer="1"/>
<text x="-5.588" y="-5.588" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.858" y="-5.588" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-3.8862" y1="-6.604" x2="-2.921" y2="-4.445" layer="51"/>
<rectangle x1="-3.8862" y1="-4.4704" x2="-2.921" y2="-2.794" layer="21"/>
<rectangle x1="-2.1844" y1="-6.604" x2="-1.2192" y2="-4.445" layer="51"/>
<rectangle x1="-0.4826" y1="-6.604" x2="0.4826" y2="-4.445" layer="51"/>
<rectangle x1="1.2192" y1="-6.604" x2="2.1844" y2="-4.445" layer="51"/>
<rectangle x1="2.921" y1="-6.604" x2="3.8862" y2="-4.445" layer="51"/>
<rectangle x1="-2.1844" y1="-4.4704" x2="-1.2192" y2="-2.794" layer="21"/>
<rectangle x1="-0.4826" y1="-4.4704" x2="0.4826" y2="-2.794" layer="21"/>
<rectangle x1="1.2192" y1="-4.4704" x2="2.1844" y2="-2.794" layer="21"/>
<rectangle x1="2.921" y1="-4.4704" x2="3.8862" y2="-2.794" layer="21"/>
<polygon width="0.2032" layer="51">
<vertex x="-5.1054" y="7.267"/>
<vertex x="-5.1054" y="7.6782"/>
<vertex x="-3.3782" y="8.1354"/>
<vertex x="3.3782" y="8.1354"/>
<vertex x="5.1054" y="7.6782"/>
<vertex x="5.1054" y="7.267"/>
</polygon>
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
<symbol name="LM1086">
<wire x1="-7.62" y1="5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VIN" x="-10.16" y="2.54" length="short"/>
<pin name="VOUT@0" x="12.7" y="2.54" length="short" rot="R180"/>
<pin name="VOUT@1" x="12.7" y="0" length="short" rot="R180"/>
<pin name="GND" x="-2.54" y="-10.16" length="short" rot="R90"/>
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
<symbol name="74LVC1T45">
<wire x1="-10.16" y1="12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<text x="5.08" y="13.97" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="-17.78" length="middle" direction="pwr" rot="R90"/>
<pin name="VCCB" x="2.54" y="17.78" length="middle" direction="pwr" rot="R270"/>
<pin name="A" x="-15.24" y="2.54" length="middle" swaplevel="1"/>
<pin name="B" x="15.24" y="2.54" length="middle" swaplevel="1" rot="R180"/>
<pin name="DIR_A_TO_B" x="-15.24" y="-2.54" length="middle"/>
<pin name="VCCA" x="-2.54" y="17.78" length="middle" direction="pwr" rot="R270"/>
</symbol>
<symbol name="MPXV5100">
<wire x1="-12.7" y1="10.16" x2="10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-12.7" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="10.16" x2="-12.7" y2="-10.16" width="0.4064" layer="94"/>
<text x="-2.54" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCC" x="-7.62" y="15.24" length="middle" rot="R270"/>
<pin name="GND" x="-7.62" y="-15.24" length="middle" direction="in" swaplevel="1" rot="R90"/>
<pin name="PRESSURE_VOUT" x="15.24" y="0" length="middle" direction="in" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="N-MOS">
<wire x1="-1.016" y1="2.54" x2="-1.016" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="2.159" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-2.159" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.159" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0.381" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="3.302" y1="0.508" x2="3.81" y2="0.508" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.508" x2="4.318" y2="0.508" width="0.1524" layer="94"/>
<wire x1="3.81" y1="2.159" x2="2.54" y2="2.159" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.159" x2="0.5334" y2="2.159" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.508" x2="3.81" y2="2.159" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-2.159" x2="3.81" y2="-0.127" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-2.159" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<circle x="2.54" y="2.159" radius="0.127" width="0.4064" layer="94"/>
<circle x="2.54" y="-2.159" radius="0.127" width="0.4064" layer="94"/>
<text x="6.35" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="6.35" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.397" y="3.556" size="0.8128" layer="93">D</text>
<text x="1.397" y="-4.318" size="0.8128" layer="93">S</text>
<text x="-2.286" y="-1.778" size="0.8128" layer="93">G</text>
<rectangle x1="-0.254" y1="-2.794" x2="0.508" y2="-1.27" layer="94"/>
<rectangle x1="-0.254" y1="1.27" x2="0.508" y2="2.794" layer="94"/>
<rectangle x1="-0.254" y1="-0.889" x2="0.508" y2="0.889" layer="94"/>
<pin name="G" x="-2.54" y="-2.54" visible="off" length="point" direction="pas"/>
<pin name="S" x="2.54" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="D" x="2.54" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="3.81" y="0.508"/>
<vertex x="3.302" y="-0.254"/>
<vertex x="4.318" y="-0.254"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="0.635" y="0"/>
<vertex x="1.905" y="-0.508"/>
<vertex x="1.905" y="0.508"/>
</polygon>
</symbol>
<symbol name="LM2596">
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="6.35" size="1.778" layer="96">&gt;VALUE</text>
<text x="0" y="-6.35" size="1.4224" layer="95">GND</text>
<pin name="IN" x="-10.16" y="2.54" length="short" direction="in"/>
<pin name="OUT" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
<pin name="GND" x="0" y="-10.16" visible="pad" length="short" direction="pwr" rot="R90"/>
<pin name="FB" x="10.16" y="-2.54" length="short" direction="in" rot="R180"/>
<pin name="EN" x="-10.16" y="-2.54" length="short" direction="in"/>
<pin name="GND@1" x="2.54" y="-10.16" visible="pad" length="short" direction="pwr" rot="R90"/>
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
<technology name="">
<attribute name="VALUE" value="25 MHz" constant="no"/>
</technology>
</technologies>
</device>
<device name="16MHZ_HC49UP" package="HC49UP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="559-FOXSD160-20-LF" constant="no"/>
<attribute name="RS" value=" 547-6531" constant="no"/>
<attribute name="VALUE" value="16 MHz" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM1086CS-3.3" prefix="IC">
<gates>
<gate name="G$1" symbol="LM1086" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO263">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VIN" pad="3"/>
<connect gate="G$1" pin="VOUT@0" pad="2"/>
<connect gate="G$1" pin="VOUT@1" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="926-LM1086CS-3.3NOPB " constant="no"/>
<attribute name="RS" value="533-9426" constant="no"/>
<attribute name="VALUE" value="LM1086CS-3.3" constant="no"/>
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
<attribute name="MOUSER" value="511-ST3232CDR" constant="no"/>
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
<technology name="E">
<attribute name="MOUSER" value="511-ST3232CDR" constant="no"/>
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74LVC1T45" prefix="IC">
<gates>
<gate name="G$1" symbol="74LVC1T45" x="0" y="0"/>
</gates>
<devices>
<device name="DBV" package="SOT23-6">
<connects>
<connect gate="G$1" pin="A" pad="3"/>
<connect gate="G$1" pin="B" pad="4"/>
<connect gate="G$1" pin="DIR_A_TO_B" pad="5"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VCCA" pad="1"/>
<connect gate="G$1" pin="VCCB" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="595-SN74LVC1T45DBVT" constant="no"/>
<attribute name="RS" value=" 662-8825" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MPXV5100GC6U" prefix="IC">
<gates>
<gate name="G$1" symbol="MPXV5100" x="0" y="0"/>
</gates>
<devices>
<device name="" package="482A">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="PRESSURE_VOUT" pad="4"/>
<connect gate="G$1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="FN" value="1608911" constant="no"/>
<attribute name="MOUSER" value="841-MPXV5100GC6U " constant="no"/>
<attribute name="VALUE" value="MPXV5100GC6U" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NTR4503NT1G" prefix="T" uservalue="yes">
<gates>
<gate name="G$1" symbol="N-MOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="863-NTR4503NT1G" constant="no"/>
<attribute name="RS" value=" 780-4751" constant="no"/>
<attribute name="VALUE" value="NTR4503NT1G" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM2596S" prefix="IC" uservalue="yes">
<description>&lt;b&gt;STEP-DOWN VOLTAGE REGULATOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="LM2596" x="0" y="0"/>
</gates>
<devices>
<device name="-3.3" package="TO263-5">
<connects>
<connect gate="G$1" pin="EN" pad="5"/>
<connect gate="G$1" pin="FB" pad="4"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND@1" pad="6"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="LM2596S-3.3" constant="no"/>
</technology>
</technologies>
</device>
<device name="-5" package="TO263-5">
<connects>
<connect gate="G$1" pin="EN" pad="5"/>
<connect gate="G$1" pin="FB" pad="4"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND@1" pad="6"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="LM2596S-5" constant="no"/>
</technology>
</technologies>
</device>
<device name="-ADJ" package="TO263-5">
<connects>
<connect gate="G$1" pin="EN" pad="5"/>
<connect gate="G$1" pin="FB" pad="4"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND@1" pad="6"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1469194" constant="no"/>
<attribute name="MOUSER" value="926-LM2596SX-ADJNOPB" constant="no"/>
<attribute name="RS" value="533-3715" constant="no"/>
<attribute name="VALUE" value="LM2596S-ADJ" constant="no"/>
</technology>
</technologies>
</device>
<device name="-12" package="TO263-5">
<connects>
<connect gate="G$1" pin="EN" pad="5"/>
<connect gate="G$1" pin="FB" pad="4"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND@1" pad="6"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="LM2596S-12" constant="no"/>
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
<device name="APW" package="TSSOP24">
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
<technology name="">
<attribute name="MOUSER" value="771-74LVC4245APW-T" constant="no"/>
<attribute name="RS" value="380-0500" constant="no"/>
<attribute name="VALUE" value="74LVC4245APW" constant="no"/>
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
<package name="MICROMATCH-4_SMD">
<wire x1="-3.56" y1="0.7" x2="-3.96" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="0.7" x2="-3.96" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="-0.7" x2="-3.56" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-3.56" y1="-1.2" x2="-3.96" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="-1.2" x2="-3.96" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="-1.6" x2="-3.56" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-3.56" y1="1.6" x2="-3.96" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="1.6" x2="-3.96" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-3.96" y1="1.2" x2="-3.56" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-3.46" y1="2.4" x2="-3.46" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-2.88" y1="2" x2="-2.88" y2="-2" width="0.2032" layer="21"/>
<wire x1="3.46" y1="1" x2="2.88" y2="1" width="0.2032" layer="21"/>
<wire x1="2.88" y1="-0.33" x2="3.46" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="3.46" y1="-2.4" x2="3.46" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="3.46" y1="1" x2="3.46" y2="2.4" width="0.2032" layer="21"/>
<wire x1="2.88" y1="2" x2="1.88" y2="2" width="0.2032" layer="21"/>
<wire x1="-2.78" y1="2" x2="-2.88" y2="2" width="0.2032" layer="21"/>
<wire x1="3.46" y1="2.4" x2="1.88" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-2.78" y1="2.4" x2="-3.46" y2="2.4" width="0.2032" layer="21"/>
<wire x1="3.46" y1="-2.4" x2="2.78" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-1.88" y1="-2.4" x2="-3.46" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="2.88" y1="-2" x2="2.88" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="2.88" y1="1" x2="2.88" y2="2" width="0.2032" layer="21"/>
<wire x1="2.88" y1="-2" x2="2.78" y2="-2" width="0.2032" layer="21"/>
<wire x1="-1.88" y1="-2" x2="-2.88" y2="-2" width="0.2032" layer="21"/>
<smd name="2" x="0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="-1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="1" x="1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="-0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-2.54" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
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
<package name="MICROMATCH-8_SMD">
<wire x1="-6.1" y1="-0.7" x2="-6.5" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-0.7" x2="-6.5" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="0.7" x2="-6.1" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-6.1" y1="1.2" x2="-6.5" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="1.2" x2="-6.5" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="1.6" x2="-6.1" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-6.1" y1="-1.6" x2="-6.5" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-1.6" x2="-6.5" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-1.2" x2="-6.1" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-6" y1="-2.4" x2="-6" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-5.42" y1="-2" x2="-5.42" y2="2" width="0.2032" layer="21"/>
<wire x1="6" y1="-1" x2="5.42" y2="-1" width="0.2032" layer="21"/>
<wire x1="5.42" y1="0.33" x2="6" y2="0.33" width="0.2032" layer="21"/>
<wire x1="6" y1="2.4" x2="6" y2="0.33" width="0.2032" layer="21"/>
<wire x1="6" y1="-1" x2="6" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="5.42" y1="-2" x2="5.32" y2="-2" width="0.2032" layer="21"/>
<wire x1="-4.42" y1="-2" x2="-5.42" y2="-2" width="0.2032" layer="21"/>
<wire x1="6" y1="-2.4" x2="5.32" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-4.42" y1="-2.4" x2="-6" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="6" y1="2.4" x2="4.42" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-5.32" y1="2.4" x2="-6" y2="2.4" width="0.2032" layer="21"/>
<wire x1="5.42" y1="2" x2="5.42" y2="0.33" width="0.2032" layer="21"/>
<wire x1="5.42" y1="-1" x2="5.42" y2="-2" width="0.2032" layer="21"/>
<wire x1="5.42" y1="2" x2="4.42" y2="2" width="0.2032" layer="21"/>
<wire x1="-5.32" y1="2" x2="-5.42" y2="2" width="0.2032" layer="21"/>
<smd name="1" x="4.445" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="5" x="-0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="7" x="-3.175" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="2" x="3.175" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="6" x="-1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="8" x="-4.445" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-5.08" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.445" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MICROMATCH-16_SMD">
<description>&lt;b&gt;MicroMaTch 16 &lt;/b&gt; 8-215464-6 / 1-215464-6&lt;p&gt;
Drawing Number C-215464&lt;br&gt;
DDEController.pdf</description>
<wire x1="-11.18" y1="0.7" x2="-11.58" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="0.7" x2="-11.58" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="-0.7" x2="-11.18" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-11.18" y1="-1.2" x2="-11.58" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="-1.2" x2="-11.58" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="-1.6" x2="-11.18" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-11.18" y1="1.6" x2="-11.58" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="1.6" x2="-11.58" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-11.58" y1="1.2" x2="-11.18" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-11.08" y1="2.4" x2="-11.08" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-10.5" y1="2" x2="-10.5" y2="-2" width="0.2032" layer="21"/>
<wire x1="11.08" y1="1" x2="10.5" y2="1" width="0.2032" layer="21"/>
<wire x1="10.5" y1="-0.33" x2="11.08" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="11.08" y1="-2.4" x2="11.08" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="11.08" y1="1" x2="11.08" y2="2.4" width="0.2032" layer="21"/>
<wire x1="10.5" y1="2" x2="9.5" y2="2" width="0.2032" layer="21"/>
<wire x1="11.08" y1="2.4" x2="9.5" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-10.5" y1="2.4" x2="-11.08" y2="2.4" width="0.2032" layer="21"/>
<wire x1="11.08" y1="-2.4" x2="10.5" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-9.5" y1="-2.4" x2="-11.08" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="10.5" y1="-2" x2="10.5" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="10.5" y1="1" x2="10.5" y2="2" width="0.2032" layer="21"/>
<wire x1="-9.5" y1="-2" x2="-10.5" y2="-2" width="0.2032" layer="21"/>
<smd name="1" x="9.525" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="6.985" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="5" x="4.445" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="7" x="1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="9" x="-0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="11" x="-3.175" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="13" x="-5.715" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="15" x="-8.255" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="2" x="8.255" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="5.715" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="6" x="3.175" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="8" x="0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="10" x="-1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="12" x="-4.445" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="14" x="-6.985" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="16" x="-9.525" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-10.16" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-9.525" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="1445055-3">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 3.0 mm&lt;p&gt;
Source: ENG_CD_1445055_A.pdf</description>
<wire x1="-4.9" y1="4.525" x2="-4.175" y2="4.525" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="4.525" x2="-4.9" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="-4.5" x2="4.9" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="4.9" y1="-4.5" x2="4.9" y2="4.525" width="0.2032" layer="21"/>
<wire x1="4.9" y1="4.525" x2="4.1" y2="4.525" width="0.2032" layer="21"/>
<wire x1="4.1" y1="4.525" x2="3.575" y2="4.525" width="0.2032" layer="51"/>
<wire x1="3.575" y1="4.525" x2="3.575" y2="3.4" width="0.2032" layer="51"/>
<wire x1="3.575" y1="3.4" x2="2.425" y2="3.4" width="0.2032" layer="51"/>
<wire x1="2.425" y1="3.4" x2="2.425" y2="4.175" width="0.2032" layer="51"/>
<wire x1="2.425" y1="4.175" x2="1.95" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-1.05" y1="4.175" x2="-1.925" y2="4.175" width="0.2032" layer="21"/>
<wire x1="-1.925" y1="4.175" x2="-2.425" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-2.425" y1="4.175" x2="-2.425" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-2.425" y1="3.4" x2="-3.575" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-3.575" y1="3.4" x2="-3.575" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-3.575" y1="4.525" x2="-4.175" y2="4.525" width="0.2032" layer="51"/>
<wire x1="-5" y1="1.45" x2="-5.75" y2="1.45" width="0.2032" layer="25"/>
<wire x1="-5.75" y1="1.45" x2="-6.475" y2="1.025" width="0.2032" layer="25"/>
<wire x1="-6.475" y1="1.025" x2="-6.475" y2="-0.425" width="0.2032" layer="25"/>
<wire x1="-6.475" y1="-0.425" x2="-5.75" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-5.75" y1="-0.85" x2="-5.525" y2="-0.85" width="0.2032" layer="25"/>
<wire x1="-5.525" y1="-0.85" x2="-5.525" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-5.525" y1="-0.35" x2="-5" y2="-0.35" width="0.2032" layer="25"/>
<wire x1="-5.9" y1="-0.7" x2="-5.9" y2="1.3" width="0.2032" layer="25"/>
<wire x1="5" y1="-1.45" x2="5.75" y2="-1.45" width="0.2032" layer="25"/>
<wire x1="5.75" y1="-1.45" x2="6.475" y2="-1.025" width="0.2032" layer="25"/>
<wire x1="6.475" y1="-1.025" x2="6.475" y2="0.425" width="0.2032" layer="25"/>
<wire x1="6.475" y1="0.425" x2="5.75" y2="0.85" width="0.2032" layer="25"/>
<wire x1="5.75" y1="0.85" x2="5.525" y2="0.85" width="0.2032" layer="25"/>
<wire x1="5.525" y1="0.85" x2="5.525" y2="0.35" width="0.2032" layer="25"/>
<wire x1="5.525" y1="0.35" x2="5" y2="0.35" width="0.2032" layer="25"/>
<wire x1="5.9" y1="-1.3" x2="5.9" y2="0.7" width="0.2032" layer="25"/>
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
<wire x1="0.575" y1="3.4" x2="-0.575" y2="3.4" width="0.2032" layer="51"/>
<wire x1="-0.575" y1="3.4" x2="-0.575" y2="4.175" width="0.2032" layer="51"/>
<wire x1="0.575" y1="4.175" x2="0.575" y2="3.4" width="0.2032" layer="51"/>
<wire x1="1.95" y1="4.175" x2="1.075" y2="4.175" width="0.2032" layer="21"/>
<wire x1="1.075" y1="4.175" x2="0.575" y2="4.175" width="0.2032" layer="51"/>
<wire x1="-0.575" y1="4.175" x2="-1.05" y2="4.175" width="0.2032" layer="51"/>
<pad name="1" x="3" y="4.32" drill="1" diameter="1.6764"/>
<pad name="2" x="0" y="4.32" drill="1" diameter="1.6764"/>
<pad name="3" x="-3" y="4.32" drill="1" diameter="1.6764"/>
<text x="1.5" y="5.54" size="1.27" layer="25">&gt;NAME</text>
<text x="9" y="-4.5" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="2.6875" y1="3.5125" x2="3.325" y2="5" layer="51"/>
<rectangle x1="-0.3125" y1="3.5125" x2="0.3249" y2="4.9999" layer="51"/>
<rectangle x1="-3.3125" y1="3.5125" x2="-2.6875" y2="4.9999" layer="51"/>
<hole x="0" y="0" drill="3"/>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-3.365" y="2.14"/>
<vertex x="-3.21" y="2.14"/>
<vertex x="-3.1875" y="2.225"/>
<vertex x="-2.97" y="2.28"/>
<vertex x="-3.01" y="2.14"/>
<vertex x="-2.82" y="2.14"/>
<vertex x="-2.85" y="2.04"/>
<vertex x="-3.04" y="2.04"/>
<vertex x="-3.11" y="1.81" curve="107.492325"/>
<vertex x="-3.065" y="1.75" curve="-1.23212"/>
<vertex x="-2.945" y="1.75"/>
<vertex x="-2.975" y="1.64"/>
<vertex x="-3.255" y="1.64" curve="-115.057615"/>
<vertex x="-3.325" y="1.75"/>
<vertex x="-3.24" y="2.04"/>
<vertex x="-3.395" y="2.04"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-2.73" y="2.14"/>
<vertex x="-2.53" y="2.14"/>
<vertex x="-2.62" y="1.845" curve="114.249552"/>
<vertex x="-2.54" y="1.75"/>
<vertex x="-2.46" y="1.75"/>
<vertex x="-2.34" y="2.14"/>
<vertex x="-2.145" y="2.14"/>
<vertex x="-2.36" y="1.435"/>
<vertex x="-2.555" y="1.435"/>
<vertex x="-2.495" y="1.64"/>
<vertex x="-2.785" y="1.64" curve="-114.113525"/>
<vertex x="-2.85" y="1.74"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-1.66" y="1.96"/>
<vertex x="-1.44" y="1.96"/>
<vertex x="-1.425" y="2.01" curve="105.642164"/>
<vertex x="-1.52" y="2.14"/>
<vertex x="-1.92" y="2.14" curve="70.280225"/>
<vertex x="-2.055" y="2.045"/>
<vertex x="-2.13" y="1.805" curve="106.773065"/>
<vertex x="-2.01" y="1.64"/>
<vertex x="-1.61" y="1.64" curve="71.682021"/>
<vertex x="-1.52" y="1.705"/>
<vertex x="-1.485" y="1.825"/>
<vertex x="-1.7" y="1.825"/>
<vertex x="-1.715" y="1.78" curve="-75.804848"/>
<vertex x="-1.76" y="1.75"/>
<vertex x="-1.855" y="1.75" curve="-106.260205"/>
<vertex x="-1.9" y="1.81"/>
<vertex x="-1.85" y="1.98" curve="-70.964895"/>
<vertex x="-1.78" y="2.035"/>
<vertex x="-1.695" y="2.035" curve="-112.619865"/>
<vertex x="-1.655" y="1.975"/>
</polygon>
<polygon width="0.01" layer="25" spacing="0.254">
<vertex x="-0.95" y="1.825"/>
<vertex x="-0.73" y="1.825"/>
<vertex x="-0.675" y="2.005" curve="105.642164"/>
<vertex x="-0.77" y="2.135"/>
<vertex x="-1.17" y="2.135" curve="70.280225"/>
<vertex x="-1.305" y="2.04"/>
<vertex x="-1.38" y="1.8" curve="106.773065"/>
<vertex x="-1.26" y="1.635"/>
<vertex x="-0.86" y="1.635" curve="71.682021"/>
<vertex x="-0.77" y="1.7"/>
<vertex x="-0.73" y="1.825"/>
<vertex x="-0.95" y="1.82"/>
<vertex x="-0.965" y="1.775" curve="-75.804848"/>
<vertex x="-1.01" y="1.745"/>
<vertex x="-1.105" y="1.745" curve="-106.260205"/>
<vertex x="-1.15" y="1.805"/>
<vertex x="-1.1" y="1.975" curve="-70.964895"/>
<vertex x="-1.03" y="2.03"/>
<vertex x="-0.945" y="2.03" curve="-112.619865"/>
<vertex x="-0.905" y="1.97"/>
</polygon>
</package>
<package name="22-23-2031">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<wire x1="-3.81" y1="3.175" x2="3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="3.175" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="-3.175" x2="-3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-3.175" x2="-3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1" shape="long" rot="R90"/>
<text x="-3.81" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2061">
<description>.100" (2.54mm) Center Header - 6 Pin</description>
<wire x1="-7.62" y1="3.175" x2="7.62" y2="3.175" width="0.254" layer="21"/>
<wire x1="7.62" y1="3.175" x2="7.62" y2="1.27" width="0.254" layer="21"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-3.175" width="0.254" layer="21"/>
<wire x1="7.62" y1="-3.175" x2="-7.62" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-7.62" y1="-3.175" x2="-7.62" y2="1.27" width="0.254" layer="21"/>
<wire x1="-7.62" y1="1.27" x2="-7.62" y2="3.175" width="0.254" layer="21"/>
<wire x1="-7.62" y1="1.27" x2="7.62" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" shape="long" rot="R90"/>
<text x="-7.62" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PDI_ATMEL">
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
<symbol name="MV">
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="-0.508" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="0" y="0.889" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="-0.508" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="P3">
<wire x1="1.27" y1="-1.27" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="6.35" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="6.35" x2="1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="6.35" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="5.08" radius="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.778" y="-0.508" size="1.27" layer="95">1</text>
<text x="1.778" y="4.572" size="1.27" layer="95">3</text>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="2" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="3" x="-2.54" y="5.08" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="MV-1">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M-1">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PDI_ATMEL" prefix="SV" uservalue="yes">
<description>Ref Harting : 09 18 506 7323
Atmel pdi connector</description>
<gates>
<gate name="1" symbol="PDI_ATMEL" x="0" y="0"/>
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
<attribute name="MOUSER" value="617-09185066323" constant="no"/>
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
<attribute name="MOUSER" value="617-09-18-506-7323 " constant="no"/>
<attribute name="RS" value="693-5242 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MICROMATCH-4_SMD" prefix="X">
<description>Ref FN : 1865094</description>
<gates>
<gate name="-1" symbol="MV" x="-38.1" y="35.56"/>
<gate name="-2" symbol="M" x="-38.1" y="33.02"/>
<gate name="-3" symbol="M" x="-38.1" y="30.48"/>
<gate name="-4" symbol="M" x="-38.1" y="27.94"/>
</gates>
<devices>
<device name="" package="MICROMATCH-4_SMD">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="571-7-188275-4" constant="no"/>
<attribute name="RS" value=" 366-1721 " constant="no"/>
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
<attribute name="MOUSER" value="571-2-1445055-2 " constant="no"/>
<attribute name="RS" value=" 495-9580" constant="no"/>
<attribute name="VALUE" value="1445055-2" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MICROMATCH-8_SMD" prefix="X">
<description>Ref FN : 1865096</description>
<gates>
<gate name="-1" symbol="MV" x="-2.54" y="7.62"/>
<gate name="-2" symbol="M" x="-2.54" y="5.08"/>
<gate name="-3" symbol="M" x="-2.54" y="2.54"/>
<gate name="-4" symbol="M" x="-2.54" y="0"/>
<gate name="-5" symbol="M" x="-2.54" y="-2.54"/>
<gate name="-6" symbol="M" x="-2.54" y="-5.08"/>
<gate name="-7" symbol="M" x="-2.54" y="-7.62"/>
<gate name="-8" symbol="M" x="-2.54" y="-10.16"/>
</gates>
<devices>
<device name="" package="MICROMATCH-8_SMD">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1865096" constant="no"/>
<attribute name="MOUSER" value="571-7-188275-8 " constant="no"/>
<attribute name="RS" value="739-1227 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MICROMATCH-16_SMD" prefix="X">
<description>&lt;b&gt;MicroMaTch 16 &lt;/b&gt; FN : 1565592 / 8-215464-6 / 1-215464-6&lt;p&gt;
Drawing Number C-215464&lt;br&gt;
DDEController.pdf</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="15.24" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="10.16" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
<gate name="-13" symbol="M" x="0" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-14" symbol="M" x="0" y="-15.24" addlevel="always" swaplevel="1"/>
<gate name="-15" symbol="M" x="0" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-16" symbol="M" x="0" y="-20.32" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="MICROMATCH-16_SMD">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="571-8-188275-6" constant="no"/>
<attribute name="RS" value="739-1237 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1445055-3" prefix="J">
<description>&lt;b&gt;Micro MATE-N-LOK Connectors&lt;/b&gt; grid 1.5 mm&lt;p&gt;
Source: ENG_CD_1445055_A.pdf</description>
<gates>
<gate name="G$1" symbol="P3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1445055-3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1111119" constant="no"/>
<attribute name="MOUSER" value="571-2-1445055-3" constant="no"/>
<attribute name="RS" value=" 495-9596" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2031" prefix="X">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<gates>
<gate name="-1" symbol="MV-1" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M-1" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M-1" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2031">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1462950" constant="no"/>
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MOUSER" value="538-22-23-2031 " constant="no"/>
<attribute name="MPN" value="22-23-2031" constant="no"/>
<attribute name="RS" value="679-5587" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2061" prefix="X" uservalue="yes">
<description>.100" (2.54mm) Center Header - 6 Pin</description>
<gates>
<gate name="-1" symbol="MV-1" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M-1" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M-1" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M-1" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M-1" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M-1" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2061">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1462922" constant="no"/>
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MOUSER" value="538-22-23-2061 " constant="no"/>
<attribute name="MPN" value="22-23-2061" constant="no"/>
<attribute name="RS" value="679-5593" constant="no"/>
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
<library name="con-lstb">
<description>&lt;b&gt;Pin Headers&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
MA = male&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MA03-1">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.81" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.81" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MA03-1">
<wire x1="3.81" y1="-5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<text x="-1.27" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MA03-1" prefix="SV" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="MA03-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA03-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
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
<library name="robotter_inductor">
<packages>
<package name="SRR1280">
<wire x1="4.95" y1="0" x2="-4.95" y2="0" width="0.3048" layer="51"/>
<wire x1="-6.4" y1="-6.4" x2="6.4" y2="-6.4" width="0.127" layer="21"/>
<wire x1="6.4" y1="-6.4" x2="6.4" y2="6.4" width="0.127" layer="51"/>
<wire x1="6.4" y1="6.4" x2="-6.4" y2="6.4" width="0.127" layer="21"/>
<wire x1="-6.4" y1="6.4" x2="-6.4" y2="-6.4" width="0.127" layer="51"/>
<smd name="1" x="-5.1" y="0" dx="5.4" dy="3.4" layer="1" rot="R90"/>
<smd name="2" x="5.1" y="0" dx="5.4" dy="3.4" layer="1" rot="R90"/>
<text x="-3.81" y="-7.62" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-1.3" x2="0.5" y2="1.3" layer="21" rot="R90"/>
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
<deviceset name="33µH" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="-3.3A" package="SRR1280">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="652-SRR1280-330M" constant="no"/>
<attribute name="RS" value="727-2274" constant="no"/>
<attribute name="VALUE" value="33µH" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SRR1280" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="-150" package="SRR1280">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="652-SRR1280-150M" constant="no"/>
<attribute name="RS" value=" 693-4643" constant="no"/>
<attribute name="VALUE" value="15µH 5.2A" constant="no"/>
</technology>
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
<part name="C16" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C15" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C14" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C13" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C12" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="FRAME6" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V14" library="supply1" deviceset="+3V3" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP"/>
<part name="C17" library="robotter_capacitor" deviceset="15PF" device="-F"/>
<part name="C18" library="robotter_capacitor" deviceset="15PF" device="-F"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="+3V15" library="supply1" deviceset="+3V3" device=""/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R6" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R7" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R8" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="L_A0" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="L_A1" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="L_A2" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="L_A3" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="PDI_ATMEL" library="robotter_connector" deviceset="PDI_ATMEL" device="L"/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="C22" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C21" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="IC3" library="robotter_ic" deviceset="LM1086CS-3.3" device=""/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="+3V24" library="supply1" deviceset="+3V3" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="R13" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R14" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.6"/>
<part name="H3" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.6"/>
<part name="H4" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.6"/>
<part name="GND53" library="supply1" deviceset="GND" device=""/>
<part name="FRAME8" library="frames" deviceset="A4L-LOC" device=""/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R3" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R4" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="RUN" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="ERR" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="COM" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.6"/>
<part name="D1" library="robotter_diode" deviceset="MBRA340T3" device="" value="MBRA340T3"/>
<part name="R12" library="robotter_resistor" deviceset="6K8" device="-F" value="6k8 1%"/>
<part name="D2" library="robotter_diode" deviceset="MBRA340T3" device="" value="MBRA340T3"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="PWMC4" library="con-lstb" deviceset="MA03-1" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="P+6" library="supply1" deviceset="+5V" device=""/>
<part name="+3V7" library="supply1" deviceset="+3V3" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="PWMD2" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PWMD1" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PWMD0" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="R17" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R18" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R19" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="C19" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C20" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C25" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C26" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C27" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C28" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="+3V8" library="supply1" deviceset="+3V3" device=""/>
<part name="C29" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C30" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C35" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C36" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C37" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="R20" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="AEAT_ENCOD" library="robotter_connector" deviceset="22-23-2061" device=""/>
<part name="C38" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="C39" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="C40" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="C41" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="C42" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="C43" library="robotter_capacitor" deviceset="220UF" device="F_35V"/>
<part name="UART_CAM" library="robotter_connector" deviceset="22-23-2031" device=""/>
<part name="ADCB0" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="ADCB1" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="ADCB2" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="ADCB3" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PC0" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PC1" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PC2" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="PC3" library="con-lstb" deviceset="MA03-1" device="">
<attribute name="MF" value=""/>
<attribute name="MPN" value=""/>
<attribute name="OC_FARNELL" value="unknown"/>
<attribute name="OC_NEWARK" value="unknown"/>
</part>
<part name="L1" library="robotter_inductor" deviceset="SRR1280" device="-150" value="15uH"/>
<part name="L2" library="robotter_inductor" deviceset="33µH" device="-3.3A" value="33uH"/>
<part name="AX12" library="robotter_connector" deviceset="1445055-3" device=""/>
<part name="PW_BAT" library="robotter_connector" deviceset="1445055-2" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="robotter_resistor" deviceset="3K09" device="-F"/>
<part name="R24" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R25" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="UART" library="robotter_connector" deviceset="MICROMATCH-4_SMD" device=""/>
<part name="D3" library="robotter_diode" deviceset="50WQ03" device="" value="50WQ03"/>
<part name="IC10" library="robotter_ic" deviceset="74LVC1T45" device="DBV"/>
<part name="IC11" library="robotter_ic" deviceset="74LVC1T45" device="DBV"/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="P+2" library="supply1" deviceset="+5V" device=""/>
<part name="C2" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="FRAME5" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME7" library="frames" deviceset="A4L-LOC" device=""/>
<part name="IC4" library="robotter_ic" deviceset="MPXV5100GC6U" device=""/>
<part name="C23" library="robotter_capacitor" deviceset="10NF" device="-F" value="10nF 50V"/>
<part name="C24" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="R16" library="robotter_resistor" deviceset="4K7" device="-F"/>
<part name="R21" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="C31" library="robotter_capacitor" deviceset="10NF" device="-F" value="10nF 50V"/>
<part name="IC8" library="robotter_ic" deviceset="MPXV5100GC6U" device=""/>
<part name="C32" library="robotter_capacitor" deviceset="10NF" device="-F" value="10nF 50V"/>
<part name="C33" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="P+7" library="supply1" deviceset="+5V" device=""/>
<part name="R22" library="robotter_resistor" deviceset="4K7" device="-F"/>
<part name="R23" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="C34" library="robotter_capacitor" deviceset="10NF" device="-F" value="10nF 50V"/>
<part name="D5" library="robotter_diode" deviceset="B160-13F" device="" value="B160-13F"/>
<part name="R2" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R26" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="R1" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="T1" library="robotter_ic" deviceset="NTR4503NT1G" device="" value="NTR4503NT1G"/>
<part name="VPMP0" library="robotter_connector" deviceset="1445055-2" device="" value="1445055-2"/>
<part name="D4" library="robotter_diode" deviceset="B160-13F" device="" value="B160-13F"/>
<part name="R28" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R29" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="R30" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="T2" library="robotter_ic" deviceset="NTR4503NT1G" device="" value="NTR4503NT1G"/>
<part name="VPMP1" library="robotter_connector" deviceset="1445055-2" device="" value="1445055-2"/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="COLOR_SENS" library="robotter_connector" deviceset="MICROMATCH-8_SMD" device=""/>
<part name="R31" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R32" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="ARM_MOT" library="robotter_connector" deviceset="MICROMATCH-16_SMD" device=""/>
<part name="IC5" library="robotter_ic" deviceset="LM2596S" device="-ADJ" value="LM2596S-ADJ"/>
<part name="IC12" library="robotter_ic" deviceset="LM2596S" device="-ADJ" value="LM2596S-ADJ"/>
<part name="IC6" library="robotter_ic" deviceset="74LVC4245" device="APW"/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="C44" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C45" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C46" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="358.14" y="-43.18" size="1.778" layer="91">Vbatt : 12-26V</text>
<text x="142.24" y="-264.16" size="1.778" layer="91">analog voltage used to verify that the voltage of the vacuum pump command</text>
<text x="10.16" y="-142.24" size="1.778" layer="91">renommer les nets une fois la carte routée par pwm_E0_3v3 par exemple, renommer aussi les connecteurs</text>
<text x="193.04" y="-129.54" size="1.778" layer="91">verifier sens transceiver</text>
<text x="134.62" y="66.04" size="1.778" layer="91">ne pas connecter SS du port sur lequel est connecte la spi du codeur</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME4" gate="G$1" x="266.7" y="-185.42"/>
<instance part="IC2" gate="G$1" x="71.12" y="58.42" smashed="yes">
<attribute name="NAME" x="88.9" y="10.16" size="1.9304" layer="95" ratio="5"/>
<attribute name="VALUE" x="88.9" y="7.62" size="1.9304" layer="96" ratio="5"/>
</instance>
<instance part="C16" gate="G$1" x="106.68" y="22.86" smashed="yes">
<attribute name="NAME" x="112.776" y="19.939" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="108.204" y="18.161" size="1.778" layer="96"/>
</instance>
<instance part="C15" gate="G$1" x="114.3" y="25.4" smashed="yes">
<attribute name="NAME" x="120.396" y="22.479" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="115.824" y="20.701" size="1.778" layer="96"/>
</instance>
<instance part="C14" gate="G$1" x="121.92" y="27.94" smashed="yes">
<attribute name="NAME" x="128.016" y="25.019" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="123.444" y="23.241" size="1.778" layer="96"/>
</instance>
<instance part="C13" gate="G$1" x="129.54" y="30.48" smashed="yes">
<attribute name="NAME" x="135.636" y="27.559" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="131.064" y="25.781" size="1.778" layer="96"/>
</instance>
<instance part="C12" gate="G$1" x="137.16" y="33.02" smashed="yes">
<attribute name="NAME" x="143.256" y="30.099" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="138.684" y="28.321" size="1.778" layer="96"/>
</instance>
<instance part="C11" gate="G$1" x="144.78" y="35.56" smashed="yes">
<attribute name="NAME" x="150.876" y="32.639" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="146.304" y="30.861" size="1.778" layer="96"/>
</instance>
<instance part="C10" gate="G$1" x="152.4" y="38.1" smashed="yes">
<attribute name="NAME" x="158.496" y="35.179" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="153.924" y="33.401" size="1.778" layer="96"/>
</instance>
<instance part="C9" gate="G$1" x="160.02" y="40.64" smashed="yes">
<attribute name="NAME" x="166.116" y="37.719" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="161.544" y="35.941" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="1" x="134.62" y="15.24" smashed="yes">
<attribute name="VALUE" x="132.08" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="GND2" gate="1" x="71.12" y="5.08"/>
<instance part="+3V1" gate="G$1" x="172.72" y="45.72" smashed="yes">
<attribute name="VALUE" x="170.18" y="45.72" size="1.778" layer="96"/>
</instance>
<instance part="FRAME6" gate="G$1" x="266.7" y="0"/>
<instance part="+3V14" gate="G$1" x="15.24" y="38.1"/>
<instance part="Q1" gate="G$1" x="33.02" y="20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="27.94" y="21.336" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="22.86" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C17" gate="G$1" x="27.94" y="15.24" smashed="yes" rot="R180">
<attribute name="NAME" x="26.416" y="14.859" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="26.416" y="19.939" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C18" gate="G$1" x="38.1" y="15.24" smashed="yes" rot="R180">
<attribute name="NAME" x="36.576" y="14.859" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="36.576" y="19.939" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND10" gate="1" x="33.02" y="10.16"/>
<instance part="+3V15" gate="G$1" x="134.62" y="58.42" smashed="yes">
<attribute name="VALUE" x="132.08" y="58.42" size="1.778" layer="96"/>
</instance>
<instance part="C7" gate="G$1" x="124.46" y="53.34"/>
<instance part="C8" gate="G$1" x="134.62" y="53.34"/>
<instance part="GND11" gate="1" x="134.62" y="45.72" smashed="yes">
<attribute name="VALUE" x="132.08" y="43.18" size="1.778" layer="96"/>
</instance>
<instance part="R5" gate="G$1" x="157.48" y="124.46" smashed="yes">
<attribute name="NAME" x="149.86" y="124.46" size="1.778" layer="95"/>
<attribute name="VALUE" x="160.02" y="124.46" size="1.778" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="170.18" y="121.92" smashed="yes">
<attribute name="NAME" x="162.56" y="121.92" size="1.778" layer="95"/>
<attribute name="VALUE" x="172.72" y="121.92" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="182.88" y="119.38" smashed="yes">
<attribute name="NAME" x="175.26" y="119.38" size="1.778" layer="95"/>
<attribute name="VALUE" x="185.42" y="119.38" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="195.58" y="116.84" smashed="yes">
<attribute name="NAME" x="187.96" y="116.84" size="1.778" layer="95"/>
<attribute name="VALUE" x="198.12" y="116.84" size="1.778" layer="96"/>
</instance>
<instance part="L_A0" gate="G$1" x="190.5" y="124.46" smashed="yes" rot="R90">
<attribute name="NAME" x="182.88" y="124.46" size="1.778" layer="95"/>
<attribute name="VALUE" x="195.58" y="124.46" size="1.778" layer="96"/>
</instance>
<instance part="L_A1" gate="G$1" x="200.66" y="121.92" smashed="yes" rot="R90">
<attribute name="NAME" x="193.04" y="121.92" size="1.778" layer="95"/>
<attribute name="VALUE" x="205.74" y="121.92" size="1.778" layer="96"/>
</instance>
<instance part="L_A2" gate="G$1" x="210.82" y="119.38" smashed="yes" rot="R90">
<attribute name="NAME" x="203.2" y="119.38" size="1.778" layer="95"/>
<attribute name="VALUE" x="215.9" y="119.38" size="1.778" layer="96"/>
</instance>
<instance part="L_A3" gate="G$1" x="220.98" y="116.84" smashed="yes" rot="R90">
<attribute name="NAME" x="213.36" y="116.84" size="1.778" layer="95"/>
<attribute name="VALUE" x="226.06" y="116.84" size="1.778" layer="96"/>
</instance>
<instance part="GND19" gate="1" x="228.6" y="104.14"/>
<instance part="+3V2" gate="G$1" x="162.56" y="172.72" rot="MR0"/>
<instance part="PDI_ATMEL" gate="1" x="215.9" y="152.4"/>
<instance part="+3V3" gate="G$1" x="233.68" y="160.02"/>
<instance part="GND20" gate="1" x="233.68" y="144.78"/>
<instance part="C22" gate="G$1" x="474.98" y="-144.78"/>
<instance part="C21" gate="G$1" x="416.56" y="-144.78"/>
<instance part="IC3" gate="G$1" x="452.12" y="-142.24"/>
<instance part="+3V17" gate="G$1" x="490.22" y="-139.7"/>
<instance part="GND31" gate="1" x="449.58" y="-154.94"/>
<instance part="GND45" gate="1" x="332.74" y="91.44" rot="MR0"/>
<instance part="GND16" gate="1" x="436.88" y="101.6" rot="MR0"/>
<instance part="GND22" gate="1" x="457.2" y="127" rot="MR0"/>
<instance part="IC1" gate="G$1" x="459.74" y="104.14" rot="MR0"/>
<instance part="IC1" gate="P" x="462.28" y="137.16" rot="MR0"/>
<instance part="C1" gate="G$1" x="452.12" y="139.7" rot="MR0"/>
<instance part="C3" gate="G$1" x="487.68" y="116.84" smashed="yes" rot="MR0">
<attribute name="NAME" x="489.204" y="113.919" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="489.204" y="118.999" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C6" gate="G$1" x="482.6" y="106.68" smashed="yes" rot="MR0">
<attribute name="NAME" x="484.124" y="103.759" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="484.124" y="108.839" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C4" gate="G$1" x="434.34" y="114.3" rot="MR0"/>
<instance part="C5" gate="G$1" x="441.96" y="109.22" rot="MR0"/>
<instance part="+3V24" gate="G$1" x="457.2" y="149.86" smashed="yes" rot="MR0">
<attribute name="VALUE" x="459.74" y="149.86" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND24" gate="1" x="441.96" y="86.36"/>
<instance part="R13" gate="G$1" x="340.36" y="104.14" smashed="yes">
<attribute name="NAME" x="332.74" y="104.14" size="1.778" layer="95"/>
<attribute name="VALUE" x="342.9" y="101.6" size="1.778" layer="96"/>
</instance>
<instance part="R14" gate="G$1" x="340.36" y="106.68" smashed="yes">
<attribute name="NAME" x="332.74" y="106.68" size="1.778" layer="95"/>
<attribute name="VALUE" x="342.9" y="104.14" size="1.778" layer="96"/>
</instance>
<instance part="H1" gate="G$1" x="289.56" y="-172.72" rot="R90"/>
<instance part="H3" gate="G$1" x="299.72" y="-172.72" rot="R90"/>
<instance part="H4" gate="G$1" x="309.88" y="-172.72" rot="R90"/>
<instance part="GND53" gate="1" x="299.72" y="-177.8"/>
<instance part="FRAME8" gate="G$1" x="0" y="-185.42"/>
<instance part="R15" gate="G$1" x="20.32" y="35.56"/>
<instance part="R3" gate="G$1" x="147.32" y="160.02"/>
<instance part="R4" gate="G$1" x="154.94" y="157.48"/>
<instance part="R9" gate="G$1" x="114.3" y="88.9" smashed="yes">
<attribute name="NAME" x="106.68" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="116.84" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="R10" gate="G$1" x="127" y="86.36" smashed="yes">
<attribute name="NAME" x="119.38" y="86.36" size="1.778" layer="95"/>
<attribute name="VALUE" x="129.54" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="R11" gate="G$1" x="139.7" y="83.82" smashed="yes">
<attribute name="NAME" x="132.08" y="83.82" size="1.778" layer="95"/>
<attribute name="VALUE" x="142.24" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="RUN" gate="G$1" x="162.56" y="88.9" smashed="yes" rot="R90">
<attribute name="NAME" x="154.94" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="167.64" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="ERR" gate="G$1" x="175.26" y="86.36" smashed="yes" rot="R90">
<attribute name="NAME" x="167.64" y="86.36" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="COM" gate="G$1" x="187.96" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="180.34" y="83.82" size="1.778" layer="95"/>
<attribute name="VALUE" x="193.04" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="228.6" y="73.66"/>
<instance part="H2" gate="G$1" x="279.4" y="-172.72" rot="R90"/>
<instance part="D1" gate="G$1" x="464.82" y="-48.26" rot="R90"/>
<instance part="R12" gate="G$1" x="480.06" y="-33.02" rot="R90"/>
<instance part="D2" gate="G$1" x="467.36" y="-99.06" rot="R90"/>
<instance part="GND12" gate="1" x="441.96" y="-58.42"/>
<instance part="GND13" gate="1" x="441.96" y="-109.22"/>
<instance part="PWMC4" gate="G$1" x="101.6" y="-68.58"/>
<instance part="GND6" gate="1" x="208.28" y="-68.58"/>
<instance part="+3V4" gate="G$1" x="205.74" y="-17.78" smashed="yes" rot="MR0">
<attribute name="VALUE" x="205.74" y="-17.78" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="P+3" gate="1" x="210.82" y="-17.78" smashed="yes">
<attribute name="VALUE" x="213.36" y="-17.78" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="215.9" y="-124.46"/>
<instance part="+3V6" gate="G$1" x="213.36" y="-76.2" smashed="yes" rot="MR0">
<attribute name="VALUE" x="213.36" y="-76.2" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="P+5" gate="1" x="218.44" y="-76.2" smashed="yes">
<attribute name="VALUE" x="218.44" y="-76.2" size="1.778" layer="96"/>
</instance>
<instance part="P+6" gate="1" x="137.16" y="-78.74"/>
<instance part="+3V7" gate="G$1" x="144.78" y="-78.74" smashed="yes" rot="MR0">
<attribute name="VALUE" x="147.32" y="-78.74" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND14" gate="1" x="157.48" y="-93.98"/>
<instance part="GND15" gate="1" x="139.7" y="-139.7"/>
<instance part="PWMD2" gate="G$1" x="101.6" y="-53.34"/>
<instance part="PWMD1" gate="G$1" x="101.6" y="-38.1"/>
<instance part="PWMD0" gate="G$1" x="101.6" y="-22.86"/>
<instance part="R17" gate="G$1" x="226.06" y="-33.02" rot="R90"/>
<instance part="R18" gate="G$1" x="134.62" y="149.86"/>
<instance part="R19" gate="G$1" x="147.32" y="147.32"/>
<instance part="C19" gate="G$1" x="121.92" y="-86.36" smashed="yes">
<attribute name="NAME" x="120.396" y="-84.201" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="120.396" y="-89.281" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C20" gate="G$1" x="157.48" y="-86.36" smashed="yes">
<attribute name="NAME" x="163.576" y="-89.281" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="159.004" y="-85.979" size="1.778" layer="96"/>
</instance>
<instance part="C25" gate="G$1" x="231.14" y="-83.82" smashed="yes">
<attribute name="NAME" x="235.204" y="-83.439" size="1.778" layer="95"/>
<attribute name="VALUE" x="235.204" y="-85.979" size="1.778" layer="96"/>
</instance>
<instance part="C26" gate="G$1" x="198.12" y="-83.82" smashed="yes">
<attribute name="NAME" x="194.056" y="-84.201" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="194.056" y="-86.741" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C27" gate="G$1" x="233.68" y="-22.86" smashed="yes">
<attribute name="NAME" x="237.744" y="-25.019" size="1.778" layer="95"/>
<attribute name="VALUE" x="235.204" y="-27.559" size="1.778" layer="96"/>
</instance>
<instance part="C28" gate="G$1" x="177.8" y="-25.4" smashed="yes">
<attribute name="NAME" x="171.704" y="-25.019" size="1.778" layer="95"/>
<attribute name="VALUE" x="179.324" y="-30.099" size="1.778" layer="96"/>
</instance>
<instance part="GND17" gate="1" x="177.8" y="-35.56"/>
<instance part="GND18" gate="1" x="198.12" y="-91.44"/>
<instance part="GND21" gate="1" x="231.14" y="-91.44"/>
<instance part="+3V8" gate="G$1" x="7.62" y="104.14" rot="MR0"/>
<instance part="C29" gate="G$1" x="7.62" y="-104.14" smashed="yes">
<attribute name="NAME" x="13.716" y="-107.061" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="9.144" y="-103.759" size="1.778" layer="96"/>
</instance>
<instance part="C30" gate="G$1" x="12.7" y="-91.44" smashed="yes">
<attribute name="NAME" x="18.796" y="-94.361" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="14.224" y="-91.059" size="1.778" layer="96"/>
</instance>
<instance part="C35" gate="G$1" x="17.78" y="-76.2" smashed="yes">
<attribute name="NAME" x="23.876" y="-74.041" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="19.304" y="-80.899" size="1.778" layer="96"/>
</instance>
<instance part="C36" gate="G$1" x="7.62" y="-58.42" smashed="yes">
<attribute name="NAME" x="13.716" y="-61.341" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="9.144" y="-58.039" size="1.778" layer="96"/>
</instance>
<instance part="C37" gate="G$1" x="12.7" y="-45.72" smashed="yes">
<attribute name="NAME" x="18.796" y="-48.641" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="14.224" y="-45.339" size="1.778" layer="96"/>
</instance>
<instance part="R20" gate="G$1" x="17.78" y="99.06"/>
<instance part="AEAT_ENCOD" gate="-1" x="223.52" y="-137.16" rot="MR0"/>
<instance part="AEAT_ENCOD" gate="-2" x="223.52" y="-139.7" rot="MR0"/>
<instance part="AEAT_ENCOD" gate="-3" x="223.52" y="-142.24" rot="MR0"/>
<instance part="AEAT_ENCOD" gate="-4" x="223.52" y="-144.78" rot="MR0"/>
<instance part="AEAT_ENCOD" gate="-5" x="223.52" y="-147.32" rot="MR0"/>
<instance part="AEAT_ENCOD" gate="-6" x="223.52" y="-149.86" rot="MR0"/>
<instance part="C38" gate="G$1" x="492.76" y="-35.56"/>
<instance part="C39" gate="G$1" x="500.38" y="-35.56"/>
<instance part="C40" gate="G$1" x="495.3" y="-86.36"/>
<instance part="C41" gate="G$1" x="502.92" y="-86.36"/>
<instance part="C42" gate="G$1" x="403.86" y="-35.56"/>
<instance part="C43" gate="G$1" x="406.4" y="-86.36"/>
<instance part="UART_CAM" gate="-1" x="132.08" y="-167.64" rot="R180"/>
<instance part="UART_CAM" gate="-2" x="132.08" y="-165.1" rot="R180"/>
<instance part="UART_CAM" gate="-3" x="132.08" y="-162.56" rot="R180"/>
<instance part="ADCB0" gate="G$1" x="66.04" y="-20.32"/>
<instance part="ADCB1" gate="G$1" x="66.04" y="-33.02"/>
<instance part="ADCB2" gate="G$1" x="66.04" y="-45.72"/>
<instance part="ADCB3" gate="G$1" x="66.04" y="-58.42"/>
<instance part="PC0" gate="G$1" x="68.58" y="-96.52"/>
<instance part="PC1" gate="G$1" x="68.58" y="-109.22"/>
<instance part="PC2" gate="G$1" x="68.58" y="-121.92"/>
<instance part="PC3" gate="G$1" x="68.58" y="-134.62"/>
<instance part="L1" gate="G$1" x="472.44" y="-25.4"/>
<instance part="L2" gate="G$1" x="474.98" y="-76.2"/>
<instance part="AX12" gate="G$1" x="248.92" y="-45.72" smashed="yes">
<attribute name="NAME" x="246.38" y="-49.53" size="1.778" layer="95"/>
<attribute name="VALUE" x="254" y="-35.56" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="PW_BAT" gate="G$1" x="353.06" y="-50.8" rot="R180"/>
<instance part="GND5" gate="1" x="360.68" y="-68.58"/>
<instance part="R27" gate="G$1" x="485.14" y="-81.28" rot="R90"/>
<instance part="R24" gate="G$1" x="485.14" y="-101.6" rot="R90"/>
<instance part="R25" gate="G$1" x="480.06" y="-48.26" rot="R90"/>
<instance part="UART" gate="-1" x="299.72" y="96.52"/>
<instance part="UART" gate="-2" x="299.72" y="101.6"/>
<instance part="UART" gate="-3" x="299.72" y="104.14"/>
<instance part="UART" gate="-4" x="299.72" y="106.68"/>
<instance part="D3" gate="G$1" x="370.84" y="-50.8"/>
<instance part="IC10" gate="G$1" x="215.9" y="-101.6"/>
<instance part="IC11" gate="G$1" x="208.28" y="-45.72"/>
<instance part="P+1" gate="1" x="515.62" y="-73.66"/>
<instance part="P+2" gate="1" x="406.4" y="-137.16"/>
<instance part="C2" gate="G$1" x="406.4" y="-144.78"/>
<instance part="GND8" gate="1" x="233.68" y="-33.02"/>
<instance part="FRAME5" gate="G$1" x="0" y="-368.3"/>
<instance part="FRAME7" gate="G$1" x="266.7" y="-368.3"/>
<instance part="IC4" gate="G$1" x="53.34" y="-231.14"/>
<instance part="C23" gate="G$1" x="25.4" y="-223.52"/>
<instance part="C24" gate="G$1" x="10.16" y="-233.68"/>
<instance part="GND3" gate="1" x="45.72" y="-248.92"/>
<instance part="P+4" gate="1" x="10.16" y="-210.82"/>
<instance part="R16" gate="G$1" x="76.2" y="-231.14" rot="R180"/>
<instance part="R21" gate="G$1" x="86.36" y="-236.22" rot="R270"/>
<instance part="C31" gate="G$1" x="93.98" y="-233.68"/>
<instance part="IC8" gate="G$1" x="53.34" y="-276.86"/>
<instance part="C32" gate="G$1" x="25.4" y="-269.24"/>
<instance part="C33" gate="G$1" x="10.16" y="-279.4"/>
<instance part="GND7" gate="1" x="45.72" y="-294.64"/>
<instance part="P+7" gate="1" x="10.16" y="-256.54"/>
<instance part="R22" gate="G$1" x="76.2" y="-276.86" rot="R180"/>
<instance part="R23" gate="G$1" x="86.36" y="-281.94" rot="R270"/>
<instance part="C34" gate="G$1" x="93.98" y="-279.4"/>
<instance part="D5" gate="G$1" x="185.42" y="-231.14" rot="R90"/>
<instance part="R2" gate="G$1" x="195.58" y="-248.92" rot="R90"/>
<instance part="R26" gate="G$1" x="195.58" y="-238.76" rot="R90"/>
<instance part="GND23" gate="1" x="185.42" y="-256.54"/>
<instance part="R1" gate="G$1" x="170.18" y="-248.92" rot="R90"/>
<instance part="T1" gate="G$1" x="182.88" y="-241.3" smashed="yes">
<attribute name="NAME" x="189.23" y="-238.76" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="-242.57" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="VPMP0" gate="G$1" x="236.22" y="-228.6"/>
<instance part="D4" gate="G$1" x="185.42" y="-284.48" rot="R90"/>
<instance part="R28" gate="G$1" x="195.58" y="-302.26" rot="R90"/>
<instance part="R29" gate="G$1" x="195.58" y="-292.1" rot="R90"/>
<instance part="GND25" gate="1" x="185.42" y="-309.88"/>
<instance part="R30" gate="G$1" x="170.18" y="-302.26" rot="R90"/>
<instance part="T2" gate="G$1" x="182.88" y="-294.64" smashed="yes">
<attribute name="NAME" x="189.23" y="-292.1" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="-295.91" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="VPMP1" gate="G$1" x="236.22" y="-281.94"/>
<instance part="GND26" gate="1" x="358.14" y="-332.74"/>
<instance part="COLOR_SENS" gate="-1" x="292.1" y="-330.2"/>
<instance part="COLOR_SENS" gate="-2" x="292.1" y="-314.96"/>
<instance part="COLOR_SENS" gate="-3" x="292.1" y="-320.04"/>
<instance part="COLOR_SENS" gate="-4" x="292.1" y="-350.52"/>
<instance part="COLOR_SENS" gate="-5" x="292.1" y="-345.44"/>
<instance part="COLOR_SENS" gate="-6" x="292.1" y="-340.36"/>
<instance part="COLOR_SENS" gate="-7" x="292.1" y="-309.88"/>
<instance part="COLOR_SENS" gate="-8" x="292.1" y="-335.28"/>
<instance part="R31" gate="G$1" x="358.14" y="-325.12" rot="R90"/>
<instance part="R32" gate="G$1" x="345.44" y="-325.12" rot="R90"/>
<instance part="ARM_MOT" gate="-1" x="289.56" y="-210.82" smashed="yes">
<attribute name="NAME" x="289.052" y="-209.931" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="274.32" y="-209.931" size="1.778" layer="96"/>
</instance>
<instance part="ARM_MOT" gate="-2" x="289.56" y="-213.36" smashed="yes">
<attribute name="NAME" x="289.052" y="-212.471" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="ARM_MOT" gate="-3" x="289.56" y="-215.9" smashed="yes">
<attribute name="NAME" x="289.052" y="-215.011" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="ARM_MOT" gate="-4" x="289.56" y="-218.44" smashed="yes">
<attribute name="NAME" x="289.052" y="-217.551" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="ARM_MOT" gate="-5" x="289.56" y="-220.98" smashed="yes">
<attribute name="NAME" x="289.052" y="-220.091" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="ARM_MOT" gate="-6" x="289.56" y="-223.52"/>
<instance part="ARM_MOT" gate="-7" x="289.56" y="-226.06"/>
<instance part="ARM_MOT" gate="-8" x="289.56" y="-228.6"/>
<instance part="ARM_MOT" gate="-9" x="289.56" y="-231.14"/>
<instance part="ARM_MOT" gate="-10" x="289.56" y="-233.68"/>
<instance part="ARM_MOT" gate="-11" x="289.56" y="-236.22"/>
<instance part="ARM_MOT" gate="-12" x="289.56" y="-238.76"/>
<instance part="ARM_MOT" gate="-13" x="289.56" y="-241.3"/>
<instance part="ARM_MOT" gate="-14" x="289.56" y="-243.84"/>
<instance part="ARM_MOT" gate="-15" x="289.56" y="-246.38"/>
<instance part="ARM_MOT" gate="-16" x="289.56" y="-248.92"/>
<instance part="IC5" gate="G$1" x="441.96" y="-27.94"/>
<instance part="IC12" gate="G$1" x="441.96" y="-78.74"/>
<instance part="IC6" gate="G$1" x="139.7" y="-114.3" rot="MR0"/>
<instance part="GND27" gate="1" x="121.92" y="-93.98"/>
<instance part="C44" gate="G$1" x="490.22" y="-144.78"/>
<instance part="C45" gate="G$1" x="203.2" y="-299.72"/>
<instance part="C46" gate="G$1" x="203.2" y="-246.38"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="160.02" y1="35.56" x2="160.02" y2="17.78" width="0.1524" layer="91"/>
<wire x1="160.02" y1="17.78" x2="152.4" y2="17.78" width="0.1524" layer="91"/>
<wire x1="152.4" y1="17.78" x2="144.78" y2="17.78" width="0.1524" layer="91"/>
<wire x1="144.78" y1="17.78" x2="137.16" y2="17.78" width="0.1524" layer="91"/>
<wire x1="137.16" y1="17.78" x2="134.62" y2="17.78" width="0.1524" layer="91"/>
<wire x1="134.62" y1="17.78" x2="129.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="129.54" y1="17.78" x2="121.92" y2="17.78" width="0.1524" layer="91"/>
<wire x1="121.92" y1="17.78" x2="114.3" y2="17.78" width="0.1524" layer="91"/>
<wire x1="114.3" y1="17.78" x2="106.68" y2="17.78" width="0.1524" layer="91"/>
<wire x1="144.78" y1="30.48" x2="144.78" y2="17.78" width="0.1524" layer="91"/>
<wire x1="137.16" y1="27.94" x2="137.16" y2="17.78" width="0.1524" layer="91"/>
<wire x1="129.54" y1="25.4" x2="129.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="121.92" y1="22.86" x2="121.92" y2="17.78" width="0.1524" layer="91"/>
<wire x1="114.3" y1="20.32" x2="114.3" y2="17.78" width="0.1524" layer="91"/>
<wire x1="152.4" y1="33.02" x2="152.4" y2="17.78" width="0.1524" layer="91"/>
<junction x="114.3" y="17.78"/>
<junction x="152.4" y="17.78"/>
<junction x="144.78" y="17.78"/>
<junction x="137.16" y="17.78"/>
<junction x="129.54" y="17.78"/>
<junction x="121.92" y="17.78"/>
<junction x="134.62" y="17.78"/>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="60.96" y1="7.62" x2="63.5" y2="7.62" width="0.1524" layer="91"/>
<wire x1="63.5" y1="7.62" x2="66.04" y2="7.62" width="0.1524" layer="91"/>
<wire x1="66.04" y1="7.62" x2="68.58" y2="7.62" width="0.1524" layer="91"/>
<wire x1="68.58" y1="7.62" x2="71.12" y2="7.62" width="0.1524" layer="91"/>
<wire x1="71.12" y1="7.62" x2="73.66" y2="7.62" width="0.1524" layer="91"/>
<wire x1="73.66" y1="7.62" x2="76.2" y2="7.62" width="0.1524" layer="91"/>
<wire x1="76.2" y1="7.62" x2="78.74" y2="7.62" width="0.1524" layer="91"/>
<wire x1="78.74" y1="7.62" x2="81.28" y2="7.62" width="0.1524" layer="91"/>
<wire x1="81.28" y1="7.62" x2="83.82" y2="7.62" width="0.1524" layer="91"/>
<wire x1="71.12" y1="7.62" x2="68.58" y2="7.62" width="0.1524" layer="91"/>
<junction x="63.5" y="7.62"/>
<junction x="71.12" y="7.62"/>
<junction x="66.04" y="7.62"/>
<junction x="71.12" y="7.62"/>
<junction x="73.66" y="7.62"/>
<junction x="76.2" y="7.62"/>
<junction x="78.74" y="7.62"/>
<junction x="81.28" y="7.62"/>
<junction x="68.58" y="7.62"/>
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
<wire x1="38.1" y1="12.7" x2="33.02" y2="12.7" width="0.1524" layer="91"/>
<wire x1="33.02" y1="12.7" x2="27.94" y2="12.7" width="0.1524" layer="91"/>
<junction x="33.02" y="12.7"/>
<pinref part="C18" gate="G$1" pin="1"/>
<pinref part="C17" gate="G$1" pin="1"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="124.46" y1="48.26" x2="134.62" y2="48.26" width="0.1524" layer="91"/>
<junction x="134.62" y="48.26"/>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="C7" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="195.58" y1="124.46" x2="228.6" y2="124.46" width="0.1524" layer="91"/>
<wire x1="228.6" y1="124.46" x2="228.6" y2="121.92" width="0.1524" layer="91"/>
<wire x1="228.6" y1="121.92" x2="228.6" y2="119.38" width="0.1524" layer="91"/>
<wire x1="228.6" y1="119.38" x2="228.6" y2="116.84" width="0.1524" layer="91"/>
<wire x1="226.06" y1="116.84" x2="228.6" y2="116.84" width="0.1524" layer="91"/>
<wire x1="215.9" y1="119.38" x2="228.6" y2="119.38" width="0.1524" layer="91"/>
<wire x1="205.74" y1="121.92" x2="228.6" y2="121.92" width="0.1524" layer="91"/>
<wire x1="228.6" y1="116.84" x2="228.6" y2="106.68" width="0.1524" layer="91"/>
<junction x="228.6" y="119.38"/>
<junction x="228.6" y="121.92"/>
<junction x="228.6" y="116.84"/>
<pinref part="L_A0" gate="G$1" pin="C"/>
<pinref part="L_A3" gate="G$1" pin="C"/>
<pinref part="L_A2" gate="G$1" pin="C"/>
<pinref part="L_A1" gate="G$1" pin="C"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="228.6" y1="149.86" x2="233.68" y2="149.86" width="0.1524" layer="91"/>
<wire x1="233.68" y1="149.86" x2="233.68" y2="147.32" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="416.56" y1="-149.86" x2="416.56" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="416.56" y1="-152.4" x2="449.58" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="449.58" y1="-152.4" x2="474.98" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="474.98" y1="-152.4" x2="474.98" y2="-149.86" width="0.1524" layer="91"/>
<junction x="449.58" y="-152.4"/>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND31" gate="1" pin="GND"/>
<wire x1="416.56" y1="-152.4" x2="406.4" y2="-152.4" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="406.4" y1="-152.4" x2="406.4" y2="-149.86" width="0.1524" layer="91"/>
<junction x="416.56" y="-152.4"/>
<pinref part="C44" gate="G$1" pin="2"/>
<wire x1="474.98" y1="-152.4" x2="490.22" y2="-152.4" width="0.1524" layer="91"/>
<wire x1="490.22" y1="-152.4" x2="490.22" y2="-149.86" width="0.1524" layer="91"/>
<junction x="474.98" y="-152.4"/>
</segment>
<segment>
<pinref part="GND45" gate="1" pin="GND"/>
<wire x1="332.74" y1="101.6" x2="332.74" y2="93.98" width="0.1524" layer="91"/>
<wire x1="304.8" y1="101.6" x2="332.74" y2="101.6" width="0.1524" layer="91"/>
<pinref part="UART" gate="-2" pin="S"/>
</segment>
<segment>
<wire x1="441.96" y1="104.14" x2="436.88" y2="104.14" width="0.1524" layer="91"/>
<wire x1="436.88" y1="104.14" x2="434.34" y2="104.14" width="0.1524" layer="91"/>
<wire x1="434.34" y1="104.14" x2="434.34" y2="109.22" width="0.1524" layer="91"/>
<junction x="436.88" y="104.14"/>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="462.28" y1="129.54" x2="457.2" y2="129.54" width="0.1524" layer="91"/>
<wire x1="457.2" y1="129.54" x2="452.12" y2="129.54" width="0.1524" layer="91"/>
<wire x1="452.12" y1="129.54" x2="452.12" y2="134.62" width="0.1524" layer="91"/>
<junction x="457.2" y="129.54"/>
<pinref part="IC1" gate="P" pin="GND"/>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="441.96" y1="88.9" x2="444.5" y2="88.9" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="R2IN"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="289.56" y1="-175.26" x2="299.72" y2="-175.26" width="0.1524" layer="91"/>
<wire x1="299.72" y1="-175.26" x2="309.88" y2="-175.26" width="0.1524" layer="91"/>
<junction x="299.72" y="-175.26"/>
<junction x="299.72" y="-175.26"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="H4" gate="G$1" pin="MOUNT"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<pinref part="GND53" gate="1" pin="GND"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
<wire x1="289.56" y1="-175.26" x2="279.4" y2="-175.26" width="0.1524" layer="91"/>
<junction x="289.56" y="-175.26"/>
</segment>
<segment>
<wire x1="167.64" y1="88.9" x2="228.6" y2="88.9" width="0.1524" layer="91"/>
<wire x1="228.6" y1="88.9" x2="228.6" y2="86.36" width="0.1524" layer="91"/>
<wire x1="228.6" y1="86.36" x2="228.6" y2="83.82" width="0.1524" layer="91"/>
<wire x1="193.04" y1="83.82" x2="228.6" y2="83.82" width="0.1524" layer="91"/>
<wire x1="180.34" y1="86.36" x2="228.6" y2="86.36" width="0.1524" layer="91"/>
<wire x1="228.6" y1="83.82" x2="228.6" y2="76.2" width="0.1524" layer="91"/>
<junction x="228.6" y="83.82"/>
<junction x="228.6" y="86.36"/>
<pinref part="RUN" gate="G$1" pin="C"/>
<pinref part="COM" gate="G$1" pin="C"/>
<pinref part="ERR" gate="G$1" pin="C"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="492.76" y1="-38.1" x2="492.76" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="492.76" y1="-55.88" x2="480.06" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="480.06" y1="-55.88" x2="464.82" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="464.82" y1="-55.88" x2="444.5" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="444.5" y1="-55.88" x2="441.96" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="441.96" y1="-55.88" x2="429.26" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-55.88" x2="403.86" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-55.88" x2="403.86" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="431.8" y1="-30.48" x2="429.26" y2="-30.48" width="0.1524" layer="91"/>
<junction x="429.26" y="-55.88"/>
<wire x1="429.26" y1="-30.48" x2="429.26" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="480.06" y1="-53.34" x2="480.06" y2="-55.88" width="0.1524" layer="91"/>
<junction x="480.06" y="-55.88"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="464.82" y1="-50.8" x2="464.82" y2="-55.88" width="0.1524" layer="91"/>
<junction x="464.82" y="-55.88"/>
<pinref part="GND12" gate="1" pin="GND"/>
<junction x="441.96" y="-55.88"/>
<pinref part="C42" gate="G$1" pin="-"/>
<pinref part="C38" gate="G$1" pin="-"/>
<pinref part="C39" gate="G$1" pin="-"/>
<wire x1="500.38" y1="-38.1" x2="500.38" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="500.38" y1="-55.88" x2="492.76" y2="-55.88" width="0.1524" layer="91"/>
<junction x="492.76" y="-55.88"/>
<pinref part="R25" gate="G$1" pin="1"/>
<junction x="444.5" y="-55.88"/>
<pinref part="IC5" gate="G$1" pin="EN"/>
<pinref part="IC5" gate="G$1" pin="GND"/>
<wire x1="441.96" y1="-38.1" x2="441.96" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND@1"/>
<wire x1="444.5" y1="-38.1" x2="444.5" y2="-55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="495.3" y1="-88.9" x2="495.3" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="495.3" y1="-106.68" x2="485.14" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="485.14" y1="-106.68" x2="467.36" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="467.36" y1="-106.68" x2="444.5" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="444.5" y1="-106.68" x2="441.96" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="441.96" y1="-106.68" x2="429.26" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-106.68" x2="406.4" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="406.4" y1="-106.68" x2="406.4" y2="-88.9" width="0.1524" layer="91"/>
<junction x="429.26" y="-106.68"/>
<wire x1="431.8" y1="-81.28" x2="429.26" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-81.28" x2="429.26" y2="-106.68" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="A"/>
<wire x1="467.36" y1="-101.6" x2="467.36" y2="-106.68" width="0.1524" layer="91"/>
<junction x="467.36" y="-106.68"/>
<pinref part="GND13" gate="1" pin="GND"/>
<junction x="441.96" y="-106.68"/>
<pinref part="C40" gate="G$1" pin="-"/>
<pinref part="C43" gate="G$1" pin="-"/>
<pinref part="C41" gate="G$1" pin="-"/>
<wire x1="502.92" y1="-88.9" x2="502.92" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="502.92" y1="-106.68" x2="495.3" y2="-106.68" width="0.1524" layer="91"/>
<junction x="495.3" y="-106.68"/>
<pinref part="R24" gate="G$1" pin="1"/>
<junction x="485.14" y="-106.68"/>
<pinref part="IC12" gate="G$1" pin="EN"/>
<pinref part="IC12" gate="G$1" pin="GND"/>
<wire x1="441.96" y1="-88.9" x2="441.96" y2="-106.68" width="0.1524" layer="91"/>
<pinref part="IC12" gate="G$1" pin="GND@1"/>
<wire x1="444.5" y1="-88.9" x2="444.5" y2="-106.68" width="0.1524" layer="91"/>
<junction x="444.5" y="-106.68"/>
</segment>
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="208.28" y1="-66.04" x2="208.28" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="IC11" gate="G$1" pin="GND"/>
<pinref part="AX12" gate="G$1" pin="1"/>
<wire x1="233.68" y1="-45.72" x2="246.38" y2="-45.72" width="0.1524" layer="91"/>
<wire x1="208.28" y1="-63.5" x2="233.68" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="233.68" y1="-63.5" x2="233.68" y2="-45.72" width="0.1524" layer="91"/>
<junction x="208.28" y="-63.5"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="215.9" y1="-121.92" x2="215.9" y2="-119.38" width="0.1524" layer="91"/>
<pinref part="IC10" gate="G$1" pin="GND"/>
<pinref part="IC10" gate="G$1" pin="DIR_A_TO_B"/>
<wire x1="200.66" y1="-104.14" x2="198.12" y2="-104.14" width="0.1524" layer="91"/>
<wire x1="198.12" y1="-104.14" x2="198.12" y2="-119.38" width="0.1524" layer="91"/>
<wire x1="198.12" y1="-119.38" x2="215.9" y2="-119.38" width="0.1524" layer="91"/>
<junction x="215.9" y="-119.38"/>
</segment>
<segment>
<pinref part="PWMD0" gate="G$1" pin="1"/>
<wire x1="109.22" y1="-25.4" x2="111.76" y2="-25.4" width="0.1524" layer="91"/>
<label x="109.22" y="-25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMD1" gate="G$1" pin="1"/>
<wire x1="109.22" y1="-40.64" x2="111.76" y2="-40.64" width="0.1524" layer="91"/>
<label x="109.22" y="-40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMD2" gate="G$1" pin="1"/>
<wire x1="109.22" y1="-55.88" x2="111.76" y2="-55.88" width="0.1524" layer="91"/>
<label x="109.22" y="-55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMC4" gate="G$1" pin="1"/>
<wire x1="109.22" y1="-71.12" x2="111.76" y2="-71.12" width="0.1524" layer="91"/>
<label x="109.22" y="-71.12" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="-167.64" x2="142.24" y2="-167.64" width="0.1524" layer="91"/>
<label x="134.62" y="-167.64" size="1.778" layer="95"/>
<pinref part="UART_CAM" gate="-1" pin="S"/>
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="2"/>
<pinref part="GND18" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND21" gate="1" pin="GND"/>
<pinref part="C25" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C28" gate="G$1" pin="2"/>
<pinref part="GND17" gate="1" pin="GND"/>
<wire x1="177.8" y1="-30.48" x2="177.8" y2="-33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C29" gate="G$1" pin="2"/>
<wire x1="7.62" y1="-109.22" x2="7.62" y2="-111.76" width="0.1524" layer="91"/>
<label x="7.62" y="-111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C30" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-96.52" x2="12.7" y2="-99.06" width="0.1524" layer="91"/>
<label x="12.7" y="-99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C35" gate="G$1" pin="2"/>
<wire x1="17.78" y1="-81.28" x2="17.78" y2="-83.82" width="0.1524" layer="91"/>
<label x="17.78" y="-83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="2"/>
<wire x1="7.62" y1="-63.5" x2="7.62" y2="-66.04" width="0.1524" layer="91"/>
<label x="7.62" y="-66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-50.8" x2="12.7" y2="-53.34" width="0.1524" layer="91"/>
<label x="12.7" y="-53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-6" pin="S"/>
<wire x1="226.06" y1="-149.86" x2="231.14" y2="-149.86" width="0.1524" layer="91"/>
<label x="226.06" y="-149.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB0" gate="G$1" pin="1"/>
<wire x1="73.66" y1="-22.86" x2="76.2" y2="-22.86" width="0.1524" layer="91"/>
<label x="73.66" y="-22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB1" gate="G$1" pin="1"/>
<wire x1="73.66" y1="-35.56" x2="76.2" y2="-35.56" width="0.1524" layer="91"/>
<label x="73.66" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB2" gate="G$1" pin="1"/>
<wire x1="73.66" y1="-48.26" x2="76.2" y2="-48.26" width="0.1524" layer="91"/>
<label x="73.66" y="-48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB3" gate="G$1" pin="1"/>
<wire x1="73.66" y1="-60.96" x2="76.2" y2="-60.96" width="0.1524" layer="91"/>
<label x="73.66" y="-60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC0" gate="G$1" pin="1"/>
<wire x1="76.2" y1="-99.06" x2="78.74" y2="-99.06" width="0.1524" layer="91"/>
<label x="76.2" y="-99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC1" gate="G$1" pin="1"/>
<wire x1="76.2" y1="-111.76" x2="78.74" y2="-111.76" width="0.1524" layer="91"/>
<label x="76.2" y="-111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC2" gate="G$1" pin="1"/>
<wire x1="76.2" y1="-124.46" x2="78.74" y2="-124.46" width="0.1524" layer="91"/>
<label x="76.2" y="-124.46" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC3" gate="G$1" pin="1"/>
<wire x1="76.2" y1="-137.16" x2="78.74" y2="-137.16" width="0.1524" layer="91"/>
<label x="76.2" y="-137.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PW_BAT" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="360.68" y1="-66.04" x2="360.68" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="360.68" y1="-53.34" x2="355.6" y2="-53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C27" gate="G$1" pin="2"/>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="233.68" y1="-30.48" x2="233.68" y2="-27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="GND"/>
<pinref part="C24" gate="G$1" pin="2"/>
<wire x1="45.72" y1="-246.38" x2="25.4" y2="-246.38" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-246.38" x2="10.16" y2="-246.38" width="0.1524" layer="91"/>
<wire x1="10.16" y1="-246.38" x2="10.16" y2="-238.76" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="25.4" y1="-246.38" x2="25.4" y2="-228.6" width="0.1524" layer="91"/>
<junction x="25.4" y="-246.38"/>
<pinref part="GND3" gate="1" pin="GND"/>
<junction x="45.72" y="-246.38"/>
<pinref part="C31" gate="G$1" pin="2"/>
<wire x1="45.72" y1="-246.38" x2="86.36" y2="-246.38" width="0.1524" layer="91"/>
<wire x1="86.36" y1="-246.38" x2="93.98" y2="-246.38" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-246.38" x2="93.98" y2="-238.76" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="2"/>
<wire x1="86.36" y1="-241.3" x2="86.36" y2="-246.38" width="0.1524" layer="91"/>
<junction x="86.36" y="-246.38"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="GND"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="45.72" y1="-292.1" x2="25.4" y2="-292.1" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-292.1" x2="10.16" y2="-292.1" width="0.1524" layer="91"/>
<wire x1="10.16" y1="-292.1" x2="10.16" y2="-284.48" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<wire x1="25.4" y1="-292.1" x2="25.4" y2="-274.32" width="0.1524" layer="91"/>
<junction x="25.4" y="-292.1"/>
<pinref part="GND7" gate="1" pin="GND"/>
<junction x="45.72" y="-292.1"/>
<pinref part="C34" gate="G$1" pin="2"/>
<wire x1="45.72" y1="-292.1" x2="86.36" y2="-292.1" width="0.1524" layer="91"/>
<wire x1="86.36" y1="-292.1" x2="93.98" y2="-292.1" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-292.1" x2="93.98" y2="-284.48" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="86.36" y1="-287.02" x2="86.36" y2="-292.1" width="0.1524" layer="91"/>
<junction x="86.36" y="-292.1"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="GND23" gate="1" pin="GND"/>
<wire x1="185.42" y1="-254" x2="195.58" y2="-254" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="170.18" y1="-254" x2="185.42" y2="-254" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="S"/>
<wire x1="185.42" y1="-254" x2="185.42" y2="-246.38" width="0.1524" layer="91"/>
<junction x="185.42" y="-254"/>
<pinref part="C46" gate="G$1" pin="2"/>
<wire x1="195.58" y1="-254" x2="203.2" y2="-254" width="0.1524" layer="91"/>
<wire x1="203.2" y1="-254" x2="203.2" y2="-251.46" width="0.1524" layer="91"/>
<junction x="195.58" y="-254"/>
</segment>
<segment>
<pinref part="R28" gate="G$1" pin="1"/>
<pinref part="GND25" gate="1" pin="GND"/>
<wire x1="185.42" y1="-307.34" x2="195.58" y2="-307.34" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="1"/>
<wire x1="170.18" y1="-307.34" x2="185.42" y2="-307.34" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="S"/>
<wire x1="185.42" y1="-307.34" x2="185.42" y2="-299.72" width="0.1524" layer="91"/>
<junction x="185.42" y="-307.34"/>
<pinref part="C45" gate="G$1" pin="2"/>
<wire x1="195.58" y1="-307.34" x2="203.2" y2="-307.34" width="0.1524" layer="91"/>
<wire x1="203.2" y1="-307.34" x2="203.2" y2="-304.8" width="0.1524" layer="91"/>
<junction x="195.58" y="-307.34"/>
</segment>
<segment>
<pinref part="COLOR_SENS" gate="-1" pin="S"/>
<pinref part="GND26" gate="1" pin="GND"/>
<wire x1="358.14" y1="-330.2" x2="345.44" y2="-330.2" width="0.1524" layer="91"/>
<pinref part="R32" gate="G$1" pin="1"/>
<wire x1="345.44" y1="-330.2" x2="297.18" y2="-330.2" width="0.1524" layer="91"/>
<junction x="345.44" y="-330.2"/>
<pinref part="R31" gate="G$1" pin="1"/>
<junction x="358.14" y="-330.2"/>
</segment>
<segment>
<wire x1="294.64" y1="-210.82" x2="317.5" y2="-210.82" width="0.1524" layer="91"/>
<label x="304.8" y="-210.82" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="294.64" y1="-226.06" x2="317.5" y2="-226.06" width="0.1524" layer="91"/>
<label x="304.8" y="-226.06" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="294.64" y1="-231.14" x2="317.5" y2="-231.14" width="0.1524" layer="91"/>
<label x="304.8" y="-231.14" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-9" pin="S"/>
</segment>
<segment>
<wire x1="294.64" y1="-236.22" x2="317.5" y2="-236.22" width="0.1524" layer="91"/>
<label x="304.8" y="-236.22" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-11" pin="S"/>
</segment>
<segment>
<wire x1="134.62" y1="-137.16" x2="137.16" y2="-137.16" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@0"/>
<pinref part="IC6" gate="G$1" pin="GND@1"/>
<junction x="137.16" y="-137.16"/>
<pinref part="IC6" gate="G$1" pin="GND@2"/>
<wire x1="139.7" y1="-137.16" x2="162.56" y2="-137.16" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="/OE"/>
<wire x1="162.56" y1="-137.16" x2="162.56" y2="-129.54" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="DIR_H_TO_L"/>
<wire x1="162.56" y1="-127" x2="162.56" y2="-129.54" width="0.1524" layer="91"/>
<junction x="162.56" y="-129.54"/>
<pinref part="GND15" gate="1" pin="GND"/>
<junction x="139.7" y="-137.16"/>
<wire x1="137.16" y1="-137.16" x2="139.7" y2="-137.16" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="IO_VL7"/>
<wire x1="162.56" y1="-127" x2="162.56" y2="-121.92" width="0.1524" layer="91"/>
<junction x="162.56" y="-127"/>
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="2"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="GND27" gate="1" pin="GND"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="104.14" y1="38.1" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<wire x1="104.14" y1="35.56" x2="104.14" y2="38.1" width="0.1524" layer="91"/>
<wire x1="104.14" y1="33.02" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<wire x1="104.14" y1="30.48" x2="104.14" y2="33.02" width="0.1524" layer="91"/>
<wire x1="104.14" y1="27.94" x2="104.14" y2="30.48" width="0.1524" layer="91"/>
<wire x1="104.14" y1="25.4" x2="104.14" y2="27.94" width="0.1524" layer="91"/>
<wire x1="104.14" y1="22.86" x2="104.14" y2="25.4" width="0.1524" layer="91"/>
<wire x1="104.14" y1="40.64" x2="104.14" y2="43.18" width="0.1524" layer="91"/>
<wire x1="104.14" y1="43.18" x2="106.68" y2="43.18" width="0.1524" layer="91"/>
<wire x1="106.68" y1="43.18" x2="114.3" y2="43.18" width="0.1524" layer="91"/>
<wire x1="114.3" y1="43.18" x2="121.92" y2="43.18" width="0.1524" layer="91"/>
<wire x1="121.92" y1="43.18" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<wire x1="129.54" y1="43.18" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<wire x1="137.16" y1="43.18" x2="144.78" y2="43.18" width="0.1524" layer="91"/>
<wire x1="144.78" y1="43.18" x2="152.4" y2="43.18" width="0.1524" layer="91"/>
<wire x1="152.4" y1="43.18" x2="152.4" y2="40.64" width="0.1524" layer="91"/>
<wire x1="152.4" y1="43.18" x2="160.02" y2="43.18" width="0.1524" layer="91"/>
<wire x1="160.02" y1="43.18" x2="172.72" y2="43.18" width="0.1524" layer="91"/>
<wire x1="106.68" y1="25.4" x2="106.68" y2="43.18" width="0.1524" layer="91"/>
<wire x1="114.3" y1="27.94" x2="114.3" y2="43.18" width="0.1524" layer="91"/>
<wire x1="121.92" y1="30.48" x2="121.92" y2="43.18" width="0.1524" layer="91"/>
<wire x1="129.54" y1="33.02" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<wire x1="137.16" y1="35.56" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<wire x1="144.78" y1="38.1" x2="144.78" y2="43.18" width="0.1524" layer="91"/>
<junction x="104.14" y="38.1"/>
<junction x="104.14" y="35.56"/>
<junction x="104.14" y="33.02"/>
<junction x="104.14" y="30.48"/>
<junction x="104.14" y="27.94"/>
<junction x="104.14" y="25.4"/>
<junction x="160.02" y="43.18"/>
<junction x="106.68" y="43.18"/>
<junction x="114.3" y="43.18"/>
<junction x="121.92" y="43.18"/>
<junction x="129.54" y="43.18"/>
<junction x="137.16" y="43.18"/>
<junction x="144.78" y="43.18"/>
<junction x="152.4" y="43.18"/>
<junction x="104.14" y="40.64"/>
<pinref part="IC2" gate="G$1" pin="VCC@1"/>
<pinref part="IC2" gate="G$1" pin="VCC@2"/>
<pinref part="IC2" gate="G$1" pin="VCC@3"/>
<pinref part="IC2" gate="G$1" pin="VCC@4"/>
<pinref part="IC2" gate="G$1" pin="VCC@5"/>
<pinref part="IC2" gate="G$1" pin="VCC@6"/>
<pinref part="IC2" gate="G$1" pin="VCC@7"/>
<pinref part="IC2" gate="G$1" pin="VCC@8"/>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="C16" gate="G$1" pin="1"/>
<pinref part="C15" gate="G$1" pin="1"/>
<pinref part="C14" gate="G$1" pin="1"/>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="C12" gate="G$1" pin="1"/>
<pinref part="C11" gate="G$1" pin="1"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="134.62" y1="55.88" x2="124.46" y2="55.88" width="0.1524" layer="91"/>
<wire x1="124.46" y1="55.88" x2="114.3" y2="55.88" width="0.1524" layer="91"/>
<wire x1="114.3" y1="55.88" x2="114.3" y2="48.26" width="0.1524" layer="91"/>
<wire x1="114.3" y1="48.26" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<wire x1="104.14" y1="45.72" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<junction x="134.62" y="55.88"/>
<junction x="124.46" y="55.88"/>
<junction x="104.14" y="48.26"/>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="+3V15" gate="G$1" pin="+3V3"/>
<pinref part="IC2" gate="G$1" pin="AVCC-A"/>
<pinref part="IC2" gate="G$1" pin="AVCC-B"/>
<pinref part="C7" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<wire x1="162.56" y1="170.18" x2="162.56" y2="167.64" width="0.1524" layer="91"/>
<wire x1="162.56" y1="167.64" x2="162.56" y2="157.48" width="0.1524" layer="91"/>
<wire x1="162.56" y1="157.48" x2="160.02" y2="157.48" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="152.4" y1="160.02" x2="160.02" y2="160.02" width="0.1524" layer="91"/>
<wire x1="160.02" y1="160.02" x2="160.02" y2="167.64" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="160.02" y1="167.64" x2="162.56" y2="167.64" width="0.1524" layer="91"/>
<junction x="162.56" y="167.64"/>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="139.7" y1="149.86" x2="162.56" y2="149.86" width="0.1524" layer="91"/>
<wire x1="162.56" y1="149.86" x2="162.56" y2="157.48" width="0.1524" layer="91"/>
<junction x="162.56" y="157.48"/>
<pinref part="R19" gate="G$1" pin="2"/>
<wire x1="152.4" y1="147.32" x2="162.56" y2="147.32" width="0.1524" layer="91"/>
<wire x1="162.56" y1="147.32" x2="162.56" y2="149.86" width="0.1524" layer="91"/>
<junction x="162.56" y="149.86"/>
</segment>
<segment>
<wire x1="228.6" y1="154.94" x2="233.68" y2="154.94" width="0.1524" layer="91"/>
<wire x1="233.68" y1="154.94" x2="233.68" y2="157.48" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="VCC"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="474.98" y1="-142.24" x2="464.82" y2="-142.24" width="0.1524" layer="91"/>
<wire x1="464.82" y1="-142.24" x2="464.82" y2="-139.7" width="0.1524" layer="91"/>
<wire x1="474.98" y1="-142.24" x2="490.22" y2="-142.24" width="0.1524" layer="91"/>
<junction x="464.82" y="-142.24"/>
<junction x="474.98" y="-142.24"/>
<pinref part="C22" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="VOUT@1"/>
<pinref part="IC3" gate="G$1" pin="VOUT@0"/>
<pinref part="+3V17" gate="G$1" pin="+3V3"/>
<pinref part="C44" gate="G$1" pin="1"/>
<junction x="490.22" y="-142.24"/>
</segment>
<segment>
<wire x1="457.2" y1="147.32" x2="457.2" y2="144.78" width="0.1524" layer="91"/>
<wire x1="452.12" y1="142.24" x2="452.12" y2="144.78" width="0.1524" layer="91"/>
<wire x1="452.12" y1="144.78" x2="457.2" y2="144.78" width="0.1524" layer="91"/>
<wire x1="457.2" y1="144.78" x2="462.28" y2="144.78" width="0.1524" layer="91"/>
<junction x="457.2" y="144.78"/>
<pinref part="+3V24" gate="G$1" pin="+3V3"/>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="P" pin="VCC"/>
</segment>
<segment>
<pinref part="+3V14" gate="G$1" pin="+3V3"/>
<pinref part="R15" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<pinref part="C28" gate="G$1" pin="1"/>
<wire x1="177.8" y1="-22.86" x2="177.8" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-20.32" x2="205.74" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="IC11" gate="G$1" pin="VCCA"/>
<wire x1="205.74" y1="-20.32" x2="205.74" y2="-27.94" width="0.1524" layer="91"/>
<junction x="205.74" y="-20.32"/>
</segment>
<segment>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<wire x1="213.36" y1="-83.82" x2="213.36" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-81.28" x2="213.36" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-81.28" x2="198.12" y2="-81.28" width="0.1524" layer="91"/>
<junction x="213.36" y="-81.28"/>
<pinref part="C26" gate="G$1" pin="1"/>
<pinref part="IC10" gate="G$1" pin="VCCA"/>
</segment>
<segment>
<pinref part="+3V7" gate="G$1" pin="+3V3"/>
<wire x1="144.78" y1="-93.98" x2="144.78" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="144.78" y1="-83.82" x2="144.78" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-93.98" x2="142.24" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-83.82" x2="144.78" y2="-83.82" width="0.1524" layer="91"/>
<junction x="144.78" y="-83.82"/>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="157.48" y1="-83.82" x2="144.78" y2="-83.82" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VL@0"/>
<pinref part="IC6" gate="G$1" pin="VL@1"/>
</segment>
<segment>
<pinref part="+3V8" gate="G$1" pin="+3V3"/>
<wire x1="7.62" y1="101.6" x2="7.62" y2="99.06" width="0.1524" layer="91"/>
<wire x1="7.62" y1="99.06" x2="12.7" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="ADCB0" gate="G$1" pin="2"/>
<wire x1="73.66" y1="-20.32" x2="76.2" y2="-20.32" width="0.1524" layer="91"/>
<label x="73.66" y="-20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB1" gate="G$1" pin="2"/>
<wire x1="73.66" y1="-33.02" x2="76.2" y2="-33.02" width="0.1524" layer="91"/>
<label x="73.66" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB2" gate="G$1" pin="2"/>
<wire x1="73.66" y1="-45.72" x2="76.2" y2="-45.72" width="0.1524" layer="91"/>
<label x="73.66" y="-45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="ADCB3" gate="G$1" pin="2"/>
<wire x1="73.66" y1="-58.42" x2="76.2" y2="-58.42" width="0.1524" layer="91"/>
<label x="73.66" y="-58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC0" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-96.52" x2="78.74" y2="-96.52" width="0.1524" layer="91"/>
<label x="76.2" y="-96.52" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC1" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-109.22" x2="78.74" y2="-109.22" width="0.1524" layer="91"/>
<label x="76.2" y="-109.22" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC2" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-121.92" x2="78.74" y2="-121.92" width="0.1524" layer="91"/>
<label x="76.2" y="-121.92" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC3" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-134.62" x2="78.74" y2="-134.62" width="0.1524" layer="91"/>
<label x="76.2" y="-134.62" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="294.64" y1="-220.98" x2="317.5" y2="-220.98" width="0.1524" layer="91"/>
<label x="304.8" y="-220.98" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-5" pin="S"/>
</segment>
</net>
<net name="/RESET_3V3" class="0">
<segment>
<wire x1="40.64" y1="35.56" x2="25.4" y2="35.56" width="0.1524" layer="91"/>
<label x="25.4" y="35.56" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PDI-CLK/!RESET"/>
<pinref part="R15" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="203.2" y1="149.86" x2="182.88" y2="149.86" width="0.1524" layer="91"/>
<label x="182.88" y="149.86" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="CLK"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<wire x1="27.94" y1="20.32" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<wire x1="27.94" y1="20.32" x2="27.94" y2="30.48" width="0.1524" layer="91"/>
<wire x1="27.94" y1="30.48" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<junction x="27.94" y="20.32"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="PR0(XTAL2)"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<wire x1="40.64" y1="25.4" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="25.4" x2="38.1" y2="20.32" width="0.1524" layer="91"/>
<wire x1="35.56" y1="20.32" x2="38.1" y2="20.32" width="0.1524" layer="91"/>
<junction x="38.1" y="20.32"/>
<pinref part="IC2" gate="G$1" pin="PR1(XTAL1)"/>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="Q1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$91" class="0">
<segment>
<wire x1="162.56" y1="124.46" x2="187.96" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="L_A0" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$92" class="0">
<segment>
<wire x1="175.26" y1="121.92" x2="198.12" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="L_A1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$93" class="0">
<segment>
<wire x1="187.96" y1="119.38" x2="208.28" y2="119.38" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="L_A2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<wire x1="200.66" y1="116.84" x2="218.44" y2="116.84" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="L_A3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="RX_3V3" class="0">
<segment>
<wire x1="142.24" y1="160.02" x2="104.14" y2="160.02" width="0.1524" layer="91"/>
<label x="106.68" y="160.02" size="1.778" layer="95"/>
<pinref part="R3" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PF2(OC0C/RXD0)"/>
</segment>
<segment>
<wire x1="345.44" y1="104.14" x2="373.38" y2="104.14" width="0.1524" layer="91"/>
<label x="365.76" y="104.14" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="474.98" y1="91.44" x2="495.3" y2="91.44" width="0.1524" layer="91"/>
<label x="495.3" y="91.44" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1OUT"/>
</segment>
</net>
<net name="TX_3V3" class="0">
<segment>
<label x="106.68" y="157.48" size="1.778" layer="95"/>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PF3(OC0D/TXD0)"/>
<wire x1="104.14" y1="157.48" x2="149.86" y2="157.48" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="345.44" y1="106.68" x2="373.38" y2="106.68" width="0.1524" layer="91"/>
<label x="365.76" y="106.68" size="1.778" layer="95"/>
<pinref part="R14" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="474.98" y1="96.52" x2="495.3" y2="96.52" width="0.1524" layer="91"/>
<wire x1="474.98" y1="93.98" x2="474.98" y2="96.52" width="0.1524" layer="91"/>
<junction x="474.98" y="96.52"/>
<label x="495.3" y="96.52" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1IN"/>
<pinref part="IC1" gate="G$1" pin="T2IN"/>
</segment>
</net>
<net name="PDI_DATA_3V3" class="0">
<segment>
<wire x1="40.64" y1="40.64" x2="20.32" y2="40.64" width="0.1524" layer="91"/>
<label x="20.32" y="40.64" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PDI-DATA"/>
</segment>
<segment>
<wire x1="203.2" y1="154.94" x2="182.88" y2="154.94" width="0.1524" layer="91"/>
<label x="182.88" y="154.94" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="DATA"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="P+3" gate="1" pin="+5V"/>
<pinref part="C27" gate="G$1" pin="1"/>
<wire x1="233.68" y1="-20.32" x2="226.06" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="226.06" y1="-20.32" x2="210.82" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="226.06" y1="-27.94" x2="226.06" y2="-20.32" width="0.1524" layer="91"/>
<junction x="226.06" y="-20.32"/>
<pinref part="IC11" gate="G$1" pin="VCCB"/>
<wire x1="210.82" y1="-27.94" x2="210.82" y2="-20.32" width="0.1524" layer="91"/>
<junction x="210.82" y="-20.32"/>
</segment>
<segment>
<pinref part="P+5" gate="1" pin="+5V"/>
<wire x1="218.44" y1="-83.82" x2="218.44" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-81.28" x2="218.44" y2="-78.74" width="0.1524" layer="91"/>
<junction x="218.44" y="-81.28"/>
<wire x1="218.44" y1="-81.28" x2="231.14" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="1"/>
<pinref part="IC10" gate="G$1" pin="VCCB"/>
</segment>
<segment>
<pinref part="P+6" gate="1" pin="+5V"/>
<wire x1="137.16" y1="-93.98" x2="137.16" y2="-83.82" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="137.16" y1="-83.82" x2="137.16" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="121.92" y1="-83.82" x2="137.16" y2="-83.82" width="0.1524" layer="91"/>
<junction x="137.16" y="-83.82"/>
<pinref part="IC6" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-5" pin="S"/>
<wire x1="226.06" y1="-147.32" x2="231.14" y2="-147.32" width="0.1524" layer="91"/>
<label x="226.06" y="-147.32" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="416.56" y1="-142.24" x2="416.56" y2="-139.7" width="0.1524" layer="91"/>
<wire x1="416.56" y1="-139.7" x2="441.96" y2="-139.7" width="0.1524" layer="91"/>
<wire x1="416.56" y1="-139.7" x2="406.4" y2="-139.7" width="0.1524" layer="91"/>
<junction x="416.56" y="-139.7"/>
<pinref part="IC3" gate="G$1" pin="VIN"/>
<pinref part="C21" gate="G$1" pin="1"/>
<pinref part="P+2" gate="1" pin="+5V"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="406.4" y1="-142.24" x2="406.4" y2="-139.7" width="0.1524" layer="91"/>
<junction x="406.4" y="-139.7"/>
</segment>
<segment>
<wire x1="480.06" y1="-76.2" x2="485.14" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="485.14" y1="-76.2" x2="495.3" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="495.3" y1="-76.2" x2="502.92" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="502.92" y1="-76.2" x2="515.62" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="495.3" y1="-81.28" x2="495.3" y2="-76.2" width="0.1524" layer="91"/>
<junction x="495.3" y="-76.2"/>
<pinref part="C40" gate="G$1" pin="+"/>
<pinref part="C41" gate="G$1" pin="+"/>
<wire x1="502.92" y1="-81.28" x2="502.92" y2="-76.2" width="0.1524" layer="91"/>
<junction x="502.92" y="-76.2"/>
<pinref part="L2" gate="G$1" pin="2"/>
<pinref part="R27" gate="G$1" pin="2"/>
<junction x="485.14" y="-76.2"/>
<pinref part="P+1" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="1"/>
<wire x1="10.16" y1="-231.14" x2="10.16" y2="-213.36" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="VCC"/>
<wire x1="10.16" y1="-213.36" x2="25.4" y2="-213.36" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-213.36" x2="45.72" y2="-213.36" width="0.1524" layer="91"/>
<wire x1="45.72" y1="-213.36" x2="45.72" y2="-215.9" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="25.4" y1="-220.98" x2="25.4" y2="-213.36" width="0.1524" layer="91"/>
<junction x="25.4" y="-213.36"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<junction x="10.16" y="-213.36"/>
</segment>
<segment>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="10.16" y1="-276.86" x2="10.16" y2="-259.08" width="0.1524" layer="91"/>
<pinref part="IC8" gate="G$1" pin="VCC"/>
<wire x1="10.16" y1="-259.08" x2="25.4" y2="-259.08" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-259.08" x2="45.72" y2="-259.08" width="0.1524" layer="91"/>
<wire x1="45.72" y1="-259.08" x2="45.72" y2="-261.62" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="25.4" y1="-266.7" x2="25.4" y2="-259.08" width="0.1524" layer="91"/>
<junction x="25.4" y="-259.08"/>
<pinref part="P+7" gate="1" pin="+5V"/>
<junction x="10.16" y="-259.08"/>
</segment>
<segment>
<wire x1="294.64" y1="-223.52" x2="317.5" y2="-223.52" width="0.1524" layer="91"/>
<label x="304.8" y="-223.52" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="294.64" y1="-238.76" x2="317.5" y2="-238.76" width="0.1524" layer="91"/>
<label x="304.8" y="-238.76" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-12" pin="S"/>
</segment>
<segment>
<pinref part="PWMD0" gate="G$1" pin="2"/>
<wire x1="109.22" y1="-22.86" x2="111.76" y2="-22.86" width="0.1524" layer="91"/>
<label x="109.22" y="-22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMD1" gate="G$1" pin="2"/>
<wire x1="109.22" y1="-38.1" x2="111.76" y2="-38.1" width="0.1524" layer="91"/>
<label x="109.22" y="-38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMD2" gate="G$1" pin="2"/>
<wire x1="109.22" y1="-53.34" x2="111.76" y2="-53.34" width="0.1524" layer="91"/>
<label x="109.22" y="-53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PWMC4" gate="G$1" pin="2"/>
<wire x1="109.22" y1="-68.58" x2="111.76" y2="-68.58" width="0.1524" layer="91"/>
<label x="109.22" y="-68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C29" gate="G$1" pin="1"/>
<wire x1="7.62" y1="-101.6" x2="7.62" y2="-96.52" width="0.1524" layer="91"/>
<label x="7.62" y="-99.06" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="C30" gate="G$1" pin="1"/>
<wire x1="12.7" y1="-88.9" x2="12.7" y2="-83.82" width="0.1524" layer="91"/>
<label x="12.7" y="-86.36" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="C35" gate="G$1" pin="1"/>
<wire x1="17.78" y1="-73.66" x2="17.78" y2="-68.58" width="0.1524" layer="91"/>
<label x="17.78" y="-71.12" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="1"/>
<wire x1="7.62" y1="-55.88" x2="7.62" y2="-50.8" width="0.1524" layer="91"/>
<label x="7.62" y="-53.34" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="1"/>
<wire x1="12.7" y1="-43.18" x2="12.7" y2="-38.1" width="0.1524" layer="91"/>
<label x="12.7" y="-40.64" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="487.68" y1="119.38" x2="474.98" y2="119.38" width="0.1524" layer="91"/>
<wire x1="474.98" y1="119.38" x2="474.98" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C1+"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="474.98" y1="111.76" x2="487.68" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="C1-"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="482.6" y1="109.22" x2="474.98" y2="109.22" width="0.1524" layer="91"/>
<wire x1="474.98" y1="109.22" x2="474.98" y2="106.68" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C2+"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="474.98" y1="101.6" x2="482.6" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="C2-"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="434.34" y1="116.84" x2="444.5" y2="116.84" width="0.1524" layer="91"/>
<wire x1="444.5" y1="116.84" x2="444.5" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="V+"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="441.96" y1="111.76" x2="444.5" y2="111.76" width="0.1524" layer="91"/>
<wire x1="444.5" y1="111.76" x2="444.5" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="V-"/>
</segment>
</net>
<net name="TX_232" class="0">
<segment>
<wire x1="304.8" y1="106.68" x2="335.28" y2="106.68" width="0.1524" layer="91"/>
<label x="320.04" y="106.68" size="1.778" layer="95"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="UART" gate="-4" pin="S"/>
</segment>
<segment>
<wire x1="444.5" y1="96.52" x2="426.72" y2="96.52" width="0.1524" layer="91"/>
<label x="439.42" y="96.52" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1OUT"/>
</segment>
</net>
<net name="RX_232" class="0">
<segment>
<wire x1="304.8" y1="104.14" x2="335.28" y2="104.14" width="0.1524" layer="91"/>
<label x="320.04" y="104.14" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="UART" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="444.5" y1="91.44" x2="426.72" y2="91.44" width="0.1524" layer="91"/>
<label x="439.42" y="91.44" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="119.38" y1="88.9" x2="160.02" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="RUN" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="132.08" y1="86.36" x2="172.72" y2="86.36" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="ERR" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="144.78" y1="83.82" x2="185.42" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="2"/>
<pinref part="COM" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="104.14" y1="88.9" x2="109.22" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK0(A0/A8/A16)"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="104.14" y1="86.36" x2="121.92" y2="86.36" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK1(A1/A9/A17)"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="104.14" y1="83.82" x2="134.62" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PK2(A2/A10/A18)"/>
</segment>
</net>
<net name="SCK_ENCODER_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PE7(TSD1/SCK/CLKO/EVO/TOSC1)"/>
<wire x1="40.64" y1="48.26" x2="12.7" y2="48.26" width="0.1524" layer="91"/>
<label x="12.7" y="48.26" size="1.778" layer="95"/>
<label x="12.7" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="162.56" y1="-119.38" x2="187.96" y2="-119.38" width="0.1524" layer="91"/>
<label x="167.64" y="-119.38" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VL6"/>
</segment>
</net>
<net name="MISO_ENCODER_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PE6(RSC1/MISO/TOSC2)"/>
<wire x1="40.64" y1="50.8" x2="12.7" y2="50.8" width="0.1524" layer="91"/>
<label x="12.7" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<label x="175.26" y="-99.06" size="1.778" layer="95"/>
<pinref part="IC10" gate="G$1" pin="A"/>
<wire x1="200.66" y1="-99.06" x2="175.26" y2="-99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CS_ENCODER_3V3" class="0">
<segment>
<wire x1="162.56" y1="-114.3" x2="187.96" y2="-114.3" width="0.1524" layer="91"/>
<label x="167.64" y="-114.3" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VL4"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PQ0(TOSC1)"/>
<wire x1="104.14" y1="63.5" x2="127" y2="63.5" width="0.1524" layer="91"/>
<label x="109.22" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI_ENCODER_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PE5(OC1B/XCK1/MOSI)"/>
<wire x1="40.64" y1="53.34" x2="12.7" y2="53.34" width="0.1524" layer="91"/>
<label x="12.7" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="162.56" y1="-116.84" x2="187.96" y2="-116.84" width="0.1524" layer="91"/>
<label x="167.64" y="-116.84" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VL5"/>
</segment>
</net>
<net name="+10V" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="480.06" y1="-25.4" x2="492.76" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="492.76" y1="-25.4" x2="500.38" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="500.38" y1="-25.4" x2="508" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="480.06" y1="-27.94" x2="480.06" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="492.76" y1="-30.48" x2="492.76" y2="-25.4" width="0.1524" layer="91"/>
<junction x="492.76" y="-25.4"/>
<label x="502.92" y="-25.4" size="1.778" layer="95"/>
<pinref part="C38" gate="G$1" pin="+"/>
<pinref part="C39" gate="G$1" pin="+"/>
<wire x1="500.38" y1="-30.48" x2="500.38" y2="-25.4" width="0.1524" layer="91"/>
<junction x="500.38" y="-25.4"/>
<pinref part="L1" gate="G$1" pin="2"/>
<wire x1="477.52" y1="-25.4" x2="480.06" y2="-25.4" width="0.1524" layer="91"/>
<junction x="480.06" y="-25.4"/>
</segment>
<segment>
<pinref part="AX12" gate="G$1" pin="3"/>
<wire x1="233.68" y1="-40.64" x2="246.38" y2="-40.64" width="0.1524" layer="91"/>
<label x="233.68" y="-40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="480.06" y1="-43.18" x2="480.06" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="480.06" y1="-40.64" x2="480.06" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="480.06" y1="-40.64" x2="454.66" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="454.66" y1="-40.64" x2="454.66" y2="-30.48" width="0.1524" layer="91"/>
<junction x="480.06" y="-40.64"/>
<wire x1="454.66" y1="-30.48" x2="452.12" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="IC5" gate="G$1" pin="FB"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="452.12" y1="-25.4" x2="464.82" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="464.82" y1="-45.72" x2="464.82" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="464.82" y1="-25.4" x2="467.36" y2="-25.4" width="0.1524" layer="91"/>
<junction x="464.82" y="-25.4"/>
<pinref part="IC5" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="452.12" y1="-76.2" x2="467.36" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="C"/>
<wire x1="467.36" y1="-96.52" x2="467.36" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="467.36" y1="-76.2" x2="469.9" y2="-76.2" width="0.1524" layer="91"/>
<junction x="467.36" y="-76.2"/>
<pinref part="IC12" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="CS_ENCODER_5V" class="0">
<segment>
<wire x1="116.84" y1="-114.3" x2="91.44" y2="-114.3" width="0.1524" layer="91"/>
<label x="91.44" y="-114.3" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC4"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-4" pin="S"/>
<wire x1="226.06" y1="-144.78" x2="231.14" y2="-144.78" width="0.1524" layer="91"/>
<label x="226.06" y="-144.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCK_ENCODER_5V" class="0">
<segment>
<wire x1="116.84" y1="-119.38" x2="91.44" y2="-119.38" width="0.1524" layer="91"/>
<label x="91.44" y="-119.38" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC6"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-2" pin="S"/>
<wire x1="226.06" y1="-139.7" x2="231.14" y2="-139.7" width="0.1524" layer="91"/>
<label x="226.06" y="-139.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI_ENCODER_5V" class="0">
<segment>
<wire x1="116.84" y1="-116.84" x2="91.44" y2="-116.84" width="0.1524" layer="91"/>
<label x="91.44" y="-116.84" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC5"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-3" pin="S"/>
<wire x1="226.06" y1="-142.24" x2="231.14" y2="-142.24" width="0.1524" layer="91"/>
<label x="226.06" y="-142.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="MISO_ENCODER_5V" class="0">
<segment>
<label x="231.14" y="-99.06" size="1.778" layer="95"/>
<pinref part="IC10" gate="G$1" pin="B"/>
<wire x1="231.14" y1="-99.06" x2="238.76" y2="-99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="AEAT_ENCOD" gate="-1" pin="S"/>
<wire x1="226.06" y1="-137.16" x2="231.14" y2="-137.16" width="0.1524" layer="91"/>
<label x="226.06" y="-137.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="AX12_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC7(SCK/TXD1/CLKO/EVO)"/>
<wire x1="40.64" y1="99.06" x2="35.56" y2="99.06" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PC6(MISO/RXD1)"/>
<wire x1="35.56" y1="99.06" x2="22.86" y2="99.06" width="0.1524" layer="91"/>
<wire x1="40.64" y1="101.6" x2="35.56" y2="101.6" width="0.1524" layer="91"/>
<wire x1="35.56" y1="101.6" x2="35.56" y2="99.06" width="0.1524" layer="91"/>
<junction x="35.56" y="99.06"/>
<label x="22.86" y="99.06" size="1.778" layer="95"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="193.04" y1="-43.18" x2="175.26" y2="-43.18" width="0.1524" layer="91"/>
<label x="175.26" y="-43.18" size="1.778" layer="95"/>
<pinref part="IC11" gate="G$1" pin="A"/>
</segment>
</net>
<net name="AX12_DIR_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC5(OC1B/MOSI/XCK1)"/>
<wire x1="40.64" y1="104.14" x2="12.7" y2="104.14" width="0.1524" layer="91"/>
<label x="12.7" y="104.14" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="193.04" y1="-48.26" x2="175.26" y2="-48.26" width="0.1524" layer="91"/>
<label x="175.26" y="-48.26" size="1.778" layer="95"/>
<pinref part="IC11" gate="G$1" pin="DIR_A_TO_B"/>
</segment>
</net>
<net name="AX12_5V" class="0">
<segment>
<label x="231.14" y="-43.18" size="1.778" layer="95"/>
<wire x1="223.52" y1="-43.18" x2="226.06" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="226.06" y1="-43.18" x2="246.38" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="226.06" y1="-38.1" x2="226.06" y2="-43.18" width="0.1524" layer="91"/>
<junction x="226.06" y="-43.18"/>
<pinref part="R17" gate="G$1" pin="1"/>
<pinref part="IC11" gate="G$1" pin="B"/>
<pinref part="AX12" gate="G$1" pin="2"/>
</segment>
</net>
<net name="PWM_D0_5V" class="0">
<segment>
<wire x1="116.84" y1="-104.14" x2="101.6" y2="-104.14" width="0.1524" layer="91"/>
<label x="101.6" y="-104.14" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC0"/>
</segment>
<segment>
<pinref part="PWMD0" gate="G$1" pin="3"/>
<wire x1="109.22" y1="-20.32" x2="111.76" y2="-20.32" width="0.1524" layer="91"/>
<label x="109.22" y="-20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_D1_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD1(OC0B/XCK0/SCL)"/>
<wire x1="40.64" y1="88.9" x2="12.7" y2="88.9" width="0.1524" layer="91"/>
<label x="12.7" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL1"/>
<wire x1="162.56" y1="-106.68" x2="180.34" y2="-106.68" width="0.1524" layer="91"/>
<label x="167.64" y="-106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_C4_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC4(OC1A/!SS!)"/>
<wire x1="40.64" y1="106.68" x2="12.7" y2="106.68" width="0.1524" layer="91"/>
<label x="12.7" y="106.68" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL3"/>
<wire x1="162.56" y1="-111.76" x2="180.34" y2="-111.76" width="0.1524" layer="91"/>
<label x="167.64" y="-111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_D0_3V3" class="0">
<segment>
<wire x1="162.56" y1="-104.14" x2="180.34" y2="-104.14" width="0.1524" layer="91"/>
<label x="167.64" y="-104.14" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VL0"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD0(OC0A/SDA)"/>
<wire x1="40.64" y1="91.44" x2="12.7" y2="91.44" width="0.1524" layer="91"/>
<label x="12.7" y="91.44" size="1.778" layer="95"/>
<label x="12.7" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="PA0" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA0(ADCA0/AREFA)"/>
<wire x1="40.64" y1="167.64" x2="27.94" y2="167.64" width="0.1524" layer="91"/>
<label x="27.94" y="167.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="152.4" y1="124.46" x2="139.7" y2="124.46" width="0.1524" layer="91"/>
<label x="139.7" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="PA1" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA1(ADCA1)"/>
<wire x1="40.64" y1="165.1" x2="27.94" y2="165.1" width="0.1524" layer="91"/>
<label x="27.94" y="165.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="165.1" y1="121.92" x2="139.7" y2="121.92" width="0.1524" layer="91"/>
<label x="139.7" y="121.92" size="1.778" layer="95"/>
</segment>
</net>
<net name="PA2" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA2(ADCA2)"/>
<wire x1="40.64" y1="162.56" x2="27.94" y2="162.56" width="0.1524" layer="91"/>
<label x="27.94" y="162.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="177.8" y1="119.38" x2="139.7" y2="119.38" width="0.1524" layer="91"/>
<label x="139.7" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="PA3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA3(ADCA3)"/>
<wire x1="40.64" y1="160.02" x2="27.94" y2="160.02" width="0.1524" layer="91"/>
<label x="27.94" y="160.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="190.5" y1="116.84" x2="139.7" y2="116.84" width="0.1524" layer="91"/>
<label x="139.7" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_CAM_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PF6(RXD1/MISO)"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="104.14" y1="149.86" x2="129.54" y2="149.86" width="0.1524" layer="91"/>
<label x="106.68" y="149.86" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="-165.1" x2="142.24" y2="-165.1" width="0.1524" layer="91"/>
<label x="134.62" y="-165.1" size="1.778" layer="95"/>
<pinref part="UART_CAM" gate="-2" pin="S"/>
</segment>
</net>
<net name="TX_CAM_3V3" class="0">
<segment>
<pinref part="R19" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PF7(TXD1/SCK)"/>
<wire x1="142.24" y1="147.32" x2="104.14" y2="147.32" width="0.1524" layer="91"/>
<label x="106.68" y="147.32" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="-162.56" x2="142.24" y2="-162.56" width="0.1524" layer="91"/>
<label x="134.62" y="-162.56" size="1.778" layer="95"/>
<pinref part="UART_CAM" gate="-3" pin="S"/>
</segment>
</net>
<net name="ADCB0" class="0">
<segment>
<pinref part="ADCB0" gate="G$1" pin="3"/>
<wire x1="73.66" y1="-17.78" x2="76.2" y2="-17.78" width="0.1524" layer="91"/>
<label x="73.66" y="-17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PB0(ADCB0/AREFB)"/>
<wire x1="40.64" y1="142.24" x2="12.7" y2="142.24" width="0.1524" layer="91"/>
<label x="33.02" y="142.24" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="ADCB1" class="0">
<segment>
<pinref part="ADCB1" gate="G$1" pin="3"/>
<wire x1="73.66" y1="-30.48" x2="76.2" y2="-30.48" width="0.1524" layer="91"/>
<label x="73.66" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PB1(ADCB1)"/>
<wire x1="40.64" y1="139.7" x2="12.7" y2="139.7" width="0.1524" layer="91"/>
<label x="33.02" y="139.7" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="ADCB2" class="0">
<segment>
<pinref part="ADCB2" gate="G$1" pin="3"/>
<wire x1="73.66" y1="-43.18" x2="76.2" y2="-43.18" width="0.1524" layer="91"/>
<label x="73.66" y="-43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PB2(ADCB2/DAC0)"/>
<wire x1="40.64" y1="137.16" x2="12.7" y2="137.16" width="0.1524" layer="91"/>
<label x="33.02" y="137.16" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="ADCB3" class="0">
<segment>
<pinref part="ADCB3" gate="G$1" pin="3"/>
<wire x1="73.66" y1="-55.88" x2="76.2" y2="-55.88" width="0.1524" layer="91"/>
<label x="73.66" y="-55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PB3(ADCB3/DAC1)"/>
<wire x1="40.64" y1="134.62" x2="12.7" y2="134.62" width="0.1524" layer="91"/>
<label x="33.02" y="134.62" size="1.778" layer="95" rot="MR0"/>
</segment>
</net>
<net name="PC0_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC0(OC0A/SDA)"/>
<wire x1="40.64" y1="116.84" x2="12.7" y2="116.84" width="0.1524" layer="91"/>
<label x="27.94" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC0" gate="G$1" pin="3"/>
<wire x1="76.2" y1="-93.98" x2="78.74" y2="-93.98" width="0.1524" layer="91"/>
<label x="76.2" y="-93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC1_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC1(OC0B/XCK0/SCL)"/>
<wire x1="40.64" y1="114.3" x2="12.7" y2="114.3" width="0.1524" layer="91"/>
<label x="27.94" y="114.3" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC1" gate="G$1" pin="3"/>
<wire x1="76.2" y1="-106.68" x2="78.74" y2="-106.68" width="0.1524" layer="91"/>
<label x="76.2" y="-106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC2_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC2(OC0C/RXD0)"/>
<wire x1="40.64" y1="111.76" x2="12.7" y2="111.76" width="0.1524" layer="91"/>
<label x="27.94" y="111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC2" gate="G$1" pin="3"/>
<wire x1="76.2" y1="-119.38" x2="78.74" y2="-119.38" width="0.1524" layer="91"/>
<label x="76.2" y="-119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="PC3_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PC3(OC0D/TXD0)"/>
<wire x1="40.64" y1="109.22" x2="12.7" y2="109.22" width="0.1524" layer="91"/>
<label x="27.94" y="109.22" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PC3" gate="G$1" pin="3"/>
<wire x1="76.2" y1="-132.08" x2="78.74" y2="-132.08" width="0.1524" layer="91"/>
<label x="76.2" y="-132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="PW" class="0">
<segment>
<wire x1="431.8" y1="-76.2" x2="406.4" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="406.4" y1="-76.2" x2="386.08" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="406.4" y1="-81.28" x2="406.4" y2="-76.2" width="0.1524" layer="91"/>
<junction x="406.4" y="-76.2"/>
<pinref part="C43" gate="G$1" pin="+"/>
<wire x1="373.38" y1="-50.8" x2="386.08" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="386.08" y1="-50.8" x2="386.08" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="431.8" y1="-25.4" x2="403.86" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-25.4" x2="386.08" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-30.48" x2="403.86" y2="-25.4" width="0.1524" layer="91"/>
<junction x="403.86" y="-25.4"/>
<pinref part="C42" gate="G$1" pin="+"/>
<wire x1="386.08" y1="-50.8" x2="386.08" y2="-25.4" width="0.1524" layer="91"/>
<junction x="386.08" y="-50.8"/>
<pinref part="D3" gate="G$1" pin="C"/>
<label x="375.92" y="-50.8" size="1.778" layer="95"/>
<pinref part="IC12" gate="G$1" pin="IN"/>
<pinref part="IC5" gate="G$1" pin="IN"/>
</segment>
<segment>
<pinref part="D5" gate="G$1" pin="C"/>
<wire x1="185.42" y1="-228.6" x2="185.42" y2="-220.98" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-220.98" x2="233.68" y2="-220.98" width="0.1524" layer="91"/>
<label x="208.28" y="-220.98" size="1.778" layer="95"/>
<pinref part="VPMP0" gate="G$1" pin="2"/>
<wire x1="233.68" y1="-226.06" x2="233.68" y2="-220.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D4" gate="G$1" pin="C"/>
<wire x1="185.42" y1="-281.94" x2="185.42" y2="-274.32" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-274.32" x2="233.68" y2="-274.32" width="0.1524" layer="91"/>
<label x="208.28" y="-274.32" size="1.778" layer="95"/>
<pinref part="VPMP1" gate="G$1" pin="2"/>
<wire x1="233.68" y1="-279.4" x2="233.68" y2="-274.32" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="340.36" y1="-309.88" x2="297.18" y2="-309.88" width="0.1524" layer="91"/>
<pinref part="COLOR_SENS" gate="-7" pin="S"/>
<label x="337.82" y="-309.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="452.12" y1="-81.28" x2="454.66" y2="-81.28" width="0.1524" layer="91"/>
<wire x1="454.66" y1="-81.28" x2="454.66" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="454.66" y1="-86.36" x2="485.14" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="485.14" y1="-86.36" x2="485.14" y2="-96.52" width="0.1524" layer="91"/>
<pinref part="R27" gate="G$1" pin="1"/>
<junction x="485.14" y="-86.36"/>
<pinref part="R24" gate="G$1" pin="2"/>
<pinref part="IC12" gate="G$1" pin="FB"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="D3" gate="G$1" pin="A1"/>
<pinref part="D3" gate="G$1" pin="A2"/>
<wire x1="365.76" y1="-53.34" x2="365.76" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="365.76" y1="-50.8" x2="365.76" y2="-48.26" width="0.1524" layer="91"/>
<wire x1="355.6" y1="-50.8" x2="365.76" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="PW_BAT" gate="G$1" pin="1"/>
<junction x="365.76" y="-50.8"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="2"/>
<pinref part="IC4" gate="G$1" pin="PRESSURE_VOUT"/>
<wire x1="71.12" y1="-231.14" x2="68.58" y2="-231.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VACCUM_PRESSURE_0_0-1V" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="1"/>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-231.14" x2="86.36" y2="-231.14" width="0.1524" layer="91"/>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="86.36" y1="-231.14" x2="93.98" y2="-231.14" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-231.14" x2="116.84" y2="-231.14" width="0.1524" layer="91"/>
<label x="101.6" y="-231.14" size="1.778" layer="95"/>
<junction x="86.36" y="-231.14"/>
<junction x="93.98" y="-231.14"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA4(ADCA4)"/>
<wire x1="40.64" y1="157.48" x2="10.16" y2="157.48" width="0.1524" layer="91"/>
<label x="5.08" y="157.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="2"/>
<pinref part="IC8" gate="G$1" pin="PRESSURE_VOUT"/>
<wire x1="71.12" y1="-276.86" x2="68.58" y2="-276.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VACCUM_PRESSURE_1_0-1V" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="1"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-276.86" x2="86.36" y2="-276.86" width="0.1524" layer="91"/>
<pinref part="C34" gate="G$1" pin="1"/>
<wire x1="86.36" y1="-276.86" x2="93.98" y2="-276.86" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-276.86" x2="116.84" y2="-276.86" width="0.1524" layer="91"/>
<label x="101.6" y="-276.86" size="1.778" layer="95"/>
<junction x="86.36" y="-276.86"/>
<junction x="93.98" y="-276.86"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA5(ADCA5)"/>
<wire x1="40.64" y1="154.94" x2="10.16" y2="154.94" width="0.1524" layer="91"/>
<label x="5.08" y="154.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="VACUUM_PUMP_0_VOLTAGE_MONITOR_0-1V" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R26" gate="G$1" pin="1"/>
<wire x1="195.58" y1="-243.84" x2="203.2" y2="-243.84" width="0.1524" layer="91"/>
<label x="200.66" y="-243.84" size="1.778" layer="95"/>
<junction x="195.58" y="-243.84"/>
<pinref part="C46" gate="G$1" pin="1"/>
<wire x1="203.2" y1="-243.84" x2="233.68" y2="-243.84" width="0.1524" layer="91"/>
<junction x="203.2" y="-243.84"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA6(ADCA6)"/>
<wire x1="40.64" y1="152.4" x2="7.62" y2="152.4" width="0.1524" layer="91"/>
<wire x1="5.08" y1="152.4" x2="7.62" y2="152.4" width="0.1524" layer="91"/>
<label x="5.08" y="152.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="VACUUM_PUMP_0" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="2"/>
<pinref part="D5" gate="G$1" pin="A"/>
<wire x1="185.42" y1="-233.68" x2="195.58" y2="-233.68" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-233.68" x2="233.68" y2="-233.68" width="0.1524" layer="91"/>
<junction x="195.58" y="-233.68"/>
<pinref part="T1" gate="G$1" pin="D"/>
<wire x1="185.42" y1="-236.22" x2="185.42" y2="-233.68" width="0.1524" layer="91"/>
<junction x="185.42" y="-233.68"/>
<label x="208.28" y="-233.68" size="1.778" layer="95"/>
<pinref part="VPMP0" gate="G$1" pin="1"/>
<wire x1="233.68" y1="-233.68" x2="233.68" y2="-228.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VACUUM_PUMP_0_CMD_3V3" class="0">
<segment>
<wire x1="139.7" y1="-243.84" x2="170.18" y2="-243.84" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="170.18" y1="-243.84" x2="180.34" y2="-243.84" width="0.1524" layer="91"/>
<junction x="170.18" y="-243.84"/>
<pinref part="T1" gate="G$1" pin="G"/>
<label x="139.7" y="-243.84" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD4(OC1A/!SS!)"/>
<wire x1="40.64" y1="81.28" x2="5.08" y2="81.28" width="0.1524" layer="91"/>
<label x="5.08" y="81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="VACUUM_PUMP_1" class="0">
<segment>
<pinref part="R29" gate="G$1" pin="2"/>
<pinref part="D4" gate="G$1" pin="A"/>
<wire x1="185.42" y1="-287.02" x2="195.58" y2="-287.02" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-287.02" x2="233.68" y2="-287.02" width="0.1524" layer="91"/>
<junction x="195.58" y="-287.02"/>
<pinref part="T2" gate="G$1" pin="D"/>
<wire x1="185.42" y1="-289.56" x2="185.42" y2="-287.02" width="0.1524" layer="91"/>
<junction x="185.42" y="-287.02"/>
<label x="208.28" y="-287.02" size="1.778" layer="95"/>
<pinref part="VPMP1" gate="G$1" pin="1"/>
<wire x1="233.68" y1="-287.02" x2="233.68" y2="-281.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VACUUM_PUMP_1_VOLTAGE_MONITOR_0-1V" class="0">
<segment>
<pinref part="R28" gate="G$1" pin="2"/>
<pinref part="R29" gate="G$1" pin="1"/>
<wire x1="195.58" y1="-297.18" x2="203.2" y2="-297.18" width="0.1524" layer="91"/>
<label x="200.66" y="-297.18" size="1.778" layer="95"/>
<junction x="195.58" y="-297.18"/>
<pinref part="C45" gate="G$1" pin="1"/>
<wire x1="203.2" y1="-297.18" x2="233.68" y2="-297.18" width="0.1524" layer="91"/>
<junction x="203.2" y="-297.18"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA7/(ADCA7/AC0-OUT)"/>
<wire x1="40.64" y1="149.86" x2="5.08" y2="149.86" width="0.1524" layer="91"/>
<label x="5.08" y="149.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="VACUUM_PUMP_1_CMD_3V3" class="0">
<segment>
<wire x1="139.7" y1="-297.18" x2="170.18" y2="-297.18" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="2"/>
<wire x1="170.18" y1="-297.18" x2="180.34" y2="-297.18" width="0.1524" layer="91"/>
<junction x="170.18" y="-297.18"/>
<pinref part="T2" gate="G$1" pin="G"/>
<label x="139.7" y="-297.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD5(OC1B/XCK1/MOSI)"/>
<wire x1="40.64" y1="78.74" x2="5.08" y2="78.74" width="0.1524" layer="91"/>
<label x="5.08" y="78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_VALID_OUT_3V3" class="0">
<segment>
<wire x1="342.9" y1="-335.28" x2="297.18" y2="-335.28" width="0.1524" layer="91"/>
<label x="302.26" y="-335.28" size="1.778" layer="95"/>
<pinref part="COLOR_SENS" gate="-8" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH0(!WE!)"/>
<wire x1="104.14" y1="139.7" x2="134.62" y2="139.7" width="0.1524" layer="91"/>
<label x="106.68" y="139.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA0_3V3" class="0">
<segment>
<wire x1="297.18" y1="-340.36" x2="342.9" y2="-340.36" width="0.1524" layer="91"/>
<label x="302.26" y="-340.36" size="1.778" layer="95"/>
<pinref part="COLOR_SENS" gate="-6" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH1(!CAS!/!RE!)"/>
<wire x1="104.14" y1="137.16" x2="134.62" y2="137.16" width="0.1524" layer="91"/>
<label x="106.68" y="137.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA1_3V3" class="0">
<segment>
<wire x1="297.18" y1="-345.44" x2="342.9" y2="-345.44" width="0.1524" layer="91"/>
<label x="302.26" y="-345.44" size="1.778" layer="95"/>
<pinref part="COLOR_SENS" gate="-5" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH2(!RAS!/ALE1)"/>
<wire x1="104.14" y1="134.62" x2="134.62" y2="134.62" width="0.1524" layer="91"/>
<label x="106.68" y="134.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA2_3V3" class="0">
<segment>
<wire x1="297.18" y1="-350.52" x2="342.9" y2="-350.52" width="0.1524" layer="91"/>
<label x="302.26" y="-350.52" size="1.778" layer="95"/>
<pinref part="COLOR_SENS" gate="-4" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH3(!DOM!/ALE2)"/>
<wire x1="104.14" y1="132.08" x2="134.62" y2="132.08" width="0.1524" layer="91"/>
<label x="106.68" y="132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX_COLOR_SENSOR_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)"/>
<wire x1="40.64" y1="73.66" x2="5.08" y2="73.66" width="0.1524" layer="91"/>
<label x="5.08" y="73.66" size="1.778" layer="95"/>
</segment>
<segment>
<label x="302.26" y="-320.04" size="1.778" layer="95"/>
<wire x1="297.18" y1="-320.04" x2="345.44" y2="-320.04" width="0.1524" layer="91"/>
<pinref part="COLOR_SENS" gate="-3" pin="S"/>
<pinref part="R32" gate="G$1" pin="2"/>
</segment>
</net>
<net name="RX_COLOR_SENSOR_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD6(RXD1/MISO)"/>
<wire x1="40.64" y1="76.2" x2="5.08" y2="76.2" width="0.1524" layer="91"/>
<label x="5.08" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="297.18" y1="-314.96" x2="358.14" y2="-314.96" width="0.1524" layer="91"/>
<label x="302.26" y="-314.96" size="1.778" layer="95"/>
<pinref part="COLOR_SENS" gate="-2" pin="S"/>
<pinref part="R31" gate="G$1" pin="2"/>
<wire x1="358.14" y1="-314.96" x2="358.14" y2="-320.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="ARM_MOT_PWM_3V3" class="0">
<segment>
<wire x1="294.64" y1="-213.36" x2="317.5" y2="-213.36" width="0.1524" layer="91"/>
<label x="302.26" y="-213.36" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-2" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PD3(OC0D/TXD0)"/>
<wire x1="40.64" y1="83.82" x2="12.7" y2="83.82" width="0.1524" layer="91"/>
<label x="12.7" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="ARM_MOT_DIRECTION_3V3" class="0">
<segment>
<wire x1="294.64" y1="-215.9" x2="317.5" y2="-215.9" width="0.1524" layer="91"/>
<label x="302.26" y="-215.9" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-3" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PE2(OC0C/RXD0)"/>
<wire x1="40.64" y1="60.96" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<label x="5.08" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="ARM_MOT_BRAKE_3V3" class="0">
<segment>
<wire x1="294.64" y1="-218.44" x2="317.5" y2="-218.44" width="0.1524" layer="91"/>
<label x="302.26" y="-218.44" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-4" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PE3(OC0D/TXD0)"/>
<wire x1="40.64" y1="58.42" x2="12.7" y2="58.42" width="0.1524" layer="91"/>
<label x="5.08" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="ARM_ENCODER_B_3V3" class="0">
<segment>
<wire x1="294.64" y1="-233.68" x2="317.5" y2="-233.68" width="0.1524" layer="91"/>
<label x="302.26" y="-233.68" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-10" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PE1(OC0B/XCK0/SCL)"/>
<wire x1="40.64" y1="63.5" x2="12.7" y2="63.5" width="0.1524" layer="91"/>
<label x="10.16" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="ARM_ENCODER_A_3V3" class="0">
<segment>
<wire x1="294.64" y1="-228.6" x2="317.5" y2="-228.6" width="0.1524" layer="91"/>
<label x="302.26" y="-228.6" size="1.778" layer="95"/>
<pinref part="ARM_MOT" gate="-8" pin="S"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PE0(OC0A/SDA)"/>
<wire x1="40.64" y1="66.04" x2="12.7" y2="66.04" width="0.1524" layer="91"/>
<label x="10.16" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_D1_5V" class="0">
<segment>
<wire x1="116.84" y1="-106.68" x2="101.6" y2="-106.68" width="0.1524" layer="91"/>
<label x="101.6" y="-106.68" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC1"/>
</segment>
<segment>
<pinref part="PWMD1" gate="G$1" pin="3"/>
<wire x1="109.22" y1="-35.56" x2="111.76" y2="-35.56" width="0.1524" layer="91"/>
<label x="109.22" y="-35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_D2_5V" class="0">
<segment>
<wire x1="116.84" y1="-109.22" x2="101.6" y2="-109.22" width="0.1524" layer="91"/>
<label x="101.6" y="-109.22" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC2"/>
</segment>
<segment>
<pinref part="PWMD2" gate="G$1" pin="3"/>
<wire x1="109.22" y1="-50.8" x2="111.76" y2="-50.8" width="0.1524" layer="91"/>
<label x="109.22" y="-50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_C4_5V" class="0">
<segment>
<wire x1="116.84" y1="-111.76" x2="101.6" y2="-111.76" width="0.1524" layer="91"/>
<label x="101.6" y="-111.76" size="1.778" layer="95"/>
<pinref part="IC6" gate="G$1" pin="IO_VCC3"/>
</segment>
<segment>
<pinref part="PWMC4" gate="G$1" pin="3"/>
<wire x1="109.22" y1="-66.04" x2="111.76" y2="-66.04" width="0.1524" layer="91"/>
<label x="109.22" y="-66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_D2_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PD2(OC0C/RXD0)"/>
<wire x1="40.64" y1="86.36" x2="12.7" y2="86.36" width="0.1524" layer="91"/>
<label x="12.7" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="IO_VL2"/>
<wire x1="162.56" y1="-109.22" x2="180.34" y2="-109.22" width="0.1524" layer="91"/>
<label x="167.64" y="-109.22" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,104.14,40.64,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,45.72,IC2,AVCC-B,+3V3,,,"/>
<approved hash="104,1,104.14,38.1,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,35.56,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,33.02,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,30.48,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,48.26,IC2,AVCC-A,+3V3,,,"/>
<approved hash="104,1,104.14,27.94,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,25.4,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,104.14,22.86,IC2,VCC,+3V3,,,"/>
<approved hash="104,1,462.28,144.78,IC1P,VCC,+3V3,,,"/>
</errors>
</schematic>
</drawing>
</eagle>

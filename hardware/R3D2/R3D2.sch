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
<symbol name="+12V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="+12V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+12V" x="0" y="0"/>
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
</symbols>
<devicesets>
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
<attribute name="MOUSER" value="863-MRA4004T3G" constant="no"/>
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
<attribute name="MOUSER" value="771-BZV55-C3V3T/R " constant="no"/>
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
<attribute name="MOUSER" value="660-RK73H2ATTD2700F" constant="no"/>
<attribute name="RS" value="740-9019" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0603-4.7K-E3" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW0805-4.7K-E3" constant="no"/>
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
<package name="SO8">
<description>&lt;b&gt;8-Lead Small Outline IC&lt;/b&gt; (SO-8)&lt;p&gt;
Source: http://www.analog.com/UploadedFiles/Data_Sheets/703465986AD8611_2_0.pdf</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.127" layer="21"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="-0.508" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-0.508" x2="-2.54" y2="0.508" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0.508" x2="-2.54" y2="1.27" width="0.127" layer="21"/>
<wire x1="-2.54" y1="0.508" x2="-2.54" y2="-0.508" width="0.127" layer="21" curve="-180"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1501" y1="-3.1001" x2="-1.6599" y2="-2" layer="51"/>
<rectangle x1="-0.8801" y1="-3.1001" x2="-0.3899" y2="-2" layer="51"/>
<rectangle x1="0.3899" y1="-3.1001" x2="0.8801" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="-3.1001" x2="2.1501" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="2" x2="2.1501" y2="3.1001" layer="51"/>
<rectangle x1="0.3899" y1="2" x2="0.8801" y2="3.1001" layer="51"/>
<rectangle x1="-0.8801" y1="2" x2="-0.3899" y2="3.1001" layer="51"/>
<rectangle x1="-2.1501" y1="2" x2="-1.6599" y2="3.1001" layer="51"/>
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
<symbol name="MOSFET_P">
<wire x1="-1.016" y1="-2.54" x2="-1.016" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.016" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="2.159" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-2.159" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="0.381" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="3.302" y1="0.508" x2="3.81" y2="0.508" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.508" x2="4.318" y2="0.508" width="0.1524" layer="94"/>
<wire x1="3.81" y1="2.159" x2="2.54" y2="2.159" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.159" x2="0.5334" y2="2.159" width="0.1524" layer="94"/>
<wire x1="3.81" y1="0.508" x2="3.81" y2="2.159" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-2.159" x2="3.81" y2="-0.127" width="0.1524" layer="94"/>
<wire x1="3.81" y1="-2.159" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="2.159" width="0.1524" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="2.54" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="-2.159" width="0.1524" layer="94"/>
<circle x="2.54" y="2.159" radius="0.127" width="0.4064" layer="94"/>
<circle x="2.54" y="-2.159" radius="0.127" width="0.4064" layer="94"/>
<text x="6.35" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="6.35" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.794" x2="0.508" y2="-1.27" layer="94"/>
<rectangle x1="-0.254" y1="1.27" x2="0.508" y2="2.794" layer="94"/>
<rectangle x1="-0.254" y1="-0.889" x2="0.508" y2="0.889" layer="94"/>
<pin name="G" x="-2.54" y="2.54" visible="off" length="point"/>
<pin name="S@1" x="2.54" y="5.08" visible="off" length="short" direction="pwr" rot="R270"/>
<pin name="D@1" x="2.54" y="-7.62" visible="off" length="short" direction="pwr" rot="R90"/>
<pin name="D@2" x="5.08" y="-7.62" visible="off" length="short" direction="pwr" rot="R90"/>
<polygon width="0.1524" layer="94">
<vertex x="2.54" y="0"/>
<vertex x="1.27" y="0.508"/>
<vertex x="1.27" y="-0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="3.81" y="0.508"/>
<vertex x="3.302" y="-0.254"/>
<vertex x="4.318" y="-0.254"/>
</polygon>
<pin name="D@3" x="7.62" y="-7.62" visible="pad" length="short" direction="pwr" rot="R90"/>
<pin name="D@4" x="10.16" y="-7.62" visible="pad" length="short" direction="pwr" rot="R90"/>
<pin name="S@3" x="7.62" y="5.08" visible="pad" length="short" direction="pwr" rot="R270"/>
<pin name="S@2" x="5.08" y="5.08" visible="pad" length="short" direction="pwr" rot="R270"/>
<wire x1="7.62" y1="2.54" x2="2.54" y2="2.54" width="0.1524" layer="94"/>
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
<attribute name="MOUSER" value="863-MMBT2222ALT1G" constant="no"/>
<attribute name="RS" value="544-9400" constant="no"/>
<attribute name="VALUE" value="mmbt2222" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="IRF7205PBF" prefix="T">
<gates>
<gate name="G$1" symbol="MOSFET_P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO8">
<connects>
<connect gate="G$1" pin="D@1" pad="5"/>
<connect gate="G$1" pin="D@2" pad="6"/>
<connect gate="G$1" pin="D@3" pad="7"/>
<connect gate="G$1" pin="D@4" pad="8"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S@1" pad="3"/>
<connect gate="G$1" pin="S@2" pad="1"/>
<connect gate="G$1" pin="S@3" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="542-9327"/>
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
<package name="MICROMATCH-8_SMD">
<wire x1="-6.1" y1="0.7" x2="-6.5" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="0.7" x2="-6.5" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-0.7" x2="-6.1" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-6.1" y1="-1.2" x2="-6.5" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-1.2" x2="-6.5" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="-1.6" x2="-6.1" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-6.1" y1="1.6" x2="-6.5" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="1.6" x2="-6.5" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-6.5" y1="1.2" x2="-6.1" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-6" y1="2.4" x2="-6" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-5.42" y1="2" x2="-5.42" y2="-2" width="0.2032" layer="21"/>
<wire x1="6" y1="1" x2="5.42" y2="1" width="0.2032" layer="21"/>
<wire x1="5.42" y1="-0.33" x2="6" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="6" y1="-2.4" x2="6" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="6" y1="1" x2="6" y2="2.4" width="0.2032" layer="21"/>
<wire x1="5.42" y1="2" x2="5.32" y2="2" width="0.2032" layer="21"/>
<wire x1="-4.42" y1="2" x2="-5.42" y2="2" width="0.2032" layer="21"/>
<wire x1="6" y1="2.4" x2="5.32" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-4.42" y1="2.4" x2="-6" y2="2.4" width="0.2032" layer="21"/>
<wire x1="6" y1="-2.4" x2="4.42" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-5.32" y1="-2.4" x2="-6" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="5.42" y1="-2" x2="5.42" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="5.42" y1="1" x2="5.42" y2="2" width="0.2032" layer="21"/>
<wire x1="5.42" y1="-2" x2="4.42" y2="-2" width="0.2032" layer="21"/>
<wire x1="-5.32" y1="-2" x2="-5.42" y2="-2" width="0.2032" layer="21"/>
<smd name="1" x="4.445" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="5" x="-0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="7" x="-3.175" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="2" x="3.175" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="6" x="-1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="8" x="-4.445" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-5.08" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.445" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="6410-04">
<description>&lt;b&gt;MOLEX 2.54mm KK  CONNECTOR&lt;/b&gt;</description>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="2.921" width="0.127" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="2.921" width="0.254" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="-3.81" y2="2.921" width="0.254" layer="21"/>
<wire x1="-3.556" y1="2.921" x2="-3.81" y2="2.921" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.921" x2="-2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="2.921" width="0.254" layer="21"/>
<wire x1="5.08" y1="2.921" x2="-2.54" y2="2.921" width="0.254" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="-2.667" y2="-2.921" width="0.127" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="-2.921" width="0.254" layer="21"/>
<wire x1="5.08" y1="-2.921" x2="-2.667" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-4.826" y1="-2.921" x2="-4.445" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-2.921" x2="-4.445" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-2.286" x2="-3.175" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.286" x2="-3.175" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.921" x2="-1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.286" x2="-0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.286" x2="-0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.921" x2="-4.445" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.921" x2="-1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.921" x2="0.635" y2="-2.921" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.921" x2="0.635" y2="-2.286" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.286" x2="1.905" y2="-2.921" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.921" x2="3.175" y2="-2.921" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.921" x2="3.175" y2="-2.286" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.286" x2="4.445" y2="-2.286" width="0.254" layer="21"/>
<wire x1="4.445" y1="-2.286" x2="4.445" y2="-2.921" width="0.254" layer="21"/>
<wire x1="4.445" y1="-2.921" x2="5.08" y2="-2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.556" y2="1.905" width="0.254" layer="21"/>
<wire x1="-3.556" y1="1.905" x2="3.556" y2="1.905" width="0.254" layer="21"/>
<wire x1="3.556" y1="1.905" x2="3.81" y2="1.905" width="0.254" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="2.921" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.556" y2="1.397" width="0.254" layer="21"/>
<wire x1="-3.556" y1="2.921" x2="-3.556" y2="1.905" width="0.254" layer="21"/>
<wire x1="-3.556" y1="1.397" x2="3.556" y2="1.397" width="0.254" layer="21"/>
<wire x1="3.556" y1="1.397" x2="3.81" y2="1.905" width="0.254" layer="21"/>
<wire x1="3.556" y1="2.921" x2="3.556" y2="1.905" width="0.254" layer="21"/>
<pad name="4" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.0531" y="3.2751" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="5.6881" y="-0.7381" size="1.27" layer="21" ratio="14">1</text>
<text x="-6.2499" y="-0.6873" size="1.27" layer="21" ratio="14">4</text>
<text x="-5.0531" y="-4.5989" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="7395-04">
<description>&lt;b&gt;MOLEX 2.54mm KK RA CONNECTOR&lt;/b&gt;
&lt;br&gt;Fixed Orientation</description>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="-1.905" width="0.254" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="4.445" y2="-1.905" width="0.254" layer="21"/>
<wire x1="4.445" y1="-1.905" x2="4.445" y2="-2.54" width="0.254" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="3.175" y2="-2.54" width="0.254" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.175" y2="-1.905" width="0.254" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="-0.635" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-1.905" x2="-0.635" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.905" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-1.905" y1="-1.905" x2="-3.175" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-3.175" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-4.445" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-4.445" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-1.905" x2="-5.08" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-4.191" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-4.191" y1="-5.08" x2="3.81" y2="-5.08" width="0.254" layer="21"/>
<wire x1="3.81" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="21"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="-13.081" width="0.254" layer="21"/>
<wire x1="3.81" y1="-13.081" x2="3.556" y2="-13.589" width="0.254" layer="21"/>
<wire x1="3.556" y1="-13.589" x2="-0.0508" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-5.08" x2="-3.81" y2="-13.081" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-13.081" x2="-3.556" y2="-13.589" width="0.254" layer="21"/>
<wire x1="-3.556" y1="-13.589" x2="0.0508" y2="-13.589" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="0.889" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-4.191" y1="-5.08" x2="-4.191" y2="-11.303" width="0.254" layer="21"/>
<wire x1="-4.191" y1="-11.303" x2="-3.8608" y2="-11.6586" width="0.254" layer="21"/>
<wire x1="4.191" y1="-5.08" x2="4.191" y2="-11.303" width="0.254" layer="21"/>
<wire x1="4.191" y1="-11.303" x2="3.8608" y2="-11.6586" width="0.254" layer="21"/>
<pad name="1" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="5.1801" y="2.9479" size="1.016" layer="25" ratio="10" rot="R180">&gt;NAME</text>
<text x="3.3259" y="-3.4021" size="1.27" layer="21" ratio="14" rot="R270">1</text>
<text x="-4.2433" y="-3.2751" size="1.27" layer="21" ratio="14" rot="R270">4</text>
<text x="5.9421" y="-2.4399" size="0.8128" layer="27" ratio="10" rot="R270">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-2.5146" x2="4.064" y2="-0.2794" layer="51"/>
<rectangle x1="1.016" y1="-2.5146" x2="1.524" y2="-0.2794" layer="51"/>
<rectangle x1="-1.524" y1="-2.5146" x2="-1.016" y2="-0.2794" layer="51"/>
<rectangle x1="-4.064" y1="-2.5146" x2="-3.556" y2="-0.2794" layer="51"/>
</package>
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
<symbol name="MV">
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="-0.508" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<text x="0" y="0.889" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0" width="0.6096" layer="94"/>
<text x="-0.508" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
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
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-?-04" prefix="J">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (.1 inch) pitch header</description>
<gates>
<gate name="-1" symbol="MV-1" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M-1" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M-1" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M-1" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="05-7048" package="7395-04">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
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
<device name="27-2041" package="6410-04">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
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
<deviceset name="22-?-02" prefix="J">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (.1 inch) pitch header</description>
<gates>
<gate name="-1" symbol="MV-1" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M-1" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
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
<attribute name="MOUSER" value="538-22-27-2021 " constant="no"/>
<attribute name="RS" value="483-8461 " constant="no"/>
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
<attribute name="MOUSER" value="571-3-794630-4 " constant="no"/>
<attribute name="RS" value="495-9344" constant="no"/>
<attribute name="VALUE" value="794630-4" constant="no"/>
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
<text x="-2.0066" y="1.1684" size="0.9906" layer="25" ratio="12">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="0.9906" layer="27" ratio="12">&gt;VALUE</text>
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
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="12">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="12">&gt;VALUE</text>
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
<text x="-2.1336" y="1.1684" size="1.27" layer="25" ratio="12">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="1.27" layer="27" ratio="12">&gt;VALUE</text>
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
<part name="C16" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C15" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C14" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C13" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C12" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="FRAME6" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V14" library="supply1" deviceset="+3V3" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP"/>
<part name="C17" library="robotter_capacitor" deviceset="15PF" device="-E"/>
<part name="C18" library="robotter_capacitor" deviceset="15PF" device="-E"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="+3V15" library="supply1" deviceset="+3V3" device=""/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R6" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R7" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R8" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="K1" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K2" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K3" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="K4" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="PDI_ATMEL" library="robotter_connector" deviceset="PDI_ATMEL" device=""/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="C22" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C21" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="R22" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="IC3" library="robotter_ic" deviceset="LM1086CS-3.3" device=""/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="P+11" library="supply1" deviceset="+5V" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="ALIM" library="robotter_connector" deviceset="22-?-04" device="27-2041"/>
<part name="P+15" library="supply1" deviceset="+12V" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="P+16" library="supply1" deviceset="+5V" device=""/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="GND46" library="supply1" deviceset="GND" device=""/>
<part name="UART_I2C" library="robotter_connector" deviceset="MICROMATCH-8_SMD" device=""/>
<part name="C2" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="+3V23" library="supply1" deviceset="+3V3" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="+3V24" library="supply1" deviceset="+3V3" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="R13" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="R14" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="H3" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="H4" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="GND53" library="supply1" deviceset="GND" device=""/>
<part name="FRAME8" library="frames" deviceset="A4L-LOC" device=""/>
<part name="D1" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R19" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND64" library="supply1" deviceset="GND" device=""/>
<part name="MIRROR_IDX" library="robotter_connector" deviceset="794681-4" device=""/>
<part name="D2" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R21" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="GND69" library="supply1" deviceset="GND" device=""/>
<part name="IR_SENSOR" library="robotter_connector" deviceset="794681-4" device=""/>
<part name="P+32" library="supply1" deviceset="+24V" device=""/>
<part name="P+33" library="supply1" deviceset="+24V" device=""/>
<part name="C20" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF"/>
<part name="C19" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF"/>
<part name="GND70" library="supply1" deviceset="GND" device=""/>
<part name="GND71" library="supply1" deviceset="GND" device=""/>
<part name="GND72" library="supply1" deviceset="GND" device=""/>
<part name="GND73" library="supply1" deviceset="GND" device=""/>
<part name="R28" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="R24" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R18" library="rcl" deviceset="R-EU_" device="R0805" value="nc"/>
<part name="R16" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="C23" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF"/>
<part name="GND74" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R23" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R26" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="GND78" library="supply1" deviceset="GND" device=""/>
<part name="T1" library="robotter_ic" deviceset="IRF7205PBF" device=""/>
<part name="R29" library="rcl" deviceset="R-EU_" device="R0603" value="nc"/>
<part name="R25" library="robotter_resistor" deviceset="0" device="-F" value="0"/>
<part name="T2" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="P+12" library="supply1" deviceset="+24V" device=""/>
<part name="R17" library="robotter_resistor" deviceset="4K7" device="-E" value="4k7"/>
<part name="R20" library="robotter_resistor" deviceset="4K7" device="-E" value="4k7"/>
<part name="T3" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="R31" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R32" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R30" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R1" library="rcl" deviceset="R-EU_" device="R0603" value="2k2"/>
<part name="R2" library="rcl" deviceset="R-EU_" device="R0603" value="2k2"/>
<part name="R3" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R4" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="RUN" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="ERROR" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="COM" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="5.5"/>
<part name="MOT" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="D3" library="robotter_diode" deviceset="CGRM400*-G" device="" technology="4"/>
</parts>
<sheets>
<sheet>
<plain>
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
<instance part="Q1" gate="G$1" x="33.02" y="22.86" smashed="yes">
<attribute name="NAME" x="38.1" y="21.844" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="35.56" y="20.32" size="1.778" layer="96"/>
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
<instance part="R5" gate="G$1" x="320.04" y="66.04" smashed="yes">
<attribute name="NAME" x="312.42" y="66.04" size="1.778" layer="95"/>
<attribute name="VALUE" x="322.58" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="332.74" y="63.5" smashed="yes">
<attribute name="NAME" x="325.12" y="63.5" size="1.778" layer="95"/>
<attribute name="VALUE" x="335.28" y="63.5" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="345.44" y="60.96" smashed="yes">
<attribute name="NAME" x="337.82" y="60.96" size="1.778" layer="95"/>
<attribute name="VALUE" x="347.98" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="358.14" y="58.42" smashed="yes">
<attribute name="NAME" x="350.52" y="58.42" size="1.778" layer="95"/>
<attribute name="VALUE" x="360.68" y="58.42" size="1.778" layer="96"/>
</instance>
<instance part="K1" gate="G$1" x="368.3" y="66.04" smashed="yes" rot="R90">
<attribute name="NAME" x="360.68" y="66.04" size="1.778" layer="95"/>
<attribute name="VALUE" x="373.38" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="K2" gate="G$1" x="381" y="63.5" smashed="yes" rot="R90">
<attribute name="NAME" x="373.38" y="63.5" size="1.778" layer="95"/>
<attribute name="VALUE" x="386.08" y="63.5" size="1.778" layer="96"/>
</instance>
<instance part="K3" gate="G$1" x="393.7" y="60.96" smashed="yes" rot="R90">
<attribute name="NAME" x="386.08" y="60.96" size="1.778" layer="95"/>
<attribute name="VALUE" x="398.78" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="K4" gate="G$1" x="406.4" y="58.42" smashed="yes" rot="R90">
<attribute name="NAME" x="398.78" y="58.42" size="1.778" layer="95"/>
<attribute name="VALUE" x="411.48" y="58.42" size="1.778" layer="96"/>
</instance>
<instance part="GND19" gate="1" x="434.34" y="45.72"/>
<instance part="+3V2" gate="G$1" x="162.56" y="170.18" rot="MR0"/>
<instance part="PDI_ATMEL" gate="1" x="215.9" y="152.4"/>
<instance part="+3V3" gate="G$1" x="233.68" y="160.02"/>
<instance part="GND20" gate="1" x="233.68" y="144.78"/>
<instance part="C22" gate="G$1" x="469.9" y="-81.28"/>
<instance part="C21" gate="G$1" x="411.48" y="-81.28"/>
<instance part="R22" gate="G$1" x="447.04" y="-66.04"/>
<instance part="IC3" gate="G$1" x="447.04" y="-78.74"/>
<instance part="+3V17" gate="G$1" x="485.14" y="-76.2"/>
<instance part="P+11" gate="1" x="401.32" y="-73.66"/>
<instance part="GND31" gate="1" x="444.5" y="-91.44"/>
<instance part="ALIM" gate="-1" x="302.26" y="-81.28" rot="R180"/>
<instance part="ALIM" gate="-2" x="302.26" y="-76.2" rot="R180"/>
<instance part="ALIM" gate="-3" x="302.26" y="-71.12" rot="R180"/>
<instance part="ALIM" gate="-4" x="302.26" y="-66.04" rot="R180"/>
<instance part="P+15" gate="1" x="330.2" y="-78.74" smashed="yes">
<attribute name="VALUE" x="327.66" y="-76.2" size="1.778" layer="96"/>
</instance>
<instance part="GND44" gate="1" x="320.04" y="-76.2" smashed="yes" rot="R90">
<attribute name="VALUE" x="322.58" y="-78.74" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P+16" gate="1" x="317.5" y="-63.5" smashed="yes">
<attribute name="VALUE" x="314.96" y="-63.5" size="1.778" layer="96"/>
</instance>
<instance part="GND45" gate="1" x="312.42" y="91.44" rot="MR0"/>
<instance part="GND46" gate="1" x="335.28" y="111.76"/>
<instance part="UART_I2C" gate="-1" x="302.26" y="96.52" smashed="yes" rot="MR180">
<attribute name="NAME" x="301.752" y="95.631" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="292.1" y="90.551" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="UART_I2C" gate="-2" x="302.26" y="99.06" rot="MR180"/>
<instance part="UART_I2C" gate="-3" x="302.26" y="101.6" rot="MR180"/>
<instance part="UART_I2C" gate="-4" x="302.26" y="104.14" rot="MR180"/>
<instance part="UART_I2C" gate="-5" x="302.26" y="106.68"/>
<instance part="UART_I2C" gate="-6" x="302.26" y="109.22"/>
<instance part="UART_I2C" gate="-7" x="302.26" y="111.76"/>
<instance part="UART_I2C" gate="-8" x="302.26" y="114.3"/>
<instance part="C2" gate="G$1" x="335.28" y="119.38"/>
<instance part="+3V23" gate="G$1" x="335.28" y="124.46" smashed="yes">
<attribute name="VALUE" x="332.74" y="124.46" size="1.778" layer="96"/>
</instance>
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
<instance part="R14" gate="G$1" x="340.36" y="101.6" smashed="yes">
<attribute name="NAME" x="332.74" y="101.6" size="1.778" layer="95"/>
<attribute name="VALUE" x="342.9" y="99.06" size="1.778" layer="96"/>
</instance>
<instance part="H1" gate="G$1" x="375.92" y="-124.46" rot="R90"/>
<instance part="H3" gate="G$1" x="393.7" y="-124.46" rot="R90"/>
<instance part="H4" gate="G$1" x="401.32" y="-124.46" rot="R90"/>
<instance part="GND53" gate="1" x="388.62" y="-129.54"/>
<instance part="FRAME8" gate="G$1" x="0" y="-185.42"/>
<instance part="D1" gate="G$1" x="60.96" y="-43.18" rot="R90"/>
<instance part="R19" gate="G$1" x="50.8" y="-43.18" rot="R90"/>
<instance part="GND64" gate="1" x="55.88" y="-50.8"/>
<instance part="MIRROR_IDX" gate="G$1" x="200.66" y="-35.56"/>
<instance part="D2" gate="G$1" x="60.96" y="-60.96" rot="R90"/>
<instance part="R21" gate="G$1" x="50.8" y="-60.96" rot="R90"/>
<instance part="GND69" gate="1" x="55.88" y="-68.58"/>
<instance part="IR_SENSOR" gate="G$1" x="195.58" y="-86.36"/>
<instance part="P+32" gate="1" x="185.42" y="-15.24"/>
<instance part="P+33" gate="1" x="157.48" y="-50.8"/>
<instance part="C20" gate="G$1" x="180.34" y="-68.58"/>
<instance part="C19" gate="G$1" x="185.42" y="-20.32"/>
<instance part="GND70" gate="1" x="180.34" y="-76.2"/>
<instance part="GND71" gate="1" x="185.42" y="-27.94"/>
<instance part="GND72" gate="1" x="195.58" y="-101.6"/>
<instance part="GND73" gate="1" x="190.5" y="-38.1"/>
<instance part="R28" gate="G$1" x="218.44" y="-91.44" rot="R90"/>
<instance part="R24" gate="G$1" x="218.44" y="-73.66" rot="R90"/>
<instance part="R18" gate="G$1" x="215.9" y="-38.1" rot="R90"/>
<instance part="R16" gate="G$1" x="215.9" y="-25.4" rot="R90"/>
<instance part="C23" gate="G$1" x="182.88" y="-124.46" smashed="yes">
<attribute name="NAME" x="176.784" y="-124.079" size="1.778" layer="95"/>
<attribute name="VALUE" x="181.356" y="-127.381" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND74" gate="1" x="182.88" y="-132.08" smashed="yes">
<attribute name="VALUE" x="180.34" y="-134.62" size="1.778" layer="96"/>
</instance>
<instance part="R27" gate="G$1" x="147.32" y="-91.44"/>
<instance part="R23" gate="G$1" x="157.48" y="-71.12" rot="R90"/>
<instance part="R26" gate="G$1" x="157.48" y="-81.28" rot="R90"/>
<instance part="GND78" gate="1" x="157.48" y="-104.14"/>
<instance part="T1" gate="G$1" x="165.1" y="-68.58" rot="R90"/>
<instance part="R29" gate="G$1" x="210.82" y="-93.98" rot="R90"/>
<instance part="R25" gate="G$1" x="210.82" y="-78.74" rot="R90"/>
<instance part="T2" gate="G$1" x="154.94" y="-91.44" smashed="yes">
<attribute name="NAME" x="157.48" y="-88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="157.48" y="-91.44" size="1.778" layer="96"/>
</instance>
<instance part="P+12" gate="1" x="182.88" y="-114.3"/>
<instance part="R17" gate="G$1" x="71.12" y="-38.1"/>
<instance part="R20" gate="G$1" x="71.12" y="-55.88"/>
<instance part="T3" gate="G$1" x="187.96" y="-144.78" smashed="yes">
<attribute name="NAME" x="190.5" y="-142.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="190.5" y="-144.78" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="190.5" y="-157.48" smashed="yes">
<attribute name="VALUE" x="187.96" y="-160.02" size="1.778" layer="96"/>
</instance>
<instance part="R31" gate="G$1" x="180.34" y="-144.78"/>
<instance part="R32" gate="G$1" x="172.72" y="-149.86" rot="R90"/>
<instance part="R30" gate="G$1" x="142.24" y="-96.52" rot="R90"/>
<instance part="R15" gate="G$1" x="20.32" y="35.56"/>
<instance part="R1" gate="G$1" x="129.54" y="167.64"/>
<instance part="R2" gate="G$1" x="137.16" y="165.1"/>
<instance part="R3" gate="G$1" x="124.46" y="149.86"/>
<instance part="R4" gate="G$1" x="134.62" y="147.32"/>
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
<instance part="ERROR" gate="G$1" x="175.26" y="86.36" smashed="yes" rot="R90">
<attribute name="NAME" x="167.64" y="86.36" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="COM" gate="G$1" x="187.96" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="180.34" y="83.82" size="1.778" layer="95"/>
<attribute name="VALUE" x="193.04" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="228.6" y="73.66"/>
<instance part="H2" gate="G$1" x="383.54" y="-124.46" rot="R90"/>
<instance part="MOT" gate="-1" x="215.9" y="-139.7"/>
<instance part="MOT" gate="-2" x="215.9" y="-134.62"/>
<instance part="D3" gate="G$1" x="190.5" y="-129.54" rot="R90"/>
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
<wire x1="373.38" y1="66.04" x2="434.34" y2="66.04" width="0.1524" layer="91"/>
<wire x1="434.34" y1="66.04" x2="434.34" y2="63.5" width="0.1524" layer="91"/>
<wire x1="434.34" y1="63.5" x2="434.34" y2="60.96" width="0.1524" layer="91"/>
<wire x1="434.34" y1="60.96" x2="434.34" y2="58.42" width="0.1524" layer="91"/>
<wire x1="411.48" y1="58.42" x2="434.34" y2="58.42" width="0.1524" layer="91"/>
<wire x1="398.78" y1="60.96" x2="434.34" y2="60.96" width="0.1524" layer="91"/>
<wire x1="386.08" y1="63.5" x2="434.34" y2="63.5" width="0.1524" layer="91"/>
<wire x1="434.34" y1="58.42" x2="434.34" y2="48.26" width="0.1524" layer="91"/>
<junction x="434.34" y="60.96"/>
<junction x="434.34" y="63.5"/>
<junction x="434.34" y="58.42"/>
<pinref part="K1" gate="G$1" pin="C"/>
<pinref part="K4" gate="G$1" pin="C"/>
<pinref part="K3" gate="G$1" pin="C"/>
<pinref part="K2" gate="G$1" pin="C"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="228.6" y1="149.86" x2="233.68" y2="149.86" width="0.1524" layer="91"/>
<wire x1="233.68" y1="149.86" x2="233.68" y2="147.32" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="411.48" y1="-86.36" x2="411.48" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="411.48" y1="-88.9" x2="444.5" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="444.5" y1="-88.9" x2="469.9" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="469.9" y1="-88.9" x2="469.9" y2="-86.36" width="0.1524" layer="91"/>
<junction x="444.5" y="-88.9"/>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND31" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="317.5" y1="-76.2" x2="304.8" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="ALIM" gate="-2" pin="S"/>
<pinref part="GND44" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="312.42" y1="109.22" x2="312.42" y2="99.06" width="0.1524" layer="91"/>
<pinref part="GND45" gate="1" pin="GND"/>
<pinref part="UART_I2C" gate="-2" pin="S"/>
<wire x1="312.42" y1="99.06" x2="312.42" y2="93.98" width="0.1524" layer="91"/>
<wire x1="307.34" y1="99.06" x2="312.42" y2="99.06" width="0.1524" layer="91"/>
<pinref part="UART_I2C" gate="-6" pin="S"/>
<wire x1="307.34" y1="109.22" x2="312.42" y2="109.22" width="0.1524" layer="91"/>
<junction x="312.42" y="99.06"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="GND46" gate="1" pin="GND"/>
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
<wire x1="375.92" y1="-127" x2="383.54" y2="-127" width="0.1524" layer="91"/>
<wire x1="383.54" y1="-127" x2="388.62" y2="-127" width="0.1524" layer="91"/>
<wire x1="388.62" y1="-127" x2="401.32" y2="-127" width="0.1524" layer="91"/>
<wire x1="388.62" y1="-127" x2="393.7" y2="-127" width="0.1524" layer="91"/>
<junction x="388.62" y="-127"/>
<junction x="388.62" y="-127"/>
<junction x="383.54" y="-127"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="H4" gate="G$1" pin="MOUNT"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<pinref part="GND53" gate="1" pin="GND"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
</segment>
<segment>
<wire x1="50.8" y1="-48.26" x2="55.88" y2="-48.26" width="0.1524" layer="91"/>
<wire x1="55.88" y1="-48.26" x2="60.96" y2="-48.26" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-48.26" x2="60.96" y2="-45.72" width="0.1524" layer="91"/>
<junction x="55.88" y="-48.26"/>
<pinref part="R19" gate="G$1" pin="1"/>
<pinref part="D1" gate="G$1" pin="A"/>
<pinref part="GND64" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="50.8" y1="-66.04" x2="55.88" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="55.88" y1="-66.04" x2="60.96" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-66.04" x2="60.96" y2="-63.5" width="0.1524" layer="91"/>
<junction x="55.88" y="-66.04"/>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="GND69" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="2"/>
<pinref part="GND70" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="GND71" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="190.5" y1="-35.56" x2="195.58" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-43.18" x2="185.42" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-43.18" x2="185.42" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="185.42" y1="-35.56" x2="190.5" y2="-35.56" width="0.1524" layer="91"/>
<junction x="190.5" y="-35.56"/>
<pinref part="GND73" gate="1" pin="GND"/>
<pinref part="MIRROR_IDX" gate="G$1" pin="1"/>
<pinref part="R18" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND74" gate="1" pin="GND"/>
<pinref part="C23" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="190.5" y1="-86.36" x2="190.5" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-99.06" x2="195.58" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-99.06" x2="210.82" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-99.06" x2="218.44" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-99.06" x2="218.44" y2="-96.52" width="0.1524" layer="91"/>
<junction x="195.58" y="-99.06"/>
<junction x="210.82" y="-99.06"/>
<pinref part="IR_SENSOR" gate="G$1" pin="1"/>
<pinref part="R28" gate="G$1" pin="1"/>
<pinref part="GND72" gate="1" pin="GND"/>
<pinref part="R29" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="157.48" y1="-101.6" x2="157.48" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-101.6" x2="157.48" y2="-101.6" width="0.1524" layer="91"/>
<pinref part="GND78" gate="1" pin="GND"/>
<pinref part="T2" gate="G$1" pin="E"/>
<pinref part="R30" gate="G$1" pin="1"/>
<junction x="157.48" y="-101.6"/>
</segment>
<segment>
<wire x1="172.72" y1="-154.94" x2="190.5" y2="-154.94" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-154.94" x2="190.5" y2="-149.86" width="0.1524" layer="91"/>
<junction x="190.5" y="-154.94"/>
<pinref part="R32" gate="G$1" pin="1"/>
<pinref part="T3" gate="G$1" pin="E"/>
<pinref part="GND3" gate="1" pin="GND"/>
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
<pinref part="ERROR" gate="G$1" pin="C"/>
<pinref part="GND4" gate="1" pin="GND"/>
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
<wire x1="134.62" y1="167.64" x2="142.24" y2="167.64" width="0.1524" layer="91"/>
<wire x1="142.24" y1="167.64" x2="160.02" y2="167.64" width="0.1524" layer="91"/>
<wire x1="160.02" y1="167.64" x2="162.56" y2="167.64" width="0.1524" layer="91"/>
<wire x1="162.56" y1="167.64" x2="162.56" y2="147.32" width="0.1524" layer="91"/>
<wire x1="162.56" y1="147.32" x2="139.7" y2="147.32" width="0.1524" layer="91"/>
<wire x1="129.54" y1="149.86" x2="160.02" y2="149.86" width="0.1524" layer="91"/>
<wire x1="160.02" y1="149.86" x2="160.02" y2="167.64" width="0.1524" layer="91"/>
<wire x1="142.24" y1="165.1" x2="142.24" y2="167.64" width="0.1524" layer="91"/>
<junction x="160.02" y="167.64"/>
<junction x="142.24" y="167.64"/>
<junction x="162.56" y="167.64"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R4" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="228.6" y1="154.94" x2="233.68" y2="154.94" width="0.1524" layer="91"/>
<wire x1="233.68" y1="154.94" x2="233.68" y2="157.48" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="VCC"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="469.9" y1="-78.74" x2="459.74" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="459.74" y1="-78.74" x2="459.74" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="459.74" y1="-76.2" x2="459.74" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="459.74" y1="-66.04" x2="452.12" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="469.9" y1="-78.74" x2="485.14" y2="-78.74" width="0.1524" layer="91"/>
<junction x="459.74" y="-78.74"/>
<junction x="459.74" y="-76.2"/>
<junction x="469.9" y="-78.74"/>
<pinref part="C22" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="VOUT@1"/>
<pinref part="R22" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="VOUT@0"/>
<pinref part="+3V17" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="314.96" y1="121.92" x2="314.96" y2="106.68" width="0.1524" layer="91"/>
<wire x1="335.28" y1="121.92" x2="314.96" y2="121.92" width="0.1524" layer="91"/>
<junction x="335.28" y="121.92"/>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="+3V23" gate="G$1" pin="+3V3"/>
<pinref part="UART_I2C" gate="-1" pin="S"/>
<wire x1="307.34" y1="96.52" x2="314.96" y2="96.52" width="0.1524" layer="91"/>
<wire x1="314.96" y1="96.52" x2="314.96" y2="106.68" width="0.1524" layer="91"/>
<pinref part="UART_I2C" gate="-5" pin="S"/>
<wire x1="307.34" y1="106.68" x2="314.96" y2="106.68" width="0.1524" layer="91"/>
<junction x="314.96" y="106.68"/>
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
<wire x1="27.94" y1="20.32" x2="27.94" y2="22.86" width="0.1524" layer="91"/>
<wire x1="27.94" y1="22.86" x2="27.94" y2="30.48" width="0.1524" layer="91"/>
<wire x1="27.94" y1="30.48" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="PR0(XTAL2)"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="22.86" x2="27.94" y2="22.86" width="0.1524" layer="91"/>
<junction x="27.94" y="22.86"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<wire x1="40.64" y1="25.4" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="25.4" x2="38.1" y2="22.86" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PR1(XTAL1)"/>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="38.1" y1="22.86" x2="38.1" y2="20.32" width="0.1524" layer="91"/>
<wire x1="35.56" y1="22.86" x2="38.1" y2="22.86" width="0.1524" layer="91"/>
<junction x="38.1" y="22.86"/>
</segment>
</net>
<net name="N$91" class="0">
<segment>
<wire x1="325.12" y1="66.04" x2="365.76" y2="66.04" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="K1" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$92" class="0">
<segment>
<wire x1="337.82" y1="63.5" x2="378.46" y2="63.5" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="K2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$93" class="0">
<segment>
<wire x1="350.52" y1="60.96" x2="391.16" y2="60.96" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="K3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<wire x1="363.22" y1="58.42" x2="403.86" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="K4" gate="G$1" pin="A"/>
</segment>
</net>
<net name="RX_3V3" class="0">
<segment>
<wire x1="119.38" y1="149.86" x2="104.14" y2="149.86" width="0.1524" layer="91"/>
<label x="116.84" y="149.86" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF6(RXD1/MISO)"/>
<pinref part="R3" gate="G$1" pin="1"/>
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
<wire x1="104.14" y1="147.32" x2="129.54" y2="147.32" width="0.1524" layer="91"/>
<label x="116.84" y="147.32" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF7(TXD1/SCK)"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="345.44" y1="101.6" x2="373.38" y2="101.6" width="0.1524" layer="91"/>
<label x="365.76" y="101.6" size="1.778" layer="95"/>
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
<net name="SDA_3V3" class="0">
<segment>
<wire x1="307.34" y1="114.3" x2="330.2" y2="114.3" width="0.1524" layer="91"/>
<label x="317.5" y="114.3" size="1.778" layer="95"/>
<pinref part="UART_I2C" gate="-8" pin="S"/>
</segment>
<segment>
<wire x1="124.46" y1="167.64" x2="124.46" y2="165.1" width="0.1524" layer="91"/>
<wire x1="124.46" y1="165.1" x2="104.14" y2="165.1" width="0.1524" layer="91"/>
<label x="116.84" y="165.1" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF0(OC0A/SDA)"/>
<pinref part="R1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="SCL_3V3" class="0">
<segment>
<wire x1="307.34" y1="111.76" x2="330.2" y2="111.76" width="0.1524" layer="91"/>
<label x="317.5" y="111.76" size="1.778" layer="95"/>
<pinref part="UART_I2C" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="132.08" y1="165.1" x2="132.08" y2="162.56" width="0.1524" layer="91"/>
<wire x1="132.08" y1="162.56" x2="104.14" y2="162.56" width="0.1524" layer="91"/>
<label x="116.84" y="162.56" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC2" gate="G$1" pin="PF1(OC0B/XCK0/SCL)"/>
<pinref part="R2" gate="G$1" pin="1"/>
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
<wire x1="411.48" y1="-78.74" x2="411.48" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="411.48" y1="-76.2" x2="436.88" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="411.48" y1="-76.2" x2="401.32" y2="-76.2" width="0.1524" layer="91"/>
<junction x="411.48" y="-76.2"/>
<pinref part="IC3" gate="G$1" pin="VIN"/>
<pinref part="C21" gate="G$1" pin="1"/>
<pinref part="P+11" gate="1" pin="+5V"/>
</segment>
<segment>
<wire x1="304.8" y1="-66.04" x2="317.5" y2="-66.04" width="0.1524" layer="91"/>
<pinref part="ALIM" gate="-4" pin="S"/>
<pinref part="P+16" gate="1" pin="+5V"/>
</segment>
</net>
<net name="3V3_BUS" class="0">
<segment>
<wire x1="441.96" y1="-66.04" x2="401.32" y2="-66.04" width="0.1524" layer="91"/>
<label x="401.32" y="-66.04" size="1.778" layer="95"/>
<pinref part="R22" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="317.5" y1="-71.12" x2="304.8" y2="-71.12" width="0.1524" layer="91"/>
<label x="307.34" y="-71.12" size="1.778" layer="95"/>
<pinref part="ALIM" gate="-3" pin="S"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<wire x1="330.2" y1="-81.28" x2="304.8" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="P+15" gate="1" pin="+12V"/>
<pinref part="ALIM" gate="-1" pin="S"/>
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
<wire x1="307.34" y1="101.6" x2="335.28" y2="101.6" width="0.1524" layer="91"/>
<label x="320.04" y="101.6" size="1.778" layer="95"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="UART_I2C" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="444.5" y1="96.52" x2="426.72" y2="96.52" width="0.1524" layer="91"/>
<label x="439.42" y="96.52" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1OUT"/>
</segment>
</net>
<net name="RX_232" class="0">
<segment>
<wire x1="307.34" y1="104.14" x2="335.28" y2="104.14" width="0.1524" layer="91"/>
<label x="320.04" y="104.14" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="UART_I2C" gate="-4" pin="S"/>
</segment>
<segment>
<wire x1="444.5" y1="91.44" x2="426.72" y2="91.44" width="0.1524" layer="91"/>
<label x="439.42" y="91.44" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="LED_EAST" class="0">
<segment>
<wire x1="294.64" y1="63.5" x2="327.66" y2="63.5" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<label x="294.64" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH1(!CAS!/!RE!)"/>
<wire x1="104.14" y1="137.16" x2="124.46" y2="137.16" width="0.1524" layer="91"/>
<label x="106.68" y="137.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="ON/OFF_SENSOR" class="0">
<segment>
<wire x1="142.24" y1="-91.44" x2="119.38" y2="-91.44" width="0.1524" layer="91"/>
<junction x="142.24" y="-91.44"/>
<label x="119.38" y="-91.44" size="1.778" layer="95"/>
<pinref part="R27" gate="G$1" pin="1"/>
<pinref part="R30" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="17.78" y1="83.82" x2="40.64" y2="83.82" width="0.1524" layer="91"/>
<label x="17.78" y="83.82" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PD3(OC0D/TXD0)"/>
</segment>
</net>
<net name="+24V" class="0">
<segment>
<wire x1="185.42" y1="-17.78" x2="195.58" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-17.78" x2="195.58" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-17.78" x2="215.9" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-17.78" x2="215.9" y2="-17.78" width="0.1524" layer="91"/>
<junction x="185.42" y="-17.78"/>
<junction x="195.58" y="-17.78"/>
<pinref part="C19" gate="G$1" pin="1"/>
<pinref part="P+32" gate="1" pin="+24V"/>
<pinref part="MIRROR_IDX" gate="G$1" pin="3"/>
<pinref part="R16" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="160.02" y1="-66.04" x2="157.48" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="157.48" y1="-66.04" x2="157.48" y2="-63.5" width="0.1524" layer="91"/>
<junction x="157.48" y="-66.04"/>
<pinref part="T1" gate="G$1" pin="S@1"/>
<pinref part="R23" gate="G$1" pin="2"/>
<pinref part="P+33" gate="1" pin="+24V"/>
<pinref part="T1" gate="G$1" pin="S@2"/>
<wire x1="157.48" y1="-63.5" x2="157.48" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="157.48" y1="-60.96" x2="157.48" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="160.02" y1="-63.5" x2="157.48" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="S@3"/>
<wire x1="160.02" y1="-60.96" x2="157.48" y2="-60.96" width="0.1524" layer="91"/>
<junction x="157.48" y="-63.5"/>
<junction x="157.48" y="-60.96"/>
</segment>
<segment>
<wire x1="182.88" y1="-121.92" x2="182.88" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-121.92" x2="190.5" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-121.92" x2="182.88" y2="-121.92" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-134.62" x2="213.36" y2="-121.92" width="0.1524" layer="91"/>
<junction x="182.88" y="-121.92"/>
<pinref part="P+12" gate="1" pin="+24V"/>
<pinref part="C23" gate="G$1" pin="1"/>
<pinref part="MOT" gate="-2" pin="S"/>
<pinref part="D3" gate="G$1" pin="C"/>
<wire x1="190.5" y1="-127" x2="190.5" y2="-121.92" width="0.1524" layer="91"/>
<junction x="190.5" y="-121.92"/>
</segment>
</net>
<net name="MOTOR_PWM_3V3" class="0">
<segment>
<wire x1="17.78" y1="91.44" x2="40.64" y2="91.44" width="0.1524" layer="91"/>
<label x="17.78" y="91.44" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PD0(OC0A/SDA)"/>
</segment>
<segment>
<wire x1="172.72" y1="-144.78" x2="149.86" y2="-144.78" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-144.78" x2="175.26" y2="-144.78" width="0.1524" layer="91"/>
<junction x="172.72" y="-144.78"/>
<label x="149.86" y="-144.78" size="1.778" layer="95"/>
<pinref part="R31" gate="G$1" pin="1"/>
<pinref part="R32" gate="G$1" pin="2"/>
</segment>
</net>
<net name="MIRROR_INDEX_3V3" class="0">
<segment>
<wire x1="50.8" y1="-38.1" x2="17.78" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-38.1" x2="60.96" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-38.1" x2="50.8" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-40.64" x2="60.96" y2="-38.1" width="0.1524" layer="91"/>
<junction x="50.8" y="-38.1"/>
<junction x="60.96" y="-38.1"/>
<label x="17.78" y="-38.1" size="1.778" layer="95"/>
<pinref part="R19" gate="G$1" pin="2"/>
<pinref part="D1" gate="G$1" pin="C"/>
<pinref part="R17" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="10.16" y1="109.22" x2="40.64" y2="109.22" width="0.1524" layer="91"/>
<label x="10.16" y="109.22" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PC3(OC0D/TXD0)"/>
</segment>
</net>
<net name="IR_SENSOR_OUTPUT_3V3" class="0">
<segment>
<wire x1="50.8" y1="-55.88" x2="17.78" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-55.88" x2="60.96" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-55.88" x2="50.8" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-58.42" x2="60.96" y2="-55.88" width="0.1524" layer="91"/>
<junction x="50.8" y="-55.88"/>
<junction x="60.96" y="-55.88"/>
<label x="17.78" y="-55.88" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="2"/>
<pinref part="D2" gate="G$1" pin="C"/>
<pinref part="R20" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="10.16" y1="111.76" x2="40.64" y2="111.76" width="0.1524" layer="91"/>
<label x="10.16" y="111.76" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="PC2(OC0C/RXD0)"/>
</segment>
</net>
<net name="IR_SENSOR_OUTPUT_24V" class="0">
<segment>
<wire x1="76.2" y1="-55.88" x2="88.9" y2="-55.88" width="0.1524" layer="91"/>
<label x="76.2" y="-55.88" size="1.778" layer="95"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="200.66" y1="-86.36" x2="218.44" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-86.36" x2="218.44" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-86.36" x2="233.68" y2="-86.36" width="0.1524" layer="91"/>
<junction x="218.44" y="-86.36"/>
<label x="220.98" y="-86.36" size="1.778" layer="95"/>
<pinref part="IR_SENSOR" gate="G$1" pin="2"/>
<pinref part="R28" gate="G$1" pin="2"/>
<pinref part="R24" gate="G$1" pin="1"/>
</segment>
</net>
<net name="MIRROR_INDEX_24V" class="0">
<segment>
<wire x1="76.2" y1="-38.1" x2="88.9" y2="-38.1" width="0.1524" layer="91"/>
<label x="76.2" y="-38.1" size="1.778" layer="95"/>
<pinref part="R17" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="205.74" y1="-35.56" x2="210.82" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-35.56" x2="210.82" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-33.02" x2="215.9" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-33.02" x2="215.9" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="215.9" y1="-33.02" x2="246.38" y2="-33.02" width="0.1524" layer="91"/>
<junction x="215.9" y="-33.02"/>
<label x="220.98" y="-33.02" size="1.778" layer="95"/>
<pinref part="MIRROR_IDX" gate="G$1" pin="2"/>
<pinref part="R18" gate="G$1" pin="2"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
</net>
<net name="MOTOR_M" class="0">
<segment>
<wire x1="213.36" y1="-139.7" x2="190.5" y2="-139.7" width="0.1524" layer="91"/>
<label x="195.58" y="-139.7" size="1.778" layer="95"/>
<pinref part="T3" gate="G$1" pin="C"/>
<pinref part="MOT" gate="-1" pin="S"/>
<pinref part="D3" gate="G$1" pin="A"/>
<wire x1="190.5" y1="-139.7" x2="190.5" y2="-132.08" width="0.1524" layer="91"/>
<junction x="190.5" y="-139.7"/>
</segment>
</net>
<net name="N$125" class="0">
<segment>
<wire x1="180.34" y1="-66.04" x2="190.5" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-66.04" x2="190.5" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-68.58" x2="218.44" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-66.04" x2="210.82" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-66.04" x2="218.44" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-63.5" x2="172.72" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-66.04" x2="180.34" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-73.66" x2="210.82" y2="-66.04" width="0.1524" layer="91"/>
<junction x="190.5" y="-66.04"/>
<junction x="172.72" y="-66.04"/>
<junction x="180.34" y="-66.04"/>
<junction x="210.82" y="-66.04"/>
<pinref part="C20" gate="G$1" pin="1"/>
<pinref part="IR_SENSOR" gate="G$1" pin="3"/>
<pinref part="R24" gate="G$1" pin="2"/>
<pinref part="T1" gate="G$1" pin="D@2"/>
<pinref part="T1" gate="G$1" pin="D@1"/>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="T1" gate="G$1" pin="D@3"/>
<wire x1="172.72" y1="-63.5" x2="172.72" y2="-60.96" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="D@4"/>
<wire x1="172.72" y1="-60.96" x2="172.72" y2="-58.42" width="0.1524" layer="91"/>
<junction x="172.72" y="-63.5"/>
<junction x="172.72" y="-60.96"/>
</segment>
</net>
<net name="N$128" class="0">
<segment>
<wire x1="157.48" y1="-76.2" x2="162.56" y2="-76.2" width="0.1524" layer="91"/>
<wire x1="162.56" y1="-76.2" x2="162.56" y2="-71.12" width="0.1524" layer="91"/>
<junction x="157.48" y="-76.2"/>
<pinref part="R26" gate="G$1" pin="2"/>
<pinref part="R23" gate="G$1" pin="1"/>
<pinref part="T1" gate="G$1" pin="G"/>
</segment>
</net>
<net name="N$129" class="0">
<segment>
<wire x1="210.82" y1="-88.9" x2="210.82" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="210.82" y1="-83.82" x2="200.66" y2="-83.82" width="0.1524" layer="91"/>
<junction x="210.82" y="-83.82"/>
<pinref part="R29" gate="G$1" pin="2"/>
<pinref part="R25" gate="G$1" pin="1"/>
<pinref part="IR_SENSOR" gate="G$1" pin="4"/>
</segment>
</net>
<net name="N$113" class="0">
<segment>
<pinref part="R27" gate="G$1" pin="2"/>
<pinref part="T2" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$126" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="1"/>
<pinref part="T2" gate="G$1" pin="C"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="B"/>
<pinref part="R31" gate="G$1" pin="2"/>
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
<pinref part="ERROR" gate="G$1" pin="A"/>
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
<net name="LED_NORTH" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="314.96" y1="66.04" x2="294.64" y2="66.04" width="0.1524" layer="91"/>
<label x="294.64" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PH7(CLK/!CS3!/A19)"/>
<wire x1="104.14" y1="121.92" x2="124.46" y2="121.92" width="0.1524" layer="91"/>
<label x="106.68" y="121.92" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_WEST" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="340.36" y1="60.96" x2="294.64" y2="60.96" width="0.1524" layer="91"/>
<label x="294.64" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA0(ADCA0/AREFA)"/>
<wire x1="20.32" y1="167.64" x2="40.64" y2="167.64" width="0.1524" layer="91"/>
<label x="25.4" y="167.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_SOUTH" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="353.06" y1="58.42" x2="294.64" y2="58.42" width="0.1524" layer="91"/>
<label x="294.64" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PJ3(D3/A3/A11)"/>
<wire x1="104.14" y1="106.68" x2="124.46" y2="106.68" width="0.1524" layer="91"/>
<label x="106.68" y="106.68" size="1.778" layer="95"/>
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
<approved hash="106,1,330.2,-81.28,+12V,,,,,"/>
<approved hash="106,1,304.8,-81.28,+12V,,,,,"/>
<approved hash="115,1,130.071,89.431,FRAME1,,,,,"/>
<approved hash="115,1,396.771,-95.989,FRAME4,,,,,"/>
<approved hash="115,1,396.771,89.431,FRAME6,,,,,"/>
<approved hash="115,1,215.9,153.865,PDI_ATMEL,,,,,"/>
<approved hash="115,1,130.071,-95.989,FRAME8,,,,,"/>
</errors>
</schematic>
</drawing>
</eagle>

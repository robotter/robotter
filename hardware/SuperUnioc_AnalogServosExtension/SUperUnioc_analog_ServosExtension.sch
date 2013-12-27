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
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
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
<symbol name="+12V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
</devicesets>
</library>
<library name="robotter_diode">
<packages>
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
</packages>
<symbols>
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
</symbols>
<devicesets>
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
<attribute name="RS" value="688-0502" constant="no"/>
<attribute name="VALUE" value="MBRA340T3" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
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
</devicesets>
</library>
<library name="robotter_ic">
<packages>
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
</packages>
<symbols>
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
</symbols>
<devicesets>
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
<attribute name="RS" value="380-0500" constant="no"/>
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
</devicesets>
</library>
<library name="robotter_capacitor">
<packages>
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
<deviceset name="100UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_POL_" x="0" y="0"/>
</gates>
<devices>
<device name="F_35V" package="PANASONIC_F">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="537-0613" constant="no"/>
<attribute name="VALUE" value="100µF 35V" constant="no"/>
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
<attribute name="RS" value="568-828" constant="no"/>
<attribute name="VALUE" value="220µF 35V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_connector">
<packages>
<package name="EMBASE_8+8_FEM">
<wire x1="-8" y1="-2" x2="-8" y2="2" width="0.127" layer="21"/>
<wire x1="-8" y1="2" x2="8" y2="2" width="0.127" layer="21"/>
<wire x1="8" y1="2" x2="8" y2="-2" width="0.127" layer="21"/>
<wire x1="8" y1="-2" x2="-8" y2="-2" width="0.127" layer="21"/>
<pad name="1" x="-7" y="1" drill="0.8" diameter="1.27" shape="square"/>
<pad name="2" x="-7" y="-1" drill="0.8" diameter="1.27"/>
<pad name="3" x="-5" y="1" drill="0.8" diameter="1.27"/>
<pad name="4" x="-5" y="-1" drill="0.8" diameter="1.27"/>
<pad name="5" x="-3" y="1" drill="0.8" diameter="1.27"/>
<pad name="6" x="-3" y="-1" drill="0.8" diameter="1.27"/>
<pad name="7" x="-1" y="1" drill="0.8" diameter="1.27"/>
<pad name="8" x="-1" y="-1" drill="0.8" diameter="1.27"/>
<pad name="9" x="1" y="1" drill="0.8" diameter="1.27"/>
<pad name="10" x="1" y="-1" drill="0.8" diameter="1.27"/>
<pad name="11" x="3" y="1" drill="0.8" diameter="1.27"/>
<pad name="12" x="3" y="-1" drill="0.8" diameter="1.27"/>
<pad name="13" x="5" y="1" drill="0.8" diameter="1.27"/>
<pad name="14" x="5" y="-1" drill="0.8" diameter="1.27"/>
<pad name="15" x="7" y="1" drill="0.8" diameter="1.27"/>
<pad name="16" x="7" y="-1" drill="0.8" diameter="1.27"/>
<text x="-8" y="3" size="1.27" layer="25">&gt;NAME</text>
<text x="-8" y="-4" size="1.27" layer="27">&gt;VALUE</text>
<polygon width="0.127" layer="21">
<vertex x="-7" y="2.2"/>
<vertex x="-7.4" y="2.6"/>
<vertex x="-6.6" y="2.6"/>
</polygon>
</package>
<package name="ANALOG_SERVOS">
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
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<text x="-3.048" y="-2.794" size="1.27" layer="21" font="vector">-</text>
<text x="-0.508" y="-2.794" size="1.27" layer="21" font="vector">+</text>
<text x="2.032" y="-2.794" size="1.27" layer="21" font="vector">s</text>
</package>
</packages>
<symbols>
<symbol name="EMBASE_8+8">
<wire x1="5.08" y1="-15.24" x2="-5.08" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-15.24" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="8.382" size="1.778" layer="95">&gt;NAME</text>
<pin name="5" x="-7.62" y="0" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="7.62" y="5.08" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="2.54" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="-7.62" y="2.54" length="short" direction="pas" swaplevel="1"/>
<pin name="6" x="7.62" y="0" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-7.62" y="5.08" length="short" direction="pas" swaplevel="1"/>
<pin name="7" x="-7.62" y="-2.54" length="short" direction="pas" swaplevel="1"/>
<pin name="8" x="7.62" y="-2.54" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="9" x="-7.62" y="-5.08" length="short" direction="pas" swaplevel="1"/>
<pin name="10" x="7.62" y="-5.08" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="11" x="-7.62" y="-7.62" length="short" direction="pas" swaplevel="1"/>
<pin name="12" x="7.62" y="-7.62" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="13" x="-7.62" y="-10.16" length="short" direction="pas" swaplevel="1"/>
<pin name="14" x="7.62" y="-10.16" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="15" x="-7.62" y="-12.7" length="short" direction="pas" swaplevel="1"/>
<pin name="16" x="7.62" y="-12.7" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="ANALOG_SERVO">
<wire x1="3.81" y1="-5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="GND" x="7.62" y="-2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="+5V" x="7.62" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="PWM" x="7.62" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="EMBASE_8+8_FEM" prefix="J">
<gates>
<gate name="G$1" symbol="EMBASE_8+8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="EMBASE_8+8_FEM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1109794" constant="no"/>
<attribute name="RS" value="605-8847" constant="no"/>
<attribute name="VALUE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ANALOG_SERVO" prefix="SV" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="ANALOG_SERVO" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ANALOG_SERVOS">
<connects>
<connect gate="G$1" pin="+5V" pad="2"/>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="PWM" pad="3"/>
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
<description>&lt;b&gt;Mounting Holes and Pads&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
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
<library name="robotter_resistor">
<packages>
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
<device name="-A" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="224-0395" constant="no"/>
<attribute name="VALUE" value="1k 1W" constant="no"/>
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
<deviceset name="470" prefix="R" uservalue="yes">
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
<attribute name="RS" value="213-2222" constant="no"/>
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
<attribute name="RS" value="740-9038" constant="no"/>
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
<attribute name="RS" value="727-2274" constant="no"/>
<attribute name="VALUE" value="33µH" constant="no"/>
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
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device=""/>
<part name="D1" library="robotter_diode" deviceset="MBRA340T3" device="" value="MBRA340T3"/>
<part name="P+2" library="supply1" deviceset="+12V" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="C12" library="robotter_capacitor" deviceset="220UF" device="F_35V" value="220µF 35V"/>
<part name="C9" library="robotter_capacitor" deviceset="100UF" device="F_35V"/>
<part name="L1" library="robotter_inductor" deviceset="33µH" device="-3.3A" value="33uH"/>
<part name="R2" library="robotter_resistor" deviceset="1K" device="-F" value="1k 1%"/>
<part name="R1" library="robotter_resistor" deviceset="3K09" device="-F" value="3k 1%"/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="IC2" library="robotter_ic" deviceset="74LVC4245" device="APW"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="JA1" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="+3V21" library="supply1" deviceset="+3V3" device=""/>
<part name="P+7" library="supply1" deviceset="+12V" device=""/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="PF3" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C3" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="PF7" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C4" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="PH0" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C1" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+6" library="supply1" deviceset="+5V" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="PF5" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C2" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+8" library="supply1" deviceset="+5V" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="PF6" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C5" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+11" library="supply1" deviceset="+5V" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="PF4" library="robotter_connector" deviceset="ANALOG_SERVO" device=""/>
<part name="C6" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="P+12" library="supply1" deviceset="+5V" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="C7" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="IC3" library="robotter_ic" deviceset="LM2596S" device="-ADJ" value="LM2596S-ADJ"/>
<part name="R3" library="robotter_resistor" deviceset="470" device="-F"/>
<part name="PW" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="144.78" y="-127" size="1.778" layer="91">manque refs RS pour c9 C12 IC3 et L1</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME2" gate="G$1" x="0" y="-182.88"/>
<instance part="D1" gate="G$1" x="195.58" y="-101.6" rot="R90"/>
<instance part="P+2" gate="1" x="124.46" y="-76.2" smashed="yes">
<attribute name="VALUE" x="121.92" y="-73.66" size="1.778" layer="96"/>
</instance>
<instance part="GND13" gate="1" x="170.18" y="-111.76"/>
<instance part="C12" gate="G$1" x="223.52" y="-93.98"/>
<instance part="C9" gate="G$1" x="132.08" y="-93.98"/>
<instance part="L1" gate="G$1" x="203.2" y="-78.74"/>
<instance part="R2" gate="G$1" x="213.36" y="-104.14" rot="R90"/>
<instance part="R1" gate="G$1" x="213.36" y="-83.82" rot="R90"/>
<instance part="P+1" gate="1" x="238.76" y="-73.66"/>
<instance part="IC2" gate="G$1" x="195.58" y="101.6"/>
<instance part="C11" gate="G$1" x="220.98" y="129.54"/>
<instance part="C10" gate="G$1" x="165.1" y="129.54"/>
<instance part="+3V1" gate="G$1" x="165.1" y="134.62"/>
<instance part="P+3" gate="1" x="220.98" y="134.62"/>
<instance part="GND1" gate="1" x="162.56" y="83.82"/>
<instance part="GND2" gate="1" x="198.12" y="76.2"/>
<instance part="GND3" gate="1" x="220.98" y="121.92"/>
<instance part="GND4" gate="1" x="165.1" y="121.92"/>
<instance part="JA1" gate="G$1" x="76.2" y="139.7"/>
<instance part="GND25" gate="1" x="15.24" y="142.24"/>
<instance part="+3V21" gate="G$1" x="106.68" y="147.32"/>
<instance part="P+7" gate="1" x="111.76" y="129.54"/>
<instance part="H1" gate="G$1" x="53.34" y="-121.92" rot="R90"/>
<instance part="H2" gate="G$1" x="68.58" y="-121.92" rot="R90"/>
<instance part="GND5" gate="1" x="60.96" y="-127"/>
<instance part="PF3" gate="G$1" x="25.4" y="43.18"/>
<instance part="C3" gate="G$1" x="48.26" y="40.64"/>
<instance part="P+4" gate="1" x="60.96" y="45.72" smashed="yes">
<attribute name="VALUE" x="60.96" y="45.72" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="48.26" y="33.02"/>
<instance part="PF7" gate="G$1" x="25.4" y="20.32"/>
<instance part="C4" gate="G$1" x="48.26" y="17.78"/>
<instance part="P+5" gate="1" x="60.96" y="22.86" smashed="yes">
<attribute name="VALUE" x="60.96" y="22.86" size="1.778" layer="96"/>
</instance>
<instance part="GND7" gate="1" x="48.26" y="10.16"/>
<instance part="PH0" gate="G$1" x="25.4" y="91.44"/>
<instance part="C1" gate="G$1" x="48.26" y="88.9"/>
<instance part="P+6" gate="1" x="60.96" y="93.98" smashed="yes">
<attribute name="VALUE" x="60.96" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="1" x="48.26" y="81.28"/>
<instance part="PF5" gate="G$1" x="25.4" y="68.58"/>
<instance part="C2" gate="G$1" x="48.26" y="66.04"/>
<instance part="P+8" gate="1" x="60.96" y="71.12" smashed="yes">
<attribute name="VALUE" x="60.96" y="71.12" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="48.26" y="58.42"/>
<instance part="PF6" gate="G$1" x="78.74" y="91.44"/>
<instance part="C5" gate="G$1" x="101.6" y="88.9"/>
<instance part="P+11" gate="1" x="114.3" y="93.98" smashed="yes">
<attribute name="VALUE" x="114.3" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="GND12" gate="1" x="101.6" y="81.28"/>
<instance part="PF4" gate="G$1" x="78.74" y="68.58"/>
<instance part="C6" gate="G$1" x="101.6" y="66.04"/>
<instance part="P+12" gate="1" x="114.3" y="71.12" smashed="yes">
<attribute name="VALUE" x="114.3" y="71.12" size="1.778" layer="96"/>
</instance>
<instance part="GND14" gate="1" x="101.6" y="58.42"/>
<instance part="C7" gate="G$1" x="149.86" y="-91.44"/>
<instance part="IC3" gate="G$1" x="175.26" y="-81.28"/>
<instance part="R3" gate="G$1" x="238.76" y="-104.14" rot="R90"/>
<instance part="PW" gate="G$1" x="238.76" y="-81.28"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="223.52" y1="-96.52" x2="223.52" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-109.22" x2="213.36" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="213.36" y1="-109.22" x2="195.58" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-109.22" x2="177.8" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="175.26" y1="-109.22" x2="170.18" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="170.18" y1="-109.22" x2="162.56" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="162.56" y1="-109.22" x2="149.86" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-109.22" x2="132.08" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="132.08" y1="-109.22" x2="132.08" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="165.1" y1="-83.82" x2="162.56" y2="-83.82" width="0.1524" layer="91"/>
<junction x="162.56" y="-109.22"/>
<wire x1="162.56" y1="-83.82" x2="162.56" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="195.58" y1="-104.14" x2="195.58" y2="-109.22" width="0.1524" layer="91"/>
<junction x="195.58" y="-109.22"/>
<pinref part="GND13" gate="1" pin="GND"/>
<junction x="170.18" y="-109.22"/>
<pinref part="C12" gate="G$1" pin="-"/>
<pinref part="C9" gate="G$1" pin="-"/>
<pinref part="R2" gate="G$1" pin="1"/>
<junction x="213.36" y="-109.22"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="149.86" y1="-96.52" x2="149.86" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="EN"/>
<pinref part="IC3" gate="G$1" pin="GND"/>
<wire x1="175.26" y1="-91.44" x2="175.26" y2="-109.22" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="GND@1"/>
<wire x1="175.26" y1="-109.22" x2="177.8" y2="-109.22" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-109.22" x2="177.8" y2="-91.44" width="0.1524" layer="91"/>
<junction x="175.26" y="-109.22"/>
<junction x="177.8" y="-109.22"/>
<junction x="149.86" y="-109.22"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="223.52" y1="-109.22" x2="238.76" y2="-109.22" width="0.1524" layer="91"/>
<junction x="223.52" y="-109.22"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="GND@2"/>
<pinref part="IC2" gate="G$1" pin="GND@1"/>
<pinref part="IC2" gate="G$1" pin="GND@0"/>
<wire x1="198.12" y1="78.74" x2="200.66" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<junction x="198.12" y="78.74"/>
<junction x="195.58" y="78.74"/>
<wire x1="195.58" y1="78.74" x2="198.12" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="DIR_H_TO_L"/>
<wire x1="172.72" y1="88.9" x2="162.56" y2="88.9" width="0.1524" layer="91"/>
<wire x1="162.56" y1="88.9" x2="162.56" y2="86.36" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="/OE"/>
<wire x1="162.56" y1="86.36" x2="172.72" y2="86.36" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<junction x="162.56" y="86.36"/>
<pinref part="IC2" gate="G$1" pin="IO_VL6"/>
<wire x1="162.56" y1="88.9" x2="162.56" y2="93.98" width="0.1524" layer="91"/>
<wire x1="162.56" y1="93.98" x2="162.56" y2="96.52" width="0.1524" layer="91"/>
<wire x1="162.56" y1="96.52" x2="172.72" y2="96.52" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL7"/>
<wire x1="172.72" y1="93.98" x2="162.56" y2="93.98" width="0.1524" layer="91"/>
<junction x="162.56" y="88.9"/>
<junction x="162.56" y="93.98"/>
</segment>
<segment>
<wire x1="68.58" y1="144.78" x2="15.24" y2="144.78" width="0.1524" layer="91"/>
<pinref part="JA1" gate="G$1" pin="1"/>
<pinref part="GND25" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="60.96" y1="-124.46" x2="53.34" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
<wire x1="68.58" y1="-124.46" x2="60.96" y2="-124.46" width="0.1524" layer="91"/>
<junction x="60.96" y="-124.46"/>
</segment>
<segment>
<pinref part="PF3" gate="G$1" pin="GND"/>
<wire x1="33.02" y1="40.64" x2="33.02" y2="35.56" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="33.02" y1="35.56" x2="48.26" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<junction x="48.26" y="35.56"/>
</segment>
<segment>
<pinref part="PF7" gate="G$1" pin="GND"/>
<wire x1="33.02" y1="17.78" x2="33.02" y2="12.7" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="33.02" y1="12.7" x2="48.26" y2="12.7" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
<junction x="48.26" y="12.7"/>
</segment>
<segment>
<pinref part="PH0" gate="G$1" pin="GND"/>
<wire x1="33.02" y1="88.9" x2="33.02" y2="83.82" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="83.82" x2="48.26" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
<junction x="48.26" y="83.82"/>
</segment>
<segment>
<pinref part="PF5" gate="G$1" pin="GND"/>
<wire x1="33.02" y1="66.04" x2="33.02" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="33.02" y1="60.96" x2="48.26" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="48.26" y="60.96"/>
</segment>
<segment>
<pinref part="PF6" gate="G$1" pin="GND"/>
<wire x1="86.36" y1="88.9" x2="86.36" y2="83.82" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="86.36" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
<junction x="101.6" y="83.82"/>
</segment>
<segment>
<pinref part="PF4" gate="G$1" pin="GND"/>
<wire x1="86.36" y1="66.04" x2="86.36" y2="60.96" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="86.36" y1="60.96" x2="101.6" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
<junction x="101.6" y="60.96"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="185.42" y1="-78.74" x2="195.58" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="195.58" y1="-99.06" x2="195.58" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="195.58" y1="-78.74" x2="198.12" y2="-78.74" width="0.1524" layer="91"/>
<junction x="195.58" y="-78.74"/>
<pinref part="IC3" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="185.42" y1="-83.82" x2="187.96" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-83.82" x2="187.96" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="187.96" y1="-88.9" x2="213.36" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="213.36" y1="-88.9" x2="213.36" y2="-99.06" width="0.1524" layer="91"/>
<junction x="213.36" y="-88.9"/>
<pinref part="IC3" gate="G$1" pin="FB"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<wire x1="165.1" y1="-78.74" x2="149.86" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-78.74" x2="132.08" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="132.08" y1="-78.74" x2="124.46" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="132.08" y1="-88.9" x2="132.08" y2="-78.74" width="0.1524" layer="91"/>
<junction x="132.08" y="-78.74"/>
<pinref part="C9" gate="G$1" pin="+"/>
<pinref part="P+2" gate="1" pin="+12V"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="149.86" y1="-88.9" x2="149.86" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="IN"/>
<junction x="149.86" y="-78.74"/>
</segment>
<segment>
<pinref part="JA1" gate="G$1" pin="16"/>
<pinref part="P+7" gate="1" pin="+12V"/>
<wire x1="83.82" y1="127" x2="111.76" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<wire x1="213.36" y1="-78.74" x2="223.52" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-78.74" x2="238.76" y2="-78.74" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-88.9" x2="223.52" y2="-78.74" width="0.1524" layer="91"/>
<junction x="223.52" y="-78.74"/>
<pinref part="C12" gate="G$1" pin="+"/>
<pinref part="L1" gate="G$1" pin="2"/>
<wire x1="208.28" y1="-78.74" x2="213.36" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<junction x="213.36" y="-78.74"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<pinref part="PW" gate="G$1" pin="A"/>
<junction x="238.76" y="-78.74"/>
<wire x1="238.76" y1="-78.74" x2="238.76" y2="-76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VCC"/>
<wire x1="198.12" y1="121.92" x2="198.12" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="198.12" y1="132.08" x2="220.98" y2="132.08" width="0.1524" layer="91"/>
<pinref part="P+3" gate="1" pin="+5V"/>
<junction x="220.98" y="132.08"/>
</segment>
<segment>
<pinref part="PF3" gate="G$1" pin="+5V"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="33.02" y1="43.18" x2="48.26" y2="43.18" width="0.1524" layer="91"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<wire x1="60.96" y1="43.18" x2="48.26" y2="43.18" width="0.1524" layer="91"/>
<junction x="48.26" y="43.18"/>
</segment>
<segment>
<pinref part="PF7" gate="G$1" pin="+5V"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="33.02" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<pinref part="P+5" gate="1" pin="+5V"/>
<wire x1="60.96" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<junction x="48.26" y="20.32"/>
</segment>
<segment>
<pinref part="PH0" gate="G$1" pin="+5V"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="33.02" y1="91.44" x2="48.26" y2="91.44" width="0.1524" layer="91"/>
<pinref part="P+6" gate="1" pin="+5V"/>
<wire x1="60.96" y1="91.44" x2="48.26" y2="91.44" width="0.1524" layer="91"/>
<junction x="48.26" y="91.44"/>
</segment>
<segment>
<pinref part="PF5" gate="G$1" pin="+5V"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="33.02" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<pinref part="P+8" gate="1" pin="+5V"/>
<wire x1="60.96" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<junction x="48.26" y="68.58"/>
</segment>
<segment>
<pinref part="PF6" gate="G$1" pin="+5V"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="86.36" y1="91.44" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
<pinref part="P+11" gate="1" pin="+5V"/>
<wire x1="114.3" y1="91.44" x2="101.6" y2="91.44" width="0.1524" layer="91"/>
<junction x="101.6" y="91.44"/>
</segment>
<segment>
<pinref part="PF4" gate="G$1" pin="+5V"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="86.36" y1="68.58" x2="101.6" y2="68.58" width="0.1524" layer="91"/>
<pinref part="P+12" gate="1" pin="+5V"/>
<wire x1="114.3" y1="68.58" x2="101.6" y2="68.58" width="0.1524" layer="91"/>
<junction x="101.6" y="68.58"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="VL@1"/>
<wire x1="165.1" y1="132.08" x2="190.5" y2="132.08" width="0.1524" layer="91"/>
<wire x1="190.5" y1="132.08" x2="190.5" y2="121.92" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="VL@0"/>
<wire x1="193.04" y1="121.92" x2="193.04" y2="132.08" width="0.1524" layer="91"/>
<wire x1="193.04" y1="132.08" x2="190.5" y2="132.08" width="0.1524" layer="91"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<junction x="165.1" y="132.08"/>
<junction x="190.5" y="132.08"/>
</segment>
<segment>
<wire x1="106.68" y1="144.78" x2="83.82" y2="144.78" width="0.1524" layer="91"/>
<pinref part="JA1" gate="G$1" pin="2"/>
<pinref part="+3V21" gate="G$1" pin="+3V3"/>
</segment>
</net>
<net name="SERVOS_PF3_3V3" class="0">
<segment>
<wire x1="30.48" y1="139.7" x2="68.58" y2="139.7" width="0.1524" layer="91"/>
<label x="33.02" y="139.7" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="5"/>
</segment>
<segment>
<wire x1="144.78" y1="101.6" x2="172.72" y2="101.6" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL4"/>
<label x="144.78" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF4_3V3" class="0">
<segment>
<pinref part="JA1" gate="G$1" pin="6"/>
<wire x1="83.82" y1="139.7" x2="106.68" y2="139.7" width="0.1524" layer="91"/>
<label x="86.36" y="139.7" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="144.78" y1="99.06" x2="172.72" y2="99.06" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL5"/>
<label x="144.78" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF5_3V3" class="0">
<segment>
<wire x1="144.78" y1="106.68" x2="172.72" y2="106.68" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL2"/>
<label x="144.78" y="106.68" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="30.48" y1="137.16" x2="68.58" y2="137.16" width="0.1524" layer="91"/>
<label x="33.02" y="137.16" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="7"/>
</segment>
</net>
<net name="SERVOS_PF6_3V3" class="0">
<segment>
<wire x1="144.78" y1="104.14" x2="172.72" y2="104.14" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL3"/>
<label x="144.78" y="104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JA1" gate="G$1" pin="8"/>
<wire x1="83.82" y1="137.16" x2="106.68" y2="137.16" width="0.1524" layer="91"/>
<label x="86.36" y="137.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF7_3V3" class="0">
<segment>
<wire x1="30.48" y1="134.62" x2="68.58" y2="134.62" width="0.1524" layer="91"/>
<label x="33.02" y="134.62" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="9"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="IO_VL0"/>
<wire x1="172.72" y1="111.76" x2="144.78" y2="111.76" width="0.1524" layer="91"/>
<label x="144.78" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PH0_3V3" class="0">
<segment>
<pinref part="JA1" gate="G$1" pin="10"/>
<wire x1="83.82" y1="134.62" x2="106.68" y2="134.62" width="0.1524" layer="91"/>
<label x="86.36" y="134.62" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="144.78" y1="109.22" x2="172.72" y2="109.22" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VL1"/>
<label x="144.78" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF3_5V" class="0">
<segment>
<wire x1="218.44" y1="101.6" x2="243.84" y2="101.6" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC4"/>
<label x="220.98" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PF3" gate="G$1" pin="PWM"/>
<wire x1="33.02" y1="45.72" x2="55.88" y2="45.72" width="0.1524" layer="91"/>
<label x="35.56" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF5_5V" class="0">
<segment>
<wire x1="218.44" y1="106.68" x2="243.84" y2="106.68" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC2"/>
<label x="220.98" y="106.68" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PF5" gate="G$1" pin="PWM"/>
<wire x1="33.02" y1="71.12" x2="55.88" y2="71.12" width="0.1524" layer="91"/>
<label x="35.56" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF6_5V" class="0">
<segment>
<wire x1="218.44" y1="104.14" x2="243.84" y2="104.14" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC3"/>
<label x="220.98" y="104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PF6" gate="G$1" pin="PWM"/>
<wire x1="86.36" y1="93.98" x2="109.22" y2="93.98" width="0.1524" layer="91"/>
<label x="88.9" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PF7_5V" class="0">
<segment>
<wire x1="218.44" y1="111.76" x2="243.84" y2="111.76" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC0"/>
<label x="220.98" y="111.76" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PF7" gate="G$1" pin="PWM"/>
<wire x1="33.02" y1="22.86" x2="55.88" y2="22.86" width="0.1524" layer="91"/>
<label x="35.56" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="SERVOS_PH0_5V" class="0">
<segment>
<wire x1="218.44" y1="109.22" x2="243.84" y2="109.22" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC1"/>
<label x="220.98" y="109.22" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PH0" gate="G$1" pin="PWM"/>
<wire x1="33.02" y1="93.98" x2="55.88" y2="93.98" width="0.1524" layer="91"/>
<label x="35.56" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIRECTION_MOT0_3V3" class="0">
<segment>
<wire x1="30.48" y1="132.08" x2="68.58" y2="132.08" width="0.1524" layer="91"/>
<label x="33.02" y="132.08" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="11"/>
</segment>
</net>
<net name="BRAKE_MOT0_3V3" class="0">
<segment>
<pinref part="JA1" gate="G$1" pin="14"/>
<wire x1="83.82" y1="129.54" x2="106.68" y2="129.54" width="0.1524" layer="91"/>
<label x="86.36" y="129.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_MOT2_3V3" class="0">
<segment>
<pinref part="JA1" gate="G$1" pin="4"/>
<wire x1="83.82" y1="142.24" x2="106.68" y2="142.24" width="0.1524" layer="91"/>
<label x="86.36" y="142.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIRECTION_MOT2_3V3" class="0">
<segment>
<wire x1="30.48" y1="129.54" x2="68.58" y2="129.54" width="0.1524" layer="91"/>
<label x="33.02" y="129.54" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="13"/>
</segment>
</net>
<net name="PWM_MOT1_3V3" class="0">
<segment>
<wire x1="30.48" y1="142.24" x2="68.58" y2="142.24" width="0.1524" layer="91"/>
<label x="33.02" y="142.24" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="3"/>
</segment>
</net>
<net name="DIRECTION_MOT1_3V3" class="0">
<segment>
<pinref part="JA1" gate="G$1" pin="12"/>
<wire x1="83.82" y1="132.08" x2="106.68" y2="132.08" width="0.1524" layer="91"/>
<label x="86.36" y="132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="BRAKE_MOT1_3V3" class="0">
<segment>
<wire x1="30.48" y1="127" x2="68.58" y2="127" width="0.1524" layer="91"/>
<label x="33.02" y="127" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="15"/>
</segment>
</net>
<net name="SERVOS_PF4_5V" class="0">
<segment>
<wire x1="218.44" y1="99.06" x2="243.84" y2="99.06" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="IO_VCC5"/>
<label x="220.98" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PF4" gate="G$1" pin="PWM"/>
<wire x1="86.36" y1="71.12" x2="109.22" y2="71.12" width="0.1524" layer="91"/>
<label x="88.9" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="PW" gate="G$1" pin="C"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="238.76" y1="-99.06" x2="238.76" y2="-86.36" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

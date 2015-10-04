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
<deviceset name="8K2" prefix="R">
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
<attribute name="MOUSER" value="71-CRCW0603-8.2K-E3" constant="no"/>
<attribute name="RS" value="679-0759" constant="no"/>
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
<attribute name="MOUSER" value="71-CRCW08058K20FKEB" constant="no"/>
<attribute name="RS" value=" 679-1727" constant="no"/>
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
<attribute name="MOUSER" value="660-RK73H2ATTD1502F" constant="no"/>
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
<attribute name="MOUSER" value="652-CR0603-JW-153GLF" constant="no"/>
<attribute name="RS" value="740-8912" constant="no"/>
<attribute name="VALUE" value="15k 1%" constant="no"/>
</technology>
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
<symbol name="+24V">
<wire x1="1.27" y1="-0.635" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+24V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
</devicesets>
</library>
<library name="testpad">
<packages>
<package name="P1-13">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="1.3208" diameter="2.159" shape="octagon"/>
<text x="-1.016" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="B1,27">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.0024" layer="37"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.0024" layer="37"/>
<smd name="TP" x="0" y="0" dx="1.27" dy="1.27" layer="1" roundness="100" cream="no"/>
<text x="-0.635" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-0.635" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="B2,54">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.0024" layer="37"/>
<wire x1="0" y1="-0.635" x2="0" y2="0.635" width="0.0024" layer="37"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="37"/>
<smd name="TP" x="0" y="0" dx="2.54" dy="2.54" layer="1" roundness="100" cream="no"/>
<text x="-1.27" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-1.397" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-3.175" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="P1-13Y">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="1.3208" diameter="1.905" shape="long" rot="R90"/>
<text x="-0.889" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-3.81" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="P1-17">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.8128" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="1.7018" diameter="2.54" shape="octagon"/>
<text x="-1.143" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-3.175" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="P1-17Y">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.8128" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="1.7018" diameter="2.1208" shape="long" rot="R90"/>
<text x="-1.143" y="2.286" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-3.81" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="P1-20">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="2.0066" diameter="3.1496" shape="octagon"/>
<text x="-1.524" y="1.778" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-3.175" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="P1-20Y">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<circle x="0" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="TP" x="0" y="0" drill="2.0066" diameter="2.54" shape="long" rot="R90"/>
<text x="-1.27" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="0" size="0.0254" layer="27">&gt;VALUE</text>
<text x="-1.27" y="-4.445" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
</package>
<package name="TP06R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.6" dy="0.6" layer="1" roundness="100" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.254" y="-0.381" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP06SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.5996" dy="0.5996" layer="1" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.254" y="-0.381" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP07R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.7" dy="0.7" layer="1" roundness="100" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.254" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP07SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.7" dy="0.7" layer="1" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.381" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP08R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.8" dy="0.8" layer="1" roundness="100" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.381" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP08SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.8" dy="0.8" layer="1" cream="no"/>
<text x="-0.3" y="0.4001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP09R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.9" dy="0.9" layer="1" roundness="100" cream="no"/>
<text x="-0.4501" y="0.5001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP09SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="0.8998" dy="0.8998" layer="1" cream="no"/>
<text x="-0.4501" y="0.5001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP10R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1" dy="1" layer="1" roundness="100" cream="no"/>
<text x="-0.5001" y="0.5499" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.381" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP10SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1" dy="1" layer="1" cream="no"/>
<text x="-0.5001" y="0.5499" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.635" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP11R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.1" dy="1.1" layer="1" roundness="100" cream="no"/>
<text x="-0.5499" y="0.5999" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.508" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-1.905" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP11SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.1" dy="1.1" layer="1" cream="no"/>
<text x="-0.5499" y="0.5999" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.635" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP12SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.1998" dy="1.1998" layer="1" cream="no"/>
<text x="-0.5999" y="0.65" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.635" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP12R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.2" dy="1.2" layer="1" roundness="100" cream="no"/>
<text x="-0.5999" y="0.65" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.635" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP13R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.3" dy="1.3" layer="1" roundness="100" cream="no"/>
<text x="-0.65" y="0.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.635" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP14R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.4" dy="1.4" layer="1" roundness="100" cream="no"/>
<text x="-0.7" y="0.7501" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.508" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP15R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.5" dy="1.5" layer="1" roundness="100" cream="no"/>
<text x="-0.7501" y="0.8001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP16R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.6" dy="1.6" layer="1" roundness="100" cream="no"/>
<text x="-0.8001" y="0.8499" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP17R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.7" dy="1.7" layer="1" roundness="100" cream="no"/>
<text x="-0.8499" y="0.8999" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP18R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.8" dy="1.8" layer="1" roundness="100" cream="no"/>
<text x="-0.8999" y="0.95" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP19R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.9" dy="1.9" layer="1" roundness="100" cream="no"/>
<text x="-0.95" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP20R">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="2" dy="2" layer="1" roundness="100" cream="no"/>
<text x="-1" y="1.05" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-1.016" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP13SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.3" dy="1.3" layer="1" cream="no"/>
<text x="-0.65" y="0.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP14SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.4" dy="1.4" layer="1" cream="no"/>
<text x="-0.7" y="0.7501" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-0.762" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP15SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.5" dy="1.5" layer="1" cream="no"/>
<text x="-0.7501" y="0.8001" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP16SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.5996" dy="1.5996" layer="1" cream="no"/>
<text x="-0.8001" y="0.8499" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP17SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.7" dy="1.7" layer="1" cream="no"/>
<text x="-0.8499" y="0.8999" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.762" y="-0.889" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP18SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.8" dy="1.8" layer="1" cream="no"/>
<text x="-0.8999" y="0.95" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.889" y="-1.016" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP19SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="1.8998" dy="1.8998" layer="1" cream="no"/>
<text x="-0.95" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.889" y="-1.016" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
<package name="TP20SQ">
<description>&lt;b&gt;TEST PAD&lt;/b&gt;</description>
<smd name="TP" x="0" y="0" dx="2" dy="2" layer="1" cream="no"/>
<text x="-1" y="1.05" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.016" y="-1.143" size="0.0254" layer="27">&gt;VALUE</text>
<text x="0" y="-2.54" size="1" layer="37">&gt;TP_SIGNAL_NAME</text>
</package>
</packages>
<symbols>
<symbol name="PS">
<wire x1="0.635" y1="-4.572" x2="-0.635" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="0.635" y1="-4.572" x2="0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-3.048" x2="-0.381" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-2.794" x2="0.381" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-2.54" x2="-0.381" y2="-2.286" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-2.286" x2="0.381" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-2.032" x2="-0.381" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-1.778" x2="0.381" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="-0.381" y2="-1.27" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-1.27" x2="0.381" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="0.381" y1="-1.016" x2="-0.381" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="-0.762" x2="0.381" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-5.207" x2="-0.508" y2="-5.207" width="0.1524" layer="94"/>
<wire x1="-0.508" y1="-5.207" x2="-0.508" y2="-5.715" width="0.1524" layer="94"/>
<wire x1="-0.508" y1="-5.715" x2="0" y2="-6.35" width="0.1524" layer="94"/>
<wire x1="0" y1="-6.35" x2="0.508" y2="-5.715" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-5.715" x2="0.508" y2="-5.207" width="0.1524" layer="94"/>
<text x="-1.016" y="-6.35" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="1.27" y="-2.54" size="1.778" layer="97">&gt;TP_SIGNAL_NAME</text>
<rectangle x1="-0.381" y1="-5.207" x2="0.381" y2="-4.572" layer="94"/>
<pin name="TP" x="0" y="2.54" visible="off" length="short" direction="in" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PTR1" prefix="TP">
<description>&lt;b&gt;TEST PIN&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PS" x="0" y="0"/>
</gates>
<devices>
<device name="B1,27" package="B1,27">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="B2,54" package="B2,54">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-13" package="P1-13">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-13Y" package="P1-13Y">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-17" package="P1-17">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-17Y" package="P1-17Y">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-20" package="P1-20">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="PAD1-20Y" package="P1-20Y">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP06R" package="TP06R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP06SQ" package="TP06SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP07R" package="TP07R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP07SQ" package="TP07SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP08R" package="TP08R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP08SQ" package="TP08SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP09R" package="TP09R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP09SQ" package="TP09SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP10R" package="TP10R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP10SQ" package="TP10SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP11R" package="TP11R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP11SQ" package="TP11SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP12SQ" package="TP12SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP12R" package="TP12R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP13R" package="TP13R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP14R" package="TP14R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP15R" package="TP15R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP16R" package="TP16R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP17R" package="TP17R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP18R" package="TP18R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP19R" package="TP19R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP20R" package="TP20R">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP13SQ" package="TP13SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP14SQ" package="TP14SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP15SQ" package="TP15SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP16SQ" package="TP16SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP17SQ" package="TP17SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP18SQ" package="TP18SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP19SQ" package="TP19SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="TP20SQ" package="TP20SQ">
<connects>
<connect gate="G$1" pin="TP" pad="TP"/>
</connects>
<technologies>
<technology name="">
<attribute name="TP_SIGNAL_NAME" value="" constant="no"/>
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
<attribute name="MOUSER" value="667-EEE-FK1V331P" constant="no"/>
<attribute name="RS" value="708-3475" constant="no"/>
<attribute name="VALUE" value="330µF 35V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1NF" prefix="C">
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
<technology name=""/>
</technologies>
</device>
<device name="-E" package="C0805">
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
<library name="robotter_connector">
<packages>
<package name="22-05-1052">
<description>&lt;b&gt;MOLEX 2.54mm KK RA CONNECTOR&lt;/b&gt;
&lt;br&gt;Fixed Orientation</description>
<wire x1="6.35" y1="-1.7" x2="6.35" y2="3.2" width="0.254" layer="21"/>
<wire x1="6.35" y1="3.2" x2="-6.35" y2="3.2" width="0.254" layer="21"/>
<wire x1="-6.35" y1="3.2" x2="-6.35" y2="-1.7" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.7" x2="-5.461" y2="-1.7" width="0.254" layer="21"/>
<wire x1="-5.461" y1="-1.7" x2="-5.08" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-1.7" x2="5.08" y2="-1.7" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.7" x2="5.461" y2="-1.7" width="0.254" layer="21"/>
<wire x1="5.461" y1="-1.7" x2="6.35" y2="-1.7" width="0.254" layer="21"/>
<wire x1="5.08" y1="-1.7" x2="5.08" y2="-9.271" width="0.254" layer="21"/>
<wire x1="5.08" y1="-9.271" x2="4.826" y2="-10.1" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.7" x2="-5.08" y2="-9.271" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-9.271" x2="-4.826" y2="-10.1" width="0.254" layer="21"/>
<wire x1="-4.826" y1="-10.1" x2="4.826" y2="-10.1" width="0.254" layer="21"/>
<wire x1="-5.461" y1="-1.7" x2="-5.461" y2="-7.493" width="0.254" layer="21"/>
<wire x1="-5.461" y1="-7.493" x2="-5.1308" y2="-7.8486" width="0.254" layer="21"/>
<wire x1="5.461" y1="-1.7" x2="5.461" y2="-7.493" width="0.254" layer="21"/>
<wire x1="5.461" y1="-7.493" x2="5.1308" y2="-7.8486" width="0.254" layer="21"/>
<pad name="1" x="5" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="2.5" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="3" x="0" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="4" x="-2.5" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="5" x="-5" y="0" drill="1.2" shape="long" rot="R90"/>
<text x="-2.6401" y="3.4021" size="1.016" layer="25" ratio="14">&gt;NAME</text>
<text x="4.5959" y="4.2179" size="1.27" layer="21" ratio="14" rot="R270">1</text>
<text x="-5.5133" y="4.3449" size="1.27" layer="21" ratio="14" rot="R270">5</text>
<text x="7.2121" y="2.6401" size="0.8128" layer="27" ratio="10" rot="R270">&gt;VALUE</text>
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
<package name="53047-05">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 1.25 mm (.049 inch) pitch header&lt;p&gt;
straight&lt;br&gt;
Sourcxe: http://www.molex.com/pdm_docs/sd/530470210_sd.pdf</description>
<wire x1="-3.9" y1="-1.5" x2="3.9" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.9" y1="-1.5" x2="3.9" y2="1.5" width="0.2032" layer="21"/>
<wire x1="3.9" y1="1.5" x2="-3.9" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-3.9" y1="1.5" x2="-3.9" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.875" y1="-0.25" x2="-3.5" y2="-0.25" width="0.0508" layer="21"/>
<wire x1="-3.5" y1="-0.25" x2="-3.5" y2="-1.25" width="0.0508" layer="21"/>
<wire x1="3.5" y1="-0.25" x2="3.875" y2="-0.25" width="0.0508" layer="21"/>
<wire x1="3.5" y1="-0.25" x2="3.5" y2="-1.25" width="0.0508" layer="21"/>
<wire x1="-3.875" y1="0.375" x2="-3.5" y2="0.375" width="0.0508" layer="21"/>
<wire x1="3.5" y1="0.375" x2="3.875" y2="0.375" width="0.0508" layer="21"/>
<wire x1="-3.5" y1="0.375" x2="-3.5" y2="1.125" width="0.0508" layer="21"/>
<wire x1="-3.5" y1="1.125" x2="3.5" y2="1.125" width="0.0508" layer="21"/>
<wire x1="3.5" y1="1.125" x2="3.5" y2="0.375" width="0.0508" layer="21"/>
<wire x1="3.5" y1="1.125" x2="3.75" y2="1.375" width="0.0508" layer="21"/>
<wire x1="-3.5" y1="1.125" x2="-3.75" y2="1.375" width="0.0508" layer="21"/>
<pad name="1" x="2.5" y="0.45" drill="0.5" diameter="0.6984" shape="long" rot="R90"/>
<pad name="2" x="1.25" y="0.45" drill="0.5" diameter="0.6984" shape="long" rot="R90"/>
<pad name="3" x="0" y="0.45" drill="0.5" diameter="0.6984" shape="long" rot="R90"/>
<pad name="4" x="-1.25" y="0.45" drill="0.5" diameter="0.6984" shape="long" rot="R90"/>
<pad name="5" x="-2.5" y="0.45" drill="0.5" diameter="0.6984" shape="long" rot="R90"/>
<text x="-3.75" y="1.75" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.25" y="-3.25" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.875" y1="-1.5" x2="3.875" y2="-1.125" layer="21"/>
</package>
</packages>
<symbols>
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
<symbol name="HEDS554X">
<wire x1="5.08" y1="-7.62" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="8.382" size="1.778" layer="95">&gt;NAME</text>
<pin name="CH_A" x="-10.16" y="2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="CH_I" x="-10.16" y="-2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="VCC" x="-10.16" y="5.08" length="middle" direction="pas" swaplevel="1"/>
<pin name="GND" x="-10.16" y="-5.08" length="middle" direction="pas" swaplevel="1"/>
<pin name="CH_B" x="-10.16" y="0" length="middle" direction="pas" swaplevel="1"/>
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
<symbol name="AEAT-601X">
<wire x1="5.08" y1="-7.62" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="5.08" y2="7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="8.382" size="1.778" layer="95">&gt;NAME</text>
<pin name="/CS" x="-10.16" y="2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="CLK" x="-10.16" y="-2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="5V" x="-10.16" y="5.08" length="middle" direction="pas" swaplevel="1"/>
<pin name="MISO" x="-10.16" y="-5.08" length="middle" direction="pas" swaplevel="1"/>
<pin name="GND" x="-10.16" y="0" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="HEDS554X" prefix="J">
<gates>
<gate name="G$1" symbol="HEDS554X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="22-05-1052">
<connects>
<connect gate="G$1" pin="CH_A" pad="3"/>
<connect gate="G$1" pin="CH_B" pad="5"/>
<connect gate="G$1" pin="CH_I" pad="2"/>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VCC" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="9732594" constant="no"/>
<attribute name="MOUSER" value="538-22-05-1052 " constant="no"/>
<attribute name="RS" value="687-7275" constant="no"/>
<attribute name="VALUE" value="22-05-1052" constant="no"/>
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
<deviceset name="AEAT-601X" prefix="J" uservalue="yes">
<gates>
<gate name="G$1" symbol="AEAT-601X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="53047-05">
<connects>
<connect gate="G$1" pin="/CS" pad="2"/>
<connect gate="G$1" pin="5V" pad="1"/>
<connect gate="G$1" pin="CLK" pad="4"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="MISO" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="AEAT-601X" value="" constant="no"/>
<attribute name="MOUSER" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_ic">
<packages>
<package name="TO-220-11">
<description>&lt;b&gt;11-Lead TO-220 Power Package (T)&lt;/b&gt; NS Package Number TA11B&lt;p&gt;
Source: http://cache.national.com/ds/LM/LMD18200.pdf</description>
<wire x1="-9.9" y1="-1.5" x2="-9.9" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-9.9" y1="-4.4" x2="9.9" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="9.9" y1="-4.4" x2="9.9" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-9.9" y1="-4.4" x2="-8.515" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="8.515" y1="-4.4" x2="9.9" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-8.5" y1="-9.35" x2="-8.5" y2="-8.3" width="1" layer="51"/>
<wire x1="-5.1" y1="-9.35" x2="-5.1" y2="-8.3" width="1" layer="51"/>
<wire x1="-1.7" y1="-9.35" x2="-1.7" y2="-8.3" width="1" layer="51"/>
<wire x1="1.7" y1="-9.35" x2="1.7" y2="-8.3" width="1" layer="51"/>
<wire x1="5.1" y1="-9.35" x2="5.1" y2="-8.3" width="1" layer="51"/>
<wire x1="8.5" y1="-9.35" x2="8.5" y2="-8.3" width="1" layer="51"/>
<pad name="1" x="-8.5" y="-9.37" drill="1.1" diameter="1.9304" shape="long" rot="R90"/>
<pad name="2" x="-6.8" y="-4.29" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="3" x="-5.1" y="-9.37" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="4" x="-3.4" y="-4.29" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="5" x="-1.7" y="-9.37" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="6" x="0" y="-4.29" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="7" x="1.7" y="-9.37" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="8" x="3.4" y="-4.29" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="9" x="5.1" y="-9.37" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="10" x="6.8" y="-4.29" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<pad name="11" x="8.5" y="-9.37" drill="1.1" diameter="1.778" shape="long" rot="R90"/>
<text x="-10.16" y="-9.525" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-10" y1="-1.55" x2="10" y2="0" layer="21"/>
<rectangle x1="-9" y1="-8.175" x2="-8" y2="-4.3" layer="21"/>
<rectangle x1="-5.6" y1="-8.175" x2="-4.6" y2="-4.3" layer="21"/>
<rectangle x1="-2.2" y1="-8.175" x2="-1.2" y2="-4.3" layer="21"/>
<rectangle x1="1.2" y1="-8.175" x2="2.2" y2="-4.3" layer="21"/>
<rectangle x1="4.6" y1="-8.175" x2="5.6" y2="-4.3" layer="21"/>
<rectangle x1="8" y1="-8.175" x2="9" y2="-4.3" layer="21"/>
</package>
<package name="SSOP8">
<smd name="1" x="-0.975" y="-2" dx="1.6" dy="0.3" layer="1" rot="R90"/>
<smd name="2" x="-0.325" y="-2" dx="1.6" dy="0.3" layer="1" rot="R90"/>
<smd name="3" x="0.325" y="-2" dx="1.6" dy="0.3" layer="1" rot="R90"/>
<smd name="4" x="0.975" y="-2" dx="1.6" dy="0.3" layer="1" rot="R90"/>
<smd name="5" x="0.975" y="2" dx="1.6" dy="0.3" layer="1" rot="R270"/>
<smd name="6" x="0.325" y="2" dx="1.6" dy="0.3" layer="1" rot="R270"/>
<smd name="7" x="-0.325" y="2" dx="1.6" dy="0.3" layer="1" rot="R270"/>
<smd name="8" x="-0.975" y="2" dx="1.6" dy="0.3" layer="1" rot="R270"/>
<wire x1="-1.6" y1="1.45" x2="-1.3" y2="1.45" width="0.127" layer="21"/>
<wire x1="1.3" y1="1.45" x2="1.6" y2="1.45" width="0.127" layer="21"/>
<wire x1="1.6" y1="1.45" x2="1.6" y2="-1.45" width="0.127" layer="21"/>
<wire x1="1.6" y1="-1.45" x2="1.3" y2="-1.45" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-1.45" x2="-1.6" y2="-1.45" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-1.45" x2="-1.6" y2="-0.4" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-0.4" x2="-1.6" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.6" y1="0.4" x2="-1.6" y2="1.45" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-0.4" x2="-1.6" y2="0.4" width="0.127" layer="21" curve="180"/>
</package>
</packages>
<symbols>
<symbol name="LM18200">
<wire x1="-12.7" y1="15.24" x2="12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="15.24" x2="12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="-15.24" x2="-12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-15.24" x2="-12.7" y2="15.24" width="0.254" layer="94"/>
<text x="-12.7" y="16.51" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="BOOTSTRAP1" x="15.24" y="7.62" length="short" direction="in" rot="R180"/>
<pin name="BOOTSTRAP2" x="15.24" y="-2.54" length="short" direction="in" rot="R180"/>
<pin name="OUTPUT1" x="15.24" y="12.7" length="short" direction="out" rot="R180"/>
<pin name="OUTPUT2" x="15.24" y="-7.62" length="short" direction="out" rot="R180"/>
<pin name="DIRECTION" x="-15.24" y="2.54" length="short" direction="in"/>
<pin name="BREAK" x="-15.24" y="5.08" length="short" direction="in"/>
<pin name="PWM" x="-15.24" y="0" length="short" direction="in"/>
<pin name="VS" x="-15.24" y="12.7" length="short" direction="pwr"/>
<pin name="GND" x="-15.24" y="-12.7" length="short" direction="pwr"/>
<pin name="SENSE" x="15.24" y="-12.7" length="short" direction="out" rot="R180"/>
<pin name="THERMAL" x="-15.24" y="-5.08" length="short" direction="out"/>
</symbol>
<symbol name="74LVC2T45">
<wire x1="-10.16" y1="12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<text x="5.08" y="13.97" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="-17.78" length="middle" direction="pwr" rot="R90"/>
<pin name="VCCB" x="2.54" y="17.78" length="middle" direction="pwr" rot="R270"/>
<pin name="A2" x="-15.24" y="0" length="middle" swaplevel="1"/>
<pin name="B2" x="15.24" y="0" length="middle" swaplevel="1" rot="R180"/>
<pin name="DIR_A_TO_B" x="-15.24" y="-5.08" length="middle"/>
<pin name="VCCA" x="-2.54" y="17.78" length="middle" direction="pwr" rot="R270"/>
<pin name="A1" x="-15.24" y="2.54" length="middle" swaplevel="1"/>
<pin name="B1" x="15.24" y="2.54" length="middle" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM18200T" prefix="IC">
<description>&lt;b&gt;3A, 55V H-Bridge Motor Control&lt;/b&gt;&lt;p&gt;
SourcE: http://cache.national.com/ds/LM/LMD18200.pdf</description>
<gates>
<gate name="G$1" symbol="LM18200" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO-220-11">
<connects>
<connect gate="G$1" pin="BOOTSTRAP1" pad="1"/>
<connect gate="G$1" pin="BOOTSTRAP2" pad="11"/>
<connect gate="G$1" pin="BREAK" pad="4"/>
<connect gate="G$1" pin="DIRECTION" pad="3"/>
<connect gate="G$1" pin="GND" pad="7"/>
<connect gate="G$1" pin="OUTPUT1" pad="2"/>
<connect gate="G$1" pin="OUTPUT2" pad="10"/>
<connect gate="G$1" pin="PWM" pad="5"/>
<connect gate="G$1" pin="SENSE" pad="8"/>
<connect gate="G$1" pin="THERMAL" pad="9"/>
<connect gate="G$1" pin="VS" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1468979" constant="no"/>
<attribute name="MOUSER" value="926-LMD18200T/NOPB" constant="no"/>
<attribute name="RS" value=" 534-4276" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74LVC2T45DCT" prefix="IC">
<gates>
<gate name="G$1" symbol="74LVC2T45" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SSOP8">
<connects>
<connect gate="G$1" pin="A1" pad="2"/>
<connect gate="G$1" pin="A2" pad="3"/>
<connect gate="G$1" pin="B1" pad="7"/>
<connect gate="G$1" pin="B2" pad="6"/>
<connect gate="G$1" pin="DIR_A_TO_B" pad="5"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VCCA" pad="1"/>
<connect gate="G$1" pin="VCCB" pad="8"/>
</connects>
<technologies>
<technology name=""/>
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
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device="" value=" "/>
<part name="R1" library="robotter_resistor" deviceset="8K2" device="-E"/>
<part name="R2" library="robotter_resistor" deviceset="8K2" device="-E"/>
<part name="R3" library="robotter_resistor" deviceset="8K2" device="-E"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="P+4" library="supply1" deviceset="+24V" device=""/>
<part name="PW" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="THRM" library="robotter_diode" deviceset="LED_" device="Y"/>
<part name="I_SENSE" library="testpad" deviceset="PTR1" device="PAD1-13"/>
<part name="GND" library="testpad" deviceset="PTR1" device="PAD1-13"/>
<part name="C1" library="robotter_capacitor" deviceset="10NF" device="-F"/>
<part name="C2" library="robotter_capacitor" deviceset="10NF" device="-F"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="R4" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R5" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="MOT1" library="robotter_connector" deviceset="MICROMATCH-16_SMD" device=""/>
<part name="R6" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="C4" library="robotter_capacitor" deviceset="330UF" device=""/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="MOT" library="robotter_connector" deviceset="1445055-2" device=""/>
<part name="V_PUISS" library="robotter_connector" deviceset="1445055-3" device=""/>
<part name="ENCODER" library="robotter_connector" deviceset="HEDS554X" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="P+2" library="supply1" deviceset="+5V" device=""/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="LM18200T" device=""/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="IC2" library="robotter_ic" deviceset="74LVC2T45DCT" device=""/>
<part name="C7" library="robotter_capacitor" deviceset="1NF" device="-F"/>
<part name="IC3" library="robotter_ic" deviceset="74LVC2T45DCT" device=""/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="AEAT" library="robotter_connector" deviceset="AEAT-601X" device=""/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="R7" library="robotter_resistor" deviceset="8K2" device="-F"/>
<part name="R8" library="robotter_resistor" deviceset="15K" device="-F" value="15k 1%"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="88.9" y1="172.72" x2="88.9" y2="116.84" width="0.1524" layer="97"/>
<wire x1="88.9" y1="116.84" x2="88.9" y2="104.14" width="0.1524" layer="97"/>
<wire x1="88.9" y1="104.14" x2="116.84" y2="104.14" width="0.1524" layer="97"/>
<wire x1="116.84" y1="104.14" x2="200.66" y2="104.14" width="0.1524" layer="97"/>
<wire x1="200.66" y1="104.14" x2="254" y2="104.14" width="0.1524" layer="97"/>
<wire x1="88.9" y1="116.84" x2="7.62" y2="116.84" width="0.1524" layer="97"/>
<wire x1="116.84" y1="104.14" x2="116.84" y2="58.42" width="0.1524" layer="97"/>
<text x="7.62" y="172.72" size="1.778" layer="97">control board connector</text>
<text x="93.98" y="172.72" size="1.778" layer="97">motor : H-Bridge + connectors</text>
<text x="33.02" y="55.88" size="1.778" layer="97">Transceiver 5V-&gt;3V3 for encoder</text>
<text x="205.74" y="99.06" size="1.778" layer="97">encoder connector</text>
<wire x1="116.84" y1="58.42" x2="116.84" y2="10.16" width="0.1524" layer="97"/>
<wire x1="7.62" y1="58.42" x2="116.84" y2="58.42" width="0.1524" layer="97"/>
<wire x1="200.66" y1="104.14" x2="200.66" y2="27.94" width="0.1524" layer="97"/>
<text x="33.02" y="114.3" size="1.778" layer="97">Transceiver 5V-&gt;3V3 for encoder</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="R1" gate="G$1" x="111.76" y="154.94" rot="R90"/>
<instance part="R2" gate="G$1" x="132.08" y="154.94" rot="R90"/>
<instance part="R3" gate="G$1" x="215.9" y="116.84" rot="R90"/>
<instance part="GND1" gate="1" x="157.48" y="154.94"/>
<instance part="GND2" gate="1" x="53.34" y="7.62"/>
<instance part="GND3" gate="1" x="78.74" y="38.1"/>
<instance part="GND4" gate="1" x="195.58" y="109.22"/>
<instance part="P+4" gate="1" x="152.4" y="172.72"/>
<instance part="PW" gate="G$1" x="111.76" y="142.24"/>
<instance part="THRM" gate="G$1" x="132.08" y="142.24"/>
<instance part="I_SENSE" gate="G$1" x="218.44" y="129.54" rot="R90"/>
<instance part="GND" gate="G$1" x="101.6" y="111.76" rot="R270"/>
<instance part="C1" gate="G$1" x="215.9" y="139.7" smashed="yes">
<attribute name="NAME" x="217.424" y="140.081" size="1.778" layer="95"/>
<attribute name="VALUE" x="217.424" y="142.621" size="1.778" layer="96"/>
</instance>
<instance part="C2" gate="G$1" x="215.9" y="152.4"/>
<instance part="C3" gate="G$1" x="162.56" y="162.56"/>
<instance part="R4" gate="G$1" x="157.48" y="119.38" rot="R90"/>
<instance part="R5" gate="G$1" x="167.64" y="119.38" rot="R90"/>
<instance part="MOT1" gate="-1" x="25.4" y="160.02" smashed="yes">
<attribute name="NAME" x="24.892" y="160.909" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="10.16" y="160.909" size="1.778" layer="96"/>
</instance>
<instance part="MOT1" gate="-2" x="25.4" y="157.48" smashed="yes">
<attribute name="NAME" x="24.892" y="158.369" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-3" x="25.4" y="154.94" smashed="yes">
<attribute name="NAME" x="24.892" y="155.829" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-4" x="25.4" y="152.4" smashed="yes">
<attribute name="NAME" x="24.892" y="153.289" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-5" x="25.4" y="149.86" smashed="yes">
<attribute name="NAME" x="24.892" y="150.749" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-6" x="25.4" y="147.32"/>
<instance part="MOT1" gate="-7" x="25.4" y="144.78"/>
<instance part="MOT1" gate="-8" x="25.4" y="142.24"/>
<instance part="MOT1" gate="-9" x="25.4" y="139.7"/>
<instance part="MOT1" gate="-10" x="25.4" y="137.16"/>
<instance part="MOT1" gate="-11" x="25.4" y="134.62"/>
<instance part="MOT1" gate="-12" x="25.4" y="132.08"/>
<instance part="MOT1" gate="-13" x="25.4" y="129.54"/>
<instance part="MOT1" gate="-14" x="25.4" y="127"/>
<instance part="MOT1" gate="-15" x="25.4" y="124.46"/>
<instance part="MOT1" gate="-16" x="25.4" y="121.92"/>
<instance part="R6" gate="G$1" x="71.12" y="157.48" rot="R90"/>
<instance part="+3V1" gate="G$1" x="71.12" y="167.64"/>
<instance part="C4" gate="G$1" x="147.32" y="160.02"/>
<instance part="P+1" gate="1" x="96.52" y="53.34"/>
<instance part="+3V2" gate="G$1" x="22.86" y="53.34"/>
<instance part="C5" gate="G$1" x="30.48" y="45.72"/>
<instance part="C6" gate="G$1" x="78.74" y="45.72"/>
<instance part="GND5" gate="1" x="30.48" y="38.1"/>
<instance part="GND8" gate="1" x="66.04" y="96.52"/>
<instance part="GND9" gate="1" x="17.78" y="96.52"/>
<instance part="P+3" gate="1" x="66.04" y="109.22" smashed="yes">
<attribute name="VALUE" x="63.5" y="109.22" size="1.778" layer="96"/>
</instance>
<instance part="+3V3" gate="G$1" x="17.78" y="109.22" smashed="yes">
<attribute name="VALUE" x="15.24" y="109.22" size="1.778" layer="96"/>
</instance>
<instance part="GND10" gate="1" x="50.8" y="66.04"/>
<instance part="MOT" gate="G$1" x="246.38" y="144.78" smashed="yes">
<attribute name="NAME" x="243.84" y="140.97" size="1.778" layer="95"/>
<attribute name="VALUE" x="241.3" y="137.16" size="1.778" layer="96"/>
</instance>
<instance part="V_PUISS" gate="G$1" x="96.52" y="142.24" rot="R180"/>
<instance part="ENCODER" gate="G$1" x="246.38" y="68.58"/>
<instance part="GND6" gate="1" x="215.9" y="78.74"/>
<instance part="P+2" gate="1" x="210.82" y="91.44"/>
<instance part="C9" gate="G$1" x="215.9" y="86.36"/>
<instance part="GND7" gate="1" x="210.82" y="60.96"/>
<instance part="IC1" gate="G$1" x="193.04" y="142.24"/>
<instance part="H1" gate="G$1" x="129.54" y="15.24" rot="R90"/>
<instance part="GND11" gate="1" x="129.54" y="10.16"/>
<instance part="IC2" gate="G$1" x="53.34" y="27.94"/>
<instance part="C7" gate="G$1" x="238.76" y="147.32" smashed="yes">
<attribute name="NAME" x="235.204" y="147.701" size="1.778" layer="95"/>
<attribute name="VALUE" x="230.124" y="142.621" size="1.778" layer="96"/>
</instance>
<instance part="IC3" gate="G$1" x="50.8" y="86.36"/>
<instance part="C8" gate="G$1" x="17.78" y="104.14"/>
<instance part="C10" gate="G$1" x="66.04" y="104.14"/>
<instance part="AEAT" gate="G$1" x="193.04" y="83.82"/>
<instance part="C11" gate="G$1" x="142.24" y="88.9" smashed="yes">
<attribute name="NAME" x="136.144" y="89.281" size="1.778" layer="95"/>
<attribute name="VALUE" x="125.984" y="84.201" size="1.778" layer="96"/>
</instance>
<instance part="P+5" gate="1" x="142.24" y="96.52" smashed="yes">
<attribute name="VALUE" x="139.7" y="96.52" size="1.778" layer="96"/>
</instance>
<instance part="GND12" gate="1" x="142.24" y="81.28"/>
<instance part="R7" gate="G$1" x="175.26" y="78.74" smashed="yes">
<attribute name="NAME" x="172.72" y="81.28" size="1.778" layer="95"/>
<attribute name="VALUE" x="172.72" y="74.93" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="170.18" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="160.02" y="71.12" size="1.778" layer="95"/>
<attribute name="VALUE" x="160.02" y="67.31" size="1.778" layer="96"/>
</instance>
<instance part="GND13" gate="1" x="170.18" y="66.04"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="132.08" y1="144.78" x2="132.08" y2="149.86" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="THRM" gate="G$1" pin="A"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="162.56" y1="157.48" x2="157.48" y2="157.48" width="0.1524" layer="91"/>
<wire x1="157.48" y1="157.48" x2="147.32" y2="157.48" width="0.1524" layer="91"/>
<junction x="157.48" y="157.48"/>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="C4" gate="G$1" pin="-"/>
</segment>
<segment>
<wire x1="30.48" y1="160.02" x2="53.34" y2="160.02" width="0.1524" layer="91"/>
<label x="40.64" y="160.02" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="30.48" y1="144.78" x2="53.34" y2="144.78" width="0.1524" layer="91"/>
<label x="40.64" y="144.78" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="30.48" y1="139.7" x2="53.34" y2="139.7" width="0.1524" layer="91"/>
<label x="40.64" y="139.7" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-9" pin="S"/>
</segment>
<segment>
<wire x1="30.48" y1="134.62" x2="53.34" y2="134.62" width="0.1524" layer="91"/>
<label x="40.64" y="134.62" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-11" pin="S"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="236.22" y1="63.5" x2="210.82" y2="63.5" width="0.1524" layer="91"/>
<pinref part="ENCODER" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="195.58" y1="111.76" x2="215.9" y2="111.76" width="0.1524" layer="91"/>
<wire x1="177.8" y1="129.54" x2="177.8" y2="111.76" width="0.1524" layer="91"/>
<wire x1="177.8" y1="111.76" x2="195.58" y2="111.76" width="0.1524" layer="91"/>
<wire x1="177.8" y1="111.76" x2="167.64" y2="111.76" width="0.1524" layer="91"/>
<wire x1="167.64" y1="111.76" x2="157.48" y2="111.76" width="0.1524" layer="91"/>
<wire x1="157.48" y1="111.76" x2="111.76" y2="111.76" width="0.1524" layer="91"/>
<wire x1="111.76" y1="111.76" x2="104.14" y2="111.76" width="0.1524" layer="91"/>
<wire x1="111.76" y1="137.16" x2="111.76" y2="111.76" width="0.1524" layer="91"/>
<wire x1="157.48" y1="114.3" x2="157.48" y2="111.76" width="0.1524" layer="91"/>
<wire x1="167.64" y1="114.3" x2="167.64" y2="111.76" width="0.1524" layer="91"/>
<wire x1="104.14" y1="111.76" x2="104.14" y2="137.16" width="0.1524" layer="91"/>
<wire x1="104.14" y1="137.16" x2="99.06" y2="137.16" width="0.1524" layer="91"/>
<junction x="111.76" y="111.76"/>
<junction x="177.8" y="111.76"/>
<junction x="157.48" y="111.76"/>
<junction x="167.64" y="111.76"/>
<junction x="104.14" y="111.76"/>
<junction x="195.58" y="111.76"/>
<pinref part="GND4" gate="1" pin="GND"/>
<pinref part="R3" gate="G$1" pin="1"/>
<pinref part="GND" gate="G$1" pin="TP"/>
<pinref part="PW" gate="G$1" pin="C"/>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="R5" gate="G$1" pin="1"/>
<pinref part="V_PUISS" gate="G$1" pin="3"/>
<pinref part="IC1" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="38.1" y1="22.86" x2="38.1" y2="10.16" width="0.1524" layer="91"/>
<wire x1="38.1" y1="10.16" x2="53.34" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="GND"/>
<junction x="53.34" y="10.16"/>
<pinref part="IC2" gate="G$1" pin="DIR_A_TO_B"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="GND12" gate="1" pin="GND"/>
<pinref part="AEAT" gate="G$1" pin="GND"/>
<wire x1="182.88" y1="83.82" x2="142.24" y2="83.82" width="0.1524" layer="91"/>
<junction x="142.24" y="83.82"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="208.28" y1="129.54" x2="215.9" y2="129.54" width="0.1524" layer="91"/>
<wire x1="215.9" y1="129.54" x2="215.9" y2="121.92" width="0.1524" layer="91"/>
<junction x="215.9" y="129.54"/>
<pinref part="I_SENSE" gate="G$1" pin="TP"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="SENSE"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="111.76" y1="149.86" x2="111.76" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="PW" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="177.8" y1="137.16" x2="132.08" y2="137.16" width="0.1524" layer="91"/>
<pinref part="THRM" gate="G$1" pin="C"/>
<pinref part="IC1" gate="G$1" pin="THERMAL"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="208.28" y1="149.86" x2="208.28" y2="147.32" width="0.1524" layer="91"/>
<wire x1="208.28" y1="147.32" x2="215.9" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="BOOTSTRAP1"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="208.28" y1="139.7" x2="208.28" y2="142.24" width="0.1524" layer="91"/>
<wire x1="208.28" y1="142.24" x2="215.9" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="BOOTSTRAP2"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="30.48" y1="149.86" x2="53.34" y2="149.86" width="0.1524" layer="91"/>
<label x="40.64" y="149.86" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-5" pin="S"/>
</segment>
<segment>
<wire x1="71.12" y1="165.1" x2="71.12" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="50.8" y1="45.72" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="48.26" x2="30.48" y2="48.26" width="0.1524" layer="91"/>
<wire x1="30.48" y1="48.26" x2="22.86" y2="48.26" width="0.1524" layer="91"/>
<wire x1="22.86" y1="48.26" x2="22.86" y2="50.8" width="0.1524" layer="91"/>
<junction x="30.48" y="48.26"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="IC2" gate="G$1" pin="VCCA"/>
</segment>
<segment>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="VCCA"/>
<wire x1="17.78" y1="106.68" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="33.02" y1="106.68" x2="48.26" y2="106.68" width="0.1524" layer="91"/>
<wire x1="48.26" y1="106.68" x2="48.26" y2="104.14" width="0.1524" layer="91"/>
<junction x="17.78" y="106.68"/>
<pinref part="IC3" gate="G$1" pin="DIR_A_TO_B"/>
<wire x1="35.56" y1="81.28" x2="33.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="33.02" y1="81.28" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<junction x="33.02" y="106.68"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<wire x1="30.48" y1="147.32" x2="53.34" y2="147.32" width="0.1524" layer="91"/>
<label x="40.64" y="147.32" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="30.48" y1="132.08" x2="53.34" y2="132.08" width="0.1524" layer="91"/>
<label x="40.64" y="132.08" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-12" pin="S"/>
</segment>
<segment>
<wire x1="78.74" y1="48.26" x2="55.88" y2="48.26" width="0.1524" layer="91"/>
<wire x1="55.88" y1="48.26" x2="55.88" y2="45.72" width="0.1524" layer="91"/>
<wire x1="78.74" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<wire x1="96.52" y1="48.26" x2="96.52" y2="50.8" width="0.1524" layer="91"/>
<junction x="78.74" y="48.26"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<pinref part="IC2" gate="G$1" pin="VCCB"/>
</segment>
<segment>
<wire x1="215.9" y1="88.9" x2="210.82" y2="88.9" width="0.1524" layer="91"/>
<wire x1="236.22" y1="73.66" x2="236.22" y2="88.9" width="0.1524" layer="91"/>
<wire x1="236.22" y1="88.9" x2="215.9" y2="88.9" width="0.1524" layer="91"/>
<junction x="215.9" y="88.9"/>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="P+2" gate="1" pin="+5V"/>
<pinref part="ENCODER" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="P+3" gate="1" pin="+5V"/>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="VCCB"/>
<wire x1="66.04" y1="106.68" x2="53.34" y2="106.68" width="0.1524" layer="91"/>
<wire x1="53.34" y1="106.68" x2="53.34" y2="104.14" width="0.1524" layer="91"/>
<junction x="66.04" y="106.68"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="1"/>
<pinref part="P+5" gate="1" pin="+5V"/>
<pinref part="AEAT" gate="G$1" pin="5V"/>
<wire x1="142.24" y1="91.44" x2="182.88" y2="91.44" width="0.1524" layer="91"/>
<wire x1="182.88" y1="91.44" x2="182.88" y2="88.9" width="0.1524" layer="91"/>
<junction x="142.24" y="91.44"/>
<wire x1="142.24" y1="91.44" x2="142.24" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MISO_MOT_3V3" class="0">
<segment>
<wire x1="30.48" y1="129.54" x2="53.34" y2="129.54" width="0.1524" layer="91"/>
<label x="38.1" y="129.54" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-13" pin="S"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="170.18" y1="78.74" x2="147.32" y2="78.74" width="0.1524" layer="91"/>
<junction x="170.18" y="78.74"/>
<pinref part="R8" gate="G$1" pin="2"/>
<label x="147.32" y="78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI_MOT_3V3" class="0">
<segment>
<wire x1="30.48" y1="127" x2="53.34" y2="127" width="0.1524" layer="91"/>
<label x="38.1" y="127" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-14" pin="S"/>
</segment>
</net>
<net name="SCK_MOT_3V3" class="0">
<segment>
<wire x1="30.48" y1="124.46" x2="53.34" y2="124.46" width="0.1524" layer="91"/>
<label x="38.1" y="124.46" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-15" pin="S"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="A1"/>
<wire x1="35.56" y1="88.9" x2="12.7" y2="88.9" width="0.1524" layer="91"/>
<label x="12.7" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM_3V3" class="0">
<segment>
<wire x1="30.48" y1="157.48" x2="53.34" y2="157.48" width="0.1524" layer="91"/>
<label x="38.1" y="157.48" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-2" pin="S"/>
</segment>
<segment>
<wire x1="177.8" y1="142.24" x2="167.64" y2="142.24" width="0.1524" layer="91"/>
<wire x1="167.64" y1="142.24" x2="152.4" y2="142.24" width="0.1524" layer="91"/>
<wire x1="167.64" y1="124.46" x2="167.64" y2="142.24" width="0.1524" layer="91"/>
<junction x="167.64" y="142.24"/>
<label x="152.4" y="142.24" size="1.778" layer="95"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="PWM"/>
</segment>
</net>
<net name="DIRECTION_3V3" class="0">
<segment>
<wire x1="30.48" y1="154.94" x2="53.34" y2="154.94" width="0.1524" layer="91"/>
<label x="38.1" y="154.94" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="177.8" y1="144.78" x2="157.48" y2="144.78" width="0.1524" layer="91"/>
<wire x1="157.48" y1="144.78" x2="152.4" y2="144.78" width="0.1524" layer="91"/>
<wire x1="157.48" y1="124.46" x2="157.48" y2="144.78" width="0.1524" layer="91"/>
<junction x="157.48" y="144.78"/>
<label x="152.4" y="144.78" size="1.778" layer="95"/>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="DIRECTION"/>
</segment>
</net>
<net name="BRAKE_3V3" class="0">
<segment>
<wire x1="30.48" y1="152.4" x2="71.12" y2="152.4" width="0.1524" layer="91"/>
<label x="38.1" y="152.4" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-4" pin="S"/>
<pinref part="R6" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="177.8" y1="147.32" x2="152.4" y2="147.32" width="0.1524" layer="91"/>
<label x="152.4" y="147.32" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="BREAK"/>
</segment>
</net>
<net name="ENCODER_B_3V3" class="0">
<segment>
<wire x1="30.48" y1="137.16" x2="53.34" y2="137.16" width="0.1524" layer="91"/>
<label x="38.1" y="137.16" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-10" pin="S"/>
</segment>
<segment>
<wire x1="38.1" y1="27.94" x2="15.24" y2="30.48" width="0.1524" layer="91"/>
<label x="15.24" y="30.48" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="A2"/>
</segment>
</net>
<net name="ENCODER_A_3V3" class="0">
<segment>
<wire x1="30.48" y1="142.24" x2="53.34" y2="142.24" width="0.1524" layer="91"/>
<label x="38.1" y="142.24" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-8" pin="S"/>
</segment>
<segment>
<wire x1="38.1" y1="30.48" x2="15.24" y2="27.94" width="0.1524" layer="91"/>
<label x="15.24" y="27.94" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="A1"/>
</segment>
</net>
<net name="+24V" class="0">
<segment>
<wire x1="132.08" y1="165.1" x2="147.32" y2="165.1" width="0.1524" layer="91"/>
<wire x1="132.08" y1="160.02" x2="132.08" y2="165.1" width="0.1524" layer="91"/>
<wire x1="111.76" y1="165.1" x2="132.08" y2="165.1" width="0.1524" layer="91"/>
<wire x1="111.76" y1="160.02" x2="111.76" y2="165.1" width="0.1524" layer="91"/>
<wire x1="175.26" y1="154.94" x2="177.8" y2="154.94" width="0.1524" layer="91"/>
<wire x1="175.26" y1="165.1" x2="175.26" y2="154.94" width="0.1524" layer="91"/>
<wire x1="162.56" y1="165.1" x2="175.26" y2="165.1" width="0.1524" layer="91"/>
<wire x1="147.32" y1="165.1" x2="152.4" y2="165.1" width="0.1524" layer="91"/>
<wire x1="162.56" y1="165.1" x2="152.4" y2="165.1" width="0.1524" layer="91"/>
<wire x1="152.4" y1="165.1" x2="152.4" y2="170.18" width="0.1524" layer="91"/>
<wire x1="111.76" y1="165.1" x2="104.14" y2="165.1" width="0.1524" layer="91"/>
<wire x1="104.14" y1="165.1" x2="104.14" y2="142.24" width="0.1524" layer="91"/>
<wire x1="104.14" y1="142.24" x2="99.06" y2="142.24" width="0.1524" layer="91"/>
<junction x="147.32" y="165.1"/>
<junction x="132.08" y="165.1"/>
<junction x="152.4" y="165.1"/>
<junction x="162.56" y="165.1"/>
<junction x="111.76" y="165.1"/>
<pinref part="C4" gate="G$1" pin="+"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="P+4" gate="1" pin="+24V"/>
<pinref part="V_PUISS" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="VS"/>
</segment>
</net>
<net name="MOT1" class="0">
<segment>
<wire x1="208.28" y1="154.94" x2="215.9" y2="154.94" width="0.1524" layer="91"/>
<wire x1="243.84" y1="147.32" x2="243.84" y2="149.86" width="0.1524" layer="91"/>
<wire x1="243.84" y1="149.86" x2="238.76" y2="149.86" width="0.1524" layer="91"/>
<wire x1="238.76" y1="149.86" x2="238.76" y2="154.94" width="0.1524" layer="91"/>
<wire x1="215.9" y1="154.94" x2="238.76" y2="154.94" width="0.1524" layer="91"/>
<junction x="215.9" y="154.94"/>
<label x="231.14" y="154.94" size="1.778" layer="95"/>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="MOT" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="OUTPUT1"/>
<pinref part="C7" gate="G$1" pin="1"/>
<junction x="238.76" y="149.86"/>
</segment>
</net>
<net name="MOT2" class="0">
<segment>
<wire x1="208.28" y1="134.62" x2="215.9" y2="134.62" width="0.1524" layer="91"/>
<wire x1="215.9" y1="134.62" x2="238.76" y2="134.62" width="0.1524" layer="91"/>
<wire x1="238.76" y1="134.62" x2="238.76" y2="142.24" width="0.1524" layer="91"/>
<wire x1="238.76" y1="142.24" x2="241.3" y2="142.24" width="0.1524" layer="91"/>
<wire x1="241.3" y1="142.24" x2="241.3" y2="144.78" width="0.1524" layer="91"/>
<wire x1="241.3" y1="144.78" x2="243.84" y2="144.78" width="0.1524" layer="91"/>
<junction x="215.9" y="134.62"/>
<label x="231.14" y="134.62" size="1.778" layer="95"/>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="MOT" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="OUTPUT2"/>
<pinref part="C7" gate="G$1" pin="2"/>
<junction x="238.76" y="142.24"/>
</segment>
</net>
<net name="ENCODER_A_5V" class="0">
<segment>
<wire x1="236.22" y1="71.12" x2="210.82" y2="71.12" width="0.1524" layer="91"/>
<label x="210.82" y="71.12" size="1.778" layer="95"/>
<pinref part="ENCODER" gate="G$1" pin="CH_A"/>
</segment>
<segment>
<wire x1="68.58" y1="30.48" x2="88.9" y2="27.94" width="0.1524" layer="91"/>
<label x="73.66" y="27.94" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="B1"/>
</segment>
</net>
<net name="ENCODER_B_5V" class="0">
<segment>
<wire x1="236.22" y1="68.58" x2="210.82" y2="68.58" width="0.1524" layer="91"/>
<label x="210.82" y="68.58" size="1.778" layer="95"/>
<pinref part="ENCODER" gate="G$1" pin="CH_B"/>
</segment>
<segment>
<wire x1="68.58" y1="27.94" x2="88.9" y2="30.48" width="0.1524" layer="91"/>
<label x="73.66" y="30.48" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="B2"/>
</segment>
</net>
<net name="SCK_MOT_5V" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="B1"/>
<wire x1="66.04" y1="88.9" x2="86.36" y2="88.9" width="0.1524" layer="91"/>
<label x="68.58" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="AEAT" gate="G$1" pin="CLK"/>
<wire x1="182.88" y1="81.28" x2="147.32" y2="81.28" width="0.1524" layer="91"/>
<label x="147.32" y="81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="/CS_MOT0_5V" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="B2"/>
<wire x1="66.04" y1="86.36" x2="86.36" y2="86.36" width="0.1524" layer="91"/>
<label x="68.58" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="AEAT" gate="G$1" pin="/CS"/>
<wire x1="182.88" y1="86.36" x2="147.32" y2="86.36" width="0.1524" layer="91"/>
<label x="147.32" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="/CS_MOT_3V3" class="0">
<segment>
<wire x1="30.48" y1="121.92" x2="53.34" y2="121.92" width="0.1524" layer="91"/>
<label x="38.1" y="121.92" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-16" pin="S"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="A2"/>
<wire x1="35.56" y1="86.36" x2="12.7" y2="86.36" width="0.1524" layer="91"/>
<label x="12.7" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="AEAT" gate="G$1" pin="MISO"/>
<wire x1="182.88" y1="78.74" x2="180.34" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

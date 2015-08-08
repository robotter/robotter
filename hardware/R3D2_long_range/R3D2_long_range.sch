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
<deviceset name="100" prefix="R">
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
<attribute name="MOUSER" value="652-CR0603-JW-101GLF" constant="no"/>
<attribute name="RS" value="740-8886" constant="no"/>
<attribute name="VALUE" value="100-F" constant="no"/>
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
<attribute name="MOUSER" value="603-AF0805FR-07100RL" constant="no"/>
<attribute name="RS" value="223-0297" constant="no"/>
<attribute name="VALUE" value="100-E" constant="no"/>
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
<deviceset name="150K" prefix="R">
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
<attribute name="FARNELL" value="1527709" constant="no"/>
<attribute name="RS" value="213-2553" constant="no"/>
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
<attribute name="RS" value="810-1959" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_ic">
<packages>
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
<package name="TQFP44">
<description>&lt;b&gt;44-lead Thin Quad Flat Package&lt;/b&gt;</description>
<wire x1="-4.8" y1="4.4" x2="-4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="4.8" x2="4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.8" x2="4.8" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="4.4" x2="4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="-4.4" x2="4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.8" x2="-4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.8" x2="-4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.8" y1="-4.4" x2="-4.8" y2="4.4" width="0.2032" layer="21"/>
<circle x="-4" y="4" radius="0.2827" width="0.254" layer="21"/>
<smd name="1" x="-5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="2" x="-5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="3" x="-5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="4" x="-5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="5" x="-5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="6" x="-5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="7" x="-5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="8" x="-5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="9" x="-5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="10" x="-5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="11" x="-5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="12" x="-4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="13" x="-3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="14" x="-2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="15" x="-1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="16" x="-0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="17" x="0" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="18" x="0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="19" x="1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="20" x="2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="21" x="3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="22" x="4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="23" x="5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="24" x="5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="25" x="5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="26" x="5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="27" x="5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="28" x="5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="29" x="5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="30" x="5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="31" x="5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="32" x="5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="33" x="5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="34" x="4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="35" x="3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="36" x="2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="37" x="1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="38" x="0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="39" x="0" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="40" x="-0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="41" x="-1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="42" x="-2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="43" x="-3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="44" x="-4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<text x="-3.81" y="6.985" size="1.778" layer="25">&gt;NAME</text>
<text x="-4.445" y="-8.7551" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="-6.1001" y1="3.8001" x2="-4.95" y2="4.1999" layer="51"/>
<rectangle x1="-6.1001" y1="3" x2="-4.95" y2="3.4" layer="51"/>
<rectangle x1="-6.1001" y1="2.1999" x2="-4.95" y2="2.5999" layer="51"/>
<rectangle x1="-6.1001" y1="1.4" x2="-4.95" y2="1.8001" layer="51"/>
<rectangle x1="-6.1001" y1="0.5999" x2="-4.95" y2="1" layer="51"/>
<rectangle x1="-6.1001" y1="-0.1999" x2="-4.95" y2="0.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-1" x2="-4.95" y2="-0.5999" layer="51"/>
<rectangle x1="-6.1001" y1="-1.8001" x2="-4.95" y2="-1.4" layer="51"/>
<rectangle x1="-6.1001" y1="-2.5999" x2="-4.95" y2="-2.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-3.4" x2="-4.95" y2="-3" layer="51"/>
<rectangle x1="-6.1001" y1="-4.1999" x2="-4.95" y2="-3.8001" layer="51"/>
<rectangle x1="-4.1999" y1="-6.1001" x2="-3.8001" y2="-4.95" layer="51"/>
<rectangle x1="-3.4" y1="-6.1001" x2="-3" y2="-4.95" layer="51"/>
<rectangle x1="-2.5999" y1="-6.1001" x2="-2.1999" y2="-4.95" layer="51"/>
<rectangle x1="-1.8001" y1="-6.1001" x2="-1.4" y2="-4.95" layer="51"/>
<rectangle x1="-1" y1="-6.1001" x2="-0.5999" y2="-4.95" layer="51"/>
<rectangle x1="-0.1999" y1="-6.1001" x2="0.1999" y2="-4.95" layer="51"/>
<rectangle x1="0.5999" y1="-6.1001" x2="1" y2="-4.95" layer="51"/>
<rectangle x1="1.4" y1="-6.1001" x2="1.8001" y2="-4.95" layer="51"/>
<rectangle x1="2.1999" y1="-6.1001" x2="2.5999" y2="-4.95" layer="51"/>
<rectangle x1="3" y1="-6.1001" x2="3.4" y2="-4.95" layer="51"/>
<rectangle x1="3.8001" y1="-6.1001" x2="4.1999" y2="-4.95" layer="51"/>
<rectangle x1="4.95" y1="-4.1999" x2="6.1001" y2="-3.8001" layer="51"/>
<rectangle x1="4.95" y1="-3.4" x2="6.1001" y2="-3" layer="51"/>
<rectangle x1="4.95" y1="-2.5999" x2="6.1001" y2="-2.1999" layer="51"/>
<rectangle x1="4.95" y1="-1.8001" x2="6.1001" y2="-1.4" layer="51"/>
<rectangle x1="4.95" y1="-1" x2="6.1001" y2="-0.5999" layer="51"/>
<rectangle x1="4.95" y1="-0.1999" x2="6.1001" y2="0.1999" layer="51"/>
<rectangle x1="4.95" y1="0.5999" x2="6.1001" y2="1" layer="51"/>
<rectangle x1="4.95" y1="1.4" x2="6.1001" y2="1.8001" layer="51"/>
<rectangle x1="4.95" y1="2.1999" x2="6.1001" y2="2.5999" layer="51"/>
<rectangle x1="4.95" y1="3" x2="6.1001" y2="3.4" layer="51"/>
<rectangle x1="4.95" y1="3.8001" x2="6.1001" y2="4.1999" layer="51"/>
<rectangle x1="3.8001" y1="4.95" x2="4.1999" y2="6.1001" layer="51"/>
<rectangle x1="3" y1="4.95" x2="3.4" y2="6.1001" layer="51"/>
<rectangle x1="2.1999" y1="4.95" x2="2.5999" y2="6.1001" layer="51"/>
<rectangle x1="1.4" y1="4.95" x2="1.8001" y2="6.1001" layer="51"/>
<rectangle x1="0.5999" y1="4.95" x2="1" y2="6.1001" layer="51"/>
<rectangle x1="-0.1999" y1="4.95" x2="0.1999" y2="6.1001" layer="51"/>
<rectangle x1="-1" y1="4.95" x2="-0.5999" y2="6.1001" layer="51"/>
<rectangle x1="-1.8001" y1="4.95" x2="-1.4" y2="6.1001" layer="51"/>
<rectangle x1="-2.5999" y1="4.95" x2="-2.1999" y2="6.1001" layer="51"/>
<rectangle x1="-3.4" y1="4.95" x2="-3" y2="6.1001" layer="51"/>
<rectangle x1="-4.1999" y1="4.95" x2="-3.8001" y2="6.1001" layer="51"/>
</package>
<package name="EESX1106">
<pad name="A" x="2.5" y="1.25" drill="0.8"/>
<pad name="K" x="2.5" y="-1.25" drill="0.8"/>
<pad name="C" x="-2.5" y="-1.25" drill="0.8"/>
<pad name="E" x="-2.5" y="1.25" drill="0.8"/>
<hole x="0" y="1.27" drill="1"/>
<hole x="0" y="-1.27" drill="1.4"/>
<wire x1="-3.2" y1="-2.1" x2="-1.5" y2="-2.1" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-2.1" x2="1.5" y2="-2.1" width="0.127" layer="21"/>
<wire x1="1.5" y1="2.1" x2="-1.5" y2="2.1" width="0.127" layer="21"/>
<wire x1="-1.5" y1="2.1" x2="-3.2" y2="2.1" width="0.127" layer="21"/>
<wire x1="-3.2" y1="2.1" x2="-3.2" y2="-2.1" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.27" x2="-1.5" y2="-2.1" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.27" x2="-1.5" y2="2.1" width="0.127" layer="21"/>
<wire x1="1.5" y1="2.1" x2="1.5" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.27" x2="1.5" y2="-2.1" width="0.127" layer="21"/>
<wire x1="3.2" y1="2.1" x2="1.5" y2="2.1" width="0.127" layer="21"/>
<wire x1="1.5" y1="-2.1" x2="3.2" y2="-2.1" width="0.127" layer="21"/>
<wire x1="3.2" y1="-2.1" x2="3.2" y2="2.1" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-1.27" x2="-1.5" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.7" y1="-1.27" x2="1.5" y2="-1.27" width="0.127" layer="21"/>
</package>
<package name="SOT223">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt;</description>
<wire x1="3.2766" y1="1.778" x2="3.2766" y2="-1.778" width="0.2032" layer="21"/>
<wire x1="3.2766" y1="-1.778" x2="-3.2766" y2="-1.778" width="0.2032" layer="21"/>
<wire x1="-3.2766" y1="-1.778" x2="-3.2766" y2="1.778" width="0.2032" layer="21"/>
<wire x1="-3.2766" y1="1.778" x2="3.2766" y2="1.778" width="0.2032" layer="21"/>
<smd name="1" x="-2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="2" x="0" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="3" x="2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="4" x="0" y="3.099" dx="3.6" dy="2.2" layer="1"/>
<text x="1.0208" y="-4.318" size="0.8128" layer="21" ratio="12">3</text>
<text x="1.905" y="2.54" size="0.8128" layer="21" ratio="12">4</text>
<text x="-3.4526" y="-4.318" size="0.8128" layer="21" ratio="12">1</text>
<text x="-1.2906" y="-4.3274" size="0.8128" layer="21" ratio="12">2</text>
<text x="-2.54" y="0.0508" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.3208" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
</package>
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
<package name="SOT26">
<smd name="6" x="-0.95" y="1.2" dx="0.55" dy="0.8" layer="1"/>
<smd name="5" x="0" y="1.2" dx="0.55" dy="0.8" layer="1"/>
<smd name="4" x="0.95" y="1.2" dx="0.55" dy="0.8" layer="1"/>
<smd name="3" x="0.95" y="-1.2" dx="0.55" dy="0.8" layer="1"/>
<smd name="2" x="0" y="-1.2" dx="0.55" dy="0.8" layer="1"/>
<smd name="1" x="-0.95" y="-1.2" dx="0.55" dy="0.8" layer="1"/>
<wire x1="-1.55" y1="-0.75" x2="1.55" y2="-0.75" width="0.127" layer="21"/>
<wire x1="1.55" y1="-0.75" x2="1.55" y2="0.75" width="0.127" layer="21"/>
<wire x1="1.55" y1="0.75" x2="-1.55" y2="0.75" width="0.127" layer="21"/>
<wire x1="-1.55" y1="0.75" x2="-1.55" y2="-0.75" width="0.127" layer="21"/>
<rectangle x1="-1.524" y1="-0.762" x2="-0.65" y2="0.762" layer="21"/>
</package>
<package name="CRYSTAL_5032">
<wire x1="2.144" y1="-1.6" x2="-2.144" y2="-1.6" width="0.1524" layer="21"/>
<wire x1="2.144" y1="-1.6" x2="2.5" y2="-1.344" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.5" y1="-1.344" x2="-2.144" y2="-1.6" width="0.1524" layer="21" curve="90"/>
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
<smd name="1" x="-2.05" y="0" dx="1.9" dy="2.4" layer="1" roundness="10"/>
<smd name="2" x="2.05" y="0" dx="1.9" dy="2.4" layer="1" roundness="10"/>
<text x="-5.715" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-2.144" y1="1.6" x2="2.144" y2="1.6" width="0.1524" layer="21"/>
<wire x1="-2.144" y1="1.6" x2="-2.5" y2="1.344" width="0.1524" layer="21" curve="90"/>
<wire x1="2.5" y1="1.344" x2="2.144" y2="1.6" width="0.1524" layer="21" curve="90"/>
</package>
</packages>
<symbols>
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
<symbol name="ATXMEGA_D4">
<pin name="PA0/ADCA0/AREF" x="-33.02" y="40.64" length="middle" swaplevel="1"/>
<pin name="PA1/ADCA1" x="-33.02" y="38.1" length="middle" swaplevel="1"/>
<pin name="PA2/ADCA2" x="-33.02" y="35.56" length="middle" swaplevel="1"/>
<pin name="PA3/ADCA3" x="-33.02" y="33.02" length="middle" swaplevel="1"/>
<pin name="PA4/ADCA4" x="-33.02" y="30.48" length="middle" swaplevel="1"/>
<pin name="PA5/ADCA5" x="-33.02" y="27.94" length="middle" swaplevel="1"/>
<pin name="PA6/ADCA6" x="-33.02" y="25.4" length="middle" swaplevel="1"/>
<pin name="PA7/ADCA7" x="-33.02" y="22.86" length="middle" swaplevel="1"/>
<pin name="VCC@0" x="-5.08" y="53.34" length="middle" rot="R270"/>
<pin name="GND@0" x="-2.54" y="-27.94" length="middle" rot="R90"/>
<pin name="PB0/ADCA8/AREF" x="-33.02" y="15.24" length="middle" swaplevel="1"/>
<pin name="PB1/ADCA9" x="-33.02" y="12.7" length="middle" swaplevel="1"/>
<pin name="PB2/ADCA10" x="-33.02" y="10.16" length="middle" swaplevel="1"/>
<pin name="PB3/ADCA11" x="-33.02" y="7.62" length="middle" swaplevel="1"/>
<pin name="PC0/OC0A/SDA" x="-33.02" y="0" length="middle" swaplevel="1"/>
<pin name="PC1/OC0B/XCK0/SCL" x="-33.02" y="-2.54" length="middle" swaplevel="1"/>
<pin name="PC2/OC0C/RXD0" x="-33.02" y="-5.08" length="middle" swaplevel="1"/>
<pin name="PC3/OC0D/TXD0" x="-33.02" y="-7.62" length="middle" swaplevel="1"/>
<pin name="PC4/OC1A/\S\S" x="-33.02" y="-10.16" length="middle" swaplevel="1"/>
<pin name="PC5/OC1B/MOSI" x="-33.02" y="-12.7" length="middle" swaplevel="1"/>
<pin name="PC6/MISO" x="-33.02" y="-15.24" length="middle" swaplevel="1"/>
<pin name="PC7/SCK" x="-33.02" y="-17.78" length="middle" swaplevel="1"/>
<pin name="GND@1" x="0" y="-27.94" length="middle" rot="R90"/>
<pin name="GND@2" x="2.54" y="-27.94" length="middle" rot="R90"/>
<pin name="GND@3" x="5.08" y="-27.94" length="middle" rot="R90"/>
<pin name="AVCC@0" x="5.08" y="53.34" length="middle" rot="R270"/>
<pin name="OC0A/PD0" x="30.48" y="43.18" length="middle" swaplevel="1" rot="R180"/>
<pin name="XCK0/OC0B/PD1" x="30.48" y="40.64" length="middle" swaplevel="1" rot="R180"/>
<pin name="RXD0/OC0C/PD2" x="30.48" y="38.1" length="middle" swaplevel="1" rot="R180"/>
<pin name="TXD0/OC0D/PD3" x="30.48" y="35.56" length="middle" swaplevel="1" rot="R180"/>
<pin name="\S\S/PD4" x="30.48" y="33.02" length="middle" swaplevel="1" rot="R180"/>
<pin name="MOSI/PD5" x="30.48" y="30.48" length="middle" swaplevel="1" rot="R180"/>
<pin name="MISO/PD6" x="30.48" y="27.94" length="middle" swaplevel="1" rot="R180"/>
<pin name="SCK/PD7" x="30.48" y="25.4" length="middle" swaplevel="1" rot="R180"/>
<pin name="SDA/OC0A/PE0" x="30.48" y="17.78" length="middle" swaplevel="1" rot="R180"/>
<pin name="SCL/OC0B/PE1" x="30.48" y="15.24" length="middle" swaplevel="1" rot="R180"/>
<pin name="OC0C/PE2" x="30.48" y="12.7" length="middle" swaplevel="1" rot="R180"/>
<pin name="OC0D/PE3" x="30.48" y="10.16" length="middle" swaplevel="1" rot="R180"/>
<pin name="PDI" x="30.48" y="2.54" length="middle" swaplevel="1" rot="R180"/>
<pin name="/RESET" x="30.48" y="0" length="middle" swaplevel="1" rot="R180"/>
<pin name="PR0/XTAL2" x="30.48" y="-2.54" length="middle" swaplevel="1" rot="R180"/>
<pin name="PR1/XTAL1" x="30.48" y="-5.08" length="middle" swaplevel="1" rot="R180"/>
<wire x1="-27.94" y1="48.26" x2="25.4" y2="48.26" width="0.254" layer="94"/>
<wire x1="25.4" y1="48.26" x2="25.4" y2="-22.86" width="0.254" layer="94"/>
<wire x1="25.4" y1="-22.86" x2="-27.94" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-27.94" y1="-22.86" x2="-27.94" y2="48.26" width="0.254" layer="94"/>
<pin name="VCC@1" x="-2.54" y="53.34" length="middle" rot="R270"/>
<pin name="VCC@2" x="0" y="53.34" length="middle" rot="R270"/>
<text x="-27.94" y="49.53" size="1.778" layer="95">&gt;NAME</text>
<text x="-27.94" y="-25.4" size="1.778" layer="96">&gt;VALUE</text>
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
<symbol name="N-MOS_2D">
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
<pin name="D@1" x="2.54" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
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
<pin name="D@2" x="5.08" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<wire x1="2.54" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="94"/>
<text x="3.937" y="3.556" size="0.8128" layer="93">D</text>
</symbol>
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
</symbols>
<devicesets>
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
<deviceset name="ATXMEGA64D4" prefix="IC" uservalue="yes">
<gates>
<gate name="G$1" symbol="ATXMEGA_D4" x="0" y="0"/>
</gates>
<devices>
<device name="-AU" package="TQFP44">
<connects>
<connect gate="G$1" pin="/RESET" pad="35"/>
<connect gate="G$1" pin="AVCC@0" pad="39"/>
<connect gate="G$1" pin="GND@0" pad="38"/>
<connect gate="G$1" pin="GND@1" pad="8"/>
<connect gate="G$1" pin="GND@2" pad="18"/>
<connect gate="G$1" pin="GND@3" pad="30"/>
<connect gate="G$1" pin="MISO/PD6" pad="26"/>
<connect gate="G$1" pin="MOSI/PD5" pad="25"/>
<connect gate="G$1" pin="OC0A/PD0" pad="20"/>
<connect gate="G$1" pin="OC0C/PE2" pad="32"/>
<connect gate="G$1" pin="OC0D/PE3" pad="33"/>
<connect gate="G$1" pin="PA0/ADCA0/AREF" pad="40"/>
<connect gate="G$1" pin="PA1/ADCA1" pad="41"/>
<connect gate="G$1" pin="PA2/ADCA2" pad="42"/>
<connect gate="G$1" pin="PA3/ADCA3" pad="43"/>
<connect gate="G$1" pin="PA4/ADCA4" pad="44"/>
<connect gate="G$1" pin="PA5/ADCA5" pad="1"/>
<connect gate="G$1" pin="PA6/ADCA6" pad="2"/>
<connect gate="G$1" pin="PA7/ADCA7" pad="3"/>
<connect gate="G$1" pin="PB0/ADCA8/AREF" pad="4"/>
<connect gate="G$1" pin="PB1/ADCA9" pad="5"/>
<connect gate="G$1" pin="PB2/ADCA10" pad="6"/>
<connect gate="G$1" pin="PB3/ADCA11" pad="7"/>
<connect gate="G$1" pin="PC0/OC0A/SDA" pad="10"/>
<connect gate="G$1" pin="PC1/OC0B/XCK0/SCL" pad="11"/>
<connect gate="G$1" pin="PC2/OC0C/RXD0" pad="12"/>
<connect gate="G$1" pin="PC3/OC0D/TXD0" pad="13"/>
<connect gate="G$1" pin="PC4/OC1A/\S\S" pad="14"/>
<connect gate="G$1" pin="PC5/OC1B/MOSI" pad="15"/>
<connect gate="G$1" pin="PC6/MISO" pad="16"/>
<connect gate="G$1" pin="PC7/SCK" pad="17"/>
<connect gate="G$1" pin="PDI" pad="34"/>
<connect gate="G$1" pin="PR0/XTAL2" pad="36"/>
<connect gate="G$1" pin="PR1/XTAL1" pad="37"/>
<connect gate="G$1" pin="RXD0/OC0C/PD2" pad="22"/>
<connect gate="G$1" pin="SCK/PD7" pad="27"/>
<connect gate="G$1" pin="SCL/OC0B/PE1" pad="29"/>
<connect gate="G$1" pin="SDA/OC0A/PE0" pad="28"/>
<connect gate="G$1" pin="TXD0/OC0D/PD3" pad="23"/>
<connect gate="G$1" pin="VCC@0" pad="9"/>
<connect gate="G$1" pin="VCC@1" pad="19"/>
<connect gate="G$1" pin="VCC@2" pad="31"/>
<connect gate="G$1" pin="XCK0/OC0B/PD1" pad="21"/>
<connect gate="G$1" pin="\S\S/PD4" pad="24"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="556-ATXMEGA64D4-AU " constant="no"/>
<attribute name="RS" value="" constant="no"/>
<attribute name="VALUE" value="ATXMEGA64DA-AU" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="EESX1106" prefix="PH">
<gates>
<gate name="G$1" symbol="PHOTOINTERRUPTER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="EESX1106">
<connects>
<connect gate="G$1" pin="LED_A" pad="A"/>
<connect gate="G$1" pin="LED_C" pad="K"/>
<connect gate="G$1" pin="TRANSISTOR_C" pad="C"/>
<connect gate="G$1" pin="TRANSISTOR_E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DMN6068SE" prefix="T">
<gates>
<gate name="G$2" symbol="N-MOS_2D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT223">
<connects>
<connect gate="G$2" pin="D@1" pad="2"/>
<connect gate="G$2" pin="D@2" pad="4"/>
<connect gate="G$2" pin="G" pad="1"/>
<connect gate="G$2" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="2061415" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
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
<device name="16MHZ_5032" package="CRYSTAL_5032">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="2467791" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NCV8774DT33RKG" prefix="IC">
<gates>
<gate name="G$1" symbol="78XX" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DPACK_3">
<connects>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VI" pad="1"/>
<connect gate="G$1" pin="VO" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ZXMP6A17E6TA" prefix="T">
<gates>
<gate name="G$1" symbol="P-MOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT26">
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
<attribute name="FN" value="1843775" constant="no"/>
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
<package name="87831-0641">
<pad name="2" x="-2" y="1" drill="1" diameter="1.6764" shape="octagon"/>
<pad name="1" x="-2" y="-1" drill="1" diameter="1.6764" shape="square"/>
<pad name="4" x="0" y="1" drill="1" diameter="1.6764" shape="octagon"/>
<pad name="3" x="0" y="-1" drill="1" diameter="1.6764" shape="octagon"/>
<pad name="6" x="2" y="1" drill="1" diameter="1.6764" shape="octagon"/>
<pad name="5" x="2" y="-1" drill="1" diameter="1.6764" shape="octagon"/>
<wire x1="-4.325" y1="3.15" x2="-4.325" y2="-3.15" width="0.127" layer="21"/>
<wire x1="4.325" y1="-3.15" x2="4.325" y2="3.15" width="0.127" layer="21"/>
<wire x1="4.325" y1="3.15" x2="-4.325" y2="3.15" width="0.127" layer="21"/>
<wire x1="-4.325" y1="-3.15" x2="-1.2" y2="-3.15" width="0.127" layer="21"/>
<wire x1="4.315" y1="-3.15" x2="1.2" y2="-3.15" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-2.8" x2="-4" y2="-2.8" width="0.127" layer="21"/>
<wire x1="-4" y1="-2.8" x2="-4" y2="2.8" width="0.127" layer="21"/>
<wire x1="-4" y1="2.8" x2="4" y2="2.8" width="0.127" layer="21"/>
<wire x1="4" y1="2.8" x2="4" y2="-2.8" width="0.127" layer="21"/>
<wire x1="4" y1="-2.8" x2="1.2" y2="-2.8" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-2.8" x2="-1.2" y2="-3" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-3" x2="-1.2" y2="-3.15" width="0.127" layer="21"/>
<wire x1="1.2" y1="-2.8" x2="1.2" y2="-3" width="0.127" layer="21"/>
<wire x1="1.2" y1="-3" x2="1.2" y2="-3.15" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-3" x2="1.2" y2="-3" width="0.127" layer="21"/>
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
<symbol name="COM_2013_SLAVE">
<wire x1="6.35" y1="-5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="6.35" y1="-5.08" x2="6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="6.35" y2="5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="RX_I" x="10.16" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="TX_O" x="10.16" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="10.16" y="-2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="P6-2">
<wire x1="6.35" y1="-1.27" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="6.35" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="6.35" x2="6.35" y2="6.35" width="0.254" layer="94"/>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="6.35" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.778" y="-0.508" size="1.27" layer="95">1</text>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="3" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
<circle x="5.08" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="5.08" y="0" radius="0.635" width="0.254" layer="94"/>
<pin name="4" x="7.62" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="7.62" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<text x="3.048" y="-0.508" size="1.27" layer="95">2</text>
<text x="1.778" y="2.032" size="1.27" layer="95">3</text>
<text x="3.048" y="2.032" size="1.27" layer="95">4</text>
<circle x="0" y="5.08" radius="0.635" width="0.254" layer="94"/>
<pin name="5" x="-2.54" y="5.08" visible="off" length="short" direction="pas"/>
<circle x="5.08" y="5.08" radius="0.635" width="0.254" layer="94"/>
<pin name="6" x="7.62" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<text x="1.778" y="4.572" size="1.27" layer="95">5</text>
<text x="3.048" y="4.572" size="1.27" layer="95">6</text>
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
<deviceset name="COM_2013_SLAVE" prefix="UART">
<gates>
<gate name="G$1" symbol="COM_2013_SLAVE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MICROMATCH-4_SMD">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="RX_I" pad="1"/>
<connect gate="G$1" pin="TX_O" pad="4"/>
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
<deviceset name="87831-0641" prefix="J">
<gates>
<gate name="G$1" symbol="P6-2" x="-2.54" y="-2.54"/>
</gates>
<devices>
<device name="" package="87831-0641">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1393817" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_inductor">
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
<deviceset name="FERRITE_220OHMS" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MOUSER" value="81-BLM18BB221SN1D" constant="no"/>
<attribute name="RS" value="724-1302" constant="no"/>
<attribute name="VALUE" value="220 ohms" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_others">
<description>Tiny6410 board</description>
<packages>
<package name="3,0-PAD_NC">
<wire x1="-2.159" y1="0" x2="0" y2="-2.159" width="2.4892" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="2.159" x2="2.159" y2="0" width="2.4892" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="3" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="3" width="1.016" layer="39"/>
<circle x="0" y="0" radius="3" width="1.016" layer="40"/>
<circle x="0" y="0" radius="3" width="1.016" layer="43"/>
<circle x="0" y="0" radius="1.6" width="0.2032" layer="21"/>
<pad name="B3,0" x="0" y="0" drill="3" diameter="5"/>
<text x="-1.27" y="-3.81" size="1.27" layer="48">3,0</text>
</package>
</packages>
<symbols>
<symbol name="MOUNT-PAD_NC">
<wire x1="0.254" y1="2.032" x2="2.032" y2="0.254" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="0.254" x2="-0.254" y2="2.032" width="1.016" layer="94" curve="-75.749967" cap="flat"/>
<wire x1="-2.032" y1="-0.254" x2="-0.254" y2="-2.032" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<wire x1="0.254" y1="-2.032" x2="2.032" y2="-0.254" width="1.016" layer="94" curve="75.749967" cap="flat"/>
<circle x="0" y="0" radius="1.524" width="0.0508" layer="94"/>
<text x="2.794" y="0.5842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.794" y="-2.4638" size="1.778" layer="96">&gt;VALUE</text>
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
<deviceset name="MOUNT-PAD-ROUND-NC" prefix="H">
<gates>
<gate name="G$1" symbol="MOUNT-PAD_NC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3,0-PAD_NC">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+BAT" prefix="P+">
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
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C2" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="FRAME6" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V15" library="supply1" deviceset="+3V3" device=""/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="PDI_ATMEL" library="robotter_connector" deviceset="PDI_ATMEL" device="L"/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="C13" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF 50V"/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="GND45" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="IC3" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="C16" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C18" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C17" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C14" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C15" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="+3V24" library="supply1" deviceset="+3V3" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="R21" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="R22" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="FRAME8" library="frames" deviceset="A4L-LOC" device=""/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF"/>
<part name="GND72" library="supply1" deviceset="GND" device=""/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="GND74" library="supply1" deviceset="GND" device=""/>
<part name="R3" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R4" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R5" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="GND78" library="supply1" deviceset="GND" device=""/>
<part name="T1" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="MMBT2222LT1G"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="R7" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R2" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R11" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R16" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R12" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="RUN" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="ERROR" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="COM" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="MOT" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="D1" library="robotter_diode" deviceset="CGRM400*-G" device="" technology="4"/>
<part name="IC1" library="robotter_ic" deviceset="ATXMEGA64D4" device="-AU" value="ATXMEGA64D4-AU"/>
<part name="BAT" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="D4" library="robotter_diode" deviceset="MBRA340T3" device="" value="MBRA340T3"/>
<part name="PH1" library="robotter_ic" deviceset="EESX1106" device="" value="EESX1106"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R1" library="robotter_resistor" deviceset="100" device="-E" value="100-E"/>
<part name="R6" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V5" library="supply1" deviceset="+3V3" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="T3" library="robotter_ic" deviceset="DMN6068SE" device=""/>
<part name="D2" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R19" library="robotter_resistor" deviceset="3K09" device="-F" value="3K09-F"/>
<part name="R17" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="+3V13" library="supply1" deviceset="+3V3" device=""/>
<part name="R8" library="robotter_resistor" deviceset="0" device="-E"/>
<part name="R13" library="robotter_resistor" deviceset="15K" device="-F" value="15k 1%"/>
<part name="D3" library="robotter_diode" deviceset="BZV55-C3V3" device="SOD80C" value="bzv55-c3v3"/>
<part name="R20" library="robotter_resistor" deviceset="3K09" device="-F" value="3K09-F"/>
<part name="R18" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="R14" library="robotter_resistor" deviceset="15K" device="-F" value="15k 1%"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="UART" library="robotter_connector" deviceset="COM_2013_SLAVE" device=""/>
<part name="IR-SENSOR" library="robotter_connector" deviceset="87831-0641" device=""/>
<part name="+3V14" library="supply1" deviceset="+3V3" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_5032"/>
<part name="C9" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="C10" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F" value="10k"/>
<part name="L1" library="robotter_inductor" deviceset="FERRITE_220OHMS" device="" value="220 ohms"/>
<part name="C12" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="IC2" library="robotter_ic" deviceset="NCV8774DT33RKG" device=""/>
<part name="T2" library="robotter_ic" deviceset="ZXMP6A17E6TA" device=""/>
<part name="H1" library="robotter_others" deviceset="MOUNT-PAD-ROUND-NC" device=""/>
<part name="H2" library="robotter_others" deviceset="MOUNT-PAD-ROUND-NC" device=""/>
<part name="H3" library="robotter_others" deviceset="MOUNT-PAD-ROUND-NC" device=""/>
<part name="R23" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R24" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="P+5" library="robotter_others" deviceset="+BAT" device=""/>
<part name="P+6" library="robotter_others" deviceset="+BAT" device=""/>
<part name="P+7" library="robotter_others" deviceset="+BAT" device=""/>
<part name="P+8" library="robotter_others" deviceset="+BAT" device=""/>
<part name="P+9" library="robotter_others" deviceset="+BAT" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R25" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="C19" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF 50V"/>
<part name="R26" library="robotter_resistor" deviceset="150K" device="-F"/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="7.62" y1="-127" x2="96.52" y2="-127" width="1.27" layer="97" style="shortdash"/>
<wire x1="96.52" y1="-127" x2="96.52" y2="-177.8" width="1.27" layer="97" style="shortdash"/>
<text x="10.16" y="-132.08" size="1.778" layer="97">sensor head index</text>
<text x="91.44" y="-22.86" size="1.778" layer="91">connector to IR sensor : 
S15-PA-2-A00-PK
or 
S15-PA-2-A00-NK</text>
<wire x1="167.64" y1="-60.96" x2="205.74" y2="-60.96" width="1.27" layer="97" style="shortdash"/>
<wire x1="205.74" y1="-60.96" x2="205.74" y2="-30.48" width="1.27" layer="97" style="shortdash"/>
<wire x1="205.74" y1="-30.48" x2="167.64" y2="-30.48" width="1.27" layer="97" style="shortdash"/>
<wire x1="167.64" y1="-30.48" x2="167.64" y2="-60.96" width="1.27" layer="97" style="shortdash"/>
<text x="170.18" y="-58.42" size="1.778" layer="97">NC if S15-PA-2-A00-NK</text>
<wire x1="167.64" y1="-121.92" x2="205.74" y2="-121.92" width="1.27" layer="97" style="shortdash"/>
<wire x1="205.74" y1="-121.92" x2="205.74" y2="-91.44" width="1.27" layer="97" style="shortdash"/>
<wire x1="205.74" y1="-91.44" x2="167.64" y2="-91.44" width="1.27" layer="97" style="shortdash"/>
<wire x1="167.64" y1="-91.44" x2="167.64" y2="-121.92" width="1.27" layer="97" style="shortdash"/>
<text x="170.18" y="-119.38" size="1.778" layer="97">NC if S15-PA-2-A00-NK</text>
<wire x1="96.52" y1="-127" x2="200.66" y2="-127" width="1.27" layer="97" style="shortdash"/>
<wire x1="200.66" y1="-127" x2="200.66" y2="-157.48" width="1.27" layer="97" style="shortdash"/>
<text x="284.48" y="101.6" size="3.81" layer="97" ratio="15">BATTERY : 12-30V SUPPLY VOLTAGE</text>
<wire x1="274.32" y1="111.76" x2="429.26" y2="111.76" width="1.27" layer="97" style="shortdash"/>
<wire x1="429.26" y1="111.76" x2="429.26" y2="55.88" width="1.27" layer="97" style="shortdash"/>
<wire x1="429.26" y1="55.88" x2="429.26" y2="25.4" width="1.27" layer="97" style="shortdash"/>
<wire x1="274.32" y1="55.88" x2="429.26" y2="55.88" width="1.27" layer="97" style="shortdash"/>
<text x="363.22" y="12.7" size="1.778" layer="91">Use INTVCC as reference voltage of ADC</text>
<text x="317.5" y="7.62" size="1.778" layer="91"> Resistor divider is calculated to output 2V when battery voltage is 31V</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="C6" gate="G$1" x="91.44" y="149.86" smashed="yes" rot="MR0">
<attribute name="NAME" x="89.916" y="150.241" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="89.916" y="145.161" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="C5" gate="G$1" x="81.28" y="152.4" smashed="yes" rot="MR0">
<attribute name="NAME" x="79.756" y="152.781" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="79.756" y="147.701" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="C2" gate="G$1" x="71.12" y="154.94" smashed="yes" rot="MR0">
<attribute name="NAME" x="69.596" y="155.321" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="69.596" y="150.241" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND1" gate="1" x="81.28" y="137.16" smashed="yes" rot="MR0">
<attribute name="VALUE" x="83.82" y="134.62" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND2" gate="1" x="111.76" y="45.72"/>
<instance part="+3V1" gate="G$1" x="60.96" y="160.02" smashed="yes" rot="MR0">
<attribute name="VALUE" x="63.5" y="160.02" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="FRAME6" gate="G$1" x="266.7" y="0"/>
<instance part="+3V15" gate="G$1" x="149.86" y="160.02" smashed="yes">
<attribute name="VALUE" x="147.32" y="160.02" size="1.778" layer="96"/>
</instance>
<instance part="C8" gate="G$1" x="124.46" y="154.94"/>
<instance part="GND11" gate="1" x="124.46" y="137.16" smashed="yes">
<attribute name="VALUE" x="121.92" y="134.62" size="1.778" layer="96"/>
</instance>
<instance part="+3V2" gate="G$1" x="180.34" y="134.62" smashed="yes" rot="MR0">
<attribute name="VALUE" x="177.8" y="137.16" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="PDI_ATMEL" gate="1" x="215.9" y="152.4"/>
<instance part="+3V3" gate="G$1" x="233.68" y="160.02"/>
<instance part="GND20" gate="1" x="233.68" y="144.78"/>
<instance part="C13" gate="G$1" x="414.02" y="76.2"/>
<instance part="C11" gate="G$1" x="345.44" y="73.66"/>
<instance part="+3V17" gate="G$1" x="414.02" y="88.9"/>
<instance part="GND31" gate="1" x="370.84" y="66.04"/>
<instance part="GND44" gate="1" x="312.42" y="66.04" smashed="yes">
<attribute name="VALUE" x="309.88" y="63.5" size="1.778" layer="96"/>
</instance>
<instance part="GND45" gate="1" x="304.8" y="134.62" rot="MR0"/>
<instance part="GND16" gate="1" x="454.66" y="119.38" rot="MR0"/>
<instance part="GND22" gate="1" x="474.98" y="144.78" rot="MR0"/>
<instance part="IC3" gate="G$1" x="477.52" y="121.92" rot="MR0"/>
<instance part="IC3" gate="P" x="480.06" y="154.94" rot="MR0"/>
<instance part="C16" gate="G$1" x="469.9" y="157.48" rot="MR0"/>
<instance part="C18" gate="G$1" x="505.46" y="134.62" smashed="yes" rot="MR0">
<attribute name="NAME" x="506.984" y="131.699" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="506.984" y="136.779" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C17" gate="G$1" x="500.38" y="124.46" smashed="yes" rot="MR0">
<attribute name="NAME" x="501.904" y="121.539" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="501.904" y="126.619" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C14" gate="G$1" x="452.12" y="132.08" rot="MR0"/>
<instance part="C15" gate="G$1" x="459.74" y="127" rot="MR0"/>
<instance part="+3V24" gate="G$1" x="474.98" y="167.64" smashed="yes" rot="MR0">
<attribute name="VALUE" x="477.52" y="167.64" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND24" gate="1" x="459.74" y="104.14"/>
<instance part="R21" gate="G$1" x="327.66" y="149.86" smashed="yes">
<attribute name="NAME" x="320.04" y="149.86" size="1.778" layer="95"/>
<attribute name="VALUE" x="330.2" y="147.32" size="1.778" layer="96"/>
</instance>
<instance part="R22" gate="G$1" x="327.66" y="147.32" smashed="yes">
<attribute name="NAME" x="320.04" y="147.32" size="1.778" layer="95"/>
<attribute name="VALUE" x="330.2" y="144.78" size="1.778" layer="96"/>
</instance>
<instance part="FRAME8" gate="G$1" x="0" y="-185.42"/>
<instance part="C4" gate="G$1" x="78.74" y="-38.1"/>
<instance part="GND72" gate="1" x="193.04" y="-53.34"/>
<instance part="C7" gate="G$1" x="119.38" y="-142.24" smashed="yes">
<attribute name="NAME" x="113.284" y="-141.859" size="1.778" layer="95"/>
<attribute name="VALUE" x="117.856" y="-145.161" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND74" gate="1" x="119.38" y="-149.86" smashed="yes">
<attribute name="VALUE" x="116.84" y="-152.4" size="1.778" layer="96"/>
</instance>
<instance part="R3" gate="G$1" x="45.72" y="-58.42"/>
<instance part="R4" gate="G$1" x="55.88" y="-38.1" rot="R90"/>
<instance part="R5" gate="G$1" x="55.88" y="-48.26" rot="R90"/>
<instance part="GND78" gate="1" x="55.88" y="-71.12"/>
<instance part="T1" gate="G$1" x="53.34" y="-58.42" smashed="yes">
<attribute name="NAME" x="55.88" y="-55.88" size="1.778" layer="95"/>
<attribute name="VALUE" x="55.88" y="-58.42" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="142.24" y="-170.18" smashed="yes">
<attribute name="VALUE" x="139.7" y="-172.72" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="124.46" y="-162.56" rot="R90"/>
<instance part="R2" gate="G$1" x="40.64" y="-63.5" rot="R90"/>
<instance part="R11" gate="G$1" x="175.26" y="124.46" rot="R90"/>
<instance part="R16" gate="G$1" x="185.42" y="124.46" rot="R90"/>
<instance part="R9" gate="G$1" x="177.8" y="91.44" smashed="yes">
<attribute name="NAME" x="170.18" y="91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="180.34" y="91.44" size="1.778" layer="96"/>
</instance>
<instance part="R10" gate="G$1" x="190.5" y="88.9" smashed="yes">
<attribute name="NAME" x="182.88" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="193.04" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="R12" gate="G$1" x="203.2" y="83.82" smashed="yes">
<attribute name="NAME" x="195.58" y="83.82" size="1.778" layer="95"/>
<attribute name="VALUE" x="205.74" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="RUN" gate="G$1" x="213.36" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="205.74" y="91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="218.44" y="91.44" size="1.778" layer="96"/>
</instance>
<instance part="ERROR" gate="G$1" x="226.06" y="88.9" smashed="yes" rot="R90">
<attribute name="NAME" x="218.44" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="231.14" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="COM" gate="G$1" x="236.22" y="83.82" smashed="yes" rot="R90">
<attribute name="NAME" x="228.6" y="83.82" size="1.778" layer="95"/>
<attribute name="VALUE" x="241.3" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="251.46" y="78.74"/>
<instance part="MOT" gate="-1" x="167.64" y="-149.86"/>
<instance part="MOT" gate="-2" x="167.64" y="-142.24"/>
<instance part="D1" gate="G$1" x="142.24" y="-144.78" smashed="yes" rot="R90">
<attribute name="NAME" x="137.16" y="-146.8374" size="1.778" layer="95"/>
<attribute name="VALUE" x="144.78" y="-144.5514" size="1.778" layer="96"/>
</instance>
<instance part="IC1" gate="G$1" x="109.22" y="76.2"/>
<instance part="BAT" gate="-1" x="294.64" y="71.12" rot="R180"/>
<instance part="BAT" gate="-2" x="294.64" y="78.74" rot="R180"/>
<instance part="D4" gate="G$1" x="304.8" y="78.74"/>
<instance part="PH1" gate="G$1" x="43.18" y="-165.1"/>
<instance part="C1" gate="G$1" x="12.7" y="-162.56"/>
<instance part="C3" gate="G$1" x="73.66" y="-147.32"/>
<instance part="R1" gate="G$1" x="30.48" y="-149.86" rot="R90"/>
<instance part="R6" gate="G$1" x="60.96" y="-149.86" rot="R90"/>
<instance part="+3V4" gate="G$1" x="12.7" y="-142.24"/>
<instance part="+3V5" gate="G$1" x="73.66" y="-139.7"/>
<instance part="GND5" gate="1" x="43.18" y="-177.8"/>
<instance part="GND6" gate="1" x="73.66" y="-154.94"/>
<instance part="T3" gate="G$2" x="139.7" y="-154.94" smashed="yes">
<attribute name="NAME" x="146.05" y="-157.48" size="1.778" layer="95"/>
<attribute name="VALUE" x="146.05" y="-160.02" size="1.778" layer="96"/>
</instance>
<instance part="D2" gate="G$1" x="187.96" y="-40.64" smashed="yes" rot="R90">
<attribute name="NAME" x="186.055" y="-42.418" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="191.389" y="-50.038" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R19" gate="G$1" x="200.66" y="-40.64" smashed="yes" rot="R90">
<attribute name="NAME" x="198.12" y="-43.18" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="204.47" y="-48.26" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R17" gate="G$1" x="195.58" y="-22.86" rot="R90"/>
<instance part="+3V13" gate="G$1" x="195.58" y="-12.7"/>
<instance part="R8" gate="G$1" x="132.08" y="-139.7"/>
<instance part="R13" gate="G$1" x="177.8" y="-35.56"/>
<instance part="D3" gate="G$1" x="187.96" y="-101.6" smashed="yes" rot="R90">
<attribute name="NAME" x="186.055" y="-103.378" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="191.389" y="-110.998" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R20" gate="G$1" x="200.66" y="-101.6" rot="R90"/>
<instance part="R18" gate="G$1" x="195.58" y="-83.82" rot="R90"/>
<instance part="+3V6" gate="G$1" x="195.58" y="-73.66"/>
<instance part="R14" gate="G$1" x="177.8" y="-96.52"/>
<instance part="GND7" gate="1" x="193.04" y="-114.3"/>
<instance part="UART" gate="G$1" x="284.48" y="147.32"/>
<instance part="IR-SENSOR" gate="G$1" x="96.52" y="-53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="99.06" y="-49.53" size="1.778" layer="95"/>
<attribute name="VALUE" x="99.06" y="-53.34" size="1.778" layer="96"/>
</instance>
<instance part="+3V14" gate="G$1" x="193.04" y="81.28"/>
<instance part="Q1" gate="G$1" x="167.64" y="63.5" smashed="yes">
<attribute name="NAME" x="172.72" y="62.484" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="170.18" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="C9" gate="G$1" x="162.56" y="55.88" smashed="yes" rot="R180">
<attribute name="NAME" x="161.036" y="55.499" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="161.036" y="60.579" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C10" gate="G$1" x="172.72" y="55.88" smashed="yes" rot="R180">
<attribute name="NAME" x="174.244" y="53.721" size="1.778" layer="95"/>
<attribute name="VALUE" x="174.244" y="58.801" size="1.778" layer="96"/>
</instance>
<instance part="GND10" gate="1" x="167.64" y="50.8"/>
<instance part="R15" gate="G$1" x="182.88" y="76.2" rot="R180"/>
<instance part="L1" gate="G$1" x="139.7" y="157.48"/>
<instance part="C12" gate="G$1" x="393.7" y="76.2"/>
<instance part="IC2" gate="G$1" x="370.84" y="78.74"/>
<instance part="T2" gate="G$1" x="66.04" y="-33.02" rot="R90"/>
<instance part="H1" gate="G$1" x="454.66" y="43.18"/>
<instance part="H2" gate="G$1" x="454.66" y="35.56"/>
<instance part="H3" gate="G$1" x="454.66" y="27.94"/>
<instance part="R23" gate="G$1" x="109.22" y="-40.64"/>
<instance part="R24" gate="G$1" x="109.22" y="-63.5"/>
<instance part="P+5" gate="1" x="299.72" y="45.72" smashed="yes">
<attribute name="VALUE" x="297.18" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="P+6" gate="1" x="345.44" y="88.9"/>
<instance part="P+7" gate="1" x="312.42" y="88.9"/>
<instance part="P+8" gate="1" x="55.88" y="-17.78"/>
<instance part="P+9" gate="1" x="119.38" y="-132.08"/>
<instance part="GND8" gate="1" x="299.72" y="20.32" smashed="yes">
<attribute name="VALUE" x="297.18" y="17.78" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="43.18" y="81.28"/>
<instance part="R25" gate="G$1" x="299.72" y="27.94" rot="R90"/>
<instance part="C19" gate="G$1" x="312.42" y="30.48"/>
<instance part="R26" gate="G$1" x="299.72" y="38.1" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="111.76" y1="48.26" x2="114.3" y2="48.26" width="0.1524" layer="91"/>
<wire x1="109.22" y1="48.26" x2="106.68" y2="48.26" width="0.1524" layer="91"/>
<junction x="109.22" y="48.26"/>
<junction x="109.22" y="48.26"/>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="IC1" gate="G$1" pin="GND@0"/>
<pinref part="IC1" gate="G$1" pin="GND@1"/>
<pinref part="IC1" gate="G$1" pin="GND@2"/>
<junction x="111.76" y="48.26"/>
<pinref part="IC1" gate="G$1" pin="GND@3"/>
<wire x1="109.22" y1="48.26" x2="111.76" y2="48.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="124.46" y1="149.86" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="228.6" y1="149.86" x2="233.68" y2="149.86" width="0.1524" layer="91"/>
<wire x1="233.68" y1="149.86" x2="233.68" y2="147.32" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="345.44" y1="68.58" x2="370.84" y2="68.58" width="0.1524" layer="91"/>
<wire x1="370.84" y1="68.58" x2="393.7" y2="68.58" width="0.1524" layer="91"/>
<wire x1="393.7" y1="68.58" x2="414.02" y2="68.58" width="0.1524" layer="91"/>
<wire x1="414.02" y1="68.58" x2="414.02" y2="71.12" width="0.1524" layer="91"/>
<junction x="370.84" y="68.58"/>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="GND31" gate="1" pin="GND"/>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="393.7" y1="71.12" x2="393.7" y2="68.58" width="0.1524" layer="91"/>
<junction x="393.7" y="68.58"/>
<pinref part="IC2" gate="G$1" pin="GND"/>
<wire x1="370.84" y1="71.12" x2="370.84" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND45" gate="1" pin="GND"/>
<wire x1="304.8" y1="144.78" x2="304.8" y2="137.16" width="0.1524" layer="91"/>
<wire x1="294.64" y1="144.78" x2="304.8" y2="144.78" width="0.1524" layer="91"/>
<pinref part="UART" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="459.74" y1="121.92" x2="454.66" y2="121.92" width="0.1524" layer="91"/>
<wire x1="454.66" y1="121.92" x2="452.12" y2="121.92" width="0.1524" layer="91"/>
<wire x1="452.12" y1="121.92" x2="452.12" y2="127" width="0.1524" layer="91"/>
<junction x="454.66" y="121.92"/>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="480.06" y1="147.32" x2="474.98" y2="147.32" width="0.1524" layer="91"/>
<wire x1="474.98" y1="147.32" x2="469.9" y2="147.32" width="0.1524" layer="91"/>
<wire x1="469.9" y1="147.32" x2="469.9" y2="152.4" width="0.1524" layer="91"/>
<junction x="474.98" y="147.32"/>
<pinref part="IC3" gate="P" pin="GND"/>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="459.74" y1="106.68" x2="462.28" y2="106.68" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="R2IN"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND74" gate="1" pin="GND"/>
<pinref part="C7" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND72" gate="1" pin="GND"/>
<wire x1="193.04" y1="-50.8" x2="187.96" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-50.8" x2="187.96" y2="-43.18" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="A"/>
<pinref part="R19" gate="G$1" pin="1"/>
<wire x1="200.66" y1="-45.72" x2="200.66" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="200.66" y1="-50.8" x2="193.04" y2="-50.8" width="0.1524" layer="91"/>
<junction x="193.04" y="-50.8"/>
</segment>
<segment>
<wire x1="55.88" y1="-68.58" x2="55.88" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="40.64" y1="-68.58" x2="55.88" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="GND78" gate="1" pin="GND"/>
<pinref part="T1" gate="G$1" pin="E"/>
<pinref part="R2" gate="G$1" pin="1"/>
<junction x="55.88" y="-68.58"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="78.74" y1="-43.18" x2="78.74" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="55.88" y1="-68.58" x2="78.74" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-68.58" x2="91.44" y2="-68.58" width="0.1524" layer="91"/>
<junction x="78.74" y="-68.58"/>
<pinref part="IR-SENSOR" gate="G$1" pin="5"/>
<wire x1="91.44" y1="-68.58" x2="91.44" y2="-55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="124.46" y1="-167.64" x2="142.24" y2="-167.64" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-167.64" x2="142.24" y2="-160.02" width="0.1524" layer="91"/>
<junction x="142.24" y="-167.64"/>
<pinref part="R7" gate="G$1" pin="1"/>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="T3" gate="G$2" pin="S"/>
</segment>
<segment>
<wire x1="218.44" y1="91.44" x2="251.46" y2="91.44" width="0.1524" layer="91"/>
<wire x1="251.46" y1="91.44" x2="251.46" y2="88.9" width="0.1524" layer="91"/>
<wire x1="251.46" y1="88.9" x2="251.46" y2="83.82" width="0.1524" layer="91"/>
<wire x1="241.3" y1="83.82" x2="251.46" y2="83.82" width="0.1524" layer="91"/>
<wire x1="231.14" y1="88.9" x2="251.46" y2="88.9" width="0.1524" layer="91"/>
<wire x1="251.46" y1="83.82" x2="251.46" y2="81.28" width="0.1524" layer="91"/>
<junction x="251.46" y="83.82"/>
<junction x="251.46" y="88.9"/>
<pinref part="RUN" gate="G$1" pin="C"/>
<pinref part="COM" gate="G$1" pin="C"/>
<pinref part="ERROR" gate="G$1" pin="C"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="BAT" gate="-1" pin="S"/>
<pinref part="GND44" gate="1" pin="GND"/>
<wire x1="312.42" y1="68.58" x2="312.42" y2="71.12" width="0.1524" layer="91"/>
<wire x1="312.42" y1="71.12" x2="297.18" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="43.18" y1="-175.26" x2="30.48" y2="-175.26" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-175.26" x2="30.48" y2="-167.64" width="0.1524" layer="91"/>
<pinref part="PH1" gate="G$1" pin="LED_C"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="30.48" y1="-175.26" x2="12.7" y2="-175.26" width="0.1524" layer="91"/>
<wire x1="12.7" y1="-175.26" x2="12.7" y2="-167.64" width="0.1524" layer="91"/>
<pinref part="PH1" gate="G$1" pin="TRANSISTOR_E"/>
<wire x1="43.18" y1="-175.26" x2="55.88" y2="-175.26" width="0.1524" layer="91"/>
<wire x1="55.88" y1="-175.26" x2="55.88" y2="-167.64" width="0.1524" layer="91"/>
<junction x="30.48" y="-175.26"/>
<junction x="43.18" y="-175.26"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="193.04" y1="-111.76" x2="187.96" y2="-111.76" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-111.76" x2="187.96" y2="-104.14" width="0.1524" layer="91"/>
<pinref part="D3" gate="G$1" pin="A"/>
<pinref part="R20" gate="G$1" pin="1"/>
<wire x1="200.66" y1="-106.68" x2="200.66" y2="-111.76" width="0.1524" layer="91"/>
<wire x1="200.66" y1="-111.76" x2="193.04" y2="-111.76" width="0.1524" layer="91"/>
<junction x="193.04" y="-111.76"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="71.12" y1="149.86" x2="71.12" y2="139.7" width="0.1524" layer="91"/>
<wire x1="71.12" y1="139.7" x2="81.28" y2="139.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="139.7" x2="91.44" y2="139.7" width="0.1524" layer="91"/>
<wire x1="91.44" y1="144.78" x2="91.44" y2="139.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="147.32" x2="81.28" y2="139.7" width="0.1524" layer="91"/>
<junction x="81.28" y="139.7"/>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
<junction x="81.28" y="139.7"/>
</segment>
<segment>
<wire x1="172.72" y1="53.34" x2="167.64" y2="53.34" width="0.1524" layer="91"/>
<wire x1="167.64" y1="53.34" x2="162.56" y2="53.34" width="0.1524" layer="91"/>
<junction x="167.64" y="53.34"/>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="PB3/ADCA11"/>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="76.2" y1="83.82" x2="43.18" y2="83.82" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R25" gate="G$1" pin="1"/>
<pinref part="GND8" gate="1" pin="GND"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="299.72" y1="22.86" x2="312.42" y2="22.86" width="0.1524" layer="91"/>
<wire x1="312.42" y1="22.86" x2="312.42" y2="25.4" width="0.1524" layer="91"/>
<junction x="299.72" y="22.86"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="106.68" y1="129.54" x2="106.68" y2="157.48" width="0.1524" layer="91"/>
<wire x1="106.68" y1="157.48" x2="91.44" y2="157.48" width="0.1524" layer="91"/>
<wire x1="91.44" y1="157.48" x2="81.28" y2="157.48" width="0.1524" layer="91"/>
<wire x1="81.28" y1="157.48" x2="81.28" y2="154.94" width="0.1524" layer="91"/>
<wire x1="81.28" y1="157.48" x2="71.12" y2="157.48" width="0.1524" layer="91"/>
<wire x1="71.12" y1="157.48" x2="60.96" y2="157.48" width="0.1524" layer="91"/>
<wire x1="91.44" y1="152.4" x2="91.44" y2="157.48" width="0.1524" layer="91"/>
<junction x="71.12" y="157.48"/>
<junction x="91.44" y="157.48"/>
<junction x="81.28" y="157.48"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<pinref part="IC1" gate="G$1" pin="VCC@1"/>
<pinref part="IC1" gate="G$1" pin="VCC@0"/>
<pinref part="IC1" gate="G$1" pin="VCC@2"/>
<wire x1="104.14" y1="129.54" x2="106.68" y2="129.54" width="0.1524" layer="91"/>
<junction x="106.68" y="129.54"/>
<wire x1="106.68" y1="129.54" x2="109.22" y2="129.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+3V15" gate="G$1" pin="+3V3"/>
<wire x1="149.86" y1="157.48" x2="144.78" y2="157.48" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="175.26" y1="132.08" x2="180.34" y2="132.08" width="0.1524" layer="91"/>
<wire x1="180.34" y1="132.08" x2="185.42" y2="132.08" width="0.1524" layer="91"/>
<wire x1="185.42" y1="132.08" x2="185.42" y2="129.54" width="0.1524" layer="91"/>
<wire x1="175.26" y1="129.54" x2="175.26" y2="132.08" width="0.1524" layer="91"/>
<junction x="180.34" y="132.08"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="R11" gate="G$1" pin="2"/>
<pinref part="R16" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="228.6" y1="154.94" x2="233.68" y2="154.94" width="0.1524" layer="91"/>
<wire x1="233.68" y1="154.94" x2="233.68" y2="157.48" width="0.1524" layer="91"/>
<pinref part="PDI_ATMEL" gate="1" pin="VCC"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="414.02" y1="78.74" x2="393.7" y2="78.74" width="0.1524" layer="91"/>
<wire x1="393.7" y1="78.74" x2="381" y2="78.74" width="0.1524" layer="91"/>
<wire x1="414.02" y1="78.74" x2="414.02" y2="86.36" width="0.1524" layer="91"/>
<junction x="414.02" y="78.74"/>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="+3V17" gate="G$1" pin="+3V3"/>
<pinref part="C12" gate="G$1" pin="1"/>
<junction x="393.7" y="78.74"/>
<pinref part="IC2" gate="G$1" pin="VO"/>
</segment>
<segment>
<wire x1="474.98" y1="165.1" x2="474.98" y2="162.56" width="0.1524" layer="91"/>
<wire x1="469.9" y1="160.02" x2="469.9" y2="162.56" width="0.1524" layer="91"/>
<wire x1="469.9" y1="162.56" x2="474.98" y2="162.56" width="0.1524" layer="91"/>
<wire x1="474.98" y1="162.56" x2="480.06" y2="162.56" width="0.1524" layer="91"/>
<junction x="474.98" y="162.56"/>
<pinref part="+3V24" gate="G$1" pin="+3V3"/>
<pinref part="C16" gate="G$1" pin="1"/>
<pinref part="IC3" gate="P" pin="VCC"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="12.7" y1="-144.78" x2="30.48" y2="-144.78" width="0.1524" layer="91"/>
<wire x1="12.7" y1="-144.78" x2="12.7" y2="-160.02" width="0.1524" layer="91"/>
<junction x="12.7" y="-144.78"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="60.96" y1="-144.78" x2="73.66" y2="-144.78" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-144.78" x2="73.66" y2="-142.24" width="0.1524" layer="91"/>
<junction x="73.66" y="-144.78"/>
</segment>
<segment>
<pinref part="R17" gate="G$1" pin="2"/>
<pinref part="+3V13" gate="G$1" pin="+3V3"/>
<wire x1="195.58" y1="-17.78" x2="195.58" y2="-15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R18" gate="G$1" pin="2"/>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<wire x1="195.58" y1="-78.74" x2="195.58" y2="-76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="+3V14" gate="G$1" pin="+3V3"/>
<pinref part="R15" gate="G$1" pin="1"/>
<wire x1="187.96" y1="76.2" x2="193.04" y2="76.2" width="0.1524" layer="91"/>
<wire x1="193.04" y1="76.2" x2="193.04" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="/RESET_3V3" class="0">
<segment>
<wire x1="203.2" y1="149.86" x2="182.88" y2="149.86" width="0.1524" layer="91"/>
<label x="182.88" y="149.86" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="CLK"/>
</segment>
<segment>
<label x="144.78" y="76.2" size="1.778" layer="95"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="139.7" y1="76.2" x2="177.8" y2="76.2" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="/RESET"/>
</segment>
</net>
<net name="RX_3V3" class="0">
<segment>
<wire x1="175.26" y1="119.38" x2="175.26" y2="114.3" width="0.1524" layer="91"/>
<wire x1="175.26" y1="114.3" x2="139.7" y2="114.3" width="0.1524" layer="91"/>
<label x="154.94" y="114.3" size="1.778" layer="95" rot="MR0"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="RXD0/OC0C/PD2"/>
</segment>
<segment>
<wire x1="332.74" y1="149.86" x2="360.68" y2="149.86" width="0.1524" layer="91"/>
<label x="353.06" y="149.86" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="492.76" y1="109.22" x2="513.08" y2="109.22" width="0.1524" layer="91"/>
<label x="513.08" y="109.22" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC3" gate="G$1" pin="R1OUT"/>
</segment>
</net>
<net name="TX_3V3" class="0">
<segment>
<wire x1="139.7" y1="111.76" x2="185.42" y2="111.76" width="0.1524" layer="91"/>
<wire x1="185.42" y1="111.76" x2="185.42" y2="119.38" width="0.1524" layer="91"/>
<label x="154.94" y="111.76" size="1.778" layer="95" rot="MR0"/>
<pinref part="R16" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="TXD0/OC0D/PD3"/>
</segment>
<segment>
<wire x1="332.74" y1="147.32" x2="360.68" y2="147.32" width="0.1524" layer="91"/>
<label x="353.06" y="147.32" size="1.778" layer="95"/>
<pinref part="R22" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="492.76" y1="114.3" x2="513.08" y2="114.3" width="0.1524" layer="91"/>
<wire x1="492.76" y1="111.76" x2="492.76" y2="114.3" width="0.1524" layer="91"/>
<junction x="492.76" y="114.3"/>
<label x="513.08" y="114.3" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC3" gate="G$1" pin="T1IN"/>
<pinref part="IC3" gate="G$1" pin="T2IN"/>
</segment>
</net>
<net name="PDI_DATA_3V3" class="0">
<segment>
<wire x1="203.2" y1="154.94" x2="182.88" y2="154.94" width="0.1524" layer="91"/>
<label x="182.88" y="154.94" size="1.778" layer="95"/>
<pinref part="PDI_ATMEL" gate="1" pin="DATA"/>
</segment>
<segment>
<wire x1="162.56" y1="78.74" x2="139.7" y2="78.74" width="0.1524" layer="91"/>
<label x="144.78" y="78.74" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PDI"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="505.46" y1="137.16" x2="492.76" y2="137.16" width="0.1524" layer="91"/>
<wire x1="492.76" y1="137.16" x2="492.76" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="C1+"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="492.76" y1="129.54" x2="505.46" y2="129.54" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="C1-"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="500.38" y1="127" x2="492.76" y2="127" width="0.1524" layer="91"/>
<wire x1="492.76" y1="127" x2="492.76" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="C2+"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<wire x1="492.76" y1="119.38" x2="500.38" y2="119.38" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="C2-"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="452.12" y1="134.62" x2="462.28" y2="134.62" width="0.1524" layer="91"/>
<wire x1="462.28" y1="134.62" x2="462.28" y2="132.08" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="V+"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="459.74" y1="129.54" x2="462.28" y2="129.54" width="0.1524" layer="91"/>
<wire x1="462.28" y1="129.54" x2="462.28" y2="127" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="V-"/>
</segment>
</net>
<net name="TX_232" class="0">
<segment>
<wire x1="294.64" y1="147.32" x2="322.58" y2="147.32" width="0.1524" layer="91"/>
<label x="307.34" y="147.32" size="1.778" layer="95"/>
<pinref part="R22" gate="G$1" pin="1"/>
<pinref part="UART" gate="G$1" pin="TX_O"/>
</segment>
<segment>
<wire x1="462.28" y1="114.3" x2="444.5" y2="114.3" width="0.1524" layer="91"/>
<label x="457.2" y="114.3" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC3" gate="G$1" pin="T1OUT"/>
</segment>
</net>
<net name="RX_232" class="0">
<segment>
<wire x1="294.64" y1="149.86" x2="322.58" y2="149.86" width="0.1524" layer="91"/>
<label x="307.34" y="149.86" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="UART" gate="G$1" pin="RX_I"/>
</segment>
<segment>
<wire x1="462.28" y1="109.22" x2="444.5" y2="109.22" width="0.1524" layer="91"/>
<label x="457.2" y="109.22" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC3" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="+24V" class="0">
<segment>
<wire x1="60.96" y1="-33.02" x2="55.88" y2="-33.02" width="0.1524" layer="91"/>
<junction x="55.88" y="-33.02"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="55.88" y1="-33.02" x2="55.88" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="S"/>
<pinref part="P+8" gate="1" pin="+24V"/>
</segment>
<segment>
<wire x1="119.38" y1="-139.7" x2="119.38" y2="-134.62" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="127" y1="-139.7" x2="119.38" y2="-139.7" width="0.1524" layer="91"/>
<junction x="119.38" y="-139.7"/>
<pinref part="C7" gate="G$1" pin="1"/>
<pinref part="P+9" gate="1" pin="+24V"/>
</segment>
<segment>
<pinref part="D4" gate="G$1" pin="C"/>
<wire x1="307.34" y1="78.74" x2="312.42" y2="78.74" width="0.1524" layer="91"/>
<wire x1="312.42" y1="78.74" x2="312.42" y2="86.36" width="0.1524" layer="91"/>
<pinref part="P+7" gate="1" pin="+24V"/>
</segment>
<segment>
<wire x1="345.44" y1="76.2" x2="345.44" y2="78.74" width="0.1524" layer="91"/>
<wire x1="345.44" y1="78.74" x2="360.68" y2="78.74" width="0.1524" layer="91"/>
<wire x1="345.44" y1="78.74" x2="345.44" y2="86.36" width="0.1524" layer="91"/>
<junction x="345.44" y="78.74"/>
<pinref part="C11" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="VI"/>
<pinref part="P+6" gate="1" pin="+24V"/>
</segment>
<segment>
<pinref part="R26" gate="G$1" pin="2"/>
<pinref part="P+5" gate="1" pin="+24V"/>
</segment>
</net>
<net name="MOTOR_PWM_3V3" class="0">
<segment>
<wire x1="124.46" y1="-157.48" x2="101.6" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="124.46" y1="-157.48" x2="137.16" y2="-157.48" width="0.1524" layer="91"/>
<junction x="124.46" y="-157.48"/>
<label x="101.6" y="-157.48" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="T3" gate="G$2" pin="G"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="SDA/OC0A/PE0"/>
<wire x1="139.7" y1="93.98" x2="167.64" y2="93.98" width="0.1524" layer="91"/>
<label x="142.24" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="MIRROR_INDEX_3V3" class="0">
<segment>
<wire x1="27.94" y1="66.04" x2="76.2" y2="66.04" width="0.1524" layer="91"/>
<label x="27.94" y="66.04" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PC4/OC1A/\S\S"/>
<pinref part="IC1" gate="G$1" pin="PC3/OC0D/TXD0"/>
<wire x1="76.2" y1="68.58" x2="76.2" y2="66.04" width="0.1524" layer="91"/>
<junction x="76.2" y="66.04"/>
</segment>
<segment>
<pinref part="PH1" gate="G$1" pin="TRANSISTOR_C"/>
<wire x1="55.88" y1="-162.56" x2="60.96" y2="-162.56" width="0.1524" layer="91"/>
<label x="63.5" y="-162.56" size="1.778" layer="95"/>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="60.96" y1="-162.56" x2="86.36" y2="-162.56" width="0.1524" layer="91"/>
<wire x1="60.96" y1="-154.94" x2="60.96" y2="-162.56" width="0.1524" layer="91"/>
<junction x="60.96" y="-162.56"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="XCK0/OC0B/PD1"/>
<wire x1="139.7" y1="116.84" x2="165.1" y2="116.84" width="0.1524" layer="91"/>
<label x="142.24" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOTOR_M" class="0">
<segment>
<wire x1="165.1" y1="-149.86" x2="144.78" y2="-149.86" width="0.1524" layer="91"/>
<label x="152.4" y="-149.86" size="1.778" layer="95"/>
<pinref part="MOT" gate="-1" pin="S"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="144.78" y1="-149.86" x2="142.24" y2="-149.86" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-149.86" x2="142.24" y2="-147.32" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$2" pin="D@1"/>
<junction x="142.24" y="-149.86"/>
<pinref part="T3" gate="G$2" pin="D@2"/>
<junction x="144.78" y="-149.86"/>
</segment>
</net>
<net name="N$125" class="0">
<segment>
<wire x1="78.74" y1="-35.56" x2="91.44" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-33.02" x2="71.12" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-35.56" x2="78.74" y2="-35.56" width="0.1524" layer="91"/>
<junction x="78.74" y="-35.56"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="71.12" y1="-33.02" x2="71.12" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="IR-SENSOR" gate="G$1" pin="6"/>
<wire x1="71.12" y1="-30.48" x2="71.12" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-27.94" x2="71.12" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="91.44" y1="-45.72" x2="91.44" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="D@0"/>
<junction x="71.12" y="-33.02"/>
<pinref part="T2" gate="G$1" pin="D@1"/>
<junction x="71.12" y="-30.48"/>
<pinref part="T2" gate="G$1" pin="D@2"/>
<junction x="71.12" y="-27.94"/>
<pinref part="T2" gate="G$1" pin="D@3"/>
</segment>
</net>
<net name="N$128" class="0">
<segment>
<wire x1="55.88" y1="-43.18" x2="63.5" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-43.18" x2="63.5" y2="-38.1" width="0.1524" layer="91"/>
<junction x="55.88" y="-43.18"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="T2" gate="G$1" pin="G"/>
</segment>
</net>
<net name="N$113" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="T1" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$126" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<pinref part="T1" gate="G$1" pin="C"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="182.88" y1="91.44" x2="210.82" y2="91.44" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="RUN" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="195.58" y1="88.9" x2="223.52" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="ERROR" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="208.28" y1="83.82" x2="233.68" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="2"/>
<pinref part="COM" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="OC0C/PE2"/>
<wire x1="167.64" y1="91.44" x2="172.72" y2="91.44" width="0.1524" layer="91"/>
<wire x1="139.7" y1="88.9" x2="167.64" y2="88.9" width="0.1524" layer="91"/>
<wire x1="167.64" y1="88.9" x2="167.64" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="OC0D/PE3"/>
<wire x1="170.18" y1="88.9" x2="185.42" y2="88.9" width="0.1524" layer="91"/>
<wire x1="139.7" y1="86.36" x2="170.18" y2="86.36" width="0.1524" layer="91"/>
<wire x1="170.18" y1="86.36" x2="170.18" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="BAT" gate="-2" pin="S"/>
<pinref part="D4" gate="G$1" pin="A"/>
<wire x1="302.26" y1="78.74" x2="297.18" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="PH1" gate="G$1" pin="LED_A"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="-154.94" x2="30.48" y2="-162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LONG_RANGE_SENSOR_OUTPUT_3V3" class="0">
<segment>
<wire x1="200.66" y1="-35.56" x2="243.84" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="182.88" y1="-35.56" x2="187.96" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-27.94" x2="195.58" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-35.56" x2="195.58" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-35.56" x2="200.66" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-38.1" x2="187.96" y2="-35.56" width="0.1524" layer="91"/>
<junction x="200.66" y="-35.56"/>
<junction x="187.96" y="-35.56"/>
<label x="208.28" y="-35.56" size="1.778" layer="95"/>
<pinref part="R19" gate="G$1" pin="2"/>
<pinref part="D2" gate="G$1" pin="C"/>
<pinref part="R17" gate="G$1" pin="1"/>
<junction x="195.58" y="-35.56"/>
<pinref part="R13" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="76.2" y1="71.12" x2="25.4" y2="71.12" width="0.1524" layer="91"/>
<label x="25.4" y="71.12" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PC2/OC0C/RXD0"/>
</segment>
</net>
<net name="LONG_RANGE_SENSOR_OUTPUT_24V" class="0">
<segment>
<wire x1="93.98" y1="-35.56" x2="172.72" y2="-35.56" width="0.1524" layer="91"/>
<label x="119.38" y="-35.56" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="IR-SENSOR" gate="G$1" pin="4"/>
<wire x1="93.98" y1="-45.72" x2="93.98" y2="-35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="165.1" y1="-139.7" x2="142.24" y2="-139.7" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-139.7" x2="137.16" y2="-139.7" width="0.1524" layer="91"/>
<wire x1="165.1" y1="-142.24" x2="165.1" y2="-139.7" width="0.1524" layer="91"/>
<pinref part="MOT" gate="-2" pin="S"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="142.24" y1="-142.24" x2="142.24" y2="-139.7" width="0.1524" layer="91"/>
<junction x="142.24" y="-139.7"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
</net>
<net name="SHORT_RANGE_SENSOR_OUTPUT_24V" class="0">
<segment>
<wire x1="93.98" y1="-96.52" x2="172.72" y2="-96.52" width="0.1524" layer="91"/>
<label x="116.84" y="-96.52" size="1.778" layer="95"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="IR-SENSOR" gate="G$1" pin="3"/>
<wire x1="93.98" y1="-55.88" x2="93.98" y2="-96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SHORT_RANGE_SENSOR_OUTPUT_3V3" class="0">
<segment>
<wire x1="200.66" y1="-96.52" x2="218.44" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="182.88" y1="-96.52" x2="187.96" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-88.9" x2="195.58" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-96.52" x2="195.58" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-96.52" x2="200.66" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="187.96" y1="-99.06" x2="187.96" y2="-96.52" width="0.1524" layer="91"/>
<junction x="200.66" y="-96.52"/>
<junction x="187.96" y="-96.52"/>
<label x="208.28" y="-96.52" size="1.778" layer="95"/>
<pinref part="R20" gate="G$1" pin="2"/>
<pinref part="D3" gate="G$1" pin="C"/>
<pinref part="R18" gate="G$1" pin="1"/>
<junction x="195.58" y="-96.52"/>
<pinref part="R14" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="25.4" y1="73.66" x2="76.2" y2="73.66" width="0.1524" layer="91"/>
<label x="25.4" y="73.66" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PC1/OC0B/XCK0/SCL"/>
</segment>
</net>
<net name="LONG_RANGE_LED_3V3" class="0">
<segment>
<label x="127" y="-40.64" size="1.778" layer="95"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="114.3" y1="-40.64" x2="157.48" y2="-40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="43.18" y1="109.22" x2="76.2" y2="109.22" width="0.1524" layer="91"/>
<label x="43.18" y="109.22" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PA3/ADCA3"/>
</segment>
</net>
<net name="SHORT_RANGE_LED_3V3" class="0">
<segment>
<label x="129.54" y="-63.5" size="1.778" layer="95"/>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="114.3" y1="-63.5" x2="160.02" y2="-63.5" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="43.18" y1="106.68" x2="76.2" y2="106.68" width="0.1524" layer="91"/>
<label x="43.18" y="106.68" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="PA4/ADCA4"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<wire x1="162.56" y1="60.96" x2="162.56" y2="63.5" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="165.1" y1="63.5" x2="162.56" y2="63.5" width="0.1524" layer="91"/>
<wire x1="162.56" y1="63.5" x2="162.56" y2="71.12" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="PR1/XTAL1"/>
<wire x1="162.56" y1="71.12" x2="139.7" y2="71.12" width="0.1524" layer="91"/>
<junction x="162.56" y="63.5"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="PR0/XTAL2"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="139.7" y1="73.66" x2="172.72" y2="73.66" width="0.1524" layer="91"/>
<wire x1="172.72" y1="73.66" x2="172.72" y2="63.5" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="172.72" y1="63.5" x2="172.72" y2="60.96" width="0.1524" layer="91"/>
<wire x1="170.18" y1="63.5" x2="172.72" y2="63.5" width="0.1524" layer="91"/>
<junction x="172.72" y="63.5"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="134.62" y1="157.48" x2="124.46" y2="157.48" width="0.1524" layer="91"/>
<wire x1="124.46" y1="157.48" x2="114.3" y2="157.48" width="0.1524" layer="91"/>
<wire x1="114.3" y1="129.54" x2="114.3" y2="157.48" width="0.1524" layer="91"/>
<junction x="124.46" y="157.48"/>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="AVCC@0"/>
<pinref part="L1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="ON/OFF_SENSOR_3V3" class="0">
<segment>
<wire x1="40.64" y1="-58.42" x2="7.62" y2="-58.42" width="0.1524" layer="91"/>
<junction x="40.64" y="-58.42"/>
<label x="7.62" y="-58.42" size="1.778" layer="95"/>
<pinref part="R3" gate="G$1" pin="1"/>
<pinref part="R2" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="SCL/OC0B/PE1"/>
<wire x1="139.7" y1="91.44" x2="162.56" y2="91.44" width="0.1524" layer="91"/>
<label x="142.24" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="96.52" y1="-40.64" x2="104.14" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="IR-SENSOR" gate="G$1" pin="2"/>
<wire x1="96.52" y1="-45.72" x2="96.52" y2="-40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="R24" gate="G$1" pin="1"/>
<pinref part="IR-SENSOR" gate="G$1" pin="1"/>
<wire x1="96.52" y1="-55.88" x2="96.52" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="96.52" y1="-63.5" x2="104.14" y2="-63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_COM_3V3" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="198.12" y1="83.82" x2="147.32" y2="83.82" width="0.1524" layer="91"/>
<label x="147.32" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="PC0/OC0A/SDA"/>
<wire x1="76.2" y1="76.2" x2="53.34" y2="76.2" width="0.1524" layer="91"/>
<label x="53.34" y="76.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="VBAT_0-2V" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="2"/>
<wire x1="299.72" y1="33.02" x2="312.42" y2="33.02" width="0.1524" layer="91"/>
<label x="345.44" y="33.02" size="1.778" layer="95"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="312.42" y1="33.02" x2="360.68" y2="33.02" width="0.1524" layer="91"/>
<junction x="312.42" y="33.02"/>
<pinref part="R26" gate="G$1" pin="1"/>
<junction x="299.72" y="33.02"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="PB2/ADCA10"/>
<wire x1="76.2" y1="86.36" x2="43.18" y2="86.36" width="0.1524" layer="91"/>
<label x="43.18" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,480.06,162.56,IC3P,VCC,+3V3,,,"/>
<approved hash="108,1,60.96,-154.94,MIRROR_INDEX_3V3,,,,,"/>
<approved hash="113,1,130.071,89.431,FRAME1,,,,,"/>
<approved hash="113,1,396.771,89.431,FRAME6,,,,,"/>
<approved hash="113,1,215.9,153.865,PDI_ATMEL,,,,,"/>
<approved hash="113,1,130.071,-95.989,FRAME8,,,,,"/>
<approved hash="113,1,167.64,62.7592,Q1,,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>

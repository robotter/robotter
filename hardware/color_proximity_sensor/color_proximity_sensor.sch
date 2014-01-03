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
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="22UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="-C_10V" package="C1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="698-3844" constant="no"/>
<attribute name="VALUE" value="22µF 10V" constant="no"/>
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
<package name="SFH4253">
<smd name="C" x="0" y="-1.5" dx="1.5" dy="2.6" layer="1" rot="R90"/>
<smd name="A" x="0" y="1.5" dx="1.5" dy="2.6" layer="1" rot="R90"/>
<wire x1="-1.5" y1="-1.7" x2="-1.2" y2="-1.7" width="0.127" layer="21"/>
<wire x1="1.2" y1="-1.7" x2="1.5" y2="-1.7" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.7" x2="1.5" y2="1.7" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.7" x2="1.2" y2="1.7" width="0.127" layer="21"/>
<wire x1="-1.2" y1="1.7" x2="-1.5" y2="1.7" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.7" x2="-1.5" y2="-1.7" width="0.127" layer="21"/>
<circle x="0" y="0" radius="0.632453125" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-1.2" y="-1.7"/>
<vertex x="-1.2" y="-1.4"/>
<vertex x="-1.5" y="-1.1"/>
<vertex x="-1.5" y="-1.7"/>
</polygon>
<text x="-2.54" y="-2.286" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.81" y="-2.286" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="PLCC6">
<wire x1="-1.5" y1="1.4" x2="-1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.5" y2="1.4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.4" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="-1.4" width="0.127" layer="21"/>
<smd name="2" x="1.475" y="0" dx="1.6" dy="0.5" layer="1"/>
<smd name="3" x="1.475" y="0.9" dx="1.6" dy="0.5" layer="1"/>
<smd name="1" x="1.475" y="-0.9" dx="1.6" dy="0.5" layer="1"/>
<smd name="6" x="-1.475" y="-0.9" dx="1.6" dy="0.5" layer="1"/>
<smd name="5" x="-1.475" y="0" dx="1.6" dy="0.5" layer="1"/>
<smd name="4" x="-1.475" y="0.9" dx="1.6" dy="0.5" layer="1"/>
<text x="-3.302" y="-3.048" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.302" y="1.778" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1" y1="-1.7" x2="1.5" y2="-1.4" layer="21"/>
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
<deviceset name="SFH4253" prefix="LED">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SFH4253">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="665-5495" constant="no"/>
<attribute name="VALUE" value="SFH 4253" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED_MULTICOLOR" prefix="LED">
<gates>
<gate name="_B" symbol="LED" x="-10.16" y="0" swaplevel="1"/>
<gate name="_G" symbol="LED" x="0" y="0" swaplevel="1"/>
<gate name="_R" symbol="LED" x="12.7" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="" package="PLCC6">
<connects>
<connect gate="_B" pin="A" pad="6"/>
<connect gate="_B" pin="C" pad="1"/>
<connect gate="_G" pin="A" pad="5"/>
<connect gate="_G" pin="C" pad="2"/>
<connect gate="_R" pin="A" pad="4"/>
<connect gate="_R" pin="C" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1863245" constant="no"/>
<attribute name="MANUFACTURER" value="AVAGO TECHNOLOGIES" constant="no"/>
<attribute name="RS" value="769-3520 " constant="no"/>
<attribute name="VALUE" value="ASMT-YTD2-0BB02" constant="no"/>
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
<deviceset name="22" prefix="R">
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
<attribute name="RS" value="213-2042" constant="no"/>
<attribute name="VALUE" value="22 ohms" constant="no"/>
</technology>
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
</devicesets>
</library>
<library name="robotter_ic">
<packages>
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
<package name="FN6">
<wire x1="1.2" y1="1" x2="1.2" y2="-0.3" width="0.2032" layer="51"/>
<wire x1="1.2" y1="-0.3" x2="1.2" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="1.2" y1="-0.9" x2="1" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-1" y1="-0.6" x2="-1" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-1" y1="-0.9" x2="-1.2" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-1.2" y1="-0.9" x2="-1.2" y2="-0.3" width="0.2032" layer="51"/>
<wire x1="-1.2" y1="-0.3" x2="-1.2" y2="1" width="0.2032" layer="51"/>
<wire x1="-1.2" y1="1" x2="-1" y2="1" width="0.2032" layer="51"/>
<wire x1="1" y1="1" x2="1.2" y2="1" width="0.2032" layer="51"/>
<circle x="-1.802" y="-1.54" radius="0.254" width="0.381" layer="21"/>
<smd name="2" x="0" y="-0.9" dx="0.35" dy="1.5" layer="1" roundness="100"/>
<smd name="1" x="-0.65" y="-0.9" dx="0.35" dy="1.5" layer="1"/>
<smd name="3" x="0.65" y="-0.9" dx="0.35" dy="1.5" layer="1" roundness="100"/>
<smd name="6" x="-0.65" y="0.9" dx="0.35" dy="1.5" layer="1" roundness="100"/>
<smd name="5" x="0" y="0.9" dx="0.35" dy="1.5" layer="1" roundness="100"/>
<smd name="4" x="0.65" y="0.9" dx="0.35" dy="1.5" layer="1" roundness="100"/>
<text x="-1.675" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.945" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="APDS-9800">
<smd name="10" x="-1.96" y="-1.9" dx="0.5" dy="1.5" layer="1"/>
<smd name="1" x="-1.96" y="1.9" dx="0.5" dy="1.5" layer="1"/>
<smd name="9" x="-1.08" y="-1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="8" x="0" y="-1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="2" x="-1.08" y="1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="3" x="0" y="1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="7" x="1.08" y="-1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="4" x="1.08" y="1.9" dx="0.9" dy="1.5" layer="1"/>
<smd name="6" x="1.96" y="-1.9" dx="0.5" dy="1.5" layer="1"/>
<smd name="5" x="1.96" y="1.9" dx="0.5" dy="1.5" layer="1"/>
<text x="3.937" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-2.921" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<wire x1="-2.3" y1="1.6" x2="-2.5" y2="1.6" width="0.127" layer="21"/>
<wire x1="-2.5" y1="1.6" x2="-2.5" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-1.6" x2="-2.3" y2="-1.6" width="0.127" layer="21"/>
<wire x1="2.3" y1="1.6" x2="2.5" y2="1.6" width="0.127" layer="21"/>
<wire x1="2.5" y1="1.6" x2="2.5" y2="-1.6" width="0.127" layer="21"/>
<wire x1="2.5" y1="-1.6" x2="2.3" y2="-1.6" width="0.127" layer="21"/>
<rectangle x1="-0.54" y1="-1.115" x2="0.65" y2="0.075" layer="21"/>
<rectangle x1="-2.025" y1="-0.8" x2="-1.465" y2="-0.24" layer="21"/>
<rectangle x1="-0.23" y1="0.365" x2="0.2" y2="1.065" layer="21"/>
<wire x1="-1.016" y1="1.016" x2="-1.016" y2="-1.016" width="0.1" layer="21"/>
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
<package name="SOT563-6">
<wire x1="-0.85" y1="-0.65" x2="-0.85" y2="0.65" width="0.1524" layer="21"/>
<wire x1="0.85" y1="0.65" x2="0.85" y2="-0.65" width="0.1524" layer="21"/>
<circle x="-1.15" y="-0.5" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-0.5" y="-0.75" dx="0.3" dy="0.6" layer="1"/>
<smd name="2" x="0" y="-0.75" dx="0.3" dy="0.6" layer="1"/>
<smd name="3" x="0.5" y="-0.75" dx="0.3" dy="0.6" layer="1"/>
<smd name="4" x="0.5" y="0.75" dx="0.3" dy="0.6" layer="1"/>
<smd name="5" x="0" y="0.75" dx="0.3" dy="0.6" layer="1"/>
<smd name="6" x="-0.5" y="0.75" dx="0.3" dy="0.6" layer="1"/>
<text x="-1.397" y="-2.872" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.397" y="1.802" size="1.016" layer="25" ratio="10">&gt;NAME</text>
</package>
</packages>
<symbols>
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
<symbol name="TCS3772">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="10.16" y2="7.62" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="7.62" x2="-10.16" y2="-10.16" width="0.4064" layer="94"/>
<text x="2.54" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCC" x="0" y="12.7" length="middle" direction="sup" rot="R270"/>
<pin name="GND" x="0" y="-15.24" length="middle" direction="sup" rot="R90"/>
<pin name="SCL" x="-15.24" y="-7.62" length="middle" direction="oc"/>
<pin name="SDA" x="-15.24" y="-2.54" length="middle" direction="oc"/>
<pin name="INT" x="-15.24" y="5.08" length="middle" direction="oc" swaplevel="1"/>
<pin name="LDR" x="15.24" y="5.08" length="middle" direction="out" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="APDS-9800">
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="10.16" y2="10.16" width="0.4064" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="-10.16" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="-15.24" width="0.4064" layer="94"/>
<text x="-10.16" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="LEDON" x="-15.24" y="2.54" length="middle"/>
<pin name="PS_DOUT" x="-15.24" y="7.62" length="middle"/>
<pin name="VCC" x="5.08" y="15.24" length="middle" rot="R270"/>
<pin name="PS_PFILT" x="-15.24" y="-2.54" length="middle"/>
<pin name="ALS_IOUT" x="-15.24" y="-7.62" length="middle" direction="in" swaplevel="1"/>
<pin name="GND" x="5.08" y="-20.32" length="middle" direction="in" swaplevel="1" rot="R90"/>
<pin name="PS_ENB" x="-15.24" y="5.08" length="middle" direction="out" swaplevel="1"/>
<pin name="LEDK" x="15.24" y="-5.08" length="middle" direction="in" swaplevel="1" rot="R180"/>
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
</symbols>
<devicesets>
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
<deviceset name="TCS3772" prefix="IC">
<gates>
<gate name="G$1" symbol="TCS3772" x="0" y="0"/>
</gates>
<devices>
<device name="5FN" package="FN6">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="INT" pad="4"/>
<connect gate="G$1" pin="LDR" pad="6"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="5"/>
<connect gate="G$1" pin="VCC" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="I2C_ADDRESS" value="0x29" constant="no"/>
<attribute name="RADIOSPARES" value="785-7749"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="APDS-9800" prefix="IC">
<gates>
<gate name="G$1" symbol="APDS-9800" x="0" y="2.54"/>
</gates>
<devices>
<device name="-021" package="APDS-9800">
<connects>
<connect gate="G$1" pin="ALS_IOUT" pad="7"/>
<connect gate="G$1" pin="GND" pad="8"/>
<connect gate="G$1" pin="LEDK" pad="10"/>
<connect gate="G$1" pin="LEDON" pad="2"/>
<connect gate="G$1" pin="PS_DOUT" pad="3"/>
<connect gate="G$1" pin="PS_ENB" pad="9"/>
<connect gate="G$1" pin="PS_PFILT" pad="6"/>
<connect gate="G$1" pin="VCC" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="714-2707" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ATXMEGA64D4" prefix="IC">
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
<attribute name="RS" value="" constant="no"/>
<attribute name="VALUE" value="ATXMEGA64DA-AU" constant="no"/>
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
<attribute name="RS" value=" 547-6531" constant="no"/>
<attribute name="VALUE" value="16 MHz" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BC847CDXV6T" prefix="T">
<gates>
<gate name="-Q2" symbol="NPN" x="-10.16" y="0" swaplevel="1"/>
<gate name="-Q1" symbol="NPN" x="5.08" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="" package="SOT563-6">
<connects>
<connect gate="-Q1" pin="B" pad="5"/>
<connect gate="-Q1" pin="C" pad="3"/>
<connect gate="-Q1" pin="E" pad="4"/>
<connect gate="-Q2" pin="B" pad="2"/>
<connect gate="-Q2" pin="C" pad="6"/>
<connect gate="-Q2" pin="E" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="773-7627" constant="no"/>
<attribute name="VALUE" value="BC847CDXV6T1G" constant="no"/>
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
<attribute name="RS" value="724-1302" constant="no"/>
<attribute name="VALUE" value="220 ohms" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_connector">
<packages>
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
<package name="HEADER_2.54MM_2X2W_">
<smd name="1" x="1.7" y="1.27" dx="1.5" dy="2.6" layer="1" rot="R90"/>
<smd name="2" x="1.7" y="-1.27" dx="1.5" dy="2.6" layer="1" rot="R90"/>
<smd name="3" x="1.7" y="1.27" dx="1.5" dy="2.6" layer="16" rot="R90"/>
<smd name="4" x="1.7" y="-1.27" dx="1.5" dy="2.6" layer="16" rot="R90"/>
<wire x1="0" y1="1.27" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="1.27" x2="0" y2="-1.27" width="0.127" layer="22"/>
<text x="0" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="0" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
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
<symbol name="PDI_ATMEL_SIMPLIFIED">
<wire x1="8.89" y1="-2.54" x2="-8.89" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-8.89" y1="5.08" x2="-8.89" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-2.54" x2="8.89" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-8.89" y1="5.08" x2="8.89" y2="5.08" width="0.4064" layer="94"/>
<text x="-3.81" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="CLK" x="-12.7" y="0" length="middle" direction="pas" swaplevel="1"/>
<pin name="VCC" x="12.7" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="12.7" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="DATA" x="-12.7" y="2.54" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
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
<attribute name="RS" value="739-1227 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PDI_ATMEL_WIDTH" prefix="J">
<gates>
<gate name="G$1" symbol="PDI_ATMEL_SIMPLIFIED" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HEADER_2.54MM_2X2W_">
<connects>
<connect gate="G$1" pin="CLK" pad="3"/>
<connect gate="G$1" pin="DATA" pad="1"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VCC" pad="2"/>
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
<package name="2,1-PAD">
<wire x1="0" y1="2.921" x2="0" y2="2.667" width="0.0508" layer="21"/>
<wire x1="0" y1="-2.667" x2="0" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-1.778" y1="0" x2="0" y2="-1.778" width="2.286" layer="51" curve="90" cap="flat"/>
<wire x1="0" y1="1.778" x2="1.778" y2="0" width="2.286" layer="51" curve="-90" cap="flat"/>
<circle x="0" y="0" radius="0.635" width="0.4572" layer="51"/>
<circle x="0" y="0" radius="2" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2" width="0.8128" layer="39"/>
<circle x="0" y="0" radius="2" width="0.8128" layer="40"/>
<circle x="0" y="0" radius="2" width="0.8128" layer="43"/>
<circle x="0" y="0" radius="1.5" width="0.2032" layer="21"/>
<pad name="B2,8" x="0" y="0" drill="2.1" diameter="4"/>
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
<device name="" package="2,1-PAD">
<connects>
<connect gate="G$1" pin="MOUNT" pad="B2,8"/>
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
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME3" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME4" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="IC4" library="robotter_ic" deviceset="LM25011" device="MY" value="LM25011MY"/>
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
<part name="R13" library="robotter_resistor" deviceset="15K" device="-E" value="15k 1%"/>
<part name="R14" library="robotter_resistor" deviceset="1K" device="-E" value="1k"/>
<part name="IC1" library="robotter_ic" deviceset="TCS3772" device="5FN"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R1" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="C3" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="LED1" library="robotter_diode" deviceset="SFH4253" device="" value="SFH 4253"/>
<part name="C4" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C5" library="robotter_capacitor" deviceset="22UF" device="-C_10V" value="22µF 10V"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="R2" library="robotter_resistor" deviceset="22" device="-F" value="22 ohms"/>
<part name="IC2" library="robotter_ic" deviceset="APDS-9800" device="-021"/>
<part name="C6" library="robotter_capacitor" deviceset="22UF" device="-C_10V" value="22µF 10V"/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="R3" library="robotter_resistor" deviceset="22" device="-F" value="22 ohms"/>
<part name="R4" library="robotter_resistor" deviceset="22" device="-F" value="22 ohms"/>
<part name="R5" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R6" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R7" library="robotter_resistor" deviceset="15K" device="-F" value="15k 1%"/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C9" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="LED2" library="robotter_diode" deviceset="LED_MULTICOLOR" device="" value="ASMT-YTD2-0BB02"/>
<part name="LED3" library="robotter_diode" deviceset="LED_MULTICOLOR" device="" value="ASMT-YTD2-0BB02"/>
<part name="C10" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="C11" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="C12" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="R8" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R9" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R10" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R16" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
<part name="R17" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
<part name="R18" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
<part name="IC5" library="robotter_ic" deviceset="ATXMEGA64D4" device="-AU" value="ATXMEGA64DA-AU"/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="C13" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C14" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C15" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="C16" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="R19" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R20" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R21" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R23" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R25" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="L2" library="robotter_inductor" deviceset="FERRITE_220OHMS" device="" value="220 ohms"/>
<part name="C17" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF 50V"/>
<part name="+3V5" library="supply1" deviceset="+3V3" device=""/>
<part name="C18" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="C19" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP" value="16 MHz"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="P+1" library="supply1" deviceset="+24V" device=""/>
<part name="P+2" library="supply1" deviceset="+24V" device=""/>
<part name="P+3" library="supply1" deviceset="+24V" device=""/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="C2" library="robotter_capacitor" deviceset="220UF" device="F_35V" value="220µF 35V"/>
<part name="H1" library="robotter_others" deviceset="MOUNT-PAD-ROUND" device=""/>
<part name="H3" library="robotter_others" deviceset="MOUNT-PAD-ROUND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="COM" library="robotter_connector" deviceset="MICROMATCH-8_SMD" device=""/>
<part name="J1" library="robotter_connector" deviceset="PDI_ATMEL_WIDTH" device=""/>
<part name="T4" library="robotter_ic" deviceset="BC847CDXV6T" device="" value="BC847CDXV6T1G"/>
<part name="T1" library="robotter_ic" deviceset="BC847CDXV6T" device="" value="BC847CDXV6T1G"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="PC6" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="PC7" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R12" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="292.1" y="139.7" size="1.778" layer="91">manque alim</text>
<text x="292.1" y="66.04" size="1.778" layer="91">manque connecteur meca</text>
<text x="340.36" y="25.4" size="1.778" layer="91">color_valid_3v3, color_data*_3v3 are outputs of this board.
color_valid_3v3 is high when data on color_data*_3v3 is valid, else 0 when data state is updated</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME2" gate="G$1" x="264.16" y="0"/>
<instance part="FRAME3" gate="G$1" x="0" y="182.88"/>
<instance part="FRAME4" gate="G$1" x="264.16" y="182.88"/>
<instance part="+3V17" gate="G$1" x="508" y="144.78"/>
<instance part="GND23" gate="1" x="347.98" y="106.68"/>
<instance part="IC4" gate="G$1" x="444.5" y="132.08"/>
<instance part="C22" gate="G$1" x="396.24" y="132.08"/>
<instance part="C30" gate="G$1" x="408.94" y="139.7"/>
<instance part="C31" gate="G$1" x="426.72" y="119.38"/>
<instance part="C32" gate="G$1" x="462.28" y="147.32" smashed="yes">
<attribute name="NAME" x="463.804" y="147.701" size="1.778" layer="95"/>
<attribute name="VALUE" x="463.804" y="150.241" size="1.778" layer="96"/>
</instance>
<instance part="C33" gate="G$1" x="500.38" y="127"/>
<instance part="D8" gate="G$1" x="462.28" y="139.7" smashed="yes" rot="R90">
<attribute name="NAME" x="460.375" y="137.414" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="465.074" y="136.271" size="1.778" layer="96"/>
</instance>
<instance part="L1" gate="G$1" x="472.44" y="142.24" smashed="yes">
<attribute name="NAME" x="468.63" y="144.78" size="1.778" layer="95"/>
<attribute name="VALUE" x="476.25" y="143.51" size="1.778" layer="96"/>
</instance>
<instance part="R22" gate="G$1" x="462.28" y="132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="464.82" y="132.08" size="1.778" layer="95"/>
<attribute name="VALUE" x="464.82" y="129.54" size="1.778" layer="96"/>
</instance>
<instance part="R58" gate="G$1" x="429.26" y="137.16" rot="R90"/>
<instance part="R60" gate="G$1" x="487.68" y="116.84" rot="R270"/>
<instance part="R61" gate="G$1" x="487.68" y="132.08" rot="R270"/>
<instance part="GND24" gate="1" x="444.5" y="106.68"/>
<instance part="GND25" gate="1" x="462.28" y="124.46"/>
<instance part="R13" gate="G$1" x="358.14" y="132.08" rot="R90"/>
<instance part="R14" gate="G$1" x="358.14" y="114.3" rot="R90"/>
<instance part="IC1" gate="G$1" x="429.26" y="317.5"/>
<instance part="C1" gate="G$1" x="439.42" y="340.36"/>
<instance part="R1" gate="G$1" x="414.02" y="337.82" rot="R90"/>
<instance part="+3V1" gate="G$1" x="487.68" y="345.44"/>
<instance part="GND1" gate="1" x="439.42" y="332.74"/>
<instance part="GND2" gate="1" x="429.26" y="299.72"/>
<instance part="C3" gate="G$1" x="454.66" y="340.36"/>
<instance part="LED1" gate="G$1" x="454.66" y="322.58" rot="R270"/>
<instance part="C4" gate="G$1" x="474.98" y="320.04"/>
<instance part="C5" gate="G$1" x="487.68" y="340.36"/>
<instance part="GND5" gate="1" x="487.68" y="332.74"/>
<instance part="R2" gate="G$1" x="464.82" y="342.9"/>
<instance part="IC2" gate="G$1" x="434.34" y="251.46"/>
<instance part="C6" gate="G$1" x="462.28" y="274.32"/>
<instance part="C7" gate="G$1" x="447.04" y="274.32"/>
<instance part="GND3" gate="1" x="457.2" y="266.7"/>
<instance part="GND4" gate="1" x="439.42" y="228.6"/>
<instance part="+3V2" gate="G$1" x="462.28" y="279.4"/>
<instance part="R3" gate="G$1" x="449.58" y="241.3" rot="R90"/>
<instance part="R4" gate="G$1" x="459.74" y="241.3" rot="R90"/>
<instance part="R5" gate="G$1" x="419.1" y="269.24" rot="R90"/>
<instance part="R6" gate="G$1" x="419.1" y="236.22" rot="R90"/>
<instance part="R7" gate="G$1" x="396.24" y="236.22" rot="R90"/>
<instance part="C8" gate="G$1" x="388.62" y="236.22" rot="R180"/>
<instance part="C9" gate="G$1" x="411.48" y="233.68" rot="R180"/>
<instance part="LED2" gate="_B" x="73.66" y="91.44"/>
<instance part="LED2" gate="_G" x="109.22" y="91.44"/>
<instance part="LED2" gate="_R" x="144.78" y="91.44"/>
<instance part="LED3" gate="_B" x="73.66" y="116.84"/>
<instance part="LED3" gate="_G" x="109.22" y="116.84"/>
<instance part="LED3" gate="_R" x="144.78" y="116.84"/>
<instance part="C10" gate="G$1" x="55.88" y="142.24"/>
<instance part="C11" gate="G$1" x="91.44" y="142.24"/>
<instance part="C12" gate="G$1" x="127" y="142.24"/>
<instance part="R8" gate="G$1" x="63.5" y="78.74"/>
<instance part="R9" gate="G$1" x="96.52" y="58.42"/>
<instance part="R10" gate="G$1" x="134.62" y="43.18"/>
<instance part="GND6" gate="1" x="55.88" y="134.62"/>
<instance part="GND7" gate="1" x="91.44" y="134.62"/>
<instance part="GND8" gate="1" x="127" y="134.62"/>
<instance part="GND9" gate="1" x="101.6" y="30.48"/>
<instance part="R16" gate="G$1" x="73.66" y="139.7" rot="R90"/>
<instance part="R17" gate="G$1" x="109.22" y="139.7" rot="R90"/>
<instance part="R18" gate="G$1" x="144.78" y="139.7" rot="R90"/>
<instance part="IC5" gate="G$1" x="101.6" y="274.32"/>
<instance part="+3V3" gate="G$1" x="185.42" y="350.52"/>
<instance part="+3V4" gate="G$1" x="144.78" y="208.28"/>
<instance part="GND10" gate="1" x="104.14" y="243.84"/>
<instance part="GND11" gate="1" x="144.78" y="248.92"/>
<instance part="GND12" gate="1" x="144.78" y="195.58"/>
<instance part="GND13" gate="1" x="162.56" y="325.12"/>
<instance part="C13" gate="G$1" x="134.62" y="332.74"/>
<instance part="C14" gate="G$1" x="152.4" y="332.74"/>
<instance part="C15" gate="G$1" x="170.18" y="332.74"/>
<instance part="C16" gate="G$1" x="185.42" y="332.74"/>
<instance part="R19" gate="G$1" x="175.26" y="279.4" smashed="yes" rot="R90">
<attribute name="NAME" x="177.8" y="279.4" size="1.778" layer="95"/>
<attribute name="VALUE" x="177.8" y="275.59" size="1.778" layer="96"/>
</instance>
<instance part="R20" gate="G$1" x="403.86" y="337.82" rot="R90"/>
<instance part="R21" gate="G$1" x="12.7" y="271.78" rot="R270"/>
<instance part="R23" gate="G$1" x="25.4" y="274.32" rot="R270"/>
<instance part="R25" gate="G$1" x="393.7" y="337.82" rot="R90"/>
<instance part="L2" gate="G$1" x="134.62" y="342.9" rot="R90"/>
<instance part="C17" gate="G$1" x="144.78" y="203.2"/>
<instance part="+3V5" gate="G$1" x="175.26" y="287.02"/>
<instance part="C18" gate="G$1" x="132.08" y="256.54"/>
<instance part="C19" gate="G$1" x="157.48" y="256.54"/>
<instance part="Q1" gate="G$1" x="144.78" y="264.16"/>
<instance part="GND14" gate="1" x="327.66" y="43.18"/>
<instance part="P+1" gate="1" x="55.88" y="157.48"/>
<instance part="P+2" gate="1" x="309.88" y="144.78"/>
<instance part="P+3" gate="1" x="335.28" y="66.04"/>
<instance part="+3V6" gate="G$1" x="12.7" y="284.48"/>
<instance part="C2" gate="G$1" x="340.36" y="124.46"/>
<instance part="H1" gate="G$1" x="434.34" y="58.42" rot="R90"/>
<instance part="H3" gate="G$1" x="454.66" y="58.42" rot="R90"/>
<instance part="GND15" gate="1" x="444.5" y="53.34"/>
<instance part="COM" gate="-1" x="284.48" y="43.18"/>
<instance part="COM" gate="-2" x="284.48" y="58.42"/>
<instance part="COM" gate="-3" x="284.48" y="53.34"/>
<instance part="COM" gate="-4" x="284.48" y="22.86"/>
<instance part="COM" gate="-5" x="284.48" y="27.94"/>
<instance part="COM" gate="-6" x="284.48" y="33.02"/>
<instance part="COM" gate="-7" x="284.48" y="63.5"/>
<instance part="COM" gate="-8" x="284.48" y="38.1"/>
<instance part="J1" gate="G$1" x="127" y="198.12"/>
<instance part="T4" gate="-Q2" x="106.68" y="58.42"/>
<instance part="T4" gate="-Q1" x="71.12" y="78.74"/>
<instance part="T1" gate="-Q2" x="142.24" y="43.18"/>
<instance part="T1" gate="-Q1" x="167.64" y="43.18"/>
<instance part="GND16" gate="1" x="167.64" y="35.56"/>
<instance part="PC6" gate="G$1" x="43.18" y="243.84"/>
<instance part="PC7" gate="G$1" x="55.88" y="243.84"/>
<instance part="R11" gate="G$1" x="60.96" y="256.54"/>
<instance part="R12" gate="G$1" x="48.26" y="259.08"/>
<instance part="GND17" gate="1" x="48.26" y="236.22"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="GND24" gate="1" pin="GND"/>
<wire x1="396.24" y1="127" x2="396.24" y2="109.22" width="0.1524" layer="91"/>
<wire x1="396.24" y1="109.22" x2="408.94" y2="109.22" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="SGND"/>
<wire x1="408.94" y1="109.22" x2="426.72" y2="109.22" width="0.1524" layer="91"/>
<wire x1="426.72" y1="109.22" x2="444.5" y2="109.22" width="0.1524" layer="91"/>
<wire x1="444.5" y1="109.22" x2="444.5" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C31" gate="G$1" pin="2"/>
<wire x1="426.72" y1="114.3" x2="426.72" y2="109.22" width="0.1524" layer="91"/>
<wire x1="444.5" y1="109.22" x2="487.68" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R60" gate="G$1" pin="2"/>
<wire x1="487.68" y1="109.22" x2="487.68" y2="111.76" width="0.1524" layer="91"/>
<junction x="426.72" y="109.22"/>
<junction x="444.5" y="109.22"/>
<pinref part="C30" gate="G$1" pin="2"/>
<wire x1="408.94" y1="134.62" x2="408.94" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="500.38" y1="121.92" x2="500.38" y2="109.22" width="0.1524" layer="91"/>
<wire x1="500.38" y1="109.22" x2="487.68" y2="109.22" width="0.1524" layer="91"/>
<junction x="487.68" y="109.22"/>
<junction x="408.94" y="109.22"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="CSG"/>
<wire x1="454.66" y1="129.54" x2="454.66" y2="127" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="454.66" y1="127" x2="462.28" y2="127" width="0.1524" layer="91"/>
<pinref part="GND25" gate="1" pin="GND"/>
<junction x="462.28" y="127"/>
</segment>
<segment>
<wire x1="358.14" y1="109.22" x2="347.98" y2="109.22" width="0.1524" layer="91"/>
<wire x1="347.98" y1="109.22" x2="340.36" y2="109.22" width="0.1524" layer="91"/>
<wire x1="340.36" y1="121.92" x2="340.36" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="GND23" gate="1" pin="GND"/>
<junction x="347.98" y="109.22"/>
<pinref part="C2" gate="G$1" pin="-"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="454.66" y1="335.28" x2="439.42" y2="335.28" width="0.1524" layer="91"/>
<junction x="439.42" y="335.28"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="429.26" y1="302.26" x2="474.98" y2="302.26" width="0.1524" layer="91"/>
<wire x1="474.98" y1="302.26" x2="474.98" y2="314.96" width="0.1524" layer="91"/>
<junction x="429.26" y="302.26"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="457.2" y1="269.24" x2="462.28" y2="269.24" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="447.04" y1="269.24" x2="457.2" y2="269.24" width="0.1524" layer="91"/>
<junction x="457.2" y="269.24"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="GND"/>
<pinref part="GND4" gate="1" pin="GND"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="459.74" y1="236.22" x2="459.74" y2="231.14" width="0.1524" layer="91"/>
<wire x1="459.74" y1="231.14" x2="449.58" y2="231.14" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="449.58" y1="231.14" x2="439.42" y2="231.14" width="0.1524" layer="91"/>
<wire x1="449.58" y1="236.22" x2="449.58" y2="231.14" width="0.1524" layer="91"/>
<junction x="449.58" y="231.14"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="388.62" y1="233.68" x2="388.62" y2="231.14" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="388.62" y1="231.14" x2="396.24" y2="231.14" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="396.24" y1="231.14" x2="411.48" y2="231.14" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="419.1" y1="231.14" x2="411.48" y2="231.14" width="0.1524" layer="91"/>
<wire x1="419.1" y1="231.14" x2="439.42" y2="231.14" width="0.1524" layer="91"/>
<junction x="439.42" y="231.14"/>
<junction x="419.1" y="231.14"/>
<junction x="411.48" y="231.14"/>
<junction x="396.24" y="231.14"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="53.34" y1="68.58" x2="53.34" y2="33.02" width="0.1524" layer="91"/>
<wire x1="53.34" y1="33.02" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<wire x1="73.66" y1="33.02" x2="86.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="86.36" y1="33.02" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<wire x1="101.6" y1="33.02" x2="109.22" y2="33.02" width="0.1524" layer="91"/>
<wire x1="109.22" y1="33.02" x2="144.78" y2="33.02" width="0.1524" layer="91"/>
<wire x1="144.78" y1="33.02" x2="144.78" y2="38.1" width="0.1524" layer="91"/>
<wire x1="109.22" y1="53.34" x2="109.22" y2="33.02" width="0.1524" layer="91"/>
<wire x1="86.36" y1="48.26" x2="86.36" y2="33.02" width="0.1524" layer="91"/>
<wire x1="73.66" y1="73.66" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="101.6" y="33.02"/>
<junction x="73.66" y="33.02"/>
<junction x="86.36" y="33.02"/>
<junction x="109.22" y="33.02"/>
<pinref part="T4" gate="-Q1" pin="E"/>
<pinref part="T4" gate="-Q2" pin="E"/>
<pinref part="T1" gate="-Q2" pin="E"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="GND@0"/>
<pinref part="IC5" gate="G$1" pin="GND@1"/>
<wire x1="99.06" y1="246.38" x2="101.6" y2="246.38" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND@2"/>
<wire x1="104.14" y1="246.38" x2="101.6" y2="246.38" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="GND@3"/>
<pinref part="GND10" gate="1" pin="GND"/>
<junction x="104.14" y="246.38"/>
<junction x="101.6" y="246.38"/>
<junction x="106.68" y="246.38"/>
<wire x1="106.68" y1="246.38" x2="104.14" y2="246.38" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
<wire x1="162.56" y1="327.66" x2="152.4" y2="327.66" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="152.4" y1="327.66" x2="134.62" y2="327.66" width="0.1524" layer="91"/>
<junction x="152.4" y="327.66"/>
<pinref part="C16" gate="G$1" pin="2"/>
<wire x1="185.42" y1="327.66" x2="170.18" y2="327.66" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="170.18" y1="327.66" x2="162.56" y2="327.66" width="0.1524" layer="91"/>
<junction x="170.18" y="327.66"/>
<junction x="162.56" y="327.66"/>
</segment>
<segment>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="144.78" y1="198.12" x2="139.7" y2="198.12" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="2"/>
<junction x="144.78" y="198.12"/>
<pinref part="J1" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="132.08" y1="251.46" x2="144.78" y2="251.46" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="144.78" y1="251.46" x2="157.48" y2="251.46" width="0.1524" layer="91"/>
<junction x="144.78" y="251.46"/>
</segment>
<segment>
<wire x1="434.34" y1="55.88" x2="444.5" y2="55.88" width="0.1524" layer="91"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<wire x1="444.5" y1="55.88" x2="454.66" y2="55.88" width="0.1524" layer="91"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="GND15" gate="1" pin="GND"/>
<junction x="444.5" y="55.88"/>
</segment>
<segment>
<pinref part="T1" gate="-Q1" pin="C"/>
<pinref part="T1" gate="-Q1" pin="B"/>
<wire x1="170.18" y1="48.26" x2="165.1" y2="48.26" width="0.1524" layer="91"/>
<wire x1="165.1" y1="48.26" x2="165.1" y2="43.18" width="0.1524" layer="91"/>
<pinref part="T1" gate="-Q1" pin="E"/>
<wire x1="170.18" y1="38.1" x2="167.64" y2="38.1" width="0.1524" layer="91"/>
<wire x1="167.64" y1="38.1" x2="165.1" y2="38.1" width="0.1524" layer="91"/>
<wire x1="165.1" y1="38.1" x2="165.1" y2="43.18" width="0.1524" layer="91"/>
<junction x="165.1" y="43.18"/>
<pinref part="GND16" gate="1" pin="GND"/>
<junction x="167.64" y="38.1"/>
</segment>
<segment>
<pinref part="COM" gate="-1" pin="S"/>
<pinref part="GND14" gate="1" pin="GND"/>
<wire x1="327.66" y1="45.72" x2="292.1" y2="45.72" width="0.1524" layer="91"/>
<wire x1="292.1" y1="45.72" x2="292.1" y2="43.18" width="0.1524" layer="91"/>
<wire x1="292.1" y1="43.18" x2="289.56" y2="43.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="PC6" gate="G$1" pin="C"/>
<pinref part="PC7" gate="G$1" pin="C"/>
<wire x1="43.18" y1="238.76" x2="48.26" y2="238.76" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
<wire x1="48.26" y1="238.76" x2="55.88" y2="238.76" width="0.1524" layer="91"/>
<junction x="48.26" y="238.76"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<wire x1="477.52" y1="142.24" x2="487.68" y2="142.24" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="1"/>
<wire x1="487.68" y1="142.24" x2="487.68" y2="137.16" width="0.1524" layer="91"/>
<wire x1="487.68" y1="142.24" x2="500.38" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="500.38" y1="142.24" x2="508" y2="142.24" width="0.1524" layer="91"/>
<wire x1="500.38" y1="129.54" x2="500.38" y2="142.24" width="0.1524" layer="91"/>
<junction x="500.38" y="142.24"/>
<junction x="487.68" y="142.24"/>
<pinref part="+3V17" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<pinref part="C5" gate="G$1" pin="1"/>
<junction x="487.68" y="342.9"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="469.9" y1="342.9" x2="474.98" y2="342.9" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="474.98" y1="342.9" x2="487.68" y2="342.9" width="0.1524" layer="91"/>
<wire x1="457.2" y1="322.58" x2="474.98" y2="322.58" width="0.1524" layer="91"/>
<wire x1="474.98" y1="322.58" x2="474.98" y2="342.9" width="0.1524" layer="91"/>
<junction x="474.98" y="342.9"/>
<junction x="474.98" y="322.58"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VCC"/>
<wire x1="439.42" y1="266.7" x2="439.42" y2="276.86" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="439.42" y1="276.86" x2="447.04" y2="276.86" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="447.04" y1="276.86" x2="462.28" y2="276.86" width="0.1524" layer="91"/>
<junction x="447.04" y="276.86"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<junction x="462.28" y="276.86"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="439.42" y1="276.86" x2="419.1" y2="276.86" width="0.1524" layer="91"/>
<wire x1="419.1" y1="276.86" x2="419.1" y2="274.32" width="0.1524" layer="91"/>
<junction x="439.42" y="276.86"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="1"/>
<pinref part="L2" gate="G$1" pin="2"/>
<wire x1="185.42" y1="335.28" x2="185.42" y2="347.98" width="0.1524" layer="91"/>
<wire x1="185.42" y1="347.98" x2="170.18" y2="347.98" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="VCC@0"/>
<wire x1="170.18" y1="347.98" x2="152.4" y2="347.98" width="0.1524" layer="91"/>
<wire x1="152.4" y1="347.98" x2="134.62" y2="347.98" width="0.1524" layer="91"/>
<wire x1="134.62" y1="347.98" x2="101.6" y2="347.98" width="0.1524" layer="91"/>
<wire x1="101.6" y1="347.98" x2="99.06" y2="347.98" width="0.1524" layer="91"/>
<wire x1="99.06" y1="347.98" x2="96.52" y2="347.98" width="0.1524" layer="91"/>
<wire x1="96.52" y1="347.98" x2="96.52" y2="327.66" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="VCC@1"/>
<wire x1="99.06" y1="327.66" x2="99.06" y2="347.98" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="VCC@2"/>
<wire x1="101.6" y1="327.66" x2="101.6" y2="347.98" width="0.1524" layer="91"/>
<junction x="99.06" y="347.98"/>
<junction x="101.6" y="347.98"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="152.4" y1="335.28" x2="152.4" y2="347.98" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="170.18" y1="335.28" x2="170.18" y2="347.98" width="0.1524" layer="91"/>
<junction x="134.62" y="347.98"/>
<junction x="152.4" y="347.98"/>
<junction x="170.18" y="347.98"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
<junction x="185.42" y="347.98"/>
</segment>
<segment>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<pinref part="C17" gate="G$1" pin="1"/>
<junction x="144.78" y="205.74"/>
<pinref part="J1" gate="G$1" pin="VCC"/>
<wire x1="139.7" y1="200.66" x2="139.7" y2="205.74" width="0.1524" layer="91"/>
<wire x1="139.7" y1="205.74" x2="144.78" y2="205.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R19" gate="G$1" pin="2"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R21" gate="G$1" pin="1"/>
<wire x1="12.7" y1="276.86" x2="12.7" y2="279.4" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="12.7" y1="279.4" x2="25.4" y2="279.4" width="0.1524" layer="91"/>
<wire x1="12.7" y1="279.4" x2="12.7" y2="281.94" width="0.1524" layer="91"/>
<junction x="12.7" y="279.4"/>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
</segment>
</net>
<net name="BATTERY_MONITOR_0-1V" class="0">
<segment>
<wire x1="358.14" y1="119.38" x2="358.14" y2="124.46" width="0.1524" layer="91"/>
<wire x1="358.14" y1="124.46" x2="358.14" y2="127" width="0.1524" layer="91"/>
<wire x1="358.14" y1="124.46" x2="381" y2="124.46" width="0.1524" layer="91"/>
<junction x="358.14" y="124.46"/>
<label x="360.68" y="124.46" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="R14" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PA5/ADCA5"/>
<wire x1="68.58" y1="302.26" x2="27.94" y2="302.26" width="0.1524" layer="91"/>
<label x="27.94" y="302.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SW"/>
<pinref part="D8" gate="G$1" pin="C"/>
<wire x1="462.28" y1="142.24" x2="454.66" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<junction x="462.28" y="142.24"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="462.28" y1="142.24" x2="467.36" y2="142.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="CS"/>
<pinref part="D8" gate="G$1" pin="A"/>
<wire x1="462.28" y1="137.16" x2="454.66" y2="137.16" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="2"/>
<junction x="462.28" y="137.16"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="RT"/>
<pinref part="R58" gate="G$1" pin="1"/>
<wire x1="429.26" y1="132.08" x2="434.34" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SS"/>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="434.34" y1="121.92" x2="426.72" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="FB"/>
<pinref part="R60" gate="G$1" pin="1"/>
<wire x1="454.66" y1="121.92" x2="487.68" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="2"/>
<wire x1="487.68" y1="127" x2="487.68" y2="121.92" width="0.1524" layer="91"/>
<junction x="487.68" y="121.92"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="BST"/>
<wire x1="454.66" y1="147.32" x2="457.2" y2="147.32" width="0.1524" layer="91"/>
<wire x1="457.2" y1="147.32" x2="457.2" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="457.2" y1="149.86" x2="462.28" y2="149.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INT_TCS37725_3V3" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="INT"/>
<wire x1="414.02" y1="332.74" x2="414.02" y2="322.58" width="0.1524" layer="91"/>
<wire x1="414.02" y1="322.58" x2="368.3" y2="322.58" width="0.1524" layer="91"/>
<label x="368.3" y="322.58" size="1.778" layer="95"/>
<junction x="414.02" y="322.58"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="SCK/PD7"/>
<wire x1="132.08" y1="299.72" x2="149.86" y2="299.72" width="0.1524" layer="91"/>
<label x="134.62" y="299.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="SDA_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="SDA"/>
<wire x1="414.02" y1="314.96" x2="393.7" y2="314.96" width="0.1524" layer="91"/>
<label x="368.3" y="314.96" size="1.778" layer="95"/>
<pinref part="R25" gate="G$1" pin="1"/>
<wire x1="393.7" y1="314.96" x2="368.3" y2="314.96" width="0.1524" layer="91"/>
<wire x1="393.7" y1="332.74" x2="393.7" y2="314.96" width="0.1524" layer="91"/>
<junction x="393.7" y="314.96"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="SDA/OC0A/PE0"/>
<wire x1="132.08" y1="292.1" x2="139.7" y2="292.1" width="0.1524" layer="91"/>
<label x="134.62" y="292.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="SCL"/>
<wire x1="368.3" y1="309.88" x2="403.86" y2="309.88" width="0.1524" layer="91"/>
<label x="368.3" y="309.88" size="1.778" layer="95"/>
<pinref part="R20" gate="G$1" pin="1"/>
<wire x1="403.86" y1="309.88" x2="414.02" y2="309.88" width="0.1524" layer="91"/>
<wire x1="403.86" y1="332.74" x2="403.86" y2="309.88" width="0.1524" layer="91"/>
<junction x="403.86" y="309.88"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="SCL/OC0B/PE1"/>
<wire x1="132.08" y1="289.56" x2="139.7" y2="289.56" width="0.1524" layer="91"/>
<label x="134.62" y="289.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="LDR"/>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="449.58" y1="322.58" x2="444.5" y2="322.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="TCS_VCC" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VCC"/>
<wire x1="429.26" y1="330.2" x2="429.26" y2="342.9" width="0.1524" layer="91"/>
<wire x1="429.26" y1="342.9" x2="439.42" y2="342.9" width="0.1524" layer="91"/>
<wire x1="439.42" y1="342.9" x2="454.66" y2="342.9" width="0.1524" layer="91"/>
<wire x1="429.26" y1="342.9" x2="414.02" y2="342.9" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<junction x="439.42" y="342.9"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="1"/>
<junction x="454.66" y="342.9"/>
<junction x="429.26" y="342.9"/>
<wire x1="454.66" y1="342.9" x2="459.74" y2="342.9" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="R25" gate="G$1" pin="2"/>
<wire x1="393.7" y1="342.9" x2="403.86" y2="342.9" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="2"/>
<junction x="403.86" y="342.9"/>
<wire x1="403.86" y1="342.9" x2="414.02" y2="342.9" width="0.1524" layer="91"/>
<junction x="414.02" y="342.9"/>
<label x="429.26" y="342.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="LEDK"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="449.58" y1="246.38" x2="459.74" y2="246.38" width="0.1524" layer="91"/>
<junction x="449.58" y="246.38"/>
</segment>
</net>
<net name="APDS_OUTPUT_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PS_DOUT"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="419.1" y1="264.16" x2="419.1" y2="259.08" width="0.1524" layer="91"/>
<wire x1="419.1" y1="259.08" x2="391.16" y2="259.08" width="0.1524" layer="91"/>
<label x="391.16" y="259.08" size="1.778" layer="95"/>
<junction x="419.1" y="259.08"/>
</segment>
<segment>
<wire x1="132.08" y1="304.8" x2="149.86" y2="304.8" width="0.1524" layer="91"/>
<label x="137.16" y="304.8" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="MOSI/PD5"/>
</segment>
</net>
<net name="APDS_ENABLE_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PS_ENB"/>
<wire x1="419.1" y1="256.54" x2="391.16" y2="256.54" width="0.1524" layer="91"/>
<label x="391.16" y="256.54" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="307.34" x2="149.86" y2="307.34" width="0.1524" layer="91"/>
<label x="137.16" y="307.34" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="\S\S/PD4"/>
</segment>
</net>
<net name="APDS_LED_PWM_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="LEDON"/>
<wire x1="419.1" y1="254" x2="391.16" y2="254" width="0.1524" layer="91"/>
<label x="391.16" y="254" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="309.88" x2="149.86" y2="309.88" width="0.1524" layer="91"/>
<label x="137.16" y="309.88" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="TXD0/OC0D/PD3"/>
</segment>
</net>
<net name="APDS_PROXIMITY_ANA_0-0.65V" class="0">
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="388.62" y1="241.3" x2="396.24" y2="241.3" width="0.1524" layer="91"/>
<wire x1="396.24" y1="241.3" x2="396.24" y2="248.92" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="PS_PFILT"/>
<wire x1="396.24" y1="248.92" x2="419.1" y2="248.92" width="0.1524" layer="91"/>
<wire x1="396.24" y1="248.92" x2="363.22" y2="248.92" width="0.1524" layer="91"/>
<label x="363.22" y="248.92" size="1.778" layer="95"/>
<junction x="396.24" y="248.92"/>
<junction x="396.24" y="241.3"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PA1/ADCA1"/>
<wire x1="68.58" y1="312.42" x2="25.4" y2="312.42" width="0.1524" layer="91"/>
<label x="25.4" y="312.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="APDS_AMBIENT_0-300MV" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="ALS_IOUT"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="419.1" y1="243.84" x2="411.48" y2="243.84" width="0.1524" layer="91"/>
<wire x1="411.48" y1="243.84" x2="411.48" y2="238.76" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="419.1" y1="241.3" x2="419.1" y2="243.84" width="0.1524" layer="91"/>
<wire x1="411.48" y1="243.84" x2="363.22" y2="243.84" width="0.1524" layer="91"/>
<label x="363.22" y="243.84" size="1.778" layer="95"/>
<junction x="411.48" y="243.84"/>
<junction x="419.1" y="243.84"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PA0/ADCA0/AREF"/>
<wire x1="68.58" y1="314.96" x2="25.4" y2="314.96" width="0.1524" layer="91"/>
<label x="25.4" y="314.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="104.14" y1="58.42" x2="101.6" y2="58.42" width="0.1524" layer="91"/>
<pinref part="T4" gate="-Q2" pin="B"/>
</segment>
</net>
<net name="LED_RED_CMD_3V3" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="129.54" y1="43.18" x2="20.32" y2="43.18" width="0.1524" layer="91"/>
<label x="20.32" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PC4/OC1A/\S\S"/>
<wire x1="68.58" y1="264.16" x2="38.1" y2="264.16" width="0.1524" layer="91"/>
<label x="38.1" y="264.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_GREEN_CMD_3V3" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="91.44" y1="58.42" x2="20.32" y2="58.42" width="0.1524" layer="91"/>
<label x="20.32" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PC1/OC0B/XCK0/SCL"/>
<wire x1="68.58" y1="271.78" x2="38.1" y2="271.78" width="0.1524" layer="91"/>
<label x="38.1" y="271.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_BLUE_CMD_3V3" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="58.42" y1="78.74" x2="20.32" y2="78.74" width="0.1524" layer="91"/>
<label x="20.32" y="78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PC0/OC0A/SDA"/>
<wire x1="68.58" y1="274.32" x2="38.1" y2="274.32" width="0.1524" layer="91"/>
<label x="38.1" y="274.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="LED3" gate="_B" pin="C"/>
<pinref part="LED2" gate="_B" pin="A"/>
<wire x1="73.66" y1="111.76" x2="73.66" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="LED2" gate="_G" pin="A"/>
<pinref part="LED3" gate="_G" pin="C"/>
<wire x1="109.22" y1="93.98" x2="109.22" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="LED2" gate="_R" pin="A"/>
<pinref part="LED3" gate="_R" pin="C"/>
<wire x1="144.78" y1="93.98" x2="144.78" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="134.62" y1="337.82" x2="134.62" y2="335.28" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="AVCC@0"/>
<wire x1="106.68" y1="327.66" x2="106.68" y2="335.28" width="0.1524" layer="91"/>
<wire x1="106.68" y1="335.28" x2="134.62" y2="335.28" width="0.1524" layer="91"/>
<junction x="134.62" y="335.28"/>
</segment>
</net>
<net name="PDI_DATA_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PDI"/>
<wire x1="132.08" y1="276.86" x2="147.32" y2="276.86" width="0.1524" layer="91"/>
<label x="134.62" y="276.86" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="114.3" y1="200.66" x2="93.98" y2="200.66" width="0.1524" layer="91"/>
<label x="93.98" y="200.66" size="1.778" layer="95"/>
<pinref part="J1" gate="G$1" pin="DATA"/>
</segment>
</net>
<net name="PDI_CLK_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="/RESET"/>
<wire x1="132.08" y1="274.32" x2="175.26" y2="274.32" width="0.1524" layer="91"/>
<label x="134.62" y="274.32" size="1.778" layer="95"/>
<pinref part="R19" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="114.3" y1="198.12" x2="93.98" y2="198.12" width="0.1524" layer="91"/>
<label x="93.98" y="198.12" size="1.778" layer="95"/>
<pinref part="J1" gate="G$1" pin="CLK"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="C18" gate="G$1" pin="1"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="132.08" y1="259.08" x2="132.08" y2="264.16" width="0.1524" layer="91"/>
<wire x1="132.08" y1="264.16" x2="142.24" y2="264.16" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PR1/XTAL1"/>
<wire x1="132.08" y1="269.24" x2="132.08" y2="264.16" width="0.1524" layer="91"/>
<junction x="132.08" y="264.16"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="C19" gate="G$1" pin="1"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="157.48" y1="259.08" x2="157.48" y2="264.16" width="0.1524" layer="91"/>
<wire x1="157.48" y1="264.16" x2="147.32" y2="264.16" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PR0/XTAL2"/>
<wire x1="132.08" y1="271.78" x2="157.48" y2="271.78" width="0.1524" layer="91"/>
<wire x1="157.48" y1="271.78" x2="157.48" y2="264.16" width="0.1524" layer="91"/>
<junction x="157.48" y="264.16"/>
</segment>
</net>
<net name="TX_3V3" class="0">
<segment>
<wire x1="289.56" y1="58.42" x2="327.66" y2="58.42" width="0.1524" layer="91"/>
<label x="294.64" y="58.42" size="1.778" layer="95"/>
<pinref part="COM" gate="-2" pin="S"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PC3/OC0D/TXD0"/>
<wire x1="68.58" y1="266.7" x2="12.7" y2="266.7" width="0.1524" layer="91"/>
<label x="38.1" y="266.7" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="2"/>
</segment>
</net>
<net name="RX_3V3" class="0">
<segment>
<label x="294.64" y="53.34" size="1.778" layer="95"/>
<wire x1="289.56" y1="53.34" x2="327.66" y2="53.34" width="0.1524" layer="91"/>
<pinref part="COM" gate="-3" pin="S"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PC2/OC0C/RXD0"/>
<wire x1="68.58" y1="269.24" x2="25.4" y2="269.24" width="0.1524" layer="91"/>
<label x="38.1" y="269.24" size="1.778" layer="95"/>
<pinref part="R23" gate="G$1" pin="2"/>
</segment>
</net>
<net name="+24V" class="0">
<segment>
<pinref part="P+1" gate="1" pin="+24V"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="55.88" y1="144.78" x2="55.88" y2="154.94" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="55.88" y1="144.78" x2="73.66" y2="144.78" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="73.66" y1="144.78" x2="91.44" y2="144.78" width="0.1524" layer="91"/>
<wire x1="91.44" y1="144.78" x2="109.22" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="109.22" y1="144.78" x2="127" y2="144.78" width="0.1524" layer="91"/>
<junction x="109.22" y="144.78"/>
<pinref part="R16" gate="G$1" pin="2"/>
<junction x="73.66" y="144.78"/>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="127" y1="144.78" x2="144.78" y2="144.78" width="0.1524" layer="91"/>
<junction x="91.44" y="144.78"/>
<junction x="55.88" y="144.78"/>
<junction x="127" y="144.78"/>
</segment>
<segment>
<wire x1="340.36" y1="142.24" x2="358.14" y2="142.24" width="0.1524" layer="91"/>
<wire x1="358.14" y1="142.24" x2="358.14" y2="137.16" width="0.1524" layer="91"/>
<label x="365.76" y="142.24" size="1.778" layer="95"/>
<junction x="358.14" y="142.24"/>
<pinref part="IC4" gate="G$1" pin="VIN"/>
<pinref part="R58" gate="G$1" pin="2"/>
<wire x1="429.26" y1="142.24" x2="434.34" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="1"/>
<wire x1="429.26" y1="142.24" x2="408.94" y2="142.24" width="0.1524" layer="91"/>
<wire x1="408.94" y1="142.24" x2="396.24" y2="142.24" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="396.24" y1="142.24" x2="396.24" y2="134.62" width="0.1524" layer="91"/>
<wire x1="358.14" y1="142.24" x2="396.24" y2="142.24" width="0.1524" layer="91"/>
<junction x="396.24" y="142.24"/>
<junction x="429.26" y="142.24"/>
<junction x="408.94" y="142.24"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="340.36" y1="129.54" x2="340.36" y2="142.24" width="0.1524" layer="91"/>
<wire x1="340.36" y1="142.24" x2="309.88" y2="142.24" width="0.1524" layer="91"/>
<junction x="340.36" y="142.24"/>
<pinref part="P+2" gate="1" pin="+24V"/>
<pinref part="C2" gate="G$1" pin="+"/>
</segment>
<segment>
<wire x1="335.28" y1="63.5" x2="289.56" y2="63.5" width="0.1524" layer="91"/>
<pinref part="P+3" gate="1" pin="+24V"/>
<pinref part="COM" gate="-7" pin="S"/>
</segment>
</net>
<net name="COLOR_VALID_OUT_3V3" class="0">
<segment>
<wire x1="335.28" y1="38.1" x2="289.56" y2="38.1" width="0.1524" layer="91"/>
<label x="294.64" y="38.1" size="1.778" layer="95"/>
<pinref part="COM" gate="-8" pin="S"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB0/ADCA8/AREF"/>
<wire x1="68.58" y1="289.56" x2="38.1" y2="289.56" width="0.1524" layer="91"/>
<label x="38.1" y="289.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA0_3V3" class="0">
<segment>
<wire x1="289.56" y1="33.02" x2="335.28" y2="33.02" width="0.1524" layer="91"/>
<label x="294.64" y="33.02" size="1.778" layer="95"/>
<pinref part="COM" gate="-6" pin="S"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB1/ADCA9"/>
<wire x1="68.58" y1="287.02" x2="38.1" y2="287.02" width="0.1524" layer="91"/>
<label x="38.1" y="287.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA1_3V3" class="0">
<segment>
<wire x1="289.56" y1="27.94" x2="335.28" y2="27.94" width="0.1524" layer="91"/>
<label x="294.64" y="27.94" size="1.778" layer="95"/>
<pinref part="COM" gate="-5" pin="S"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB2/ADCA10"/>
<wire x1="68.58" y1="284.48" x2="38.1" y2="284.48" width="0.1524" layer="91"/>
<label x="38.1" y="284.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_DATA2_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PB3/ADCA11"/>
<wire x1="68.58" y1="281.94" x2="38.1" y2="281.94" width="0.1524" layer="91"/>
<label x="38.1" y="281.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="289.56" y1="22.86" x2="335.28" y2="22.86" width="0.1524" layer="91"/>
<label x="294.64" y="22.86" size="1.778" layer="95"/>
<pinref part="COM" gate="-4" pin="S"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="LED3" gate="_R" pin="A"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="144.78" y1="134.62" x2="144.78" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="LED2" gate="_G" pin="C"/>
<wire x1="109.22" y1="86.36" x2="109.22" y2="63.5" width="0.1524" layer="91"/>
<pinref part="T4" gate="-Q2" pin="C"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED2" gate="_R" pin="C"/>
<wire x1="144.78" y1="86.36" x2="144.78" y2="48.26" width="0.1524" layer="91"/>
<pinref part="T1" gate="-Q2" pin="C"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="LED2" gate="_B" pin="C"/>
<wire x1="73.66" y1="86.36" x2="73.66" y2="83.82" width="0.1524" layer="91"/>
<pinref part="T4" gate="-Q1" pin="C"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="LED3" gate="_G" pin="A"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="109.22" y1="134.62" x2="109.22" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="LED3" gate="_B" pin="A"/>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="73.66" y1="134.62" x2="73.66" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="T4" gate="-Q1" pin="B"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<pinref part="T1" gate="-Q2" pin="B"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PC7/SCK"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="66.04" y1="256.54" x2="68.58" y2="256.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PC6/MISO"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="53.34" y1="259.08" x2="68.58" y2="259.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="PC7" gate="G$1" pin="A"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="55.88" y1="246.38" x2="55.88" y2="256.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<pinref part="PC6" gate="G$1" pin="A"/>
<wire x1="43.18" y1="259.08" x2="43.18" y2="246.38" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,444.5,116.84,IC4,SGND,GND,,,"/>
<approved hash="104,1,434.34,121.92,IC4,SS,N$43,,,"/>
<approved hash="113,1,132.337,89.431,FRAME1,,,,,"/>
<approved hash="113,1,396.497,89.431,FRAME2,,,,,"/>
<approved hash="113,1,132.337,272.311,FRAME3,,,,,"/>
<approved hash="113,1,396.497,272.311,FRAME4,,,,,"/>
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

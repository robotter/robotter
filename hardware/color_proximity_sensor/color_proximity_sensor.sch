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
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME3" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME4" library="frames" deviceset="A4L-LOC" device=""/>
<part name="+3V17" library="supply1" deviceset="+3V3" device=""/>
<part name="P+11" library="supply1" deviceset="+5V" device=""/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
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
<part name="IC3" library="linear" deviceset="NCV78M" device="" technology="05BDTRKG"/>
<part name="C21" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="C34" library="robotter_capacitor" deviceset="10UF" device="-C_25V" value="10µF 25V"/>
<part name="R59" library="robotter_resistor" deviceset="100_1W" device="-1W"/>
<part name="R13" library="robotter_resistor" deviceset="15K" device="-E" value="15k 1%"/>
<part name="R14" library="robotter_resistor" deviceset="1K" device="-E" value="1k"/>
<part name="C2" library="robotter_capacitor" deviceset="330UF" device="" value="330µF 35V"/>
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
<part name="T1" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="mmbt2222"/>
<part name="T2" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="mmbt2222"/>
<part name="T3" library="robotter_ic" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="mmbt2222"/>
<part name="LED2" library="robotter_diode" deviceset="LED_MULTICOLOR" device="" value="ASMT-YTD2-0BB02"/>
<part name="LED3" library="robotter_diode" deviceset="LED_MULTICOLOR" device="" value="ASMT-YTD2-0BB02"/>
<part name="C10" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="C11" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="C12" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="R8" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R9" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R10" library="robotter_resistor" deviceset="1K" device="-F" value="1k"/>
<part name="R11" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R12" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R16" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
<part name="R17" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
<part name="R18" library="robotter_resistor" deviceset="1K" device="-A" value="1k 1W"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME2" gate="G$1" x="264.16" y="0"/>
<instance part="FRAME3" gate="G$1" x="0" y="182.88"/>
<instance part="FRAME4" gate="G$1" x="264.16" y="182.88"/>
<instance part="+3V17" gate="G$1" x="508" y="116.84"/>
<instance part="P+11" gate="1" x="508" y="63.5"/>
<instance part="GND31" gate="1" x="444.5" y="48.26"/>
<instance part="GND23" gate="1" x="347.98" y="104.14"/>
<instance part="IC4" gate="G$1" x="444.5" y="104.14"/>
<instance part="C22" gate="G$1" x="396.24" y="104.14"/>
<instance part="C30" gate="G$1" x="408.94" y="111.76"/>
<instance part="C31" gate="G$1" x="426.72" y="91.44"/>
<instance part="C32" gate="G$1" x="462.28" y="119.38" smashed="yes">
<attribute name="NAME" x="463.804" y="119.761" size="1.778" layer="95"/>
<attribute name="VALUE" x="463.804" y="122.301" size="1.778" layer="96"/>
</instance>
<instance part="C33" gate="G$1" x="500.38" y="99.06"/>
<instance part="D8" gate="G$1" x="462.28" y="111.76" smashed="yes" rot="R90">
<attribute name="NAME" x="460.375" y="109.474" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="465.074" y="108.331" size="1.778" layer="96"/>
</instance>
<instance part="L1" gate="G$1" x="472.44" y="114.3" smashed="yes">
<attribute name="NAME" x="468.63" y="116.84" size="1.778" layer="95"/>
<attribute name="VALUE" x="476.25" y="115.57" size="1.778" layer="96"/>
</instance>
<instance part="R22" gate="G$1" x="462.28" y="104.14" smashed="yes" rot="R90">
<attribute name="NAME" x="464.82" y="104.14" size="1.778" layer="95"/>
<attribute name="VALUE" x="464.82" y="101.6" size="1.778" layer="96"/>
</instance>
<instance part="R58" gate="G$1" x="429.26" y="109.22" rot="R90"/>
<instance part="R60" gate="G$1" x="487.68" y="88.9" rot="R270"/>
<instance part="R61" gate="G$1" x="487.68" y="104.14" rot="R270"/>
<instance part="GND24" gate="1" x="444.5" y="78.74"/>
<instance part="GND25" gate="1" x="462.28" y="96.52"/>
<instance part="IC3" gate="G$1" x="444.5" y="60.96"/>
<instance part="C21" gate="G$1" x="421.64" y="58.42"/>
<instance part="C34" gate="G$1" x="464.82" y="58.42"/>
<instance part="R59" gate="G$1" x="403.86" y="60.96"/>
<instance part="R13" gate="G$1" x="358.14" y="129.54" rot="R90"/>
<instance part="R14" gate="G$1" x="358.14" y="111.76" rot="R90"/>
<instance part="C2" gate="G$1" x="340.36" y="134.62"/>
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
<instance part="T1" gate="G$1" x="71.12" y="78.74"/>
<instance part="T2" gate="G$1" x="96.52" y="58.42"/>
<instance part="T3" gate="G$1" x="127" y="43.18"/>
<instance part="LED2" gate="_B" x="73.66" y="99.06"/>
<instance part="LED2" gate="_G" x="99.06" y="99.06"/>
<instance part="LED2" gate="_R" x="129.54" y="99.06"/>
<instance part="LED3" gate="_B" x="73.66" y="114.3"/>
<instance part="LED3" gate="_G" x="99.06" y="114.3"/>
<instance part="LED3" gate="_R" x="129.54" y="114.3"/>
<instance part="C10" gate="G$1" x="55.88" y="114.3"/>
<instance part="C11" gate="G$1" x="83.82" y="114.3"/>
<instance part="C12" gate="G$1" x="111.76" y="114.3"/>
<instance part="R8" gate="G$1" x="63.5" y="78.74"/>
<instance part="R9" gate="G$1" x="88.9" y="58.42"/>
<instance part="R10" gate="G$1" x="119.38" y="43.18"/>
<instance part="R11" gate="G$1" x="109.22" y="38.1" rot="R90"/>
<instance part="R12" gate="G$1" x="78.74" y="53.34" rot="R90"/>
<instance part="R15" gate="G$1" x="53.34" y="73.66" rot="R90"/>
<instance part="GND6" gate="1" x="55.88" y="106.68"/>
<instance part="GND7" gate="1" x="83.82" y="106.68"/>
<instance part="GND8" gate="1" x="111.76" y="106.68"/>
<instance part="GND9" gate="1" x="93.98" y="30.48"/>
<instance part="R16" gate="G$1" x="73.66" y="88.9" rot="R90"/>
<instance part="R17" gate="G$1" x="99.06" y="71.12" rot="R90"/>
<instance part="R18" gate="G$1" x="129.54" y="55.88" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="GND24" gate="1" pin="GND"/>
<wire x1="396.24" y1="99.06" x2="396.24" y2="81.28" width="0.1524" layer="91"/>
<wire x1="396.24" y1="81.28" x2="408.94" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="SGND"/>
<wire x1="408.94" y1="81.28" x2="426.72" y2="81.28" width="0.1524" layer="91"/>
<wire x1="426.72" y1="81.28" x2="444.5" y2="81.28" width="0.1524" layer="91"/>
<wire x1="444.5" y1="81.28" x2="444.5" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C31" gate="G$1" pin="2"/>
<wire x1="426.72" y1="86.36" x2="426.72" y2="81.28" width="0.1524" layer="91"/>
<wire x1="444.5" y1="81.28" x2="487.68" y2="81.28" width="0.1524" layer="91"/>
<pinref part="R60" gate="G$1" pin="2"/>
<wire x1="487.68" y1="81.28" x2="487.68" y2="83.82" width="0.1524" layer="91"/>
<junction x="426.72" y="81.28"/>
<junction x="444.5" y="81.28"/>
<pinref part="C30" gate="G$1" pin="2"/>
<wire x1="408.94" y1="106.68" x2="408.94" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="2"/>
<wire x1="500.38" y1="93.98" x2="500.38" y2="81.28" width="0.1524" layer="91"/>
<wire x1="500.38" y1="81.28" x2="487.68" y2="81.28" width="0.1524" layer="91"/>
<junction x="487.68" y="81.28"/>
<junction x="408.94" y="81.28"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="CSG"/>
<wire x1="454.66" y1="101.6" x2="454.66" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="454.66" y1="99.06" x2="462.28" y2="99.06" width="0.1524" layer="91"/>
<pinref part="GND25" gate="1" pin="GND"/>
<junction x="462.28" y="99.06"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND31" gate="1" pin="GND"/>
<wire x1="444.5" y1="50.8" x2="444.5" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="421.64" y1="53.34" x2="421.64" y2="50.8" width="0.1524" layer="91"/>
<wire x1="421.64" y1="50.8" x2="444.5" y2="50.8" width="0.1524" layer="91"/>
<pinref part="C34" gate="G$1" pin="2"/>
<wire x1="464.82" y1="53.34" x2="464.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="464.82" y1="50.8" x2="444.5" y2="50.8" width="0.1524" layer="91"/>
<junction x="444.5" y="50.8"/>
</segment>
<segment>
<wire x1="358.14" y1="106.68" x2="347.98" y2="106.68" width="0.1524" layer="91"/>
<wire x1="347.98" y1="106.68" x2="340.36" y2="106.68" width="0.1524" layer="91"/>
<wire x1="340.36" y1="132.08" x2="340.36" y2="106.68" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="1"/>
<pinref part="C2" gate="G$1" pin="-"/>
<pinref part="GND23" gate="1" pin="GND"/>
<junction x="347.98" y="106.68"/>
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
<pinref part="R15" gate="G$1" pin="1"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="53.34" y1="68.58" x2="53.34" y2="33.02" width="0.1524" layer="91"/>
<wire x1="53.34" y1="33.02" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$1" pin="E"/>
<wire x1="73.66" y1="33.02" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
<wire x1="78.74" y1="33.02" x2="93.98" y2="33.02" width="0.1524" layer="91"/>
<wire x1="93.98" y1="33.02" x2="99.06" y2="33.02" width="0.1524" layer="91"/>
<wire x1="99.06" y1="33.02" x2="109.22" y2="33.02" width="0.1524" layer="91"/>
<wire x1="109.22" y1="33.02" x2="129.54" y2="33.02" width="0.1524" layer="91"/>
<wire x1="129.54" y1="33.02" x2="129.54" y2="38.1" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="E"/>
<wire x1="99.06" y1="53.34" x2="99.06" y2="33.02" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="78.74" y1="48.26" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="E"/>
<wire x1="73.66" y1="73.66" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="93.98" y="33.02"/>
<junction x="73.66" y="33.02"/>
<junction x="78.74" y="33.02"/>
<junction x="99.06" y="33.02"/>
<junction x="109.22" y="33.02"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<wire x1="477.52" y1="114.3" x2="487.68" y2="114.3" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="1"/>
<wire x1="487.68" y1="114.3" x2="487.68" y2="109.22" width="0.1524" layer="91"/>
<wire x1="487.68" y1="114.3" x2="500.38" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C33" gate="G$1" pin="1"/>
<wire x1="500.38" y1="114.3" x2="508" y2="114.3" width="0.1524" layer="91"/>
<wire x1="500.38" y1="101.6" x2="500.38" y2="114.3" width="0.1524" layer="91"/>
<junction x="500.38" y="114.3"/>
<junction x="487.68" y="114.3"/>
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
</net>
<net name="VBAT" class="0">
<segment>
<wire x1="340.36" y1="142.24" x2="358.14" y2="142.24" width="0.1524" layer="91"/>
<wire x1="358.14" y1="142.24" x2="358.14" y2="134.62" width="0.1524" layer="91"/>
<label x="365.76" y="142.24" size="1.778" layer="95"/>
<junction x="358.14" y="142.24"/>
<pinref part="IC4" gate="G$1" pin="VIN"/>
<pinref part="R58" gate="G$1" pin="2"/>
<wire x1="429.26" y1="114.3" x2="434.34" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="1"/>
<wire x1="429.26" y1="114.3" x2="408.94" y2="114.3" width="0.1524" layer="91"/>
<wire x1="408.94" y1="114.3" x2="396.24" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="396.24" y1="114.3" x2="396.24" y2="106.68" width="0.1524" layer="91"/>
<wire x1="358.14" y1="142.24" x2="391.16" y2="142.24" width="0.1524" layer="91"/>
<junction x="396.24" y="114.3"/>
<junction x="429.26" y="114.3"/>
<junction x="408.94" y="114.3"/>
<wire x1="391.16" y1="142.24" x2="391.16" y2="114.3" width="0.1524" layer="91"/>
<wire x1="391.16" y1="114.3" x2="391.16" y2="60.96" width="0.1524" layer="91"/>
<wire x1="391.16" y1="60.96" x2="398.78" y2="60.96" width="0.1524" layer="91"/>
<wire x1="396.24" y1="114.3" x2="391.16" y2="114.3" width="0.1524" layer="91"/>
<junction x="391.16" y="114.3"/>
<pinref part="R59" gate="G$1" pin="1"/>
<pinref part="R13" gate="G$1" pin="2"/>
<pinref part="C2" gate="G$1" pin="+"/>
<wire x1="340.36" y1="139.7" x2="340.36" y2="142.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="LED3" gate="_B" pin="A"/>
<pinref part="LED3" gate="_R" pin="A"/>
<wire x1="73.66" y1="116.84" x2="83.82" y2="116.84" width="0.1524" layer="91"/>
<pinref part="LED3" gate="_G" pin="A"/>
<wire x1="83.82" y1="116.84" x2="99.06" y2="116.84" width="0.1524" layer="91"/>
<wire x1="99.06" y1="116.84" x2="111.76" y2="116.84" width="0.1524" layer="91"/>
<junction x="99.06" y="116.84"/>
<pinref part="C11" gate="G$1" pin="1"/>
<junction x="83.82" y="116.84"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="111.76" y1="116.84" x2="129.54" y2="116.84" width="0.1524" layer="91"/>
<junction x="111.76" y="116.84"/>
<wire x1="73.66" y1="116.84" x2="55.88" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="55.88" y1="116.84" x2="55.88" y2="127" width="0.1524" layer="91"/>
<wire x1="55.88" y1="127" x2="50.8" y2="127" width="0.1524" layer="91"/>
<label x="50.8" y="127" size="1.778" layer="95"/>
<junction x="55.88" y="116.84"/>
<junction x="73.66" y="116.84"/>
</segment>
</net>
<net name="BATTERY_MONITOR_0-1V" class="0">
<segment>
<wire x1="358.14" y1="116.84" x2="358.14" y2="119.38" width="0.1524" layer="91"/>
<wire x1="358.14" y1="119.38" x2="358.14" y2="124.46" width="0.1524" layer="91"/>
<wire x1="358.14" y1="119.38" x2="381" y2="119.38" width="0.1524" layer="91"/>
<junction x="358.14" y="119.38"/>
<label x="360.68" y="119.38" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="R14" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SW"/>
<pinref part="D8" gate="G$1" pin="C"/>
<wire x1="462.28" y1="114.3" x2="454.66" y2="114.3" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<junction x="462.28" y="114.3"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="462.28" y1="114.3" x2="467.36" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="CS"/>
<pinref part="D8" gate="G$1" pin="A"/>
<wire x1="462.28" y1="109.22" x2="454.66" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="2"/>
<junction x="462.28" y="109.22"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="RT"/>
<pinref part="R58" gate="G$1" pin="1"/>
<wire x1="429.26" y1="104.14" x2="434.34" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="SS"/>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="434.34" y1="93.98" x2="426.72" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="FB"/>
<pinref part="R60" gate="G$1" pin="1"/>
<wire x1="454.66" y1="93.98" x2="487.68" y2="93.98" width="0.1524" layer="91"/>
<pinref part="R61" gate="G$1" pin="2"/>
<wire x1="487.68" y1="99.06" x2="487.68" y2="93.98" width="0.1524" layer="91"/>
<junction x="487.68" y="93.98"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="BST"/>
<wire x1="454.66" y1="119.38" x2="457.2" y2="119.38" width="0.1524" layer="91"/>
<wire x1="457.2" y1="119.38" x2="457.2" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="457.2" y1="121.92" x2="462.28" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="408.94" y1="60.96" x2="421.64" y2="60.96" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="VI"/>
<wire x1="421.64" y1="60.96" x2="434.34" y2="60.96" width="0.1524" layer="91"/>
<junction x="421.64" y="60.96"/>
<pinref part="R59" gate="G$1" pin="2"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="VO"/>
<pinref part="C34" gate="G$1" pin="1"/>
<wire x1="454.66" y1="60.96" x2="464.82" y2="60.96" width="0.1524" layer="91"/>
<pinref part="P+11" gate="1" pin="+5V"/>
<wire x1="464.82" y1="60.96" x2="508" y2="60.96" width="0.1524" layer="91"/>
<junction x="464.82" y="60.96"/>
</segment>
</net>
<net name="INT_TCS37725_3V3" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="INT"/>
<wire x1="414.02" y1="332.74" x2="414.02" y2="322.58" width="0.1524" layer="91"/>
<wire x1="414.02" y1="322.58" x2="388.62" y2="322.58" width="0.1524" layer="91"/>
<label x="388.62" y="322.58" size="1.778" layer="95"/>
<junction x="414.02" y="322.58"/>
</segment>
</net>
<net name="SDA_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="SDA"/>
<wire x1="414.02" y1="314.96" x2="388.62" y2="314.96" width="0.1524" layer="91"/>
<label x="388.62" y="314.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL_3V3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="SCL"/>
<wire x1="388.62" y1="309.88" x2="414.02" y2="309.88" width="0.1524" layer="91"/>
<label x="388.62" y="309.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="LDR"/>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="449.58" y1="322.58" x2="444.5" y2="322.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC" class="0">
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
</net>
<net name="APDS_ENABLE_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PS_ENB"/>
<wire x1="419.1" y1="256.54" x2="391.16" y2="256.54" width="0.1524" layer="91"/>
<label x="391.16" y="256.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="APDS_LED_PWM_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="LEDON"/>
<wire x1="419.1" y1="254" x2="391.16" y2="254" width="0.1524" layer="91"/>
<label x="391.16" y="254" size="1.778" layer="95"/>
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
<wire x1="396.24" y1="248.92" x2="381" y2="248.92" width="0.1524" layer="91"/>
<label x="381" y="248.92" size="1.778" layer="95"/>
<junction x="396.24" y="248.92"/>
<junction x="396.24" y="241.3"/>
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
</net>
<net name="N$1" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="B"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="B"/>
<pinref part="R9" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="B"/>
<pinref part="R10" gate="G$1" pin="2"/>
</segment>
</net>
<net name="LED_RED_CMD_3V3" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="109.22" y1="43.18" x2="20.32" y2="43.18" width="0.1524" layer="91"/>
<junction x="109.22" y="43.18"/>
<label x="20.32" y="43.18" size="1.778" layer="95"/>
<wire x1="109.22" y1="43.18" x2="114.3" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_GREEN_CMD_3V3" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="78.74" y1="58.42" x2="20.32" y2="58.42" width="0.1524" layer="91"/>
<junction x="78.74" y="58.42"/>
<label x="20.32" y="58.42" size="1.778" layer="95"/>
<wire x1="78.74" y1="58.42" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED_BLUE_CMD_3V3" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="53.34" y1="78.74" x2="20.32" y2="78.74" width="0.1524" layer="91"/>
<junction x="53.34" y="78.74"/>
<label x="20.32" y="78.74" size="1.778" layer="95"/>
<wire x1="53.34" y1="78.74" x2="58.42" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="LED3" gate="_B" pin="C"/>
<pinref part="LED2" gate="_B" pin="A"/>
<wire x1="73.66" y1="109.22" x2="73.66" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="LED2" gate="_G" pin="A"/>
<pinref part="LED3" gate="_G" pin="C"/>
<wire x1="99.06" y1="101.6" x2="99.06" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="LED2" gate="_R" pin="A"/>
<pinref part="LED3" gate="_R" pin="C"/>
<wire x1="129.54" y1="101.6" x2="129.54" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="C"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="LED2" gate="_B" pin="C"/>
<pinref part="R16" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED2" gate="_G" pin="C"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="99.06" y1="76.2" x2="99.06" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="LED2" gate="_R" pin="C"/>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="129.54" y1="60.96" x2="129.54" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="C"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="99.06" y1="66.04" x2="99.06" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="C"/>
<pinref part="R18" gate="G$1" pin="1"/>
<wire x1="129.54" y1="50.8" x2="129.54" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

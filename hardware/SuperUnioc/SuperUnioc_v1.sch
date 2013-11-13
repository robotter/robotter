<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
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
<circle x="0" y="0" radius="5.08" width="2" layer="41"/>
<circle x="0" y="0" radius="5.08" width="2" layer="42"/>
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
<circle x="0" y="0" radius="5.588" width="2" layer="42"/>
<circle x="0" y="0" radius="5.588" width="2" layer="41"/>
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
<circle x="0" y="0" radius="5.588" width="2" layer="42"/>
<circle x="0" y="0" radius="5.588" width="2" layer="41"/>
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
<circle x="0" y="0" radius="5.588" width="2" layer="42"/>
<circle x="0" y="0" radius="5.588" width="2" layer="41"/>
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
<circle x="0" y="0" radius="5.588" width="2" layer="42"/>
<circle x="0" y="0" radius="5.588" width="2" layer="41"/>
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
<library name="con-molex">
<packages>
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
<deviceset name="22-?-04" prefix="J">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (.1 inch) pitch header</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
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
<package name="MICROMATCH-12_SMD">
<wire x1="-8.64" y1="0.7" x2="-9.04" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="0.7" x2="-9.04" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="-0.7" x2="-8.64" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-8.64" y1="-1.2" x2="-9.04" y2="-1.2" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="-1.2" x2="-9.04" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="-1.6" x2="-8.64" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-8.64" y1="1.6" x2="-9.04" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="1.6" x2="-9.04" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-9.04" y1="1.2" x2="-8.64" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-8.54" y1="2.4" x2="-8.54" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-7.96" y1="2" x2="-7.96" y2="-2" width="0.2032" layer="21"/>
<wire x1="8.54" y1="1" x2="7.96" y2="1" width="0.2032" layer="21"/>
<wire x1="7.96" y1="-0.33" x2="8.54" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="8.54" y1="-2.4" x2="8.54" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="8.54" y1="1" x2="8.54" y2="2.4" width="0.2032" layer="21"/>
<wire x1="7.96" y1="2" x2="7.86" y2="2" width="0.2032" layer="21"/>
<wire x1="-6.96" y1="2" x2="-7.96" y2="2" width="0.2032" layer="21"/>
<wire x1="8.54" y1="2.4" x2="7.86" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-6.96" y1="2.4" x2="-8.54" y2="2.4" width="0.2032" layer="21"/>
<wire x1="8.54" y1="-2.4" x2="6.96" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-7.86" y1="-2.4" x2="-8.54" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="7.96" y1="-2" x2="7.96" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="7.96" y1="1" x2="7.96" y2="2" width="0.2032" layer="21"/>
<wire x1="7.96" y1="-2" x2="6.96" y2="-2" width="0.2032" layer="21"/>
<wire x1="-7.86" y1="-2" x2="-7.96" y2="-2" width="0.2032" layer="21"/>
<smd name="1" x="6.985" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="4.445" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="5" x="1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="7" x="-0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="9" x="-3.175" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="11" x="-5.715" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="2" x="5.715" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="3.175" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="6" x="0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="8" x="-1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="10" x="-4.445" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="12" x="-6.985" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-7.62" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.985" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
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
<technology name=""/>
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
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
<attribute name="FN" value="1109794" constant="no"/>
<attribute name="VALUE" value="" constant="no"/>
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
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MICROMATCH-12_SMD" prefix="X">
<description>Ref FN : 1565589</description>
<gates>
<gate name="-1" symbol="MV" x="-5.08" y="12.7"/>
<gate name="-2" symbol="M" x="-5.08" y="10.16"/>
<gate name="-3" symbol="M" x="-5.08" y="7.62"/>
<gate name="-4" symbol="M" x="-5.08" y="5.08"/>
<gate name="-5" symbol="M" x="-5.08" y="2.54"/>
<gate name="-6" symbol="M" x="-5.08" y="0"/>
<gate name="-7" symbol="M" x="-5.08" y="-2.54"/>
<gate name="-8" symbol="M" x="-5.08" y="-5.08"/>
<gate name="-9" symbol="M" x="-5.08" y="-7.62"/>
<gate name="-10" symbol="M" x="-5.08" y="-10.16"/>
<gate name="-11" symbol="M" x="-5.08" y="-12.7"/>
<gate name="-12" symbol="M" x="-5.08" y="-15.24"/>
</gates>
<devices>
<device name="" package="MICROMATCH-12_SMD">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
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
<attribute name="VALUE" value="100nF_0603_50V" constant="no"/>
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
<attribute name="VALUE" value="100nF_0805_50V" constant="no"/>
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
<deviceset name="C_" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="100NF" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="100NF_50V_0805" constant="no"/>
</technology>
</technologies>
</device>
<device name="1UF" package="C1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="1UF_50V_1206" constant="no"/>
</technology>
</technologies>
</device>
<device name="15PF" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="15PF_100V_0805" constant="no"/>
</technology>
</technologies>
</device>
<device name="10NF" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="10nF_50V_0603" constant="no"/>
</technology>
</technologies>
</device>
<device name="22UF" package="C1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="VALUE" value="22µF_16V_1210" constant="no"/>
</technology>
</technologies>
</device>
<device name="10UF" package="C1210">
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
<deviceset name="10UF" prefix="C">
<gates>
<gate name="G$1" symbol="C_" x="0" y="0"/>
</gates>
<devices>
<device name="C" package="C1210">
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
<package name="SOD123">
<description>&lt;b&gt;Diode&lt;/b&gt;</description>
<wire x1="-1.1" y1="0.7" x2="1.1" y2="0.7" width="0.254" layer="51"/>
<wire x1="1.1" y1="0.7" x2="1.1" y2="-0.7" width="0.254" layer="51"/>
<wire x1="1.1" y1="-0.7" x2="-1.1" y2="-0.7" width="0.254" layer="51"/>
<wire x1="-1.1" y1="-0.7" x2="-1.1" y2="0.7" width="0.254" layer="51"/>
<smd name="C" x="-1.9" y="0" dx="1.4" dy="1.4" layer="1"/>
<smd name="A" x="1.9" y="0" dx="1.4" dy="1.4" layer="1"/>
<text x="-1.1" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.1" y="-2.3" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.95" y1="-0.45" x2="-1.2" y2="0.4" layer="51"/>
<rectangle x1="1.2" y1="-0.45" x2="1.95" y2="0.4" layer="51"/>
<rectangle x1="-1.05" y1="-0.65" x2="-0.15" y2="0.7" layer="51"/>
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
<symbol name="ADXRS453">
<wire x1="-7.62" y1="22.86" x2="22.86" y2="22.86" width="0.254" layer="94"/>
<wire x1="22.86" y1="22.86" x2="22.86" y2="-10.16" width="0.254" layer="94"/>
<wire x1="22.86" y1="-10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="22.86" width="0.254" layer="94"/>
<text x="-7.62" y="24.13" size="1.778" layer="95">&gt;NAME</text>
<text x="20.32" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VX" x="12.7" y="25.4" length="short" rot="R270"/>
<pin name="CP5" x="25.4" y="20.32" length="short" rot="R180"/>
<pin name="RSVD@2" x="10.16" y="-12.7" length="short" rot="R90"/>
<pin name="DVDD" x="25.4" y="7.62" length="short" rot="R180"/>
<pin name="RSVD@0" x="5.08" y="-12.7" length="short" rot="R90"/>
<pin name="RSVD@1" x="7.62" y="-12.7" length="short" rot="R90"/>
<pin name="/CS" x="-10.16" y="15.24" length="short"/>
<pin name="AVSS" x="17.78" y="-12.7" length="short" rot="R90"/>
<pin name="MISO" x="-10.16" y="10.16" length="short"/>
<pin name="PDD" x="2.54" y="25.4" length="short" rot="R270"/>
<pin name="PSS" x="-5.08" y="-12.7" length="short" rot="R90"/>
<pin name="RSVD@3" x="12.7" y="-12.7" length="short" rot="R90"/>
<pin name="MOSI" x="-10.16" y="5.08" length="short"/>
<pin name="SCLK" x="-10.16" y="0" length="short"/>
<pin name="AVDD" x="25.4" y="2.54" length="short" rot="R180"/>
<pin name="DVSS" x="0" y="-12.7" length="short" rot="R90"/>
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
<technology name=""/>
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
<technology name="C"/>
<technology name="E"/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ADXRS453" prefix="IC" uservalue="yes">
<gates>
<gate name="G$1" symbol="ADXRS453" x="-5.08" y="-5.08"/>
</gates>
<devices>
<device name="BRGZ" package="SO16">
<connects>
<connect gate="G$1" pin="/CS" pad="4"/>
<connect gate="G$1" pin="AVDD" pad="14"/>
<connect gate="G$1" pin="AVSS" pad="11"/>
<connect gate="G$1" pin="CP5" pad="9"/>
<connect gate="G$1" pin="DVDD" pad="1"/>
<connect gate="G$1" pin="DVSS" pad="13"/>
<connect gate="G$1" pin="MISO" pad="5"/>
<connect gate="G$1" pin="MOSI" pad="15"/>
<connect gate="G$1" pin="PDD" pad="6"/>
<connect gate="G$1" pin="PSS" pad="7"/>
<connect gate="G$1" pin="RSVD@0" pad="2"/>
<connect gate="G$1" pin="RSVD@1" pad="3"/>
<connect gate="G$1" pin="RSVD@2" pad="10"/>
<connect gate="G$1" pin="RSVD@3" pad="12"/>
<connect gate="G$1" pin="SCLK" pad="16"/>
<connect gate="G$1" pin="VX" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MMSD4148" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOD123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
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
<technology name=""/>
</technologies>
</device>
<device name="-E" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
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
<technology name=""/>
</technologies>
</device>
<device name="" package="R0805">
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
<attribute name="VALUE" value="GREEN_0805" constant="no"/>
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
<attribute name="VALUE" value="YELLOW_0805" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_inductor">
<packages>
<package name="NPSIS_D64">
<wire x1="-1" y1="-3.3" x2="1" y2="-3.3" width="0.127" layer="21"/>
<wire x1="1" y1="3.3" x2="-1" y2="3.3" width="0.127" layer="21"/>
<smd name="1" x="-2.325" y="0" dx="2.65" dy="7.3" layer="1" rot="R180"/>
<smd name="2" x="2.325" y="0" dx="2.65" dy="7.3" layer="1" rot="R180"/>
<text x="-3.81" y="-5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="3.81" size="1.27" layer="27">&gt;VALUE</text>
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
<deviceset name="NPIS64D" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="471MTRF" package="NPSIS_D64">
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
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device="" value=" "/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H3" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="FRAME2" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME3" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME4" library="frames" deviceset="A4L-LOC" device=""/>
<part name="MOT1" library="robotter_connector" deviceset="MICROMATCH-16_SMD" device=""/>
<part name="MOT2" library="robotter_connector" deviceset="MICROMATCH-16_SMD" device=""/>
<part name="MOT3" library="robotter_connector" deviceset="MICROMATCH-16_SMD" device=""/>
<part name="PDI_UC" library="robotter_connector" deviceset="PDI_ATMEL" device="L"/>
<part name="IC5" library="avr-7" deviceset="XMEGA-A1" device="TQFP" value="XMEGA128-A1"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="UART_I2C" library="robotter_connector" deviceset="MICROMATCH-8_SMD" device=""/>
<part name="+3V12" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="ALIM" library="con-molex" deviceset="22-?-04" device="27-2041"/>
<part name="P+15" library="supply1" deviceset="+12V" device=""/>
<part name="GND44" library="supply1" deviceset="GND" device=""/>
<part name="P+16" library="supply1" deviceset="+5V" device=""/>
<part name="LED3" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="LED4" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="LED2" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="LED1" library="robotter_diode" deviceset="LED_" device="G"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="JA1" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="JB1" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="JB2" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="JC2" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="C38" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C37" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C33" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C32" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C31" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C28" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C29" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C36" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C30" library="robotter_capacitor" deviceset="100NF" device="-F"/>
<part name="C34" library="robotter_capacitor" deviceset="15PF" device="-F"/>
<part name="C35" library="robotter_capacitor" deviceset="15PF" device="-F"/>
<part name="R19" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R15_Q0" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R16_Q1" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R17_Q2" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R18_Q3" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R21" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R23" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="+3V18" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V21" library="supply1" deviceset="+3V3" device=""/>
<part name="R24" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="P+2" library="supply1" deviceset="+12V" device=""/>
<part name="R25" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R20" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R22" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF_0805_50V"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-E" value="100nF_0805_50V"/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-E"/>
<part name="+3V24" library="supply1" deviceset="+3V3" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="IC2" library="robotter_ic" deviceset="ADXRS453" device="BRGZ"/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V7" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="C2" library="robotter_capacitor" deviceset="C_" device="1UF" value="1UF_50V_1206"/>
<part name="C7" library="robotter_capacitor" deviceset="C_" device="1UF" value="1UF_50V_1206"/>
<part name="C8" library="robotter_capacitor" deviceset="C_" device="1UF" value="1UF_50V_1206"/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="D1" library="robotter_ic" deviceset="MMSD4148" device="" value="MMSD4148"/>
<part name="R1" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="L1" library="robotter_inductor" deviceset="NPIS64D" device="471MTRF"/>
<part name="H4" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H5" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="FRAME5" library="frames" deviceset="A4L-LOC" device=""/>
<part name="GP2" library="robotter_connector" deviceset="MICROMATCH-12_SMD" device=""/>
<part name="R2" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R3" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R4" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R5" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R6" library="robotter_resistor" deviceset="470" device="-F"/>
<part name="R7" library="robotter_resistor" deviceset="470" device="-F"/>
<part name="R8" library="robotter_resistor" deviceset="470" device="-F"/>
<part name="R9" library="robotter_resistor" deviceset="470" device="-F"/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="P+6" library="supply1" deviceset="+5V" device=""/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="C10" library="robotter_capacitor" deviceset="10UF" device="C"/>
<part name="C11" library="robotter_capacitor" deviceset="10UF" device="C"/>
<part name="C12" library="robotter_capacitor" deviceset="10UF" device="C"/>
<part name="C13" library="robotter_capacitor" deviceset="10UF" device="C"/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="25.4" y="-134.62" size="1.778" layer="91">verifier pinout du gp2</text>
<text x="60.96" y="-134.62" size="1.778" layer="91">que la nappe ait juste a etre splittée en 4</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="H1" gate="G$1" x="157.48" y="43.18" rot="R90"/>
<instance part="H2" gate="G$1" x="165.1" y="43.18" rot="R90"/>
<instance part="H3" gate="G$1" x="172.72" y="43.18" rot="R90"/>
<instance part="GND3" gate="1" x="165.1" y="35.56"/>
<instance part="FRAME2" gate="G$1" x="0" y="185.42"/>
<instance part="FRAME3" gate="G$1" x="269.24" y="0"/>
<instance part="FRAME4" gate="G$1" x="269.24" y="185.42"/>
<instance part="MOT1" gate="-1" x="73.66" y="170.18" smashed="yes">
<attribute name="NAME" x="73.152" y="171.069" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="58.42" y="171.069" size="1.778" layer="96"/>
</instance>
<instance part="MOT1" gate="-2" x="73.66" y="167.64" smashed="yes">
<attribute name="NAME" x="73.152" y="168.529" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-3" x="73.66" y="165.1" smashed="yes">
<attribute name="NAME" x="73.152" y="165.989" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-4" x="73.66" y="162.56" smashed="yes">
<attribute name="NAME" x="73.152" y="163.449" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-5" x="73.66" y="160.02" smashed="yes">
<attribute name="NAME" x="73.152" y="160.909" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="MOT1" gate="-6" x="73.66" y="157.48"/>
<instance part="MOT1" gate="-7" x="73.66" y="154.94"/>
<instance part="MOT1" gate="-8" x="73.66" y="152.4"/>
<instance part="MOT1" gate="-9" x="73.66" y="149.86"/>
<instance part="MOT1" gate="-10" x="73.66" y="147.32"/>
<instance part="MOT1" gate="-11" x="73.66" y="144.78"/>
<instance part="MOT1" gate="-12" x="73.66" y="142.24"/>
<instance part="MOT1" gate="-13" x="73.66" y="139.7"/>
<instance part="MOT1" gate="-14" x="73.66" y="137.16"/>
<instance part="MOT1" gate="-15" x="73.66" y="134.62"/>
<instance part="MOT1" gate="-16" x="73.66" y="132.08"/>
<instance part="MOT2" gate="-1" x="68.58" y="119.38"/>
<instance part="MOT2" gate="-2" x="68.58" y="116.84"/>
<instance part="MOT2" gate="-3" x="68.58" y="114.3"/>
<instance part="MOT2" gate="-4" x="68.58" y="111.76"/>
<instance part="MOT2" gate="-5" x="68.58" y="109.22"/>
<instance part="MOT2" gate="-6" x="68.58" y="106.68"/>
<instance part="MOT2" gate="-7" x="68.58" y="104.14"/>
<instance part="MOT2" gate="-8" x="68.58" y="101.6"/>
<instance part="MOT2" gate="-9" x="68.58" y="99.06"/>
<instance part="MOT2" gate="-10" x="68.58" y="96.52"/>
<instance part="MOT2" gate="-11" x="68.58" y="93.98"/>
<instance part="MOT2" gate="-12" x="68.58" y="91.44"/>
<instance part="MOT2" gate="-13" x="68.58" y="88.9"/>
<instance part="MOT2" gate="-14" x="68.58" y="86.36"/>
<instance part="MOT2" gate="-15" x="68.58" y="83.82"/>
<instance part="MOT2" gate="-16" x="68.58" y="81.28"/>
<instance part="MOT3" gate="-1" x="68.58" y="66.04"/>
<instance part="MOT3" gate="-2" x="68.58" y="63.5"/>
<instance part="MOT3" gate="-3" x="68.58" y="60.96"/>
<instance part="MOT3" gate="-4" x="68.58" y="58.42"/>
<instance part="MOT3" gate="-5" x="68.58" y="55.88"/>
<instance part="MOT3" gate="-6" x="68.58" y="53.34"/>
<instance part="MOT3" gate="-7" x="68.58" y="50.8"/>
<instance part="MOT3" gate="-8" x="68.58" y="48.26"/>
<instance part="MOT3" gate="-9" x="68.58" y="45.72"/>
<instance part="MOT3" gate="-10" x="68.58" y="43.18"/>
<instance part="MOT3" gate="-11" x="68.58" y="40.64"/>
<instance part="MOT3" gate="-12" x="68.58" y="38.1"/>
<instance part="MOT3" gate="-13" x="68.58" y="35.56"/>
<instance part="MOT3" gate="-14" x="68.58" y="33.02"/>
<instance part="MOT3" gate="-15" x="68.58" y="30.48"/>
<instance part="MOT3" gate="-16" x="68.58" y="27.94"/>
<instance part="PDI_UC" gate="1" x="500.38" y="330.2"/>
<instance part="IC5" gate="G$1" x="337.82" y="246.38" smashed="yes">
<attribute name="NAME" x="355.6" y="198.12" size="1.9304" layer="95" ratio="5"/>
<attribute name="VALUE" x="355.6" y="195.58" size="1.9304" layer="96" ratio="5"/>
</instance>
<instance part="GND1" gate="1" x="403.86" y="193.04"/>
<instance part="GND2" gate="1" x="337.82" y="193.04"/>
<instance part="+3V1" gate="G$1" x="441.96" y="223.52" smashed="yes">
<attribute name="VALUE" x="439.42" y="223.52" size="1.778" layer="96"/>
</instance>
<instance part="GND28" gate="1" x="299.72" y="101.6" rot="MR0"/>
<instance part="UART_I2C" gate="-1" x="292.1" y="109.22" smashed="yes" rot="MR180">
<attribute name="NAME" x="291.592" y="108.331" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="297.18" y="105.029" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="UART_I2C" gate="-2" x="292.1" y="111.76" rot="MR180"/>
<instance part="UART_I2C" gate="-3" x="292.1" y="114.3" rot="MR180"/>
<instance part="UART_I2C" gate="-4" x="292.1" y="116.84" rot="MR180"/>
<instance part="UART_I2C" gate="-5" x="292.1" y="119.38"/>
<instance part="UART_I2C" gate="-6" x="292.1" y="121.92"/>
<instance part="UART_I2C" gate="-7" x="292.1" y="124.46"/>
<instance part="UART_I2C" gate="-8" x="292.1" y="127"/>
<instance part="+3V12" gate="G$1" x="302.26" y="137.16" smashed="yes">
<attribute name="VALUE" x="299.72" y="137.16" size="1.778" layer="96"/>
</instance>
<instance part="+3V2" gate="G$1" x="441.96" y="238.76" smashed="yes">
<attribute name="VALUE" x="439.42" y="238.76" size="1.778" layer="96"/>
</instance>
<instance part="+3V3" gate="G$1" x="518.16" y="337.82"/>
<instance part="GND5" gate="1" x="518.16" y="325.12"/>
<instance part="GND6" gate="1" x="393.7" y="226.06"/>
<instance part="Q1" gate="G$1" x="297.18" y="213.36" rot="R180"/>
<instance part="GND7" gate="1" x="297.18" y="200.66"/>
<instance part="+3V6" gate="G$1" x="279.4" y="236.22" smashed="yes">
<attribute name="VALUE" x="276.86" y="231.14" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="ALIM" gate="-1" x="292.1" y="152.4" rot="R180"/>
<instance part="ALIM" gate="-2" x="292.1" y="157.48" rot="R180"/>
<instance part="ALIM" gate="-3" x="292.1" y="162.56" rot="R180"/>
<instance part="ALIM" gate="-4" x="292.1" y="167.64" rot="R180"/>
<instance part="P+15" gate="1" x="320.04" y="154.94" smashed="yes">
<attribute name="VALUE" x="317.5" y="157.48" size="1.778" layer="96"/>
</instance>
<instance part="GND44" gate="1" x="309.88" y="157.48" smashed="yes" rot="R90">
<attribute name="VALUE" x="312.42" y="154.94" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P+16" gate="1" x="307.34" y="170.18" smashed="yes">
<attribute name="VALUE" x="304.8" y="170.18" size="1.778" layer="96"/>
</instance>
<instance part="LED3" gate="G$1" x="421.64" y="254" rot="R90"/>
<instance part="LED4" gate="G$1" x="421.64" y="243.84" rot="R90"/>
<instance part="LED2" gate="G$1" x="421.64" y="264.16" rot="R90"/>
<instance part="LED1" gate="G$1" x="421.64" y="274.32" rot="R90"/>
<instance part="GND19" gate="1" x="434.34" y="241.3"/>
<instance part="JA1" gate="G$1" x="457.2" y="152.4"/>
<instance part="JB1" gate="G$1" x="411.48" y="101.6"/>
<instance part="JB2" gate="G$1" x="480.06" y="101.6"/>
<instance part="JC2" gate="G$1" x="480.06" y="45.72"/>
<instance part="C38" gate="G$1" x="375.92" y="200.66"/>
<instance part="C37" gate="G$1" x="383.54" y="203.2"/>
<instance part="C33" gate="G$1" x="406.4" y="210.82"/>
<instance part="C32" gate="G$1" x="414.02" y="213.36"/>
<instance part="C31" gate="G$1" x="421.64" y="215.9"/>
<instance part="C28" gate="G$1" x="378.46" y="233.68"/>
<instance part="C29" gate="G$1" x="408.94" y="233.68"/>
<instance part="C36" gate="G$1" x="391.16" y="205.74"/>
<instance part="C30" gate="G$1" x="429.26" y="218.44"/>
<instance part="C34" gate="G$1" x="289.56" y="208.28"/>
<instance part="C35" gate="G$1" x="304.8" y="208.28"/>
<instance part="R19" gate="G$1" x="279.4" y="228.6" rot="R270"/>
<instance part="R15_Q0" gate="G$1" x="381" y="251.46"/>
<instance part="R16_Q1" gate="G$1" x="388.62" y="248.92"/>
<instance part="R17_Q2" gate="G$1" x="396.24" y="246.38"/>
<instance part="R18_Q3" gate="G$1" x="403.86" y="243.84"/>
<instance part="R21" gate="G$1" x="347.98" y="109.22" rot="R270"/>
<instance part="R23" gate="G$1" x="335.28" y="109.22" rot="R270"/>
<instance part="GND22" gate="1" x="454.66" y="48.26"/>
<instance part="GND23" gate="1" x="365.76" y="104.14"/>
<instance part="GND24" gate="1" x="457.2" y="104.14"/>
<instance part="GND25" gate="1" x="396.24" y="154.94"/>
<instance part="+3V18" gate="G$1" x="505.46" y="58.42"/>
<instance part="+3V21" gate="G$1" x="487.68" y="160.02"/>
<instance part="R24" gate="G$1" x="497.84" y="48.26" smashed="yes">
<attribute name="NAME" x="490.22" y="48.26" size="1.778" layer="95"/>
<attribute name="VALUE" x="495.3" y="44.45" size="1.778" layer="96"/>
</instance>
<instance part="P+1" gate="1" x="513.08" y="58.42"/>
<instance part="P+2" gate="1" x="520.7" y="58.42" smashed="yes">
<attribute name="VALUE" x="518.16" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="R25" gate="G$1" x="505.46" y="45.72" smashed="yes">
<attribute name="NAME" x="510.54" y="45.72" size="1.778" layer="95"/>
<attribute name="VALUE" x="502.92" y="41.91" size="1.778" layer="96"/>
</instance>
<instance part="R20" gate="G$1" x="320.04" y="116.84"/>
<instance part="R22" gate="G$1" x="327.66" y="114.3"/>
<instance part="GND16" gate="1" x="302.26" y="38.1" rot="MR0"/>
<instance part="GND4" gate="1" x="322.58" y="63.5" rot="MR0"/>
<instance part="IC1" gate="G$1" x="325.12" y="40.64" rot="MR0"/>
<instance part="IC1" gate="P" x="327.66" y="73.66" rot="MR0"/>
<instance part="C1" gate="G$1" x="317.5" y="76.2" rot="MR0"/>
<instance part="C3" gate="G$1" x="353.06" y="53.34" smashed="yes" rot="MR0">
<attribute name="NAME" x="354.584" y="50.419" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="354.584" y="55.499" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C6" gate="G$1" x="347.98" y="43.18" smashed="yes" rot="MR0">
<attribute name="NAME" x="349.504" y="40.259" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="349.504" y="45.339" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="C4" gate="G$1" x="299.72" y="50.8" rot="MR0"/>
<instance part="C5" gate="G$1" x="307.34" y="45.72" rot="MR0"/>
<instance part="+3V24" gate="G$1" x="322.58" y="86.36" smashed="yes" rot="MR0">
<attribute name="VALUE" x="325.12" y="86.36" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND8" gate="1" x="307.34" y="22.86"/>
<instance part="IC2" gate="G$1" x="139.7" y="279.4"/>
<instance part="+3V4" gate="G$1" x="119.38" y="322.58"/>
<instance part="+3V7" gate="G$1" x="93.98" y="309.88"/>
<instance part="GND10" gate="1" x="147.32" y="259.08"/>
<instance part="GND11" gate="1" x="119.38" y="309.88"/>
<instance part="C2" gate="G$1" x="167.64" y="276.86"/>
<instance part="C7" gate="G$1" x="119.38" y="317.5"/>
<instance part="C8" gate="G$1" x="175.26" y="266.7"/>
<instance part="C9" gate="G$1" x="185.42" y="289.56"/>
<instance part="D1" gate="G$1" x="167.64" y="312.42" rot="R270"/>
<instance part="R1" gate="G$1" x="93.98" y="302.26" rot="R90"/>
<instance part="L1" gate="G$1" x="147.32" y="320.04"/>
<instance part="H4" gate="G$1" x="180.34" y="43.18" rot="R90"/>
<instance part="H5" gate="G$1" x="187.96" y="43.18" rot="R90"/>
<instance part="FRAME5" gate="G$1" x="0" y="-185.42"/>
<instance part="GP2" gate="-1" x="33.02" y="-43.18"/>
<instance part="GP2" gate="-2" x="33.02" y="-63.5"/>
<instance part="GP2" gate="-3" x="33.02" y="-40.64"/>
<instance part="GP2" gate="-4" x="33.02" y="-91.44"/>
<instance part="GP2" gate="-5" x="33.02" y="-114.3"/>
<instance part="GP2" gate="-6" x="33.02" y="-88.9"/>
<instance part="GP2" gate="-7" x="114.3" y="-43.18"/>
<instance part="GP2" gate="-8" x="114.3" y="-63.5"/>
<instance part="GP2" gate="-9" x="114.3" y="-40.64"/>
<instance part="GP2" gate="-10" x="114.3" y="-91.44"/>
<instance part="GP2" gate="-11" x="114.3" y="-114.3"/>
<instance part="GP2" gate="-12" x="114.3" y="-88.9"/>
<instance part="R2" gate="G$1" x="43.18" y="-109.22" rot="R90"/>
<instance part="R3" gate="G$1" x="124.46" y="-109.22" rot="R90"/>
<instance part="R4" gate="G$1" x="124.46" y="-58.42" rot="R90"/>
<instance part="R5" gate="G$1" x="43.18" y="-58.42" rot="R90"/>
<instance part="R6" gate="G$1" x="43.18" y="-99.06" rot="R90"/>
<instance part="R7" gate="G$1" x="124.46" y="-99.06" rot="R90"/>
<instance part="R8" gate="G$1" x="124.46" y="-48.26" rot="R90"/>
<instance part="R9" gate="G$1" x="43.18" y="-48.26" rot="R90"/>
<instance part="P+3" gate="1" x="68.58" y="-33.02"/>
<instance part="P+4" gate="1" x="147.32" y="-33.02"/>
<instance part="P+5" gate="1" x="147.32" y="-81.28"/>
<instance part="P+6" gate="1" x="68.58" y="-81.28"/>
<instance part="GND12" gate="1" x="43.18" y="-116.84"/>
<instance part="GND13" gate="1" x="124.46" y="-116.84"/>
<instance part="GND14" gate="1" x="124.46" y="-66.04"/>
<instance part="GND15" gate="1" x="43.18" y="-66.04"/>
<instance part="C10" gate="G$1" x="68.58" y="-43.18"/>
<instance part="C11" gate="G$1" x="68.58" y="-91.44"/>
<instance part="C12" gate="G$1" x="147.32" y="-91.44"/>
<instance part="C13" gate="G$1" x="147.32" y="-43.18"/>
<instance part="GND9" gate="1" x="340.36" y="101.6"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<wire x1="78.74" y1="170.18" x2="101.6" y2="170.18" width="0.1524" layer="91"/>
<label x="88.9" y="170.18" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="78.74" y1="154.94" x2="101.6" y2="154.94" width="0.1524" layer="91"/>
<label x="88.9" y="154.94" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="78.74" y1="149.86" x2="101.6" y2="149.86" width="0.1524" layer="91"/>
<label x="88.9" y="149.86" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-9" pin="S"/>
</segment>
<segment>
<wire x1="78.74" y1="144.78" x2="101.6" y2="144.78" width="0.1524" layer="91"/>
<label x="88.9" y="144.78" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-11" pin="S"/>
</segment>
<segment>
<wire x1="429.26" y1="213.36" x2="429.26" y2="195.58" width="0.1524" layer="91"/>
<wire x1="429.26" y1="195.58" x2="421.64" y2="195.58" width="0.1524" layer="91"/>
<wire x1="421.64" y1="195.58" x2="414.02" y2="195.58" width="0.1524" layer="91"/>
<wire x1="414.02" y1="195.58" x2="406.4" y2="195.58" width="0.1524" layer="91"/>
<wire x1="406.4" y1="195.58" x2="403.86" y2="195.58" width="0.1524" layer="91"/>
<wire x1="403.86" y1="195.58" x2="391.16" y2="195.58" width="0.1524" layer="91"/>
<wire x1="391.16" y1="195.58" x2="383.54" y2="195.58" width="0.1524" layer="91"/>
<wire x1="383.54" y1="195.58" x2="375.92" y2="195.58" width="0.1524" layer="91"/>
<wire x1="414.02" y1="208.28" x2="414.02" y2="195.58" width="0.1524" layer="91"/>
<wire x1="406.4" y1="205.74" x2="406.4" y2="195.58" width="0.1524" layer="91"/>
<wire x1="391.16" y1="200.66" x2="391.16" y2="195.58" width="0.1524" layer="91"/>
<wire x1="383.54" y1="198.12" x2="383.54" y2="195.58" width="0.1524" layer="91"/>
<wire x1="421.64" y1="210.82" x2="421.64" y2="195.58" width="0.1524" layer="91"/>
<junction x="383.54" y="195.58"/>
<junction x="421.64" y="195.58"/>
<junction x="414.02" y="195.58"/>
<junction x="406.4" y="195.58"/>
<junction x="391.16" y="195.58"/>
<junction x="403.86" y="195.58"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="C38" gate="G$1" pin="2"/>
<pinref part="C37" gate="G$1" pin="2"/>
<pinref part="C33" gate="G$1" pin="2"/>
<pinref part="C32" gate="G$1" pin="2"/>
<pinref part="C31" gate="G$1" pin="2"/>
<pinref part="C36" gate="G$1" pin="2"/>
<pinref part="C30" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="327.66" y1="195.58" x2="330.2" y2="195.58" width="0.1524" layer="91"/>
<wire x1="330.2" y1="195.58" x2="332.74" y2="195.58" width="0.1524" layer="91"/>
<wire x1="332.74" y1="195.58" x2="335.28" y2="195.58" width="0.1524" layer="91"/>
<wire x1="335.28" y1="195.58" x2="337.82" y2="195.58" width="0.1524" layer="91"/>
<wire x1="337.82" y1="195.58" x2="340.36" y2="195.58" width="0.1524" layer="91"/>
<wire x1="340.36" y1="195.58" x2="342.9" y2="195.58" width="0.1524" layer="91"/>
<wire x1="342.9" y1="195.58" x2="345.44" y2="195.58" width="0.1524" layer="91"/>
<wire x1="345.44" y1="195.58" x2="347.98" y2="195.58" width="0.1524" layer="91"/>
<wire x1="347.98" y1="195.58" x2="350.52" y2="195.58" width="0.1524" layer="91"/>
<junction x="330.2" y="195.58"/>
<junction x="335.28" y="195.58"/>
<junction x="332.74" y="195.58"/>
<junction x="337.82" y="195.58"/>
<junction x="340.36" y="195.58"/>
<junction x="342.9" y="195.58"/>
<junction x="345.44" y="195.58"/>
<junction x="347.98" y="195.58"/>
<pinref part="IC5" gate="G$1" pin="GND@10"/>
<pinref part="IC5" gate="G$1" pin="GND@1"/>
<pinref part="IC5" gate="G$1" pin="GND@9"/>
<pinref part="IC5" gate="G$1" pin="GND@7"/>
<pinref part="IC5" gate="G$1" pin="GND@8"/>
<pinref part="IC5" gate="G$1" pin="GND@6"/>
<pinref part="IC5" gate="G$1" pin="GND@5"/>
<pinref part="IC5" gate="G$1" pin="GND@4"/>
<pinref part="IC5" gate="G$1" pin="GND@3"/>
<pinref part="IC5" gate="G$1" pin="GND@2"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="393.7" y1="228.6" x2="378.46" y2="228.6" width="0.1524" layer="91"/>
<wire x1="408.94" y1="228.6" x2="393.7" y2="228.6" width="0.1524" layer="91"/>
<junction x="393.7" y="228.6"/>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="C28" gate="G$1" pin="2"/>
<pinref part="C29" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="157.48" y1="40.64" x2="157.48" y2="38.1" width="0.1524" layer="91"/>
<wire x1="157.48" y1="38.1" x2="165.1" y2="38.1" width="0.1524" layer="91"/>
<wire x1="165.1" y1="38.1" x2="172.72" y2="38.1" width="0.1524" layer="91"/>
<wire x1="172.72" y1="38.1" x2="172.72" y2="40.64" width="0.1524" layer="91"/>
<wire x1="165.1" y1="40.64" x2="165.1" y2="38.1" width="0.1524" layer="91"/>
<junction x="165.1" y="38.1"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
<pinref part="GND3" gate="1" pin="GND"/>
<junction x="172.72" y="38.1"/>
<pinref part="H4" gate="G$1" pin="MOUNT"/>
<wire x1="172.72" y1="38.1" x2="180.34" y2="38.1" width="0.1524" layer="91"/>
<wire x1="180.34" y1="38.1" x2="180.34" y2="40.64" width="0.1524" layer="91"/>
<pinref part="H5" gate="G$1" pin="MOUNT"/>
<wire x1="180.34" y1="38.1" x2="187.96" y2="38.1" width="0.1524" layer="91"/>
<wire x1="187.96" y1="38.1" x2="187.96" y2="40.64" width="0.1524" layer="91"/>
<junction x="180.34" y="38.1"/>
</segment>
<segment>
<wire x1="304.8" y1="203.2" x2="297.18" y2="203.2" width="0.1524" layer="91"/>
<wire x1="297.18" y1="203.2" x2="289.56" y2="203.2" width="0.1524" layer="91"/>
<junction x="297.18" y="203.2"/>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="C34" gate="G$1" pin="2"/>
<pinref part="C35" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="513.08" y1="327.66" x2="518.16" y2="327.66" width="0.1524" layer="91"/>
<pinref part="PDI_UC" gate="1" pin="GND"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="307.34" y1="157.48" x2="294.64" y2="157.48" width="0.1524" layer="91"/>
<pinref part="ALIM" gate="-2" pin="S"/>
<pinref part="GND44" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="73.66" y1="119.38" x2="96.52" y2="119.38" width="0.1524" layer="91"/>
<label x="83.82" y="119.38" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="104.14" x2="96.52" y2="104.14" width="0.1524" layer="91"/>
<label x="83.82" y="104.14" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="99.06" x2="96.52" y2="99.06" width="0.1524" layer="91"/>
<label x="83.82" y="99.06" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-9" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="93.98" x2="96.52" y2="93.98" width="0.1524" layer="91"/>
<label x="83.82" y="93.98" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-11" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="66.04" x2="93.98" y2="66.04" width="0.1524" layer="91"/>
<label x="81.28" y="66.04" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="50.8" x2="93.98" y2="50.8" width="0.1524" layer="91"/>
<label x="81.28" y="50.8" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="45.72" x2="93.98" y2="45.72" width="0.1524" layer="91"/>
<label x="81.28" y="45.72" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-9" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="40.64" x2="93.98" y2="40.64" width="0.1524" layer="91"/>
<label x="81.28" y="40.64" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-11" pin="S"/>
</segment>
<segment>
<wire x1="426.72" y1="243.84" x2="434.34" y2="243.84" width="0.1524" layer="91"/>
<wire x1="434.34" y1="243.84" x2="434.34" y2="254" width="0.1524" layer="91"/>
<wire x1="434.34" y1="254" x2="434.34" y2="264.16" width="0.1524" layer="91"/>
<wire x1="434.34" y1="264.16" x2="434.34" y2="274.32" width="0.1524" layer="91"/>
<wire x1="434.34" y1="274.32" x2="426.72" y2="274.32" width="0.1524" layer="91"/>
<wire x1="426.72" y1="264.16" x2="434.34" y2="264.16" width="0.1524" layer="91"/>
<wire x1="426.72" y1="254" x2="434.34" y2="254" width="0.1524" layer="91"/>
<junction x="434.34" y="254"/>
<junction x="434.34" y="264.16"/>
<junction x="434.34" y="243.84"/>
<pinref part="LED4" gate="G$1" pin="C"/>
<pinref part="GND19" gate="1" pin="GND"/>
<pinref part="LED1" gate="G$1" pin="C"/>
<pinref part="LED2" gate="G$1" pin="C"/>
<pinref part="LED3" gate="G$1" pin="C"/>
</segment>
<segment>
<wire x1="297.18" y1="121.92" x2="299.72" y2="121.92" width="0.1524" layer="91"/>
<wire x1="299.72" y1="121.92" x2="299.72" y2="111.76" width="0.1524" layer="91"/>
<wire x1="299.72" y1="111.76" x2="297.18" y2="111.76" width="0.1524" layer="91"/>
<wire x1="299.72" y1="111.76" x2="299.72" y2="104.14" width="0.1524" layer="91"/>
<junction x="299.72" y="111.76"/>
<pinref part="GND28" gate="1" pin="GND"/>
<pinref part="UART_I2C" gate="-2" pin="S"/>
<pinref part="UART_I2C" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="449.58" y1="157.48" x2="396.24" y2="157.48" width="0.1524" layer="91"/>
<pinref part="JA1" gate="G$1" pin="1"/>
<pinref part="GND25" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="472.44" y1="106.68" x2="457.2" y2="106.68" width="0.1524" layer="91"/>
<pinref part="JB2" gate="G$1" pin="1"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="403.86" y1="106.68" x2="365.76" y2="106.68" width="0.1524" layer="91"/>
<pinref part="JB1" gate="G$1" pin="1"/>
<pinref part="GND23" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="472.44" y1="50.8" x2="454.66" y2="50.8" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="1"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="307.34" y1="40.64" x2="302.26" y2="40.64" width="0.1524" layer="91"/>
<wire x1="302.26" y1="40.64" x2="299.72" y2="40.64" width="0.1524" layer="91"/>
<wire x1="299.72" y1="40.64" x2="299.72" y2="45.72" width="0.1524" layer="91"/>
<junction x="302.26" y="40.64"/>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="327.66" y1="66.04" x2="322.58" y2="66.04" width="0.1524" layer="91"/>
<wire x1="322.58" y1="66.04" x2="317.5" y2="66.04" width="0.1524" layer="91"/>
<wire x1="317.5" y1="66.04" x2="317.5" y2="71.12" width="0.1524" layer="91"/>
<junction x="322.58" y="66.04"/>
<pinref part="IC1" gate="P" pin="GND"/>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="307.34" y1="25.4" x2="309.88" y2="25.4" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="R2IN"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PSS"/>
<wire x1="134.62" y1="266.7" x2="134.62" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="AVSS"/>
<wire x1="134.62" y1="261.62" x2="139.7" y2="261.62" width="0.1524" layer="91"/>
<wire x1="139.7" y1="261.62" x2="144.78" y2="261.62" width="0.1524" layer="91"/>
<wire x1="144.78" y1="261.62" x2="147.32" y2="261.62" width="0.1524" layer="91"/>
<wire x1="147.32" y1="261.62" x2="149.86" y2="261.62" width="0.1524" layer="91"/>
<wire x1="149.86" y1="261.62" x2="152.4" y2="261.62" width="0.1524" layer="91"/>
<wire x1="152.4" y1="261.62" x2="157.48" y2="261.62" width="0.1524" layer="91"/>
<wire x1="157.48" y1="261.62" x2="157.48" y2="266.7" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="RSVD@1"/>
<wire x1="147.32" y1="266.7" x2="147.32" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="RSVD@0"/>
<wire x1="144.78" y1="266.7" x2="144.78" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="DVSS"/>
<wire x1="139.7" y1="266.7" x2="139.7" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="RSVD@2"/>
<wire x1="149.86" y1="266.7" x2="149.86" y2="261.62" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="RSVD@3"/>
<wire x1="152.4" y1="266.7" x2="152.4" y2="261.62" width="0.1524" layer="91"/>
<junction x="139.7" y="261.62"/>
<junction x="144.78" y="261.62"/>
<pinref part="GND10" gate="1" pin="GND"/>
<junction x="147.32" y="261.62"/>
<junction x="149.86" y="261.62"/>
<junction x="152.4" y="261.62"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="157.48" y1="261.62" x2="167.64" y2="261.62" width="0.1524" layer="91"/>
<wire x1="167.64" y1="261.62" x2="167.64" y2="271.78" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="167.64" y1="261.62" x2="175.26" y2="261.62" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="185.42" y1="284.48" x2="185.42" y2="261.62" width="0.1524" layer="91"/>
<wire x1="185.42" y1="261.62" x2="175.26" y2="261.62" width="0.1524" layer="91"/>
<junction x="175.26" y="261.62"/>
<junction x="167.64" y="261.62"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="38.1" y1="-114.3" x2="43.18" y2="-114.3" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-96.52" x2="68.58" y2="-114.3" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-114.3" x2="43.18" y2="-114.3" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
<junction x="43.18" y="-114.3"/>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="GP2" gate="-5" pin="S"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="119.38" y1="-114.3" x2="124.46" y2="-114.3" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-96.52" x2="147.32" y2="-114.3" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-114.3" x2="124.46" y2="-114.3" width="0.1524" layer="91"/>
<pinref part="GND13" gate="1" pin="GND"/>
<junction x="124.46" y="-114.3"/>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="GP2" gate="-11" pin="S"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="119.38" y1="-63.5" x2="124.46" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-48.26" x2="147.32" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="147.32" y1="-63.5" x2="124.46" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
<junction x="124.46" y="-63.5"/>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="GP2" gate="-8" pin="S"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="68.58" y1="-48.26" x2="68.58" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-63.5" x2="43.18" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="GND15" gate="1" pin="GND"/>
<junction x="43.18" y="-63.5"/>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GP2" gate="-2" pin="S"/>
<wire x1="38.1" y1="-63.5" x2="43.18" y2="-63.5" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="347.98" y1="104.14" x2="340.36" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="2"/>
<pinref part="R23" gate="G$1" pin="2"/>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="340.36" y1="104.14" x2="335.28" y2="104.14" width="0.1524" layer="91"/>
<junction x="340.36" y="104.14"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<wire x1="370.84" y1="226.06" x2="370.84" y2="228.6" width="0.1524" layer="91"/>
<wire x1="370.84" y1="223.52" x2="370.84" y2="226.06" width="0.1524" layer="91"/>
<wire x1="370.84" y1="220.98" x2="370.84" y2="223.52" width="0.1524" layer="91"/>
<wire x1="370.84" y1="218.44" x2="370.84" y2="220.98" width="0.1524" layer="91"/>
<wire x1="370.84" y1="215.9" x2="370.84" y2="218.44" width="0.1524" layer="91"/>
<wire x1="370.84" y1="213.36" x2="370.84" y2="215.9" width="0.1524" layer="91"/>
<wire x1="370.84" y1="210.82" x2="370.84" y2="213.36" width="0.1524" layer="91"/>
<wire x1="370.84" y1="228.6" x2="375.92" y2="228.6" width="0.1524" layer="91"/>
<wire x1="375.92" y1="228.6" x2="375.92" y2="220.98" width="0.1524" layer="91"/>
<wire x1="375.92" y1="220.98" x2="383.54" y2="220.98" width="0.1524" layer="91"/>
<wire x1="383.54" y1="220.98" x2="391.16" y2="220.98" width="0.1524" layer="91"/>
<wire x1="391.16" y1="220.98" x2="406.4" y2="220.98" width="0.1524" layer="91"/>
<wire x1="406.4" y1="220.98" x2="414.02" y2="220.98" width="0.1524" layer="91"/>
<wire x1="414.02" y1="220.98" x2="421.64" y2="220.98" width="0.1524" layer="91"/>
<wire x1="421.64" y1="220.98" x2="421.64" y2="218.44" width="0.1524" layer="91"/>
<wire x1="421.64" y1="220.98" x2="429.26" y2="220.98" width="0.1524" layer="91"/>
<wire x1="429.26" y1="220.98" x2="441.96" y2="220.98" width="0.1524" layer="91"/>
<wire x1="375.92" y1="203.2" x2="375.92" y2="220.98" width="0.1524" layer="91"/>
<wire x1="383.54" y1="205.74" x2="383.54" y2="220.98" width="0.1524" layer="91"/>
<wire x1="391.16" y1="208.28" x2="391.16" y2="220.98" width="0.1524" layer="91"/>
<wire x1="406.4" y1="213.36" x2="406.4" y2="220.98" width="0.1524" layer="91"/>
<wire x1="414.02" y1="215.9" x2="414.02" y2="220.98" width="0.1524" layer="91"/>
<junction x="370.84" y="226.06"/>
<junction x="370.84" y="223.52"/>
<junction x="370.84" y="220.98"/>
<junction x="370.84" y="218.44"/>
<junction x="370.84" y="215.9"/>
<junction x="370.84" y="213.36"/>
<junction x="375.92" y="220.98"/>
<junction x="383.54" y="220.98"/>
<junction x="391.16" y="220.98"/>
<junction x="406.4" y="220.98"/>
<junction x="414.02" y="220.98"/>
<junction x="421.64" y="220.98"/>
<junction x="429.26" y="220.98"/>
<junction x="370.84" y="228.6"/>
<pinref part="IC5" gate="G$1" pin="VCC@1"/>
<pinref part="IC5" gate="G$1" pin="VCC@2"/>
<pinref part="IC5" gate="G$1" pin="VCC@3"/>
<pinref part="IC5" gate="G$1" pin="VCC@4"/>
<pinref part="IC5" gate="G$1" pin="VCC@5"/>
<pinref part="IC5" gate="G$1" pin="VCC@6"/>
<pinref part="IC5" gate="G$1" pin="VCC@7"/>
<pinref part="IC5" gate="G$1" pin="VCC@8"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<pinref part="C38" gate="G$1" pin="1"/>
<pinref part="C37" gate="G$1" pin="1"/>
<pinref part="C33" gate="G$1" pin="1"/>
<pinref part="C32" gate="G$1" pin="1"/>
<pinref part="C31" gate="G$1" pin="1"/>
<pinref part="C36" gate="G$1" pin="1"/>
<pinref part="C30" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="297.18" y1="119.38" x2="302.26" y2="119.38" width="0.1524" layer="91"/>
<wire x1="302.26" y1="134.62" x2="302.26" y2="119.38" width="0.1524" layer="91"/>
<wire x1="297.18" y1="109.22" x2="302.26" y2="109.22" width="0.1524" layer="91"/>
<wire x1="302.26" y1="109.22" x2="302.26" y2="119.38" width="0.1524" layer="91"/>
<junction x="302.26" y="119.38"/>
<pinref part="+3V12" gate="G$1" pin="+3V3"/>
<pinref part="UART_I2C" gate="-1" pin="S"/>
<pinref part="UART_I2C" gate="-5" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="236.22" x2="370.84" y2="233.68" width="0.1524" layer="91"/>
<wire x1="370.84" y1="236.22" x2="378.46" y2="236.22" width="0.1524" layer="91"/>
<wire x1="378.46" y1="236.22" x2="408.94" y2="236.22" width="0.1524" layer="91"/>
<wire x1="408.94" y1="236.22" x2="441.96" y2="236.22" width="0.1524" layer="91"/>
<junction x="370.84" y="236.22"/>
<junction x="378.46" y="236.22"/>
<junction x="408.94" y="236.22"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<pinref part="IC5" gate="G$1" pin="AVCC-A"/>
<pinref part="IC5" gate="G$1" pin="AVCC-B"/>
<pinref part="C28" gate="G$1" pin="1"/>
<pinref part="C29" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="513.08" y1="332.74" x2="518.16" y2="332.74" width="0.1524" layer="91"/>
<wire x1="518.16" y1="332.74" x2="518.16" y2="335.28" width="0.1524" layer="91"/>
<pinref part="PDI_UC" gate="1" pin="VCC"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="78.74" y1="160.02" x2="101.6" y2="160.02" width="0.1524" layer="91"/>
<label x="88.9" y="160.02" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-5" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="109.22" x2="96.52" y2="109.22" width="0.1524" layer="91"/>
<label x="83.82" y="109.22" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-5" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="55.88" x2="93.98" y2="55.88" width="0.1524" layer="91"/>
<label x="81.28" y="55.88" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-5" pin="S"/>
</segment>
<segment>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<pinref part="R19" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="307.34" y1="162.56" x2="294.64" y2="162.56" width="0.1524" layer="91"/>
<label x="297.18" y="162.56" size="1.778" layer="95"/>
<pinref part="ALIM" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="505.46" y1="55.88" x2="505.46" y2="50.8" width="0.1524" layer="91"/>
<wire x1="505.46" y1="50.8" x2="487.68" y2="50.8" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="2"/>
<pinref part="+3V18" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="487.68" y1="157.48" x2="464.82" y2="157.48" width="0.1524" layer="91"/>
<pinref part="JA1" gate="G$1" pin="2"/>
<pinref part="+3V21" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="322.58" y1="83.82" x2="322.58" y2="81.28" width="0.1524" layer="91"/>
<wire x1="317.5" y1="78.74" x2="317.5" y2="81.28" width="0.1524" layer="91"/>
<wire x1="317.5" y1="81.28" x2="322.58" y2="81.28" width="0.1524" layer="91"/>
<wire x1="322.58" y1="81.28" x2="327.66" y2="81.28" width="0.1524" layer="91"/>
<junction x="322.58" y="81.28"/>
<pinref part="+3V24" gate="G$1" pin="+3V3"/>
<pinref part="C1" gate="G$1" pin="1"/>
<pinref part="IC1" gate="P" pin="VCC"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="PDD"/>
<wire x1="119.38" y1="320.04" x2="142.24" y2="320.04" width="0.1524" layer="91"/>
<wire x1="142.24" y1="320.04" x2="142.24" y2="304.8" width="0.1524" layer="91"/>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<junction x="119.38" y="320.04"/>
<pinref part="L1" gate="G$1" pin="1"/>
<junction x="142.24" y="320.04"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="+3V7" gate="G$1" pin="+3V3"/>
</segment>
</net>
<net name="SDA_3V3" class="0">
<segment>
<wire x1="284.48" y1="254" x2="307.34" y2="254" width="0.1524" layer="91"/>
<label x="284.48" y="254" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE0(OC0A/SDA)"/>
</segment>
<segment>
<wire x1="297.18" y1="127" x2="317.5" y2="127" width="0.1524" layer="91"/>
<label x="304.8" y="127" size="1.778" layer="95"/>
<pinref part="UART_I2C" gate="-8" pin="S"/>
</segment>
</net>
<net name="SCL_3V3" class="0">
<segment>
<wire x1="297.18" y1="124.46" x2="317.5" y2="124.46" width="0.1524" layer="91"/>
<label x="304.8" y="124.46" size="1.778" layer="95"/>
<pinref part="UART_I2C" gate="-7" pin="S"/>
</segment>
<segment>
<wire x1="284.48" y1="251.46" x2="307.34" y2="251.46" width="0.1524" layer="91"/>
<label x="284.48" y="251.46" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE1(OC0B/XCK0/SCL)"/>
</segment>
</net>
<net name="RX_3V3" class="0">
<segment>
<wire x1="325.12" y1="116.84" x2="347.98" y2="116.84" width="0.1524" layer="91"/>
<wire x1="347.98" y1="116.84" x2="347.98" y2="114.3" width="0.1524" layer="91"/>
<label x="335.28" y="116.84" size="1.778" layer="95"/>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="R20" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="284.48" y1="248.92" x2="307.34" y2="248.92" width="0.1524" layer="91"/>
<label x="284.48" y="248.92" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE2(OC0C/RXD0)"/>
</segment>
<segment>
<wire x1="340.36" y1="27.94" x2="360.68" y2="27.94" width="0.1524" layer="91"/>
<label x="360.68" y="27.94" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1OUT"/>
</segment>
</net>
<net name="TX_3V3" class="0">
<segment>
<wire x1="332.74" y1="114.3" x2="335.28" y2="114.3" width="0.1524" layer="91"/>
<label x="335.28" y="114.3" size="1.778" layer="95"/>
<pinref part="R23" gate="G$1" pin="1"/>
<pinref part="R22" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="284.48" y1="246.38" x2="307.34" y2="246.38" width="0.1524" layer="91"/>
<label x="284.48" y="246.38" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE3(OC0D/TXD0)"/>
</segment>
<segment>
<wire x1="340.36" y1="33.02" x2="360.68" y2="33.02" width="0.1524" layer="91"/>
<wire x1="340.36" y1="30.48" x2="340.36" y2="33.02" width="0.1524" layer="91"/>
<junction x="340.36" y="33.02"/>
<label x="360.68" y="33.02" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1IN"/>
<pinref part="IC1" gate="G$1" pin="T2IN"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="307.34" y1="218.44" x2="289.56" y2="218.44" width="0.1524" layer="91"/>
<wire x1="289.56" y1="218.44" x2="289.56" y2="213.36" width="0.1524" layer="91"/>
<wire x1="289.56" y1="213.36" x2="289.56" y2="210.82" width="0.1524" layer="91"/>
<wire x1="294.64" y1="213.36" x2="289.56" y2="213.36" width="0.1524" layer="91"/>
<junction x="289.56" y="213.36"/>
<pinref part="IC5" gate="G$1" pin="PR0(XTAL2)"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<pinref part="C34" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="299.72" y1="213.36" x2="304.8" y2="213.36" width="0.1524" layer="91"/>
<wire x1="304.8" y1="213.36" x2="307.34" y2="213.36" width="0.1524" layer="91"/>
<wire x1="304.8" y1="213.36" x2="304.8" y2="210.82" width="0.1524" layer="91"/>
<junction x="304.8" y="213.36"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<pinref part="IC5" gate="G$1" pin="PR1(XTAL1)"/>
<pinref part="C35" gate="G$1" pin="1"/>
</segment>
</net>
<net name="/RESET_3V3" class="0">
<segment>
<wire x1="307.34" y1="223.52" x2="279.4" y2="223.52" width="0.1524" layer="91"/>
<label x="287.02" y="223.52" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PDI-CLK/!RESET"/>
<pinref part="R19" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="487.68" y1="327.66" x2="459.74" y2="327.66" width="0.1524" layer="91"/>
<label x="459.74" y="327.66" size="1.778" layer="95"/>
<pinref part="PDI_UC" gate="1" pin="CLK"/>
</segment>
</net>
<net name="PDI_DATA_3V3" class="0">
<segment>
<wire x1="307.34" y1="228.6" x2="287.02" y2="228.6" width="0.1524" layer="91"/>
<label x="287.02" y="228.6" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PDI-DATA"/>
</segment>
<segment>
<wire x1="487.68" y1="332.74" x2="459.74" y2="332.74" width="0.1524" layer="91"/>
<label x="459.74" y="332.74" size="1.778" layer="95"/>
<pinref part="PDI_UC" gate="1" pin="DATA"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<wire x1="294.64" y1="167.64" x2="307.34" y2="167.64" width="0.1524" layer="91"/>
<pinref part="ALIM" gate="-4" pin="S"/>
<pinref part="P+16" gate="1" pin="+5V"/>
</segment>
<segment>
<wire x1="78.74" y1="157.48" x2="101.6" y2="157.48" width="0.1524" layer="91"/>
<label x="88.9" y="157.48" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="78.74" y1="142.24" x2="101.6" y2="142.24" width="0.1524" layer="91"/>
<label x="88.9" y="142.24" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-12" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="106.68" x2="96.52" y2="106.68" width="0.1524" layer="91"/>
<label x="83.82" y="106.68" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="91.44" x2="96.52" y2="91.44" width="0.1524" layer="91"/>
<label x="83.82" y="91.44" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-12" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="53.34" x2="93.98" y2="53.34" width="0.1524" layer="91"/>
<label x="81.28" y="53.34" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-6" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="38.1" x2="93.98" y2="38.1" width="0.1524" layer="91"/>
<label x="81.28" y="38.1" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-12" pin="S"/>
</segment>
<segment>
<wire x1="502.92" y1="48.26" x2="513.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="513.08" y1="48.26" x2="513.08" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="2"/>
<pinref part="P+1" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="GP2" gate="-6" pin="S"/>
<wire x1="38.1" y1="-88.9" x2="68.58" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="P+6" gate="1" pin="+5V"/>
<wire x1="68.58" y1="-88.9" x2="68.58" y2="-83.82" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="1"/>
<junction x="68.58" y="-88.9"/>
</segment>
<segment>
<pinref part="GP2" gate="-12" pin="S"/>
<wire x1="119.38" y1="-88.9" x2="147.32" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="P+5" gate="1" pin="+5V"/>
<wire x1="147.32" y1="-88.9" x2="147.32" y2="-83.82" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<junction x="147.32" y="-88.9"/>
</segment>
<segment>
<pinref part="GP2" gate="-9" pin="S"/>
<wire x1="119.38" y1="-40.64" x2="147.32" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<wire x1="147.32" y1="-40.64" x2="147.32" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<junction x="147.32" y="-40.64"/>
</segment>
<segment>
<pinref part="P+3" gate="1" pin="+5V"/>
<wire x1="68.58" y1="-40.64" x2="68.58" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="GP2" gate="-3" pin="S"/>
<wire x1="38.1" y1="-40.64" x2="68.58" y2="-40.64" width="0.1524" layer="91"/>
<junction x="68.58" y="-40.64"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<wire x1="320.04" y1="152.4" x2="294.64" y2="152.4" width="0.1524" layer="91"/>
<pinref part="P+15" gate="1" pin="+12V"/>
<pinref part="ALIM" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="520.7" y1="55.88" x2="520.7" y2="45.72" width="0.1524" layer="91"/>
<wire x1="520.7" y1="45.72" x2="510.54" y2="45.72" width="0.1524" layer="91"/>
<pinref part="P+2" gate="1" pin="+12V"/>
<pinref part="R25" gate="G$1" pin="2"/>
</segment>
</net>
<net name="PWM_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="167.64" x2="101.6" y2="167.64" width="0.1524" layer="91"/>
<label x="86.36" y="167.64" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-2" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="353.06" x2="388.62" y2="353.06" width="0.1524" layer="91"/>
<label x="373.38" y="353.06" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF0(OC0A/SDA)"/>
</segment>
<segment>
<wire x1="487.68" y1="101.6" x2="505.46" y2="101.6" width="0.1524" layer="91"/>
<label x="490.22" y="101.6" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="6"/>
</segment>
</net>
<net name="DIRECTION_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="165.1" x2="101.6" y2="165.1" width="0.1524" layer="91"/>
<label x="86.36" y="165.1" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="345.44" x2="388.62" y2="345.44" width="0.1524" layer="91"/>
<label x="373.38" y="345.44" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF3(OC0D/TXD0)"/>
</segment>
<segment>
<wire x1="411.48" y1="149.86" x2="449.58" y2="149.86" width="0.1524" layer="91"/>
<label x="414.02" y="149.86" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="7"/>
</segment>
</net>
<net name="BRAKE_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="162.56" x2="101.6" y2="162.56" width="0.1524" layer="91"/>
<label x="86.36" y="162.56" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-4" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="337.82" x2="388.62" y2="337.82" width="0.1524" layer="91"/>
<label x="373.38" y="337.82" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF6(RXD1/MISO)"/>
</segment>
<segment>
<wire x1="411.48" y1="142.24" x2="449.58" y2="142.24" width="0.1524" layer="91"/>
<label x="414.02" y="142.24" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="13"/>
</segment>
</net>
<net name="ENCODER_A_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="152.4" x2="101.6" y2="152.4" width="0.1524" layer="91"/>
<label x="86.36" y="152.4" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-8" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="302.26" x2="307.34" y2="302.26" width="0.1524" layer="91"/>
<label x="276.86" y="302.26" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC1(OC0B/XCK0/SCL)"/>
</segment>
<segment>
<wire x1="373.38" y1="96.52" x2="403.86" y2="96.52" width="0.1524" layer="91"/>
<label x="373.38" y="96.52" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="9"/>
</segment>
</net>
<net name="ENCODER_B_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="147.32" x2="101.6" y2="147.32" width="0.1524" layer="91"/>
<label x="86.36" y="147.32" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-10" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="304.8" x2="307.34" y2="304.8" width="0.1524" layer="91"/>
<label x="276.86" y="304.8" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC0(OC0A/SDA)"/>
</segment>
<segment>
<wire x1="419.1" y1="96.52" x2="449.58" y2="96.52" width="0.1524" layer="91"/>
<label x="421.64" y="96.52" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="10"/>
</segment>
</net>
<net name="/CS_MOT0_3V3" class="0">
<segment>
<wire x1="78.74" y1="132.08" x2="101.6" y2="132.08" width="0.1524" layer="91"/>
<label x="86.36" y="132.08" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-16" pin="S"/>
</segment>
<segment>
<wire x1="284.48" y1="243.84" x2="307.34" y2="243.84" width="0.1524" layer="91"/>
<label x="284.48" y="243.84" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE4(OC1A/!SS!)"/>
</segment>
</net>
<net name="PWM_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="63.5" x2="93.98" y2="63.5" width="0.1524" layer="91"/>
<label x="78.74" y="63.5" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-2" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="347.98" x2="388.62" y2="347.98" width="0.1524" layer="91"/>
<label x="373.38" y="347.98" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF2(OC0C/RXD0)"/>
</segment>
<segment>
<wire x1="411.48" y1="152.4" x2="449.58" y2="152.4" width="0.1524" layer="91"/>
<label x="414.02" y="152.4" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="5"/>
</segment>
</net>
<net name="DIRECTION_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="60.96" x2="93.98" y2="60.96" width="0.1524" layer="91"/>
<label x="78.74" y="60.96" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="340.36" x2="388.62" y2="340.36" width="0.1524" layer="91"/>
<label x="373.38" y="340.36" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF5(OC1B/XCK1/MOSI)"/>
</segment>
<segment>
<wire x1="411.48" y1="144.78" x2="449.58" y2="144.78" width="0.1524" layer="91"/>
<label x="414.02" y="144.78" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="11"/>
</segment>
</net>
<net name="BRAKE_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="58.42" x2="93.98" y2="58.42" width="0.1524" layer="91"/>
<label x="78.74" y="58.42" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-4" pin="S"/>
</segment>
<segment>
<wire x1="279.4" y1="340.36" x2="307.34" y2="340.36" width="0.1524" layer="91"/>
<label x="279.4" y="340.36" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA6(ADCA6)"/>
</segment>
<segment>
<wire x1="431.8" y1="93.98" x2="419.1" y2="93.98" width="0.1524" layer="91"/>
<label x="421.64" y="93.98" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="12"/>
</segment>
</net>
<net name="ENCODER_A_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="48.26" x2="93.98" y2="48.26" width="0.1524" layer="91"/>
<label x="78.74" y="48.26" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-8" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="292.1" x2="307.34" y2="292.1" width="0.1524" layer="91"/>
<label x="276.86" y="292.1" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC5(OC1B/MOSI/XCK1)"/>
</segment>
<segment>
<wire x1="373.38" y1="101.6" x2="403.86" y2="101.6" width="0.1524" layer="91"/>
<label x="373.38" y="101.6" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="5"/>
</segment>
</net>
<net name="ENCODER_B_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="43.18" x2="93.98" y2="43.18" width="0.1524" layer="91"/>
<label x="78.74" y="43.18" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-10" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="294.64" x2="307.34" y2="294.64" width="0.1524" layer="91"/>
<label x="276.86" y="294.64" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC4(OC1A/!SS!)"/>
</segment>
<segment>
<wire x1="419.1" y1="101.6" x2="449.58" y2="101.6" width="0.1524" layer="91"/>
<label x="421.64" y="101.6" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="6"/>
</segment>
</net>
<net name="/CS_MOT2_3V3" class="0">
<segment>
<wire x1="73.66" y1="27.94" x2="93.98" y2="27.94" width="0.1524" layer="91"/>
<label x="78.74" y="27.94" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-16" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="289.56" x2="307.34" y2="289.56" width="0.1524" layer="91"/>
<label x="276.86" y="289.56" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC6(MISO/RXD1)"/>
</segment>
<segment>
<wire x1="419.1" y1="104.14" x2="449.58" y2="104.14" width="0.1524" layer="91"/>
<label x="424.18" y="104.14" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="4"/>
</segment>
</net>
<net name="PWM_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="116.84" x2="96.52" y2="116.84" width="0.1524" layer="91"/>
<label x="81.28" y="116.84" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-2" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="350.52" x2="388.62" y2="350.52" width="0.1524" layer="91"/>
<label x="373.38" y="350.52" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF1(OC0B/XCK0/SCL)"/>
</segment>
<segment>
<wire x1="411.48" y1="154.94" x2="449.58" y2="154.94" width="0.1524" layer="91"/>
<label x="414.02" y="154.94" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="3"/>
</segment>
</net>
<net name="DIRECTION_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="114.3" x2="96.52" y2="114.3" width="0.1524" layer="91"/>
<label x="81.28" y="114.3" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="342.9" x2="388.62" y2="342.9" width="0.1524" layer="91"/>
<label x="373.38" y="342.9" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF4(OC1A/!SS!)"/>
</segment>
<segment>
<wire x1="411.48" y1="147.32" x2="449.58" y2="147.32" width="0.1524" layer="91"/>
<label x="414.02" y="147.32" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="9"/>
</segment>
</net>
<net name="BRAKE_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="111.76" x2="96.52" y2="111.76" width="0.1524" layer="91"/>
<label x="81.28" y="111.76" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-4" pin="S"/>
</segment>
<segment>
<wire x1="370.84" y1="335.28" x2="388.62" y2="335.28" width="0.1524" layer="91"/>
<label x="373.38" y="335.28" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PF7(TXD1/SCK)"/>
</segment>
<segment>
<wire x1="411.48" y1="139.7" x2="449.58" y2="139.7" width="0.1524" layer="91"/>
<label x="414.02" y="139.7" size="1.778" layer="95"/>
<pinref part="JA1" gate="G$1" pin="15"/>
</segment>
</net>
<net name="ENCODER_A_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="101.6" x2="96.52" y2="101.6" width="0.1524" layer="91"/>
<label x="81.28" y="101.6" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-8" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="297.18" x2="307.34" y2="297.18" width="0.1524" layer="91"/>
<label x="276.86" y="297.18" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC3(OC0D/TXD0)"/>
</segment>
<segment>
<wire x1="373.38" y1="99.06" x2="403.86" y2="99.06" width="0.1524" layer="91"/>
<label x="373.38" y="99.06" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="7"/>
</segment>
</net>
<net name="ENCODER_B_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="96.52" x2="96.52" y2="96.52" width="0.1524" layer="91"/>
<label x="81.28" y="96.52" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-10" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="299.72" x2="307.34" y2="299.72" width="0.1524" layer="91"/>
<label x="276.86" y="299.72" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC2(OC0C/RXD0)"/>
</segment>
<segment>
<wire x1="419.1" y1="99.06" x2="449.58" y2="99.06" width="0.1524" layer="91"/>
<label x="421.64" y="99.06" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="8"/>
</segment>
</net>
<net name="/CS_MOT1_3V3" class="0">
<segment>
<wire x1="73.66" y1="81.28" x2="96.52" y2="81.28" width="0.1524" layer="91"/>
<label x="81.28" y="81.28" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-16" pin="S"/>
</segment>
<segment>
<wire x1="276.86" y1="287.02" x2="307.34" y2="287.02" width="0.1524" layer="91"/>
<label x="276.86" y="287.02" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PC7(SCK/TXD1/CLKO/EVO)"/>
</segment>
<segment>
<wire x1="373.38" y1="104.14" x2="403.86" y2="104.14" width="0.1524" layer="91"/>
<label x="381" y="104.14" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="3"/>
</segment>
</net>
<net name="MISO_MOT_3V3" class="0">
<segment>
<wire x1="78.74" y1="139.7" x2="101.6" y2="139.7" width="0.1524" layer="91"/>
<label x="86.36" y="139.7" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-13" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="88.9" x2="96.52" y2="88.9" width="0.1524" layer="91"/>
<label x="81.28" y="88.9" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-13" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<label x="78.74" y="35.56" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-13" pin="S"/>
</segment>
<segment>
<wire x1="284.48" y1="238.76" x2="307.34" y2="238.76" width="0.1524" layer="91"/>
<label x="284.48" y="238.76" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE6(RSC1/MISO/TOSC2)"/>
</segment>
</net>
<net name="MOSI_MOT_3V3" class="0">
<segment>
<wire x1="78.74" y1="137.16" x2="101.6" y2="137.16" width="0.1524" layer="91"/>
<label x="86.36" y="137.16" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-14" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="86.36" x2="96.52" y2="86.36" width="0.1524" layer="91"/>
<label x="81.28" y="86.36" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-14" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="33.02" x2="93.98" y2="33.02" width="0.1524" layer="91"/>
<label x="78.74" y="33.02" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-14" pin="S"/>
</segment>
<segment>
<wire x1="284.48" y1="241.3" x2="307.34" y2="241.3" width="0.1524" layer="91"/>
<label x="284.48" y="241.3" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE5(OC1B/XCK1/MOSI)"/>
</segment>
</net>
<net name="SCK_MOT_3V3" class="0">
<segment>
<wire x1="78.74" y1="134.62" x2="101.6" y2="134.62" width="0.1524" layer="91"/>
<label x="86.36" y="134.62" size="1.778" layer="95"/>
<pinref part="MOT1" gate="-15" pin="S"/>
</segment>
<segment>
<wire x1="73.66" y1="30.48" x2="93.98" y2="30.48" width="0.1524" layer="91"/>
<label x="78.74" y="30.48" size="1.778" layer="95"/>
<pinref part="MOT3" gate="-15" pin="S"/>
</segment>
<segment>
<wire x1="284.48" y1="236.22" x2="307.34" y2="236.22" width="0.1524" layer="91"/>
<label x="284.48" y="236.22" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PE7(TSD1/SCK/CLKO/EVO/TOSC1)"/>
</segment>
<segment>
<wire x1="73.66" y1="83.82" x2="96.52" y2="83.82" width="0.1524" layer="91"/>
<label x="81.28" y="83.82" size="1.778" layer="95"/>
<pinref part="MOT2" gate="-15" pin="S"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="408.94" y1="243.84" x2="419.1" y2="243.84" width="0.1524" layer="91"/>
<pinref part="LED4" gate="G$1" pin="A"/>
<pinref part="R18_Q3" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="370.84" y1="243.84" x2="398.78" y2="243.84" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PQ3"/>
<pinref part="R18_Q3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<wire x1="370.84" y1="246.38" x2="391.16" y2="246.38" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PQ2"/>
<pinref part="R17_Q2" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="370.84" y1="248.92" x2="383.54" y2="248.92" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PQ1(TOSC2)"/>
<pinref part="R16_Q1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="370.84" y1="251.46" x2="375.92" y2="251.46" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="PQ0(TOSC1)"/>
<pinref part="R15_Q0" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="386.08" y1="251.46" x2="408.94" y2="251.46" width="0.1524" layer="91"/>
<wire x1="408.94" y1="251.46" x2="408.94" y2="274.32" width="0.1524" layer="91"/>
<wire x1="408.94" y1="274.32" x2="419.1" y2="274.32" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<pinref part="R15_Q0" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<wire x1="419.1" y1="264.16" x2="411.48" y2="264.16" width="0.1524" layer="91"/>
<wire x1="411.48" y1="264.16" x2="411.48" y2="248.92" width="0.1524" layer="91"/>
<wire x1="411.48" y1="248.92" x2="393.7" y2="248.92" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="A"/>
<pinref part="R16_Q1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="419.1" y1="254" x2="414.02" y2="254" width="0.1524" layer="91"/>
<wire x1="414.02" y1="254" x2="414.02" y2="246.38" width="0.1524" layer="91"/>
<wire x1="414.02" y1="246.38" x2="401.32" y2="246.38" width="0.1524" layer="91"/>
<pinref part="LED3" gate="G$1" pin="A"/>
<pinref part="R17_Q2" gate="G$1" pin="2"/>
</segment>
</net>
<net name="PA7" class="0">
<segment>
<wire x1="279.4" y1="337.82" x2="307.34" y2="337.82" width="0.1524" layer="91"/>
<label x="279.4" y="337.82" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA7/(ADCA7/AC0-OUT)"/>
</segment>
<segment>
<wire x1="403.86" y1="93.98" x2="391.16" y2="93.98" width="0.1524" layer="91"/>
<label x="396.24" y="93.98" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="11"/>
</segment>
</net>
<net name="PA5" class="0">
<segment>
<wire x1="279.4" y1="342.9" x2="307.34" y2="342.9" width="0.1524" layer="91"/>
<label x="279.4" y="342.9" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA5(ADCA5)"/>
</segment>
<segment>
<wire x1="403.86" y1="91.44" x2="391.16" y2="91.44" width="0.1524" layer="91"/>
<label x="396.24" y="91.44" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="13"/>
</segment>
</net>
<net name="PA4" class="0">
<segment>
<wire x1="279.4" y1="345.44" x2="307.34" y2="345.44" width="0.1524" layer="91"/>
<label x="279.4" y="345.44" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA4(ADCA4)"/>
</segment>
<segment>
<wire x1="431.8" y1="91.44" x2="419.1" y2="91.44" width="0.1524" layer="91"/>
<label x="421.64" y="91.44" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="14"/>
</segment>
</net>
<net name="PA2" class="0">
<segment>
<wire x1="279.4" y1="350.52" x2="307.34" y2="350.52" width="0.1524" layer="91"/>
<label x="279.4" y="350.52" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA2(ADCA2)"/>
</segment>
<segment>
<wire x1="431.8" y1="88.9" x2="419.1" y2="88.9" width="0.1524" layer="91"/>
<label x="421.64" y="88.9" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="16"/>
</segment>
</net>
<net name="PA1" class="0">
<segment>
<wire x1="279.4" y1="353.06" x2="307.34" y2="353.06" width="0.1524" layer="91"/>
<label x="279.4" y="353.06" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA1(ADCA1)"/>
</segment>
<segment>
<wire x1="500.38" y1="88.9" x2="487.68" y2="88.9" width="0.1524" layer="91"/>
<label x="490.22" y="88.9" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="16"/>
</segment>
</net>
<net name="PA0" class="0">
<segment>
<wire x1="279.4" y1="355.6" x2="307.34" y2="355.6" width="0.1524" layer="91"/>
<label x="279.4" y="355.6" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA0(ADCA0/AREFA)"/>
</segment>
<segment>
<wire x1="472.44" y1="88.9" x2="459.74" y2="88.9" width="0.1524" layer="91"/>
<label x="459.74" y="88.9" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="15"/>
</segment>
</net>
<net name="PA3" class="0">
<segment>
<wire x1="279.4" y1="347.98" x2="307.34" y2="347.98" width="0.1524" layer="91"/>
<label x="279.4" y="347.98" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PA3(ADCA3)"/>
</segment>
<segment>
<wire x1="403.86" y1="88.9" x2="391.16" y2="88.9" width="0.1524" layer="91"/>
<label x="396.24" y="88.9" size="1.778" layer="95"/>
<pinref part="JB1" gate="G$1" pin="15"/>
</segment>
</net>
<net name="PD1" class="0">
<segment>
<wire x1="279.4" y1="276.86" x2="307.34" y2="276.86" width="0.1524" layer="91"/>
<label x="279.4" y="276.86" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PD1(OC0B/XCK0/SCL)"/>
</segment>
<segment>
<wire x1="487.68" y1="91.44" x2="495.3" y2="91.44" width="0.1524" layer="91"/>
<label x="490.22" y="91.44" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="14"/>
</segment>
</net>
<net name="PD0" class="0">
<segment>
<wire x1="279.4" y1="279.4" x2="307.34" y2="279.4" width="0.1524" layer="91"/>
<label x="279.4" y="279.4" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PD0(OC0A/SDA)"/>
</segment>
<segment>
<wire x1="464.82" y1="91.44" x2="472.44" y2="91.44" width="0.1524" layer="91"/>
<label x="464.82" y="91.44" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="13"/>
</segment>
</net>
<net name="PD2" class="0">
<segment>
<wire x1="279.4" y1="274.32" x2="307.34" y2="274.32" width="0.1524" layer="91"/>
<label x="279.4" y="274.32" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PD2(OC0C/RXD0)"/>
</segment>
<segment>
<wire x1="464.82" y1="93.98" x2="472.44" y2="93.98" width="0.1524" layer="91"/>
<label x="464.82" y="93.98" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="11"/>
</segment>
</net>
<net name="PD3" class="0">
<segment>
<wire x1="279.4" y1="271.78" x2="307.34" y2="271.78" width="0.1524" layer="91"/>
<label x="279.4" y="271.78" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="PD3(OC0D/TXD0)"/>
</segment>
<segment>
<wire x1="487.68" y1="93.98" x2="495.3" y2="93.98" width="0.1524" layer="91"/>
<label x="490.22" y="93.98" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="12"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="492.76" y1="48.26" x2="487.68" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="1"/>
<pinref part="JC2" gate="G$1" pin="4"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="487.68" y1="45.72" x2="500.38" y2="45.72" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="6"/>
<pinref part="R25" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RX_232" class="0">
<segment>
<wire x1="297.18" y1="116.84" x2="314.96" y2="116.84" width="0.1524" layer="91"/>
<label x="304.8" y="116.84" size="1.778" layer="95"/>
<pinref part="UART_I2C" gate="-4" pin="S"/>
<pinref part="R20" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="309.88" y1="27.94" x2="292.1" y2="27.94" width="0.1524" layer="91"/>
<label x="304.8" y="27.94" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="TX_232" class="0">
<segment>
<wire x1="322.58" y1="114.3" x2="297.18" y2="114.3" width="0.1524" layer="91"/>
<label x="304.8" y="114.3" size="1.778" layer="95"/>
<pinref part="R22" gate="G$1" pin="1"/>
<pinref part="UART_I2C" gate="-3" pin="S"/>
</segment>
<segment>
<wire x1="309.88" y1="33.02" x2="292.1" y2="33.02" width="0.1524" layer="91"/>
<label x="304.8" y="33.02" size="1.778" layer="95" rot="MR0"/>
<pinref part="IC1" gate="G$1" pin="T1OUT"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="353.06" y1="55.88" x2="340.36" y2="55.88" width="0.1524" layer="91"/>
<wire x1="340.36" y1="55.88" x2="340.36" y2="53.34" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C1+"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="340.36" y1="48.26" x2="353.06" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="C1-"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="347.98" y1="45.72" x2="340.36" y2="45.72" width="0.1524" layer="91"/>
<wire x1="340.36" y1="45.72" x2="340.36" y2="43.18" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C2+"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<wire x1="340.36" y1="38.1" x2="347.98" y2="38.1" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="C2-"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="299.72" y1="53.34" x2="309.88" y2="53.34" width="0.1524" layer="91"/>
<wire x1="309.88" y1="53.34" x2="309.88" y2="50.8" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="V+"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="307.34" y1="48.26" x2="309.88" y2="48.26" width="0.1524" layer="91"/>
<wire x1="309.88" y1="48.26" x2="309.88" y2="45.72" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="V-"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="AVDD"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="165.1" y1="281.94" x2="167.64" y2="281.94" width="0.1524" layer="91"/>
<wire x1="167.64" y1="281.94" x2="167.64" y2="279.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="DVDD"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="165.1" y1="287.02" x2="175.26" y2="287.02" width="0.1524" layer="91"/>
<wire x1="175.26" y1="287.02" x2="175.26" y2="269.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="CP5"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="165.1" y1="299.72" x2="167.64" y2="299.72" width="0.1524" layer="91"/>
<wire x1="167.64" y1="299.72" x2="185.42" y2="299.72" width="0.1524" layer="91"/>
<wire x1="185.42" y1="299.72" x2="185.42" y2="292.1" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="167.64" y1="309.88" x2="167.64" y2="299.72" width="0.1524" layer="91"/>
<junction x="167.64" y="299.72"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="A"/>
<pinref part="IC2" gate="G$1" pin="VX"/>
<wire x1="167.64" y1="314.96" x2="167.64" y2="320.04" width="0.1524" layer="91"/>
<wire x1="167.64" y1="320.04" x2="152.4" y2="320.04" width="0.1524" layer="91"/>
<wire x1="152.4" y1="320.04" x2="152.4" y2="304.8" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="2"/>
<junction x="152.4" y="320.04"/>
</segment>
</net>
<net name="MOSI_ADXRS453_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PD5(OC1B/XCK1/MOSI)"/>
<wire x1="307.34" y1="266.7" x2="279.4" y2="266.7" width="0.1524" layer="91"/>
<label x="279.4" y="266.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="MOSI"/>
<wire x1="129.54" y1="284.48" x2="93.98" y2="284.48" width="0.1524" layer="91"/>
<label x="99.06" y="284.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="MISO_ADXRS453_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PD6(RXD1/MISO)"/>
<wire x1="279.4" y1="264.16" x2="307.34" y2="264.16" width="0.1524" layer="91"/>
<label x="279.4" y="264.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="MISO"/>
<wire x1="129.54" y1="289.56" x2="93.98" y2="289.56" width="0.1524" layer="91"/>
<label x="99.06" y="289.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCK_ADXRS453_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)"/>
<wire x1="307.34" y1="261.62" x2="279.4" y2="261.62" width="0.1524" layer="91"/>
<label x="279.4" y="261.62" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="SCLK"/>
<wire x1="93.98" y1="279.4" x2="129.54" y2="279.4" width="0.1524" layer="91"/>
<label x="99.06" y="279.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="/CS_ADXRS453_3V3" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="PK0(A0/A8/A16)"/>
<wire x1="370.84" y1="276.86" x2="401.32" y2="276.86" width="0.1524" layer="91"/>
<label x="373.38" y="276.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="/CS"/>
<wire x1="129.54" y1="294.64" x2="93.98" y2="294.64" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="93.98" y1="294.64" x2="93.98" y2="297.18" width="0.1524" layer="91"/>
<label x="99.06" y="294.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="GP2_1_0-1V" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="43.18" y1="-104.14" x2="60.96" y2="-104.14" width="0.1524" layer="91"/>
<junction x="43.18" y="-104.14"/>
<label x="48.26" y="-104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB2(ADCB2/DAC0)"/>
<wire x1="307.34" y1="325.12" x2="279.4" y2="325.12" width="0.1524" layer="91"/>
<label x="279.4" y="325.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="GP2_3_0-1V" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="124.46" y1="-104.14" x2="142.24" y2="-104.14" width="0.1524" layer="91"/>
<junction x="124.46" y="-104.14"/>
<label x="129.54" y="-104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB0(ADCB0/AREFB)"/>
<wire x1="307.34" y1="330.2" x2="279.4" y2="330.2" width="0.1524" layer="91"/>
<label x="279.4" y="330.2" size="1.778" layer="95"/>
</segment>
</net>
<net name="GP2_2_0-1V" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="124.46" y1="-53.34" x2="142.24" y2="-53.34" width="0.1524" layer="91"/>
<junction x="124.46" y="-53.34"/>
<label x="129.54" y="-53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB1(ADCB1)"/>
<wire x1="307.34" y1="327.66" x2="279.4" y2="327.66" width="0.1524" layer="91"/>
<label x="279.4" y="327.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="GP2_0_0-1V" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="43.18" y1="-53.34" x2="60.96" y2="-53.34" width="0.1524" layer="91"/>
<junction x="43.18" y="-53.34"/>
<label x="50.8" y="-53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="PB3(ADCB3/DAC1)"/>
<wire x1="307.34" y1="322.58" x2="279.4" y2="322.58" width="0.1524" layer="91"/>
<label x="279.4" y="322.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="124.46" y1="-93.98" x2="124.46" y2="-91.44" width="0.1524" layer="91"/>
<pinref part="GP2" gate="-10" pin="S"/>
<wire x1="119.38" y1="-91.44" x2="124.46" y2="-91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="43.18" y1="-93.98" x2="43.18" y2="-91.44" width="0.1524" layer="91"/>
<pinref part="GP2" gate="-4" pin="S"/>
<wire x1="38.1" y1="-91.44" x2="43.18" y2="-91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="GP2" gate="-1" pin="S"/>
<wire x1="38.1" y1="-43.18" x2="43.18" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="GP2" gate="-7" pin="S"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="119.38" y1="-43.18" x2="124.46" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

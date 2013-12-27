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
<library name="robotter_connector">
<packages>
<package name="DM3CS-SF">
<wire x1="-6.9" y1="0" x2="6.9" y2="0" width="0.127" layer="21"/>
<wire x1="-6.9" y1="0" x2="-6.9" y2="11.5" width="0.127" layer="21"/>
<wire x1="-5.8" y1="14.1" x2="-5.5" y2="14.1" width="0.127" layer="21"/>
<wire x1="5.5" y1="14.1" x2="6.2" y2="14.1" width="0.127" layer="21"/>
<wire x1="6.9" y1="11.5" x2="6.9" y2="0" width="0.127" layer="21"/>
<smd name="GND0" x="7.25" y="12.9" dx="2.6" dy="2" layer="1" rot="R90"/>
<smd name="GND2" x="3.1" y="0.3" dx="2.7" dy="2.2" layer="1"/>
<smd name="GND1" x="-1.8" y="0.3" dx="2.7" dy="2.2" layer="1"/>
<smd name="CARD_CONNECT_1" x="-6.85" y="12.9" dx="2.6" dy="2" layer="1" rot="R90"/>
<smd name="CARD_CONNECT_0" x="-4.85" y="0.2" dx="2" dy="1.2" layer="1" rot="R90"/>
<smd name="DAT2" x="-3.2" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="CD/DAT3" x="-2.1" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="CMD" x="-1" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="VDD" x="0.1" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="CLK" x="1.2" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="VSS" x="2.3" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="DAT0" x="3.4" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<smd name="DAT1" x="4.5" y="13.4" dx="2" dy="0.7" layer="1" rot="R90"/>
<rectangle x1="-3.75" y1="2.9" x2="5.05" y2="5.4" layer="39"/>
<wire x1="-5.5" y1="15.45" x2="5.5" y2="15.45" width="0.127" layer="51"/>
<wire x1="5.5" y1="15.45" x2="5.5" y2="14.1" width="0.127" layer="51"/>
<wire x1="-5.5" y1="15.45" x2="-5.5" y2="14.1" width="0.127" layer="51"/>
<wire x1="-5.5" y1="14.1" x2="-4.6" y2="13.2" width="0.127" layer="51"/>
<wire x1="-4.6" y1="13.2" x2="4.6" y2="13.2" width="0.127" layer="51"/>
<wire x1="5.5" y1="14.1" x2="4.6" y2="13.2" width="0.127" layer="51"/>
<rectangle x1="-7.3" y1="7.8" x2="-6.7" y2="11.6" layer="39"/>
<rectangle x1="6.3" y1="7" x2="6.9" y2="11.6" layer="39"/>
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
<wire x1="2.88" y1="2" x2="2.78" y2="2" width="0.2032" layer="21"/>
<wire x1="-1.88" y1="2" x2="-2.88" y2="2" width="0.2032" layer="21"/>
<wire x1="3.46" y1="2.4" x2="2.78" y2="2.4" width="0.2032" layer="21"/>
<wire x1="-1.88" y1="2.4" x2="-3.46" y2="2.4" width="0.2032" layer="21"/>
<wire x1="3.46" y1="-2.4" x2="1.88" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="-2.78" y1="-2.4" x2="-3.46" y2="-2.4" width="0.2032" layer="21"/>
<wire x1="2.88" y1="-2" x2="2.88" y2="-0.33" width="0.2032" layer="21"/>
<wire x1="2.88" y1="1" x2="2.88" y2="2" width="0.2032" layer="21"/>
<wire x1="2.88" y1="-2" x2="1.88" y2="-2" width="0.2032" layer="21"/>
<wire x1="-2.78" y1="-2" x2="-2.88" y2="-2" width="0.2032" layer="21"/>
<smd name="1" x="1.905" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="3" x="-0.635" y="2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="2" x="0.635" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<smd name="4" x="-1.905" y="-2.794" dx="1.5" dy="4.5" layer="1"/>
<text x="-2.54" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
</package>
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
<package name="794618-4">
<wire x1="-3.325" y1="4.32" x2="-2.54" y2="4.32" width="0.2032" layer="21"/>
<wire x1="2.54" y1="4.32" x2="3.325" y2="4.32" width="0.2032" layer="21"/>
<wire x1="3.325" y1="4.32" x2="3.325" y2="-4.6" width="0.2032" layer="21"/>
<wire x1="3.325" y1="-4.6" x2="0.775" y2="-4.6" width="0.2032" layer="21"/>
<wire x1="0.775" y1="-4.6" x2="-0.775" y2="-4.6" width="0.2032" layer="21"/>
<wire x1="-0.775" y1="-4.6" x2="-3.325" y2="-4.6" width="0.2032" layer="21"/>
<wire x1="-3.325" y1="-4.6" x2="-3.325" y2="4.32" width="0.2032" layer="21"/>
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
<wire x1="0.775" y1="3.5" x2="0.775" y2="-4.6" width="0.2032" layer="21"/>
<wire x1="-0.775" y1="3.5" x2="-0.775" y2="-4.6" width="0.2032" layer="21"/>
<pad name="1" x="1.5" y="4.32" drill="1" diameter="1.778"/>
<pad name="2" x="1.5" y="7.32" drill="1" diameter="1.778"/>
<pad name="3" x="-1.5" y="4.32" drill="1" diameter="1.778"/>
<pad name="4" x="-1.5" y="7.32" drill="1" diameter="1.778"/>
<text x="-2.77" y="-6" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="8.31" size="1.27" layer="27">&gt;VALUE</text>
<hole x="0" y="0" drill="3.1"/>
<wire x1="-1.5" y1="5.9" x2="-1.5" y2="5.7" width="0.8128" layer="21"/>
<wire x1="1.5" y1="5.9" x2="1.5" y2="5.7" width="0.8128" layer="21"/>
</package>
<package name="1503_12">
<description>&lt;b&gt;Jack connectors according to JISC 6560, 2.5 mm&lt;/b&gt;&lt;p&gt;
Klinkensteckverbinder nach JISC 6560, 2,5 mm&lt;br&gt;
Source: http://www.lumberg.com/Produkte/PDFs/KLBR1.pdf</description>
<wire x1="-3" y1="11.85" x2="3" y2="11.85" width="0.2032" layer="21"/>
<wire x1="4.9" y1="8.35" x2="4.9" y2="-6.35" width="0.2032" layer="21"/>
<wire x1="4.9" y1="-6.35" x2="2.25" y2="-6.35" width="0.2032" layer="21"/>
<wire x1="-2.25" y1="-6.35" x2="-4.1" y2="-6.35" width="0.2032" layer="25"/>
<wire x1="-4.1" y1="-6.35" x2="-5" y2="-6.35" width="0.2032" layer="51"/>
<wire x1="-5" y1="-1.7" x2="-5" y2="8.35" width="0.2032" layer="21"/>
<wire x1="-5" y1="8.35" x2="-3" y2="8.35" width="0.2032" layer="21"/>
<wire x1="-3" y1="8.35" x2="3" y2="8.35" width="0.2032" layer="21"/>
<wire x1="3" y1="8.35" x2="4.9" y2="8.35" width="0.2032" layer="21"/>
<wire x1="-3" y1="8.35" x2="-3" y2="11.85" width="0.2032" layer="21"/>
<wire x1="3" y1="11.85" x2="3" y2="8.35" width="0.2032" layer="21"/>
<pad name="3" x="0" y="-6.35" drill="3" diameter="4" shape="octagon"/>
<pad name="5" x="0" y="6.35" drill="3" diameter="4" shape="octagon"/>
<pad name="4" x="-5.3" y="-4.35" drill="3" diameter="4" shape="octagon" rot="R90"/>
<text x="-5.715" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="UX60-MB-5S8">
<description>&lt;b&gt;MINI USB Connector HI-SPEED Certified&lt;/b&gt; Metal Shield Dip Type With Positioning Post&lt;p&gt;
Source: http://www.hirose.co.jp/cataloge_hp/e24000019.pdf</description>
<wire x1="0.0491" y1="3.8059" x2="7.1731" y2="3.8059" width="0.1016" layer="21"/>
<wire x1="7.1731" y1="3.8059" x2="7.1731" y2="2.5442" width="0.1016" layer="21"/>
<wire x1="7.1731" y1="2.5442" x2="6.8086" y2="2.1797" width="0.1016" layer="21" curve="-90.031447"/>
<wire x1="6.8086" y1="2.1797" x2="6.2759" y2="2.1797" width="0.1016" layer="21"/>
<wire x1="8.0539" y1="2.1797" x2="7.6894" y2="1.8152" width="0.1016" layer="51" curve="90"/>
<wire x1="7.6894" y1="1.8152" x2="7.6894" y2="-1.8578" width="0.1016" layer="51"/>
<wire x1="7.6894" y1="-1.8578" x2="8.0118" y2="-2.1802" width="0.1016" layer="51" curve="90"/>
<wire x1="6.2338" y1="-2.1802" x2="6.8226" y2="-2.1802" width="0.1016" layer="21"/>
<wire x1="6.8226" y1="-2.1802" x2="7.1731" y2="-2.5307" width="0.1016" layer="21" curve="-90.032703"/>
<wire x1="7.1731" y1="-2.5307" x2="7.1731" y2="-3.8064" width="0.1016" layer="21"/>
<wire x1="7.1731" y1="-3.8064" x2="0.0491" y2="-3.8064" width="0.1016" layer="21"/>
<wire x1="0.0491" y1="-3.8064" x2="0.0491" y2="3.8059" width="0.1016" layer="21"/>
<wire x1="1.2407" y1="3.7498" x2="1.2407" y2="2.2077" width="0.1016" layer="21"/>
<wire x1="1.2407" y1="2.2077" x2="1.5912" y2="1.8572" width="0.1016" layer="21" curve="90.032703"/>
<wire x1="1.5912" y1="1.8572" x2="1.6332" y2="1.8572" width="0.1016" layer="21"/>
<wire x1="1.6332" y1="1.8572" x2="3.7822" y2="1.689" width="0.1016" layer="21"/>
<wire x1="3.7822" y1="1.689" x2="3.7962" y2="1.9834" width="0.1016" layer="21" curve="179.766458"/>
<wire x1="3.7962" y1="1.9834" x2="1.9276" y2="2.2077" width="0.1016" layer="21"/>
<wire x1="1.9276" y1="2.2077" x2="1.9416" y2="2.6984" width="0.1016" layer="21" curve="-175.705121"/>
<wire x1="1.9416" y1="2.6984" x2="5.3482" y2="2.9227" width="0.1016" layer="21"/>
<wire x1="5.3482" y1="2.9227" x2="5.4604" y2="3.0488" width="0.1016" layer="21" curve="89.143172"/>
<wire x1="5.4604" y1="3.0488" x2="5.4604" y2="3.7498" width="0.1016" layer="21"/>
<wire x1="4.2308" y1="0.7497" x2="3.8943" y2="1.0862" width="0.1016" layer="21" curve="89.965956"/>
<wire x1="3.8943" y1="1.0862" x2="1.3949" y2="1.2965" width="0.1016" layer="21"/>
<wire x1="1.3949" y1="1.2965" x2="1.3809" y2="1.0301" width="0.1016" layer="21" curve="180"/>
<wire x1="1.3809" y1="1.0301" x2="2.9691" y2="0.8619" width="0.1016" layer="21"/>
<wire x1="2.9691" y1="0.8619" x2="3.4037" y2="0.4273" width="0.1016" layer="21" curve="-90"/>
<wire x1="3.4037" y1="0.4273" x2="3.4037" y2="-0.4559" width="0.1016" layer="21"/>
<wire x1="3.4037" y1="-0.4559" x2="2.9831" y2="-0.8765" width="0.1016" layer="21" curve="-90"/>
<wire x1="2.9831" y1="-0.8765" x2="2.913" y2="-0.8765" width="0.1016" layer="21"/>
<wire x1="2.913" y1="-0.8765" x2="1.3949" y2="-1.0167" width="0.1016" layer="21"/>
<wire x1="1.3949" y1="-1.0167" x2="1.3949" y2="-1.297" width="0.1016" layer="21" curve="174.689178"/>
<wire x1="1.3949" y1="-1.297" x2="3.8663" y2="-1.0868" width="0.1016" layer="21"/>
<wire x1="3.8663" y1="-1.0868" x2="4.2308" y2="-0.7223" width="0.1016" layer="21" curve="89.968571"/>
<wire x1="4.2308" y1="-0.7223" x2="4.2308" y2="0.7497" width="0.1016" layer="21"/>
<wire x1="1.2408" y1="-3.7504" x2="1.2408" y2="-2.2083" width="0.1016" layer="21"/>
<wire x1="1.2408" y1="-2.2083" x2="1.5913" y2="-1.8578" width="0.1016" layer="21" curve="-89.967316"/>
<wire x1="1.5913" y1="-1.8578" x2="1.6333" y2="-1.8578" width="0.1016" layer="21"/>
<wire x1="1.6333" y1="-1.8578" x2="3.7823" y2="-1.6896" width="0.1016" layer="21"/>
<wire x1="3.7823" y1="-1.6896" x2="3.7963" y2="-1.984" width="0.1016" layer="21" curve="-179.766458"/>
<wire x1="3.7963" y1="-1.984" x2="1.9277" y2="-2.2083" width="0.1016" layer="21"/>
<wire x1="1.9277" y1="-2.2083" x2="1.9417" y2="-2.699" width="0.1016" layer="21" curve="175.705121"/>
<wire x1="1.9417" y1="-2.699" x2="5.3483" y2="-2.9233" width="0.1016" layer="21"/>
<wire x1="5.3483" y1="-2.9233" x2="5.4605" y2="-3.0494" width="0.1016" layer="21" curve="-89.143172"/>
<wire x1="5.4605" y1="-3.0494" x2="5.4605" y2="-3.7504" width="0.1016" layer="21"/>
<pad name="M4" x="5.1" y="-3.65" drill="1.1" shape="octagon"/>
<pad name="M3" x="5.1" y="3.65" drill="1.1" shape="octagon"/>
<pad name="M1" x="3.3" y="-3.65" drill="1.1" shape="long" rot="R90"/>
<pad name="M2" x="3.3" y="3.65" drill="1.1" shape="long" rot="R90"/>
<smd name="1" x="6.4" y="1.6" dx="2" dy="0.5" layer="1"/>
<smd name="2" x="6.4" y="0.8" dx="2" dy="0.5" layer="1"/>
<smd name="3" x="6.4" y="0" dx="2" dy="0.5" layer="1"/>
<smd name="4" x="6.4" y="-0.8" dx="2" dy="0.5" layer="1"/>
<smd name="5" x="6.4" y="-1.6" dx="2" dy="0.5" layer="1"/>
<text x="8.89" y="-2.794" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.27" y="-5.715" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="7.7034" y1="1.4367" x2="9.0072" y2="1.7731" layer="51"/>
<rectangle x1="7.7034" y1="0.6376" x2="9.0072" y2="0.974" layer="51"/>
<rectangle x1="7.7034" y1="-0.1615" x2="9.0072" y2="0.1749" layer="51"/>
<rectangle x1="7.7034" y1="-0.9606" x2="9.0072" y2="-0.6242" layer="51"/>
<rectangle x1="7.7034" y1="-1.7596" x2="9.0072" y2="-1.4232" layer="51"/>
<rectangle x1="0" y1="-3.85" x2="1.975" y2="3.85" layer="41"/>
<rectangle x1="4.225" y1="-2.5" x2="5" y2="2.5" layer="41"/>
<rectangle x1="1.975" y1="-1.9" x2="4.225" y2="1.9" layer="41"/>
<rectangle x1="0" y1="-3.85" x2="1.775" y2="3.85" layer="39"/>
<rectangle x1="1.775" y1="-1.9" x2="4.425" y2="1.9" layer="39"/>
<rectangle x1="4.425" y1="-2.5" x2="5" y2="2.5" layer="39"/>
</package>
</packages>
<symbols>
<symbol name="SD_CARD">
<wire x1="0" y1="-15.24" x2="22.86" y2="-15.24" width="0.254" layer="94"/>
<wire x1="22.86" y1="-15.24" x2="22.86" y2="15.24" width="0.254" layer="94"/>
<wire x1="22.86" y1="15.24" x2="0" y2="15.24" width="0.254" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="-15.24" width="0.254" layer="94"/>
<text x="15.24" y="-5.08" size="2.54" layer="94" rot="R90">µ SD-card</text>
<text x="0" y="15.24" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="DAT2" x="-5.08" y="5.08" length="middle"/>
<pin name="DAT1" x="-5.08" y="7.62" length="middle"/>
<pin name="DAT0" x="-5.08" y="10.16" length="middle"/>
<pin name="VSS" x="27.94" y="-7.62" length="middle" rot="R180"/>
<pin name="VDD" x="27.94" y="12.7" length="middle" rot="R180"/>
<pin name="CMD" x="-5.08" y="0" length="middle"/>
<pin name="CD/DAT3" x="-5.08" y="2.54" length="middle"/>
<pin name="CLK" x="-5.08" y="-2.54" length="middle"/>
<pin name="CARD_CONNECT0" x="-5.08" y="-10.16" length="middle"/>
<pin name="CARD_CONNECT1" x="-5.08" y="-12.7" length="middle"/>
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
<symbol name="COM_2013_MASTER">
<wire x1="6.35" y1="-5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="6.35" y1="-5.08" x2="6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="6.35" y2="5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-6.35" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="TX_I" x="10.16" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="RX_O" x="10.16" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="10.16" y="-2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
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
<symbol name="JACK-SWITCH">
<wire x1="-2.54" y1="2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="1.524" y2="1.016" width="0.1524" layer="94"/>
<wire x1="1.524" y1="1.016" x2="2.286" y2="1.778" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.762" y2="2.286" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="2.286" x2="-1.016" y2="1.524" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.524" x2="-0.508" y2="1.524" width="0.254" layer="94"/>
<wire x1="-0.508" y1="1.524" x2="-0.762" y2="2.286" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="4.572" y2="-2.54" width="0.1524" layer="94"/>
<text x="-2.54" y="4.064" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-6.096" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.508" x2="7.874" y2="0.508" layer="94" rot="R90"/>
<pin name="5" x="-5.08" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-5.08" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
<symbol name="MINI-USB">
<wire x1="-2.54" y1="6.35" x2="-2.54" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-6.35" x2="-1.27" y2="-7.62" width="0.254" layer="94" curve="90"/>
<wire x1="-1.27" y1="-7.62" x2="0" y2="-7.62" width="0.254" layer="94"/>
<wire x1="0" y1="-7.62" x2="1.016" y2="-8.128" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="1.016" y1="-8.128" x2="2.54" y2="-8.89" width="0.254" layer="94" curve="53.130102"/>
<wire x1="2.54" y1="-8.89" x2="5.08" y2="-8.89" width="0.254" layer="94"/>
<wire x1="5.08" y1="-8.89" x2="6.35" y2="-7.62" width="0.254" layer="94" curve="90"/>
<wire x1="6.35" y1="-7.62" x2="6.35" y2="7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="6.35" x2="-1.27" y2="7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="-1.27" y1="7.62" x2="0" y2="7.62" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="1.016" y2="8.128" width="0.254" layer="94" curve="53.130102"/>
<wire x1="1.016" y1="8.128" x2="2.54" y2="8.89" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="2.54" y1="8.89" x2="5.08" y2="8.89" width="0.254" layer="94"/>
<wire x1="5.08" y1="8.89" x2="6.35" y2="7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="1.27" y2="-6.35" width="0.254" layer="94"/>
<wire x1="1.27" y1="-6.35" x2="3.81" y2="-6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="-6.35" x2="3.81" y2="6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="6.35" x2="1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="1.27" y1="6.35" x2="0" y2="5.08" width="0.254" layer="94"/>
<text x="-2.54" y="11.43" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="10.16" y="-7.62" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="1" x="-5.08" y="5.08" visible="pin" direction="in"/>
<pin name="2" x="-5.08" y="2.54" visible="pin" direction="in"/>
<pin name="3" x="-5.08" y="0" visible="pin" direction="in"/>
<pin name="4" x="-5.08" y="-2.54" visible="pin" direction="in"/>
<pin name="5" x="-5.08" y="-5.08" visible="pin" direction="in"/>
</symbol>
<symbol name="USB-SHIELD">
<wire x1="-7.62" y1="0" x2="1.27" y2="0" width="0.254" layer="94" style="shortdash"/>
<wire x1="1.27" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94" style="shortdash" curve="90"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="19.05" width="0.254" layer="94" style="shortdash"/>
<wire x1="-7.62" y1="20.32" x2="1.27" y2="20.32" width="0.254" layer="94" style="shortdash"/>
<wire x1="1.27" y1="20.32" x2="2.54" y2="19.05" width="0.254" layer="94" style="shortdash" curve="-90"/>
<text x="3.81" y="-2.54" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="S1" x="-7.62" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="-5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S3" x="-2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S4" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DM3CS-SF" prefix="SD">
<gates>
<gate name="G$1" symbol="SD_CARD" x="-12.7" y="0"/>
</gates>
<devices>
<device name="" package="DM3CS-SF">
<connects>
<connect gate="G$1" pin="CARD_CONNECT0" pad="CARD_CONNECT_0"/>
<connect gate="G$1" pin="CARD_CONNECT1" pad="CARD_CONNECT_1"/>
<connect gate="G$1" pin="CD/DAT3" pad="CD/DAT3"/>
<connect gate="G$1" pin="CLK" pad="CLK"/>
<connect gate="G$1" pin="CMD" pad="CMD"/>
<connect gate="G$1" pin="DAT0" pad="DAT0"/>
<connect gate="G$1" pin="DAT1" pad="DAT1"/>
<connect gate="G$1" pin="DAT2" pad="DAT2"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
<connect gate="G$1" pin="VSS" pad="VSS"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="772-6787" constant="no"/>
<attribute name="VALUE" value="DM3CS-SF" constant="no"/>
</technology>
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
<attribute name="FARNELL" value="1109794" constant="no"/>
<attribute name="RS" value="605-8847" constant="no"/>
<attribute name="VALUE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="COM_2013_MASTER" prefix="UART">
<gates>
<gate name="G$1" symbol="COM_2013_MASTER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MICROMATCH-4_SMD">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="RX_O" pad="2"/>
<connect gate="G$1" pin="TX_I" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value=" 366-1721 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
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
<deviceset name="794618-4" prefix="J">
<gates>
<gate name="G$1" symbol="P4-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="794618-4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="495-9439 " constant="no"/>
<attribute name="VALUE" value="794618-4" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="1503_12" prefix="X">
<description>&lt;b&gt;Jack connectors according to JISC 6560, 2.5mm / 3.5 mm&lt;/b&gt;&lt;p&gt;
Klinkensteckverbinder nach JISC 6560, 2.5mm / 3,5 mm&lt;br&gt;
Source: http://www.lumberg.com/Produkte/PDFs/KLBR2.pdf&lt;br&gt;
 www.lumberg.com/Produkte/PDFs/KLBR1.pdf</description>
<gates>
<gate name="G$1" symbol="JACK-SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="&quot;" package="1503_12">
<connects>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="1340604"/>
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="1503 12" constant="no"/>
<attribute name="OC_NEWARK" value="" constant="no"/>
<attribute name="RS" value="413-453 " constant="no"/>
<attribute name="VALUE" value="1503 12" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MINI-USB-SHIELD-" prefix="X">
<description>&lt;b&gt;MINI USB Connector&lt;/b&gt;&lt;p&gt;
Source: http://www.hirose.co.jp/cataloge_hp/e24000019.pdf</description>
<gates>
<gate name="G$1" symbol="MINI-USB" x="0" y="0"/>
<gate name="S" symbol="USB-SHIELD" x="5.08" y="-10.16" addlevel="request"/>
</gates>
<devices>
<device name="UX60-MB-5S8" package="UX60-MB-5S8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="S" pin="S1" pad="M1"/>
<connect gate="S" pin="S2" pad="M2"/>
<connect gate="S" pin="S3" pad="M3"/>
<connect gate="S" pin="S4" pad="M4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="RS" value="772-6926 " constant="no"/>
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
<deviceset name="4.7NF" prefix="C">
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
<attribute name="RS" value=" 723-5004" constant="no"/>
<attribute name="VALUE" value="4.7nF 50V" constant="no"/>
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
<attribute name="RS" value="264-4365" constant="no"/>
<attribute name="VALUE" value="4.7nF 50V" constant="no"/>
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
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
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
<symbol name="RES@1">
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
<attribute name="RS" value=" 679-1727" constant="no"/>
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
<deviceset name="1M" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RES@1" x="0" y="0"/>
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
</devices>
</deviceset>
<deviceset name="7K15_1%" prefix="R">
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
<attribute name="RS" value="679-1689" constant="no"/>
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
<attribute name="RS" value="679-0709" constant="no"/>
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
<library name="robotter_diode">
<packages>
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
<package name="OKI78SR-HORIZONTAL">
<pad name="OUT" x="-2.54" y="0" drill="0.9" shape="octagon"/>
<pad name="GND" x="0" y="0" drill="0.9" shape="octagon"/>
<pad name="IN" x="2.54" y="0" drill="0.9" shape="octagon"/>
<wire x1="-5.207" y1="-1.27" x2="5.207" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.207" y1="-1.27" x2="5.207" y2="15.24" width="0.127" layer="21"/>
<wire x1="5.207" y1="15.24" x2="-5.207" y2="15.24" width="0.127" layer="21"/>
<wire x1="-5.207" y1="15.24" x2="-5.207" y2="-1.27" width="0.127" layer="21"/>
<text x="0.635" y="1.27" size="1.905" layer="21" rot="R90">OKI-78SR</text>
<text x="-4.3434" y="15.5702" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-2.8702" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="OKI78SR-VERTICAL">
<pad name="IN" x="-2.54" y="0" drill="0.9" shape="square"/>
<pad name="GND" x="0" y="0" drill="0.9" shape="octagon"/>
<pad name="OUT" x="2.54" y="0" drill="0.9" shape="octagon"/>
<wire x1="-5.207" y1="4.826" x2="-5.207" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-5.207" y1="-2.794" x2="5.207" y2="-2.794" width="0.127" layer="21"/>
<wire x1="5.207" y1="-2.794" x2="5.207" y2="4.826" width="0.127" layer="21"/>
<wire x1="5.207" y1="4.826" x2="-5.207" y2="4.826" width="0.127" layer="21"/>
<rectangle x1="-5.207" y1="1.27" x2="5.207" y2="2.794" layer="21"/>
<rectangle x1="-2.921" y1="0.762" x2="-2.159" y2="1.27" layer="21"/>
<rectangle x1="-0.381" y1="0.762" x2="0.381" y2="1.27" layer="21"/>
<rectangle x1="2.159" y1="0.762" x2="2.921" y2="1.27" layer="21"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-4.1402" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TQFP64">
<description>&lt;B&gt;Thin Plasic Quad Flat Package&lt;/B&gt;&lt;p&gt;
Updated from atml.lbr 17.01.2005 alf@cadsoft.de</description>
<wire x1="7.036" y1="7.036" x2="7.036" y2="-7.036" width="0.1524" layer="21"/>
<wire x1="7.036" y1="-7.036" x2="-7.036" y2="-7.036" width="0.1524" layer="21"/>
<wire x1="-7.036" y1="-7.036" x2="-7.036" y2="6.604" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="7.036" x2="7.036" y2="7.036" width="0.1524" layer="21"/>
<wire x1="-7.036" y1="6.604" x2="-6.604" y2="7.036" width="0.1524" layer="21"/>
<circle x="-5.8801" y="5.8801" radius="0.5589" width="0.1524" layer="21"/>
<smd name="64" x="-6" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="63" x="-5.2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="62" x="-4.4" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="61" x="-3.6" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="60" x="-2.8" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="59" x="-2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="58" x="-1.2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="57" x="-0.4" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="56" x="0.4" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="55" x="1.2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="54" x="2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="53" x="2.8" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="52" x="3.6" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="51" x="4.4" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="50" x="5.2" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="49" x="6" y="7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="8" x="-7.8" y="0.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="7" x="-7.8" y="1.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="6" x="-7.8" y="2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="5" x="-7.8" y="2.8" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="4" x="-7.8" y="3.6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="3" x="-7.8" y="4.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="2" x="-7.8" y="5.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="1" x="-7.8" y="6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="9" x="-7.8" y="-0.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="10" x="-7.8" y="-1.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="11" x="-7.8" y="-2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="12" x="-7.8" y="-2.8" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="13" x="-7.8" y="-3.6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="14" x="-7.8" y="-4.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="15" x="-7.8" y="-5.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="16" x="-7.8" y="-6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="17" x="-6" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="18" x="-5.2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="19" x="-4.4" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="20" x="-3.6" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="21" x="-2.8" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="22" x="-2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="23" x="-1.2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="24" x="-0.4" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="25" x="0.4" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="26" x="1.2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="27" x="2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="28" x="2.8" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="29" x="3.6" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="30" x="4.4" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="31" x="5.2" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="32" x="6" y="-7.8" dx="0.5588" dy="1.1938" layer="1"/>
<smd name="33" x="7.8" y="-6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="34" x="7.8" y="-5.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="35" x="7.8" y="-4.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="36" x="7.8" y="-3.6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="37" x="7.8" y="-2.8" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="38" x="7.8" y="-2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="39" x="7.8" y="-1.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="40" x="7.8" y="-0.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="41" x="7.8" y="0.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="42" x="7.8" y="1.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="43" x="7.8" y="2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="44" x="7.8" y="2.8" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="45" x="7.8" y="3.6" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="46" x="7.8" y="4.4" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="47" x="7.8" y="5.2" dx="1.1938" dy="0.5588" layer="1"/>
<smd name="48" x="7.8" y="6" dx="1.1938" dy="0.5588" layer="1"/>
<text x="-5.715" y="8.9027" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.35" y="-1.8923" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-8.1788" y1="5.7651" x2="-7.0866" y2="6.2223" layer="51"/>
<rectangle x1="-8.1788" y1="4.9651" x2="-7.0866" y2="5.4223" layer="51"/>
<rectangle x1="-8.1788" y1="4.1651" x2="-7.0866" y2="4.6223" layer="51"/>
<rectangle x1="-8.1788" y1="3.3651" x2="-7.0866" y2="3.8223" layer="51"/>
<rectangle x1="-8.1788" y1="2.5651" x2="-7.0866" y2="3.0223" layer="51"/>
<rectangle x1="-8.1788" y1="1.7651" x2="-7.0866" y2="2.2223" layer="51"/>
<rectangle x1="-8.1788" y1="0.9651" x2="-7.0866" y2="1.4223" layer="51"/>
<rectangle x1="-8.1788" y1="0.1651" x2="-7.0866" y2="0.6223" layer="51"/>
<rectangle x1="-8.1788" y1="-0.6349" x2="-7.0866" y2="-0.1777" layer="51"/>
<rectangle x1="-8.1788" y1="-1.4349" x2="-7.0866" y2="-0.9777" layer="51"/>
<rectangle x1="-8.1788" y1="-2.2349" x2="-7.0866" y2="-1.7777" layer="51"/>
<rectangle x1="-8.1788" y1="-3.0349" x2="-7.0866" y2="-2.5777" layer="51"/>
<rectangle x1="-8.1788" y1="-3.8349" x2="-7.0866" y2="-3.3777" layer="51"/>
<rectangle x1="-8.1788" y1="-4.6349" x2="-7.0866" y2="-4.1777" layer="51"/>
<rectangle x1="-8.1788" y1="-5.4349" x2="-7.0866" y2="-4.9777" layer="51"/>
<rectangle x1="-8.1788" y1="-6.2349" x2="-7.0866" y2="-5.7777" layer="51"/>
<rectangle x1="-6.5398" y1="-7.8613" x2="-5.4476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-5.7398" y1="-7.8613" x2="-4.6476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-4.9398" y1="-7.8613" x2="-3.8476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-4.1398" y1="-7.8613" x2="-3.0476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-3.3398" y1="-7.8613" x2="-2.2476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-2.5398" y1="-7.8613" x2="-1.4476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-1.7398" y1="-7.8613" x2="-0.6476" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-0.9398" y1="-7.8613" x2="0.1524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="-0.1398" y1="-7.8613" x2="0.9524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="0.6602" y1="-7.8613" x2="1.7524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="1.4602" y1="-7.8613" x2="2.5524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="2.2602" y1="-7.8613" x2="3.3524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="3.0602" y1="-7.8613" x2="4.1524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="3.8602" y1="-7.8613" x2="4.9524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="4.6602" y1="-7.8613" x2="5.7524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="5.4602" y1="-7.8613" x2="6.5524" y2="-7.4041" layer="51" rot="R90"/>
<rectangle x1="7.0866" y1="-6.2223" x2="8.1788" y2="-5.7651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-5.4223" x2="8.1788" y2="-4.9651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-4.6223" x2="8.1788" y2="-4.1651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-3.8223" x2="8.1788" y2="-3.3651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-3.0223" x2="8.1788" y2="-2.5651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-2.2223" x2="8.1788" y2="-1.7651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-1.4223" x2="8.1788" y2="-0.9651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="-0.6223" x2="8.1788" y2="-0.1651" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="0.1777" x2="8.1788" y2="0.6349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="0.9777" x2="8.1788" y2="1.4349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="1.7777" x2="8.1788" y2="2.2349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="2.5777" x2="8.1788" y2="3.0349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="3.3777" x2="8.1788" y2="3.8349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="4.1777" x2="8.1788" y2="4.6349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="4.9777" x2="8.1788" y2="5.4349" layer="51" rot="R180"/>
<rectangle x1="7.0866" y1="5.7777" x2="8.1788" y2="6.2349" layer="51" rot="R180"/>
<rectangle x1="5.4476" y1="7.4041" x2="6.5398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="4.6476" y1="7.4041" x2="5.7398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="3.8476" y1="7.4041" x2="4.9398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="3.0476" y1="7.4041" x2="4.1398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="2.2476" y1="7.4041" x2="3.3398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="1.4476" y1="7.4041" x2="2.5398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="0.6476" y1="7.4041" x2="1.7398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-0.1524" y1="7.4041" x2="0.9398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-0.9524" y1="7.4041" x2="0.1398" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-1.7524" y1="7.4041" x2="-0.6602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-2.5524" y1="7.4041" x2="-1.4602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-3.3524" y1="7.4041" x2="-2.2602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-4.1524" y1="7.4041" x2="-3.0602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-4.9524" y1="7.4041" x2="-3.8602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-5.7524" y1="7.4041" x2="-4.6602" y2="7.8613" layer="51" rot="R270"/>
<rectangle x1="-6.5524" y1="7.4041" x2="-5.4602" y2="7.8613" layer="51" rot="R270"/>
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
<package name="LXES2BAA4">
<wire x1="1.5" y1="0.5" x2="1.5" y2="-0.2" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-0.2" x2="1.5" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-0.5" x2="-1.5" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="-1.5" y1="-0.5" x2="-1.5" y2="-0.2" width="0.2032" layer="51"/>
<wire x1="-1.5" y1="-0.2" x2="-1.5" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1.5" y1="0.5" x2="1.5" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1.5" y1="-0.2" x2="-1.5" y2="-0.2" width="0.2032" layer="51"/>
<circle x="-2.032" y="-1.27" radius="0.254" width="0.381" layer="21"/>
<smd name="2" x="0" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="5" x="0" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="1" x="-0.95" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="3" x="0.95" y="-1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="6" x="-0.95" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<smd name="4" x="0.95" y="1.25" dx="0.6" dy="1.1" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
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
<circle x="-3.302" y="-2.54" radius="0.254" width="0.381" layer="21"/>
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
<symbol name="REGULATOR">
<wire x1="-7.62" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="2.54" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IN" x="-10.16" y="5.08" length="short"/>
<pin name="OUT" x="10.16" y="5.08" length="short" rot="R180"/>
<pin name="GND" x="0" y="-7.62" length="short" rot="R90"/>
</symbol>
<symbol name="ATXMEGA_A3U">
<pin name="PA0/ADCA0/AREF" x="-33.02" y="40.64" length="middle"/>
<pin name="PA1/ADCA1" x="-33.02" y="38.1" length="middle"/>
<pin name="PA2/ADCA2" x="-33.02" y="35.56" length="middle"/>
<pin name="PA3/ADCA3" x="-33.02" y="33.02" length="middle"/>
<pin name="PA4/ADCA4" x="-33.02" y="30.48" length="middle"/>
<pin name="PA5/ADCA5" x="-33.02" y="27.94" length="middle"/>
<pin name="PA6/ADCA6" x="-33.02" y="25.4" length="middle"/>
<pin name="PA7/ADCA7" x="-33.02" y="22.86" length="middle"/>
<pin name="VCC@0" x="2.54" y="53.34" length="middle" rot="R270"/>
<pin name="GND@0" x="0" y="-53.34" length="middle" rot="R90"/>
<pin name="PB0/ADCB0/AREF" x="-33.02" y="17.78" length="middle"/>
<pin name="PB1/ADCB1" x="-33.02" y="15.24" length="middle"/>
<pin name="PB2/ADCB2/DAC0" x="-33.02" y="12.7" length="middle"/>
<pin name="PB3/ADCB3/DAC1" x="-33.02" y="10.16" length="middle"/>
<pin name="PB4/ADCB4/TMS" x="-33.02" y="7.62" length="middle"/>
<pin name="PB5/ADCB5/TDI" x="-33.02" y="5.08" length="middle"/>
<pin name="PB6/ADCB6/TCK" x="-33.02" y="2.54" length="middle"/>
<pin name="PB7/ADCB7/TDO" x="-33.02" y="0" length="middle"/>
<pin name="PC0/OC0A/SDA" x="-33.02" y="-5.08" length="middle"/>
<pin name="PC1/OC0B/XCK0/SCL" x="-33.02" y="-7.62" length="middle"/>
<pin name="PC2/OC0C/RXD0" x="-33.02" y="-10.16" length="middle"/>
<pin name="PC3/OC0D/TXD0" x="-33.02" y="-12.7" length="middle"/>
<pin name="PC4/OC1A/\S\S" x="-33.02" y="-15.24" length="middle"/>
<pin name="PC5/OC1B/XCK1/MOSI" x="-33.02" y="-17.78" length="middle"/>
<pin name="PC6/RXD1/MISO" x="-33.02" y="-20.32" length="middle"/>
<pin name="PC7/TXD1/SCK" x="-33.02" y="-22.86" length="middle"/>
<pin name="GND@1" x="2.54" y="-53.34" length="middle" rot="R90"/>
<pin name="GND@2" x="5.08" y="-53.34" length="middle" rot="R90"/>
<pin name="GND@3" x="7.62" y="-53.34" length="middle" rot="R90"/>
<pin name="GND@4" x="10.16" y="-53.34" length="middle" rot="R90"/>
<pin name="GND@5" x="12.7" y="-53.34" length="middle" rot="R90"/>
<pin name="AVCC@0" x="20.32" y="53.34" length="middle" rot="R270"/>
<pin name="PD0/OC0A" x="-33.02" y="-27.94" length="middle"/>
<pin name="PD1/OC0B/XCK0" x="-33.02" y="-30.48" length="middle"/>
<pin name="PD2/OC0C/RXD0" x="-33.02" y="-33.02" length="middle"/>
<pin name="PD3/OC0D/TXD0" x="-33.02" y="-35.56" length="middle"/>
<pin name="PD4/OC1A/\S\S" x="-33.02" y="-38.1" length="middle"/>
<pin name="PD5/OC1B/XCK1/MOSI" x="-33.02" y="-40.64" length="middle"/>
<pin name="PD6/RXD1/MISO/D-" x="-33.02" y="-43.18" length="middle"/>
<pin name="PD7/TXD1/SCK/D+" x="-33.02" y="-45.72" length="middle"/>
<pin name="SDA/OC0A/PE0" x="30.48" y="33.02" length="middle" rot="R180"/>
<pin name="SCL/XCK0/OC0B/PE1" x="30.48" y="30.48" length="middle" rot="R180"/>
<pin name="RXD0/OC0C/PE2" x="30.48" y="27.94" length="middle" rot="R180"/>
<pin name="TXD0/OC0D/PE3" x="30.48" y="25.4" length="middle" rot="R180"/>
<pin name="\S\S/OC1A/PE4" x="30.48" y="22.86" length="middle" rot="R180"/>
<pin name="MOSI/XCK1/OC1B/PE5" x="30.48" y="20.32" length="middle" rot="R180"/>
<pin name="MISO/RXD1/PE6" x="30.48" y="17.78" length="middle" rot="R180"/>
<pin name="SCK/TXD1/PE7" x="30.48" y="15.24" length="middle" rot="R180"/>
<pin name="OC0A/PF0" x="30.48" y="10.16" length="middle" rot="R180"/>
<pin name="XCK0/OC0B/PF1" x="30.48" y="7.62" length="middle" rot="R180"/>
<pin name="RXD0/OC0C/PF2" x="30.48" y="5.08" length="middle" rot="R180"/>
<pin name="TXD0/OC0D/PF3" x="30.48" y="2.54" length="middle" rot="R180"/>
<pin name="PF4" x="30.48" y="0" length="middle" rot="R180"/>
<pin name="PF5" x="30.48" y="-2.54" length="middle" rot="R180"/>
<pin name="PF6" x="30.48" y="-5.08" length="middle" rot="R180"/>
<pin name="PF7" x="30.48" y="-7.62" length="middle" rot="R180"/>
<pin name="PDI" x="30.48" y="-20.32" length="middle" rot="R180"/>
<pin name="/RESET" x="30.48" y="-22.86" length="middle" rot="R180"/>
<pin name="PR0/XTAL2" x="30.48" y="-25.4" length="middle" rot="R180"/>
<pin name="PR1/XTAL1" x="30.48" y="-27.94" length="middle" rot="R180"/>
<wire x1="-27.94" y1="48.26" x2="25.4" y2="48.26" width="0.254" layer="94"/>
<wire x1="25.4" y1="48.26" x2="25.4" y2="-48.26" width="0.254" layer="94"/>
<wire x1="25.4" y1="-48.26" x2="-27.94" y2="-48.26" width="0.254" layer="94"/>
<wire x1="-27.94" y1="-48.26" x2="-27.94" y2="48.26" width="0.254" layer="94"/>
<pin name="VCC@1" x="5.08" y="53.34" length="middle" rot="R270"/>
<pin name="VCC@2" x="7.62" y="53.34" length="middle" rot="R270"/>
<pin name="VCC@3" x="10.16" y="53.34" length="middle" rot="R270"/>
<pin name="VCC@4" x="12.7" y="53.34" length="middle" rot="R270"/>
<text x="-27.94" y="49.53" size="1.778" layer="95">&gt;NAME</text>
<text x="-27.94" y="-50.8" size="1.778" layer="96">&gt;VALUE</text>
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
<symbol name="LXES2SBAA4">
<wire x1="-10.16" y1="-10.16" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<text x="-10.16" y="11.43" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-10.16" y="-12.7" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VCC" x="-12.7" y="7.62" length="short"/>
<pin name="DATA@0" x="-12.7" y="5.08" length="short"/>
<pin name="GND" x="7.62" y="-12.7" length="short" rot="R90"/>
<pin name="DATA@1" x="-12.7" y="2.54" length="short"/>
<pin name="DATA@2" x="-12.7" y="0" length="short"/>
<pin name="DATA@3" x="-12.7" y="-2.54" length="short"/>
<wire x1="-2.54" y1="7.62" x2="0" y2="7.62" width="0.254" layer="97"/>
<wire x1="0" y1="7.62" x2="0" y2="8.636" width="0.254" layer="97"/>
<wire x1="0" y1="8.636" x2="1.016" y2="7.62" width="0.254" layer="97"/>
<wire x1="1.016" y1="7.62" x2="0" y2="6.604" width="0.254" layer="97"/>
<wire x1="0" y1="6.604" x2="0" y2="7.62" width="0.254" layer="97"/>
<wire x1="1.016" y1="8.636" x2="1.016" y2="7.62" width="0.254" layer="97"/>
<wire x1="1.016" y1="7.62" x2="1.016" y2="6.604" width="0.254" layer="97"/>
<wire x1="1.016" y1="7.62" x2="3.556" y2="7.62" width="0.254" layer="97"/>
<wire x1="3.556" y1="7.62" x2="7.62" y2="7.62" width="0.254" layer="97"/>
<wire x1="7.62" y1="7.62" x2="7.62" y2="5.334" width="0.254" layer="97"/>
<wire x1="7.62" y1="5.334" x2="6.858" y2="4.572" width="0.254" layer="97"/>
<wire x1="6.858" y1="4.572" x2="7.62" y2="4.572" width="0.254" layer="97"/>
<wire x1="7.62" y1="4.572" x2="8.382" y2="4.572" width="0.254" layer="97"/>
<wire x1="8.382" y1="4.572" x2="7.62" y2="5.334" width="0.254" layer="97"/>
<wire x1="6.604" y1="5.08" x2="6.858" y2="5.334" width="0.254" layer="97"/>
<wire x1="6.858" y1="5.334" x2="8.382" y2="5.334" width="0.254" layer="97"/>
<wire x1="8.382" y1="5.334" x2="8.636" y2="5.588" width="0.254" layer="97"/>
<wire x1="7.62" y1="4.572" x2="7.62" y2="-2.286" width="0.254" layer="97"/>
<wire x1="7.62" y1="-2.286" x2="7.62" y2="-3.048" width="0.254" layer="97"/>
<wire x1="3.556" y1="7.62" x2="3.556" y2="6.35" width="0.254" layer="97"/>
<wire x1="3.556" y1="6.35" x2="2.794" y2="5.588" width="0.254" layer="97"/>
<wire x1="2.794" y1="5.588" x2="3.556" y2="5.588" width="0.254" layer="97"/>
<wire x1="3.556" y1="5.588" x2="4.318" y2="5.588" width="0.254" layer="97"/>
<wire x1="4.318" y1="5.588" x2="3.556" y2="6.35" width="0.254" layer="97"/>
<wire x1="2.794" y1="6.35" x2="4.318" y2="6.35" width="0.254" layer="97"/>
<wire x1="3.556" y1="5.588" x2="3.556" y2="4.826" width="0.254" layer="97"/>
<wire x1="3.556" y1="4.826" x2="1.27" y2="4.826" width="0.254" layer="97"/>
<wire x1="3.556" y1="4.826" x2="3.556" y2="-0.762" width="0.254" layer="97"/>
<wire x1="3.556" y1="-0.762" x2="2.794" y2="-1.524" width="0.254" layer="97"/>
<wire x1="2.794" y1="-1.524" x2="3.556" y2="-1.524" width="0.254" layer="97"/>
<wire x1="3.556" y1="-1.524" x2="4.318" y2="-1.524" width="0.254" layer="97"/>
<wire x1="4.318" y1="-1.524" x2="3.556" y2="-0.762" width="0.254" layer="97"/>
<wire x1="2.794" y1="-0.762" x2="3.556" y2="-0.762" width="0.254" layer="97"/>
<wire x1="3.556" y1="-0.762" x2="4.318" y2="-0.762" width="0.254" layer="97"/>
<wire x1="3.556" y1="-1.524" x2="3.556" y2="-2.286" width="0.254" layer="97"/>
<wire x1="3.556" y1="-2.286" x2="7.62" y2="-2.286" width="0.254" layer="97"/>
<text x="2.794" y="3.556" size="1.27" layer="97" rot="R180">...</text>
<text x="2.794" y="1.016" size="1.27" layer="97" rot="R180">...</text>
<text x="2.794" y="-1.524" size="1.27" layer="97" rot="R180">...</text>
</symbol>
<symbol name="LM4871">
<pin name="+IN" x="-15.24" y="2.54" length="middle"/>
<pin name="-IN" x="-15.24" y="7.62" length="middle"/>
<pin name="BYPASS" x="-15.24" y="-2.54" length="middle"/>
<pin name="SHUTDOWN" x="-15.24" y="-15.24" length="middle"/>
<pin name="VO2" x="22.86" y="-7.62" length="middle" rot="R180"/>
<pin name="VO1" x="22.86" y="2.54" length="middle" rot="R180"/>
<pin name="VDD" x="10.16" y="17.78" length="middle" rot="R270"/>
<pin name="GND" x="10.16" y="-22.86" length="middle" rot="R90"/>
<wire x1="-10.16" y1="-17.78" x2="17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="17.78" y1="-17.78" x2="17.78" y2="12.7" width="0.254" layer="94"/>
<wire x1="17.78" y1="12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="-17.78" width="0.254" layer="94"/>
<text x="-10.16" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<text x="-10.16" y="12.7" size="1.778" layer="95">&gt;NAME</text>
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
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
<technology name="E">
<attribute name="RS" value="415-2105 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="OKI-78SR" prefix="IC">
<description>1.5A, 7-36V DC regulator</description>
<gates>
<gate name="G$1" symbol="REGULATOR" x="0" y="0"/>
</gates>
<devices>
<device name="-3.3/1.5-W36H-C" package="OKI78SR-HORIZONTAL">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-5/1.5-W36H-C" package="OKI78SR-HORIZONTAL">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-3.3/1.5-W36-C" package="OKI78SR-VERTICAL">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-5/1.5-W36-C" package="OKI78SR-VERTICAL">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ATXMEGA256A3U">
<gates>
<gate name="G$1" symbol="ATXMEGA_A3U" x="0" y="0"/>
</gates>
<devices>
<device name="-AU" package="TQFP64">
<connects>
<connect gate="G$1" pin="/RESET" pad="57"/>
<connect gate="G$1" pin="AVCC@0" pad="61"/>
<connect gate="G$1" pin="GND@0" pad="60"/>
<connect gate="G$1" pin="GND@1" pad="14"/>
<connect gate="G$1" pin="GND@2" pad="24"/>
<connect gate="G$1" pin="GND@3" pad="34"/>
<connect gate="G$1" pin="GND@4" pad="44"/>
<connect gate="G$1" pin="GND@5" pad="52"/>
<connect gate="G$1" pin="MISO/RXD1/PE6" pad="42"/>
<connect gate="G$1" pin="MOSI/XCK1/OC1B/PE5" pad="41"/>
<connect gate="G$1" pin="OC0A/PF0" pad="46"/>
<connect gate="G$1" pin="PA0/ADCA0/AREF" pad="62"/>
<connect gate="G$1" pin="PA1/ADCA1" pad="63"/>
<connect gate="G$1" pin="PA2/ADCA2" pad="64"/>
<connect gate="G$1" pin="PA3/ADCA3" pad="1"/>
<connect gate="G$1" pin="PA4/ADCA4" pad="2"/>
<connect gate="G$1" pin="PA5/ADCA5" pad="3"/>
<connect gate="G$1" pin="PA6/ADCA6" pad="4"/>
<connect gate="G$1" pin="PA7/ADCA7" pad="5"/>
<connect gate="G$1" pin="PB0/ADCB0/AREF" pad="6"/>
<connect gate="G$1" pin="PB1/ADCB1" pad="7"/>
<connect gate="G$1" pin="PB2/ADCB2/DAC0" pad="8"/>
<connect gate="G$1" pin="PB3/ADCB3/DAC1" pad="9"/>
<connect gate="G$1" pin="PB4/ADCB4/TMS" pad="10"/>
<connect gate="G$1" pin="PB5/ADCB5/TDI" pad="11"/>
<connect gate="G$1" pin="PB6/ADCB6/TCK" pad="12"/>
<connect gate="G$1" pin="PB7/ADCB7/TDO" pad="13"/>
<connect gate="G$1" pin="PC0/OC0A/SDA" pad="16"/>
<connect gate="G$1" pin="PC1/OC0B/XCK0/SCL" pad="17"/>
<connect gate="G$1" pin="PC2/OC0C/RXD0" pad="18"/>
<connect gate="G$1" pin="PC3/OC0D/TXD0" pad="19"/>
<connect gate="G$1" pin="PC4/OC1A/\S\S" pad="20"/>
<connect gate="G$1" pin="PC5/OC1B/XCK1/MOSI" pad="21"/>
<connect gate="G$1" pin="PC6/RXD1/MISO" pad="22"/>
<connect gate="G$1" pin="PC7/TXD1/SCK" pad="23"/>
<connect gate="G$1" pin="PD0/OC0A" pad="26"/>
<connect gate="G$1" pin="PD1/OC0B/XCK0" pad="27"/>
<connect gate="G$1" pin="PD2/OC0C/RXD0" pad="28"/>
<connect gate="G$1" pin="PD3/OC0D/TXD0" pad="29"/>
<connect gate="G$1" pin="PD4/OC1A/\S\S" pad="30"/>
<connect gate="G$1" pin="PD5/OC1B/XCK1/MOSI" pad="31"/>
<connect gate="G$1" pin="PD6/RXD1/MISO/D-" pad="32"/>
<connect gate="G$1" pin="PD7/TXD1/SCK/D+" pad="33"/>
<connect gate="G$1" pin="PDI" pad="56"/>
<connect gate="G$1" pin="PF4" pad="50"/>
<connect gate="G$1" pin="PF5" pad="51"/>
<connect gate="G$1" pin="PF6" pad="54"/>
<connect gate="G$1" pin="PF7" pad="55"/>
<connect gate="G$1" pin="PR0/XTAL2" pad="58"/>
<connect gate="G$1" pin="PR1/XTAL1" pad="59"/>
<connect gate="G$1" pin="RXD0/OC0C/PE2" pad="38"/>
<connect gate="G$1" pin="RXD0/OC0C/PF2" pad="48"/>
<connect gate="G$1" pin="SCK/TXD1/PE7" pad="43"/>
<connect gate="G$1" pin="SCL/XCK0/OC0B/PE1" pad="37"/>
<connect gate="G$1" pin="SDA/OC0A/PE0" pad="36"/>
<connect gate="G$1" pin="TXD0/OC0D/PE3" pad="39"/>
<connect gate="G$1" pin="TXD0/OC0D/PF3" pad="49"/>
<connect gate="G$1" pin="VCC@0" pad="15"/>
<connect gate="G$1" pin="VCC@1" pad="25"/>
<connect gate="G$1" pin="VCC@2" pad="35"/>
<connect gate="G$1" pin="VCC@3" pad="45"/>
<connect gate="G$1" pin="VCC@4" pad="53"/>
<connect gate="G$1" pin="XCK0/OC0B/PF1" pad="47"/>
<connect gate="G$1" pin="\S\S/OC1A/PE4" pad="40"/>
</connects>
<technologies>
<technology name="">
<attribute name="FARNELL" value="2066307" constant="no"/>
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
<deviceset name="LXES2SBAA4-016" prefix="IC" uservalue="yes">
<gates>
<gate name="G$1" symbol="LXES2SBAA4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LXES2BAA4">
<connects>
<connect gate="G$1" pin="DATA@0" pad="1"/>
<connect gate="G$1" pin="DATA@1" pad="3"/>
<connect gate="G$1" pin="DATA@2" pad="4"/>
<connect gate="G$1" pin="DATA@3" pad="6"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VCC" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM4871" prefix="IC">
<gates>
<gate name="G$1" symbol="LM4871" x="0" y="0"/>
</gates>
<devices>
<device name="M" package="SO8">
<connects>
<connect gate="G$1" pin="+IN" pad="3"/>
<connect gate="G$1" pin="-IN" pad="4"/>
<connect gate="G$1" pin="BYPASS" pad="2"/>
<connect gate="G$1" pin="GND" pad="7"/>
<connect gate="G$1" pin="SHUTDOWN" pad="1"/>
<connect gate="G$1" pin="VDD" pad="6"/>
<connect gate="G$1" pin="VO1" pad="5"/>
<connect gate="G$1" pin="VO2" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="533-8271 " constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="maxstream">
<description>&lt;b&gt;MaxSream&lt;/b&gt; XBee Products&lt;p&gt;
http://www.maxstream.net</description>
<packages>
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
</packages>
<symbols>
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
</symbols>
<devicesets>
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
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="XBP24-AWI-001" constant="no"/>
<attribute name="OC_FARNELL" value="1337916" constant="no"/>
<attribute name="OC_NEWARK" value="42M2667" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor-neu-to92">
<description>&lt;b&gt;NPN Transistors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TO3">
<description>&lt;b&gt;TO-3&lt;/b&gt;</description>
<wire x1="6.3754" y1="-10.9982" x2="17.3736" y2="-4.5212" width="0.1524" layer="21"/>
<wire x1="5.969" y1="11.2014" x2="17.3736" y2="4.5212" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="10.9982" x2="-17.272" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-5.9436" y1="-11.2268" x2="-17.2466" y2="-4.5974" width="0.1524" layer="21"/>
<wire x1="17.3366" y1="4.545" x2="19.812" y2="0" width="0.1524" layer="21" curve="-57.148737"/>
<wire x1="17.3366" y1="-4.545" x2="19.812" y2="0" width="0.1524" layer="21" curve="57.148737"/>
<wire x1="-19.812" y1="0" x2="-17.0927" y2="4.6935" width="0.1524" layer="21" curve="-60.173068"/>
<wire x1="-19.812" y1="0" x2="-17.1555" y2="-4.657" width="0.1524" layer="21" curve="59.404169"/>
<wire x1="0" y1="-12.7" x2="6.3718" y2="-10.9859" width="0.1524" layer="21" curve="30.113639"/>
<wire x1="-5.9765" y1="-11.2059" x2="0" y2="-12.7" width="0.1524" layer="21" curve="28.0726"/>
<wire x1="-6.3718" y1="10.9859" x2="0" y2="12.7" width="0.1524" layer="21" curve="-30.113639"/>
<wire x1="0" y1="12.7" x2="5.9765" y2="11.2059" width="0.1524" layer="21" curve="-28.0726"/>
<circle x="0" y="0" radius="9.3726" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="11.684" width="0.0508" layer="21"/>
<circle x="15.113" y="0" radius="2.159" width="0.1524" layer="51"/>
<circle x="-15.113" y="0" radius="2.159" width="0.1524" layer="51"/>
<pad name="E" x="-1.778" y="-5.461" drill="1.1938" diameter="3.1496" shape="long"/>
<pad name="B" x="-1.778" y="5.461" drill="1.1938" diameter="3.1496" shape="long"/>
<pad name="C" x="15.113" y="0" drill="4.1148" diameter="6.477"/>
<pad name="C/" x="-15.113" y="0" drill="4.1148" diameter="6.477"/>
<text x="-5.08" y="1.27" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="15.24" y="-4.953" size="1.27" layer="51" ratio="10" rot="R90">C</text>
<text x="-3.81" y="-6.223" size="1.27" layer="51" ratio="10" rot="R90">E</text>
<text x="-3.81" y="4.572" size="1.27" layer="51" ratio="10" rot="R90">B</text>
</package>
<package name="TO18">
<description>&lt;b&gt;TO 18&lt;/b&gt;</description>
<wire x1="0.9289" y1="2.227" x2="2.227" y2="0.9289" width="0.0508" layer="51" curve="-44.717164"/>
<wire x1="0.9289" y1="-2.227" x2="2.227" y2="-0.9289" width="0.0508" layer="51" curve="44.717164"/>
<wire x1="-3.937" y1="-0.508" x2="-3.937" y2="0.508" width="0.127" layer="21"/>
<wire x1="-2.227" y1="-0.9289" x2="0.929" y2="2.2271" width="0.0508" layer="21" curve="-135.281008"/>
<wire x1="-2.227" y1="-0.9289" x2="-0.9289" y2="-2.227" width="0.0508" layer="51" curve="44.717164"/>
<wire x1="-3.937" y1="-0.508" x2="-2.8765" y2="-0.508" width="0.127" layer="21"/>
<wire x1="-0.9289" y1="-2.227" x2="0.9289" y2="-2.227" width="0.0508" layer="21" curve="45.282836"/>
<wire x1="-3.937" y1="0.508" x2="-2.8765" y2="0.508" width="0.127" layer="21"/>
<wire x1="2.227" y1="-0.9289" x2="2.227" y2="0.9289" width="0.0508" layer="21" curve="45.282836"/>
<circle x="0" y="0" radius="2.921" width="0.127" layer="21"/>
<pad name="1" x="-1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<pad name="3" x="1.27" y="1.27" drill="0.8128" shape="octagon"/>
<text x="3.175" y="0" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.905" y="-1.27" size="1.27" layer="51" ratio="10">1</text>
<text x="0.635" y="-1.27" size="1.27" layer="51" ratio="10">2</text>
<text x="0" y="0.635" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="TO18-">
<description>&lt;b&gt;TO-18&lt;/b&gt;</description>
<wire x1="-2.2098" y1="-0.9692" x2="2.2098" y2="-0.9692" width="0.0508" layer="21" curve="132.636282"/>
<wire x1="-0.9692" y1="2.2098" x2="0.9692" y2="2.2098" width="0.0508" layer="51" curve="-47.363718"/>
<wire x1="-2.2098" y1="0.9692" x2="-2.2098" y2="-0.9692" width="0.0508" layer="51" curve="47.363718"/>
<wire x1="-2.2098" y1="0.9692" x2="-0.9692" y2="2.2098" width="0.0508" layer="21" curve="-42.636282"/>
<wire x1="2.2098" y1="-0.9692" x2="2.2098" y2="0.9692" width="0.0508" layer="51" curve="47.363718"/>
<wire x1="1.649" y1="-2.411" x2="2.413" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.411" y1="-1.649" x2="3.175" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-3.175" x2="3.175" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="0.9692" y1="2.2098" x2="2.2098" y2="0.9692" width="0.0508" layer="21" curve="-42.636282"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<pad name="1" x="1.905" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="0" y="1.905" drill="0.8128" shape="octagon"/>
<pad name="3" x="-1.905" y="0" drill="0.8128" shape="octagon"/>
<text x="3.302" y="0.381" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.302" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="1.016" y="-1.143" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.508" y="0.635" size="1.27" layer="51" ratio="10">2</text>
<text x="-1.905" y="-1.27" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="TO202">
<description>&lt;b&gt;TO 202 horizontal&lt;/b&gt;</description>
<wire x1="-5.207" y1="-1.27" x2="-5.207" y2="7.3406" width="0.127" layer="21"/>
<wire x1="-3.5052" y1="7.3406" x2="-3.5052" y2="8.8138" width="0.127" layer="21"/>
<wire x1="-3.5052" y1="8.8138" x2="-5.207" y2="8.8138" width="0.127" layer="21"/>
<wire x1="5.207" y1="8.8138" x2="3.5052" y2="8.8138" width="0.127" layer="21"/>
<wire x1="3.5052" y1="8.8138" x2="3.5052" y2="7.3406" width="0.127" layer="21"/>
<wire x1="5.2578" y1="-1.27" x2="5.2578" y2="7.3406" width="0.127" layer="21"/>
<wire x1="-5.207" y1="7.3406" x2="-3.5052" y2="7.3406" width="0.127" layer="21"/>
<wire x1="3.8354" y1="-1.27" x2="3.8354" y2="7.3406" width="0.127" layer="21"/>
<wire x1="-5.207" y1="-1.27" x2="3.8354" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.207" y1="21.717" x2="5.207" y2="8.8138" width="0.127" layer="21"/>
<wire x1="5.207" y1="21.717" x2="-5.207" y2="21.717" width="0.127" layer="21"/>
<wire x1="-5.207" y1="21.717" x2="-5.207" y2="8.8138" width="0.127" layer="21"/>
<wire x1="-3.5052" y1="7.3406" x2="3.5052" y2="7.3406" width="0.127" layer="21"/>
<wire x1="3.8354" y1="-1.27" x2="5.2578" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.8354" y1="7.3406" x2="5.2578" y2="7.3406" width="0.127" layer="21"/>
<wire x1="3.5052" y1="7.3406" x2="3.8354" y2="7.3406" width="0.127" layer="21"/>
<wire x1="-4.953" y1="-1.016" x2="4.953" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="4.953" y1="7.112" x2="4.953" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="4.953" y1="7.112" x2="-4.953" y2="7.112" width="0.0508" layer="21"/>
<wire x1="-4.953" y1="-1.016" x2="-4.953" y2="7.112" width="0.0508" layer="21"/>
<circle x="-3.7592" y="-0.2286" radius="0.4318" width="0" layer="21"/>
<circle x="0" y="17.78" radius="1.651" width="0.127" layer="21"/>
<circle x="0" y="17.78" radius="4.191" width="0" layer="42"/>
<circle x="0" y="17.78" radius="4.191" width="0" layer="43"/>
<pad name="1" x="-2.54" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<text x="-2.54" y="4.318" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-2.54" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-0.635" y="-0.635" size="1.27" layer="21" ratio="10">2</text>
<text x="1.905" y="-0.635" size="1.27" layer="21" ratio="10">3</text>
<rectangle x1="-0.635" y1="-2.54" x2="0.635" y2="-1.27" layer="21"/>
<rectangle x1="1.905" y1="-2.54" x2="3.175" y2="-1.27" layer="21"/>
<rectangle x1="-3.175" y1="-2.54" x2="-1.905" y2="-1.27" layer="21"/>
<rectangle x1="2.159" y1="-3.429" x2="2.921" y2="-2.54" layer="21"/>
<rectangle x1="2.159" y1="-5.08" x2="2.921" y2="-3.429" layer="51"/>
<rectangle x1="-0.381" y1="-3.429" x2="0.381" y2="-2.54" layer="21"/>
<rectangle x1="-2.921" y1="-3.429" x2="-2.159" y2="-2.54" layer="21"/>
<rectangle x1="-0.381" y1="-5.08" x2="0.381" y2="-3.429" layer="51"/>
<rectangle x1="-2.921" y1="-5.08" x2="-2.159" y2="-3.429" layer="51"/>
<hole x="0" y="17.78" drill="3.302"/>
</package>
<package name="TO202V">
<description>&lt;b&gt;TO 202 vertical&lt;/b&gt;</description>
<wire x1="-4.826" y1="-4.7498" x2="2.794" y2="-4.7498" width="0.127" layer="21"/>
<wire x1="-4.826" y1="-0.127" x2="4.8006" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.794" y1="-4.7498" x2="4.8006" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-4.826" y1="-4.7498" x2="-4.826" y2="-0.127" width="0.127" layer="21"/>
<wire x1="4.8006" y1="-0.127" x2="4.8006" y2="-2.794" width="0.127" layer="21"/>
<circle x="-4.064" y="-3.9878" radius="0.4318" width="0.127" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="1.1176" shape="long" rot="R90"/>
<text x="-4.445" y="-6.985" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-8.89" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.175" y="-1.905" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="-1.905" size="1.27" layer="51" ratio="10">2</text>
<text x="1.905" y="-1.905" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="3.429" y1="-2.794" x2="4.826" y2="-2.286" layer="21"/>
<rectangle x1="0.889" y1="-2.794" x2="1.651" y2="-2.286" layer="21"/>
<rectangle x1="-1.651" y1="-2.794" x2="-0.889" y2="-2.286" layer="21"/>
<rectangle x1="-4.826" y1="-2.794" x2="-3.429" y2="-2.286" layer="21"/>
<rectangle x1="-3.429" y1="-2.794" x2="-1.651" y2="-2.286" layer="51"/>
<rectangle x1="-0.889" y1="-2.794" x2="0.889" y2="-2.286" layer="51"/>
<rectangle x1="1.651" y1="-2.794" x2="3.429" y2="-2.286" layer="51"/>
</package>
<package name="SOT93">
<description>SOT-93&lt;p&gt;
grid 5.45 mm</description>
<wire x1="-7.62" y1="-6.35" x2="7.62" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.223" x2="7.62" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.223" x2="6.985" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-6.35" x2="-7.62" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="6.223" x2="-6.985" y2="6.985" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="6.223" x2="-7.62" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="6.985" x2="-7.62" y2="6.985" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="6.985" x2="-7.62" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="9.525" x2="-3.1242" y2="13.3096" width="0.1524" layer="21"/>
<wire x1="6.985" y1="6.223" x2="6.985" y2="6.985" width="0.1524" layer="21"/>
<wire x1="6.985" y1="6.223" x2="-6.985" y2="6.223" width="0.1524" layer="21"/>
<wire x1="6.985" y1="6.985" x2="7.62" y2="6.985" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.985" x2="7.62" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-5.715" x2="6.985" y2="-5.715" width="0.0508" layer="21"/>
<wire x1="6.985" y1="5.715" x2="6.985" y2="-5.715" width="0.0508" layer="21"/>
<wire x1="6.985" y1="5.715" x2="-6.985" y2="5.715" width="0.0508" layer="21"/>
<wire x1="-6.985" y1="-5.715" x2="-6.985" y2="5.715" width="0.0508" layer="21"/>
<wire x1="0" y1="14.605" x2="3.1431" y2="13.3031" width="0.1524" layer="21" curve="-45.000078"/>
<wire x1="-3.1431" y1="13.3031" x2="0" y2="14.605" width="0.1524" layer="21" curve="-45.000078"/>
<wire x1="7.62" y1="9.525" x2="3.1242" y2="13.335" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-5.715" x2="7.62" y2="-6.35" width="0.0508" layer="51"/>
<wire x1="6.985" y1="5.715" x2="7.62" y2="6.35" width="0.0508" layer="51"/>
<wire x1="-6.985" y1="5.715" x2="-7.62" y2="6.35" width="0.0508" layer="51"/>
<wire x1="-6.985" y1="-5.715" x2="-7.62" y2="-6.35" width="0.0508" layer="51"/>
<circle x="0" y="10.16" radius="2.159" width="0.1524" layer="21"/>
<circle x="0" y="10.16" radius="5.08" width="0" layer="42"/>
<circle x="0" y="10.16" radius="5.08" width="0" layer="43"/>
<pad name="B" x="-5.461" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<pad name="C" x="0" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<pad name="E" x="5.461" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<text x="-5.08" y="2.54" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="0" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.477" y="6.604" size="1.016" layer="21" ratio="10">A20,3mm</text>
<rectangle x1="-6.096" y1="-7.366" x2="-4.318" y2="-6.35" layer="21"/>
<rectangle x1="4.318" y1="-7.366" x2="6.096" y2="-6.35" layer="21"/>
<rectangle x1="-1.143" y1="-7.366" x2="1.143" y2="-6.35" layer="21"/>
<rectangle x1="-6.096" y1="-8.128" x2="-4.826" y2="-6.35" layer="21"/>
<rectangle x1="-0.635" y1="-8.128" x2="0.635" y2="-6.35" layer="21"/>
<rectangle x1="4.826" y1="-8.128" x2="6.096" y2="-6.35" layer="21"/>
<rectangle x1="-6.096" y1="-10.287" x2="-4.826" y2="-8.128" layer="51"/>
<rectangle x1="-0.635" y1="-10.287" x2="0.635" y2="-8.128" layer="51"/>
<rectangle x1="4.826" y1="-10.287" x2="6.096" y2="-8.128" layer="51"/>
<hole x="0" y="10.16" drill="4.1148"/>
</package>
<package name="SOT93V">
<description>SOT-93&lt;p&gt;
grid 5.45 mm</description>
<wire x1="7.62" y1="-2.032" x2="3.429" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-2.032" x2="2.032" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.032" x2="-2.032" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="-2.032" x2="-3.429" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.032" x2="-7.62" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-7.62" y1="0" x2="7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="-5.08" x2="7.239" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.032" x2="-7.239" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0" x2="7.62" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.032" x2="7.239" y2="-5.08" width="0.1524" layer="21"/>
<pad name="B" x="-5.461" y="-2.54" drill="1.397" shape="long" rot="R90"/>
<pad name="C" x="0" y="-2.54" drill="1.397" shape="long" rot="R90"/>
<pad name="E" x="5.461" y="-2.54" drill="1.397" shape="long" rot="R90"/>
<text x="-1.397" y="-6.858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-7.62" y="-6.858" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="-7.62" y1="-2.032" x2="7.62" y2="0" layer="51"/>
</package>
<package name="TO126">
<description>&lt;b&gt;TO 126 horizontal&lt;/b&gt;</description>
<wire x1="-3.937" y1="-1.27" x2="-3.937" y2="9.144" width="0.127" layer="21"/>
<wire x1="-3.937" y1="9.144" x2="3.937" y2="9.144" width="0.127" layer="21"/>
<wire x1="3.937" y1="9.144" x2="3.937" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-3.937" y1="-1.27" x2="3.937" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.2393" y1="3.1591" x2="1.9493" y2="3.8858" width="0.127" layer="21" curve="25.67749"/>
<wire x1="0.7687" y1="3.6188" x2="1.2393" y2="3.1591" width="0.127" layer="21"/>
<wire x1="-0.7687" y1="3.6188" x2="-1.2393" y2="3.1591" width="0.127" layer="21"/>
<wire x1="-1.4787" y1="4.3456" x2="-1.9493" y2="3.8858" width="0.127" layer="21"/>
<wire x1="-1.9493" y1="3.8858" x2="-1.2393" y2="3.1591" width="0.127" layer="21" curve="25.67749"/>
<wire x1="0.508" y1="6.6509" x2="0.508" y2="7.3088" width="0.127" layer="21"/>
<wire x1="-0.508" y1="6.6509" x2="-0.508" y2="7.3088" width="0.127" layer="21"/>
<wire x1="-0.508" y1="7.3088" x2="0.508" y2="7.3088" width="0.127" layer="21" curve="-25.679633"/>
<wire x1="1.4787" y1="4.3456" x2="1.9493" y2="3.8858" width="0.127" layer="21"/>
<circle x="-3.1242" y="-0.4826" radius="0.4318" width="0" layer="21"/>
<circle x="0" y="5.08" radius="3.81" width="0" layer="42"/>
<circle x="0" y="5.08" radius="3.81" width="0" layer="43"/>
<circle x="0" y="5.08" radius="1.651" width="0.127" layer="21"/>
<pad name="1" x="-2.286" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.286" y="-5.08" drill="1.1176" shape="long" rot="R90"/>
<text x="-2.54" y="7.62" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="1.397" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-2.54" y="-0.889" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.508" y="-0.889" size="1.27" layer="51" ratio="10">2</text>
<text x="1.778" y="-0.889" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-0.635" y1="-3.048" x2="0.635" y2="-1.27" layer="21"/>
<rectangle x1="-2.667" y1="-3.429" x2="-1.905" y2="-1.27" layer="21"/>
<rectangle x1="-2.667" y1="-5.207" x2="-1.905" y2="-3.429" layer="51"/>
<rectangle x1="-0.381" y1="-3.429" x2="0.381" y2="-1.27" layer="21"/>
<rectangle x1="-0.381" y1="-5.207" x2="0.381" y2="-3.429" layer="51"/>
<rectangle x1="1.905" y1="-3.429" x2="2.667" y2="-1.27" layer="21"/>
<rectangle x1="1.905" y1="-5.207" x2="2.667" y2="-3.429" layer="51"/>
<hole x="0" y="5.08" drill="3.302"/>
</package>
<package name="TO126V">
<description>&lt;b&gt;TO 126 vertical&lt;/b&gt;</description>
<wire x1="-3.937" y1="-0.127" x2="-3.937" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-3.937" y1="-1.27" x2="-3.683" y2="-2.794" width="0.127" layer="21"/>
<wire x1="3.683" y1="-2.794" x2="3.937" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.937" y1="-1.27" x2="3.937" y2="-0.127" width="0.127" layer="21"/>
<wire x1="-3.683" y1="-2.794" x2="-2.794" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-2.794" y1="-2.794" x2="-1.778" y2="-2.794" width="0.127" layer="51"/>
<wire x1="-1.778" y1="-2.794" x2="-0.508" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-0.508" y1="-2.794" x2="0.508" y2="-2.794" width="0.127" layer="51"/>
<wire x1="0.508" y1="-2.794" x2="1.778" y2="-2.794" width="0.127" layer="21"/>
<wire x1="1.778" y1="-2.794" x2="2.794" y2="-2.794" width="0.127" layer="51"/>
<wire x1="2.794" y1="-2.794" x2="3.683" y2="-2.794" width="0.127" layer="21"/>
<circle x="-3.175" y="-2.159" radius="0.4064" width="0.127" layer="51"/>
<pad name="1" x="-2.286" y="-1.27" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-1.27" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.286" y="-1.27" drill="1.016" shape="long" rot="R90"/>
<text x="-3.9624" y="-4.5466" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.9878" y="-6.3246" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-2.54" y="-1.905" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.381" y="-1.905" size="1.27" layer="51" ratio="10">2</text>
<text x="2.032" y="-1.905" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-3.937" y1="-0.381" x2="-3.175" y2="0" layer="21"/>
<rectangle x1="-1.397" y1="-0.381" x2="-0.889" y2="0" layer="21"/>
<rectangle x1="0.889" y1="-0.381" x2="1.397" y2="0" layer="21"/>
<rectangle x1="3.175" y1="-0.381" x2="3.937" y2="0" layer="21"/>
<rectangle x1="-3.175" y1="-0.381" x2="-1.397" y2="0" layer="51"/>
<rectangle x1="-0.889" y1="-0.381" x2="0.889" y2="0" layer="51"/>
<rectangle x1="1.397" y1="-0.381" x2="3.175" y2="0" layer="51"/>
</package>
<package name="TO218">
<description>&lt;b&gt;TO 218 horizontal&lt;/b&gt;</description>
<wire x1="-7.62" y1="-6.35" x2="7.62" y2="-6.35" width="0.127" layer="21"/>
<wire x1="7.62" y1="6.223" x2="7.62" y2="0" width="0.127" layer="21"/>
<wire x1="7.62" y1="0" x2="7.62" y2="-3.81" width="0.127" layer="21"/>
<wire x1="7.62" y1="-3.81" x2="7.62" y2="-6.35" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-6.35" x2="-7.62" y2="-3.81" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-3.81" x2="-7.62" y2="0" width="0.127" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="6.223" width="0.127" layer="21"/>
<wire x1="7.62" y1="6.223" x2="-7.62" y2="6.223" width="0.127" layer="21"/>
<wire x1="6.985" y1="5.715" x2="-6.985" y2="5.715" width="0.0508" layer="21"/>
<wire x1="6.985" y1="0.508" x2="6.985" y2="5.715" width="0.0508" layer="21"/>
<wire x1="-6.985" y1="-5.715" x2="6.985" y2="-5.715" width="0.0508" layer="21"/>
<wire x1="7.62" y1="12.065" x2="5.08" y2="14.605" width="0.127" layer="21"/>
<wire x1="7.62" y1="12.065" x2="7.62" y2="6.223" width="0.127" layer="21"/>
<wire x1="5.08" y1="14.605" x2="-5.08" y2="14.605" width="0.127" layer="21"/>
<wire x1="-7.62" y1="12.065" x2="-5.08" y2="14.605" width="0.127" layer="21"/>
<wire x1="-7.62" y1="12.065" x2="-7.62" y2="6.223" width="0.127" layer="21"/>
<wire x1="7.62" y1="0" x2="7.62" y2="-3.81" width="0.127" layer="21" curve="180"/>
<wire x1="6.985" y1="-5.715" x2="6.985" y2="-4.318" width="0.0508" layer="21"/>
<wire x1="6.9522" y1="0.4991" x2="6.9851" y2="-4.3178" width="0.0508" layer="21" curve="149.733471"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-6.985" y1="-5.715" x2="-6.985" y2="-4.318" width="0.0508" layer="21"/>
<wire x1="-6.985" y1="0.508" x2="-6.985" y2="5.715" width="0.0508" layer="21"/>
<wire x1="-6.985" y1="-4.318" x2="-6.985" y2="0.508" width="0.0508" layer="21" curve="150.512874"/>
<circle x="0" y="10.16" radius="2.159" width="0.127" layer="21"/>
<circle x="0" y="10.16" radius="5.08" width="0" layer="42"/>
<circle x="0" y="10.16" radius="5.08" width="0" layer="43"/>
<pad name="1" x="-5.461" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<pad name="2" x="0" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<pad name="3" x="5.461" y="-10.16" drill="1.397" shape="long" rot="R90"/>
<text x="-5.08" y="2.54" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="0" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.08" y="-5.08" size="1.27" layer="21" ratio="10">1</text>
<text x="-0.635" y="-5.08" size="1.27" layer="21" ratio="10">2</text>
<text x="4.445" y="-5.08" size="1.27" layer="21" ratio="10">3</text>
<rectangle x1="-6.096" y1="-7.366" x2="-4.318" y2="-6.35" layer="21"/>
<rectangle x1="4.318" y1="-7.366" x2="6.096" y2="-6.35" layer="21"/>
<rectangle x1="-1.143" y1="-7.366" x2="1.143" y2="-6.35" layer="21"/>
<rectangle x1="-6.096" y1="-8.128" x2="-4.826" y2="-6.35" layer="21"/>
<rectangle x1="-6.096" y1="-10.287" x2="-4.826" y2="-8.128" layer="51"/>
<rectangle x1="-0.635" y1="-8.128" x2="0.635" y2="-6.35" layer="21"/>
<rectangle x1="4.826" y1="-8.128" x2="6.096" y2="-6.35" layer="21"/>
<rectangle x1="-0.635" y1="-10.287" x2="0.635" y2="-8.128" layer="51"/>
<rectangle x1="4.826" y1="-10.287" x2="6.096" y2="-8.128" layer="51"/>
<hole x="0" y="10.16" drill="4.1148"/>
</package>
<package name="TO218V">
<description>&lt;b&gt;TO 218 vertical&lt;/b&gt;</description>
<wire x1="-6.985" y1="-5.08" x2="6.985" y2="-5.08" width="0.127" layer="21"/>
<wire x1="6.985" y1="-5.08" x2="7.366" y2="-4.699" width="0.127" layer="21"/>
<wire x1="7.366" y1="-4.699" x2="7.62" y2="-1.524" width="0.127" layer="21"/>
<wire x1="-6.985" y1="-5.08" x2="-7.366" y2="-4.699" width="0.127" layer="21"/>
<wire x1="-7.366" y1="-4.699" x2="-7.62" y2="-1.524" width="0.127" layer="21"/>
<pad name="1" x="-5.461" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<pad name="3" x="5.461" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<text x="-7.62" y="-6.858" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.016" y="-6.858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.096" y="-4.445" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="-4.445" size="1.27" layer="51" ratio="10">2</text>
<text x="4.826" y="-4.445" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-7.874" y1="-1.143" x2="7.874" y2="0" layer="21"/>
<rectangle x1="-3.556" y1="-2.032" x2="-1.905" y2="-1.143" layer="21"/>
<rectangle x1="1.905" y1="-2.032" x2="3.556" y2="-1.143" layer="21"/>
<rectangle x1="-7.874" y1="-2.032" x2="-7.239" y2="-1.143" layer="21"/>
<rectangle x1="7.239" y1="-2.032" x2="7.874" y2="-1.143" layer="21"/>
<rectangle x1="3.556" y1="-2.032" x2="7.239" y2="-1.143" layer="51"/>
<rectangle x1="-7.239" y1="-2.032" x2="-3.556" y2="-1.143" layer="51"/>
<rectangle x1="-1.905" y1="-2.032" x2="1.905" y2="-1.143" layer="51"/>
</package>
<package name="TO220">
<description>&lt;b&gt;TO 220 horizontal&lt;/b&gt;</description>
<wire x1="-5.207" y1="-1.27" x2="5.207" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.207" y1="14.605" x2="-5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="5.207" y1="-1.27" x2="5.207" y2="11.176" width="0.127" layer="21"/>
<wire x1="5.207" y1="11.176" x2="4.318" y2="11.176" width="0.127" layer="21"/>
<wire x1="4.318" y1="11.176" x2="4.318" y2="12.7" width="0.127" layer="21"/>
<wire x1="4.318" y1="12.7" x2="5.207" y2="12.7" width="0.127" layer="21"/>
<wire x1="5.207" y1="12.7" x2="5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="-5.207" y1="-1.27" x2="-5.207" y2="11.176" width="0.127" layer="21"/>
<wire x1="-5.207" y1="11.176" x2="-4.318" y2="11.176" width="0.127" layer="21"/>
<wire x1="-4.318" y1="11.176" x2="-4.318" y2="12.7" width="0.127" layer="21"/>
<wire x1="-4.318" y1="12.7" x2="-5.207" y2="12.7" width="0.127" layer="21"/>
<wire x1="-5.207" y1="12.7" x2="-5.207" y2="14.605" width="0.127" layer="21"/>
<wire x1="-4.572" y1="-0.635" x2="4.572" y2="-0.635" width="0.0508" layer="21"/>
<wire x1="4.572" y1="7.62" x2="4.572" y2="-0.635" width="0.0508" layer="21"/>
<wire x1="4.572" y1="7.62" x2="-4.572" y2="7.62" width="0.0508" layer="21"/>
<wire x1="-4.572" y1="-0.635" x2="-4.572" y2="7.62" width="0.0508" layer="21"/>
<circle x="0" y="11.176" radius="1.8034" width="0.127" layer="21"/>
<circle x="0" y="11.176" radius="4.191" width="0" layer="42"/>
<circle x="0" y="11.176" radius="4.191" width="0" layer="43"/>
<pad name="1" x="-2.54" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-6.35" drill="1.1176" shape="long" rot="R90"/>
<text x="-3.81" y="5.207" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.937" y="2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.445" y="7.874" size="0.9906" layer="21" ratio="12">A17,5mm</text>
<text x="-3.175" y="0" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="0" size="1.27" layer="51" ratio="10">2</text>
<text x="1.905" y="0" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-4.064" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-4.064" layer="21"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-4.064" layer="21"/>
<rectangle x1="-3.175" y1="-4.064" x2="-1.905" y2="-1.27" layer="21"/>
<rectangle x1="-0.635" y1="-4.064" x2="0.635" y2="-1.27" layer="21"/>
<rectangle x1="1.905" y1="-4.064" x2="3.175" y2="-1.27" layer="21"/>
<rectangle x1="-2.921" y1="-6.604" x2="-2.159" y2="-4.699" layer="51"/>
<rectangle x1="-0.381" y1="-6.604" x2="0.381" y2="-4.699" layer="51"/>
<rectangle x1="2.159" y1="-6.604" x2="2.921" y2="-4.699" layer="51"/>
<hole x="0" y="11.176" drill="3.302"/>
</package>
<package name="TO220V">
<description>&lt;b&gt;TO 220 vertical&lt;/b&gt;</description>
<wire x1="5.08" y1="-1.143" x2="4.953" y2="-4.064" width="0.127" layer="21"/>
<wire x1="4.699" y1="-4.318" x2="4.953" y2="-4.064" width="0.127" layer="21"/>
<wire x1="4.699" y1="-4.318" x2="-4.699" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-4.953" y1="-4.064" x2="-4.699" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-4.953" y1="-4.064" x2="-5.08" y2="-1.143" width="0.127" layer="21"/>
<circle x="-4.4958" y="-3.7084" radius="0.254" width="0.127" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<text x="-5.08" y="-6.0452" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-0.762" x2="5.334" y2="0" layer="21"/>
<rectangle x1="-5.334" y1="-1.27" x2="-3.429" y2="-0.762" layer="21"/>
<rectangle x1="-1.651" y1="-1.27" x2="-0.889" y2="-0.762" layer="21"/>
<rectangle x1="-3.429" y1="-1.27" x2="-1.651" y2="-0.762" layer="51"/>
<rectangle x1="0.889" y1="-1.27" x2="1.651" y2="-0.762" layer="21"/>
<rectangle x1="3.429" y1="-1.27" x2="5.334" y2="-0.762" layer="21"/>
<rectangle x1="-0.889" y1="-1.27" x2="0.889" y2="-0.762" layer="51"/>
<rectangle x1="1.651" y1="-1.27" x2="3.429" y2="-0.762" layer="51"/>
</package>
<package name="TO225AA">
<description>&lt;b&gt;TO-225&lt;/b&gt;&lt;p&gt;
grid 2.54 mm, vertical</description>
<wire x1="-3.4925" y1="-6.985" x2="-3.4925" y2="3.81" width="0.127" layer="21"/>
<wire x1="-3.4925" y1="3.81" x2="3.4925" y2="3.81" width="0.127" layer="21"/>
<wire x1="3.4925" y1="3.81" x2="3.4925" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-3.4925" y1="-6.985" x2="3.4925" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-2.381" y1="-8.096" x2="-2.381" y2="-9.525" width="0.4064" layer="21"/>
<wire x1="0" y1="-7.779" x2="0" y2="-9.525" width="0.4064" layer="21"/>
<wire x1="2.3813" y1="-8.0963" x2="2.381" y2="-9.525" width="0.4064" layer="21"/>
<wire x1="-2.54" y1="3.175" x2="-2.54" y2="-3.334" width="0.127" layer="51"/>
<wire x1="-2.54" y1="-3.334" x2="2.54" y2="-3.334" width="0.127" layer="51"/>
<wire x1="2.54" y1="-3.334" x2="2.54" y2="3.175" width="0.127" layer="51"/>
<wire x1="2.54" y1="3.175" x2="-2.54" y2="3.175" width="0.127" layer="51"/>
<wire x1="-1.949" y1="1.194" x2="-1.2391" y2="1.9206" width="0.127" layer="21" curve="-25.674852"/>
<wire x1="-0.769" y1="1.461" x2="-1.239" y2="1.921" width="0.127" layer="21"/>
<wire x1="0.769" y1="1.461" x2="1.239" y2="1.921" width="0.127" layer="21"/>
<wire x1="1.479" y1="0.734" x2="1.949" y2="1.194" width="0.127" layer="21"/>
<wire x1="1.239" y1="1.921" x2="1.949" y2="1.1944" width="0.127" layer="21" curve="-25.674073"/>
<wire x1="-0.508" y1="-1.571" x2="-0.508" y2="-2.229" width="0.127" layer="21"/>
<wire x1="0.508" y1="-1.571" x2="0.508" y2="-2.229" width="0.127" layer="21"/>
<wire x1="-0.508" y1="-2.229" x2="0.508" y2="-2.229" width="0.127" layer="21" curve="25.678519"/>
<wire x1="-1.479" y1="0.734" x2="-1.949" y2="1.194" width="0.127" layer="21"/>
<circle x="0" y="0" radius="3.81" width="0" layer="42"/>
<circle x="0" y="0" radius="3.81" width="0" layer="43"/>
<circle x="0" y="0" radius="1.651" width="0.127" layer="21"/>
<pad name="1" x="-2.3813" y="-11.43" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="0" y="-11.43" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="2.3813" y="-11.43" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.6988" y="-6.6675" size="1.27" layer="51">1</text>
<text x="-0.4763" y="-6.6675" size="1.27" layer="51">2</text>
<text x="1.905" y="-6.6675" size="1.27" layer="51">3</text>
<text x="3.0163" y="5.3975" size="1.27" layer="25" ratio="10" rot="R180">&gt;NAME</text>
<text x="3.4925" y="-3.7783" size="1.27" layer="27" ratio="10" rot="R180">&gt;VALUE</text>
<rectangle x1="-2.6988" y1="-8.255" x2="-2.0638" y2="-6.985" layer="21"/>
<rectangle x1="2.0638" y1="-8.255" x2="2.6988" y2="-6.985" layer="21"/>
<rectangle x1="-0.3175" y1="-7.9375" x2="0.3175" y2="-6.985" layer="21"/>
<hole x="0" y="0" drill="3.302"/>
</package>
<package name="TO39">
<description>&lt;b&gt;TO-39&lt;/b&gt;</description>
<wire x1="-4.0386" y1="-3.5306" x2="-3.5052" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-3.5306" x2="-3.5052" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-3.5052" y1="-4.064" x2="-4.0386" y2="-3.5306" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.8608" width="0.0508" layer="21"/>
<pad name="1" x="0" y="-2.54" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="0" y="2.54" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO5">
<description>&lt;b&gt;TO 5&lt;/b&gt;</description>
<wire x1="-4.0386" y1="-3.5306" x2="-3.5052" y2="-2.9972" width="0.127" layer="21"/>
<wire x1="-2.9718" y1="-3.5306" x2="-3.5052" y2="-4.064" width="0.127" layer="21"/>
<wire x1="-3.5052" y1="-4.064" x2="-4.0386" y2="-3.5306" width="0.127" layer="21"/>
<circle x="0" y="0" radius="4.572" width="0.127" layer="21"/>
<circle x="0" y="0" radius="3.8608" width="0.0508" layer="21"/>
<pad name="1" x="0" y="-2.54" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="0" y="2.54" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO66">
<description>&lt;b&gt;TO-66&lt;/b&gt;</description>
<wire x1="-3.501" y1="-7.895" x2="3.5012" y2="-7.895" width="0.1524" layer="21" curve="47.833229"/>
<wire x1="-3.501" y1="7.895" x2="3.5012" y2="7.895" width="0.1524" layer="21" curve="-47.833229"/>
<wire x1="-13.711" y1="3.3666" x2="-13.711" y2="-3.367" width="0.1524" layer="21" curve="132.167583"/>
<wire x1="-3.501" y1="-7.895" x2="-13.711" y2="-3.367" width="0.1524" layer="21"/>
<wire x1="-3.501" y1="7.895" x2="-13.711" y2="3.367" width="0.1524" layer="21"/>
<wire x1="13.711" y1="-3.367" x2="13.711" y2="3.3666" width="0.1524" layer="21" curve="132.167583"/>
<wire x1="3.501" y1="-7.895" x2="13.711" y2="-3.367" width="0.1524" layer="21"/>
<wire x1="3.501" y1="7.895" x2="13.711" y2="3.367" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="7.874" width="0.0508" layer="21"/>
<circle x="0" y="0" radius="6.35" width="0.1524" layer="21"/>
<circle x="-12.192" y="0" radius="1.905" width="0.1524" layer="51"/>
<circle x="12.192" y="0" radius="1.905" width="0.1524" layer="51"/>
<pad name="TO66" x="-12.192" y="0" drill="3.302" diameter="6.35"/>
<pad name="3" x="12.192" y="0" drill="3.302" diameter="6.35"/>
<pad name="2" x="-2.54" y="2.54" drill="1.1176" diameter="2.54" shape="long"/>
<pad name="1" x="-2.54" y="-2.54" drill="1.1176" diameter="2.54" shape="long"/>
<text x="8.89" y="-4.445" size="1.27" layer="21" ratio="10">3</text>
<text x="1.27" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.175" y="-3.175" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-5.08" y="1.905" size="1.27" layer="21" ratio="10">2</text>
<text x="-5.08" y="-3.175" size="1.27" layer="21" ratio="10">1</text>
</package>
<package name="TO92">
<description>&lt;b&gt;TO 92&lt;/b&gt;</description>
<wire x1="-2.0946" y1="-1.651" x2="-2.6549" y2="-0.254" width="0.127" layer="21" curve="-32.78104"/>
<wire x1="-2.6549" y1="-0.254" x2="-0.7863" y2="2.5485" width="0.127" layer="21" curve="-78.318477"/>
<wire x1="0.7863" y1="2.5484" x2="2.0945" y2="-1.651" width="0.127" layer="21" curve="-111.09954"/>
<wire x1="-2.0945" y1="-1.651" x2="2.0945" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.2537" y1="-0.254" x2="-0.2863" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-2.6549" y1="-0.254" x2="-2.2537" y2="-0.254" width="0.127" layer="21"/>
<wire x1="-0.2863" y1="-0.254" x2="0.2863" y2="-0.254" width="0.127" layer="21"/>
<wire x1="2.2537" y1="-0.254" x2="2.6549" y2="-0.254" width="0.127" layer="21"/>
<wire x1="0.2863" y1="-0.254" x2="2.2537" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-0.7863" y1="2.5485" x2="0.7863" y2="2.5485" width="0.127" layer="51" curve="-34.293591"/>
<pad name="1" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="0" y="1.905" drill="0.8128" shape="octagon"/>
<pad name="3" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-0.635" y="0.635" size="1.27" layer="51" ratio="10">2</text>
<text x="-2.159" y="0" size="1.27" layer="51" ratio="10">3</text>
<text x="1.143" y="0" size="1.27" layer="51" ratio="10">1</text>
</package>
<package name="TO92-EBC">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line E B C from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-2.921" x2="2.095" y2="-2.921" width="0.127" layer="21"/>
<wire x1="-2.413" y1="-0.1341" x2="2.413" y2="-0.1341" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-1.397" x2="-1.136" y2="-1.397" width="0.127" layer="51"/>
<wire x1="-2.413" y1="-0.1341" x2="-2.664" y2="-1.397" width="0.127" layer="51" curve="27.937554"/>
<wire x1="-2.664" y1="-1.397" x2="-2.413" y2="-2.4059" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-1.397" x2="-2.664" y2="-1.397" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-2.4059" x2="-2.095" y2="-2.921" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-1.397" x2="-1.404" y2="-1.397" width="0.127" layer="21"/>
<wire x1="2.413" y1="-2.4059" x2="2.664" y2="-1.397" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-1.397" x2="2.413" y2="-0.1341" width="0.127" layer="51" curve="27.937554"/>
<wire x1="2.664" y1="-1.397" x2="1.404" y2="-1.397" width="0.127" layer="51"/>
<wire x1="1.404" y1="-1.397" x2="1.136" y2="-1.397" width="0.127" layer="21"/>
<wire x1="2.095" y1="-2.921" x2="2.4247" y2="-2.3818" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="2.54" y="-1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="-1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="0" y="-1.27" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="1.778" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-4.572" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO92-E1">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads Triangle Reverse</description>
<wire x1="-2.095" y1="-1.651" x2="-0.7869" y2="2.5484" width="0.127" layer="21" curve="-111.097684"/>
<wire x1="0.7869" y1="2.5484" x2="2.095" y2="-1.651" width="0.127" layer="21" curve="-111.097684"/>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.254" y1="-0.254" x2="-0.286" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-2.655" y1="-0.254" x2="-2.254" y2="-0.254" width="0.127" layer="21"/>
<wire x1="-0.286" y1="-0.254" x2="0.286" y2="-0.254" width="0.127" layer="21"/>
<wire x1="2.254" y1="-0.254" x2="2.655" y2="-0.254" width="0.127" layer="21"/>
<wire x1="0.286" y1="-0.254" x2="2.254" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-0.7864" y1="2.5484" x2="0.7864" y2="2.5484" width="0.127" layer="51" curve="-34.298964"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="0" y="1.905" drill="0.8128" shape="octagon"/>
<pad name="3" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="3.175" y="0.635" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO92L">
<description>&lt;b&gt;TO-92&lt;/b&gt;&lt;p&gt;
grid 5.08 mm</description>
<wire x1="-1.1359" y1="2.413" x2="-0.127" y2="2.664" width="0.1524" layer="51" curve="-22.478763"/>
<wire x1="-0.127" y1="2.664" x2="1.1359" y2="2.413" width="0.1524" layer="51" curve="-27.937554"/>
<wire x1="-1.1359" y1="-2.413" x2="-0.127" y2="-2.664" width="0.1524" layer="51" curve="22.478763"/>
<wire x1="-0.127" y1="-2.664" x2="1.1359" y2="-2.413" width="0.1524" layer="51" curve="27.937554"/>
<wire x1="-1.651" y1="2.095" x2="-1.651" y2="-2.095" width="0.1524" layer="21"/>
<wire x1="-0.127" y1="-1.404" x2="-0.127" y2="1.404" width="0.1524" layer="21"/>
<wire x1="-0.127" y1="-2.664" x2="-0.127" y2="-1.404" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="-2.095" x2="-1.1118" y2="-2.4247" width="0.1524" layer="21" curve="13.609443"/>
<wire x1="-0.127" y1="1.404" x2="-0.127" y2="2.664" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="2.095" x2="-1.1359" y2="2.4135" width="0.1524" layer="21" curve="-13.038528"/>
<wire x1="2.413" y1="-1.1359" x2="2.413" y2="1.1359" width="0.1524" layer="51" curve="50.416655"/>
<wire x1="1.1359" y1="-2.413" x2="2.413" y2="-1.1359" width="0.1524" layer="21" curve="39.583345"/>
<wire x1="1.1359" y1="2.413" x2="2.413" y2="1.1359" width="0.1524" layer="21" curve="-39.583345"/>
<pad name="1" x="0" y="-2.54" drill="0.8128" shape="long"/>
<pad name="3" x="0" y="2.54" drill="0.8128" shape="long"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="long"/>
<text x="-1.524" y="3.556" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-4.953" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TOP3">
<description>&lt;b&gt;TOP 3 horizontal&lt;/b&gt;</description>
<wire x1="-7.874" y1="-1.778" x2="7.874" y2="-1.778" width="0.127" layer="21"/>
<wire x1="7.874" y1="8.763" x2="7.874" y2="-1.778" width="0.127" layer="21"/>
<wire x1="-7.874" y1="-1.778" x2="-7.874" y2="8.763" width="0.127" layer="21"/>
<wire x1="-7.874" y1="8.763" x2="-7.874" y2="11.811" width="0.127" layer="21"/>
<wire x1="-7.874" y1="11.811" x2="-3.1242" y2="15.8496" width="0.127" layer="21"/>
<wire x1="7.874" y1="8.763" x2="-7.874" y2="8.763" width="0.127" layer="21"/>
<wire x1="7.874" y1="8.763" x2="7.874" y2="11.811" width="0.127" layer="21"/>
<wire x1="-7.366" y1="-1.27" x2="7.366" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="7.366" y1="8.255" x2="7.366" y2="-1.27" width="0.0508" layer="21"/>
<wire x1="7.366" y1="8.255" x2="-7.366" y2="8.255" width="0.0508" layer="21"/>
<wire x1="-7.366" y1="-1.27" x2="-7.366" y2="8.255" width="0.0508" layer="21"/>
<wire x1="0" y1="17.145" x2="3.1431" y2="15.8431" width="0.127" layer="21" curve="-45.000078"/>
<wire x1="-3.1431" y1="15.8431" x2="0" y2="17.145" width="0.127" layer="21" curve="-45.000078"/>
<wire x1="7.874" y1="11.811" x2="3.1242" y2="15.875" width="0.127" layer="21"/>
<circle x="0" y="12.7" radius="2.159" width="0.127" layer="21"/>
<circle x="0" y="12.7" radius="5.08" width="0" layer="42"/>
<circle x="0" y="12.7" radius="5.08" width="0" layer="43"/>
<pad name="1" x="-5.588" y="-7.62" drill="1.397" shape="long" rot="R90"/>
<pad name="2" x="0" y="-7.62" drill="1.397" shape="long" rot="R90"/>
<pad name="3" x="5.588" y="-7.62" drill="1.397" shape="long" rot="R90"/>
<text x="-5.08" y="5.08" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-7.366" y="9.144" size="0.9906" layer="21" ratio="12">A20,3mm</text>
<text x="-5.715" y="-0.635" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="-0.635" size="1.27" layer="51" ratio="10">2</text>
<text x="4.445" y="-0.635" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-6.223" y1="-3.81" x2="-3.81" y2="-1.778" layer="21"/>
<rectangle x1="-1.397" y1="-3.81" x2="1.397" y2="-1.778" layer="21"/>
<rectangle x1="3.81" y1="-3.81" x2="6.223" y2="-1.778" layer="21"/>
<rectangle x1="-6.223" y1="-5.715" x2="-4.953" y2="-3.81" layer="21"/>
<rectangle x1="-6.223" y1="-7.62" x2="-4.953" y2="-5.715" layer="51"/>
<rectangle x1="-0.635" y1="-5.715" x2="0.635" y2="-3.81" layer="21"/>
<rectangle x1="-0.635" y1="-7.62" x2="0.635" y2="-5.715" layer="51"/>
<rectangle x1="4.953" y1="-5.715" x2="6.223" y2="-3.81" layer="21"/>
<rectangle x1="4.953" y1="-7.62" x2="6.223" y2="-5.715" layer="51"/>
<hole x="0" y="12.7" drill="4.1148"/>
</package>
<package name="TOP3V">
<description>&lt;b&gt;TOP 3 vertical&lt;/b&gt;</description>
<wire x1="6.985" y1="-5.08" x2="7.366" y2="-4.699" width="0.127" layer="21"/>
<wire x1="7.366" y1="-4.699" x2="7.493" y2="-1.524" width="0.127" layer="21"/>
<wire x1="-6.985" y1="-5.08" x2="-7.366" y2="-4.699" width="0.127" layer="21"/>
<wire x1="-7.366" y1="-4.699" x2="-7.493" y2="-1.524" width="0.127" layer="21"/>
<wire x1="6.985" y1="-5.08" x2="6.35" y2="-5.08" width="0.127" layer="21"/>
<wire x1="6.35" y1="-5.08" x2="4.572" y2="-5.08" width="0.127" layer="51"/>
<wire x1="4.572" y1="-5.08" x2="0.889" y2="-5.08" width="0.127" layer="21"/>
<wire x1="0.889" y1="-5.08" x2="-0.889" y2="-5.08" width="0.127" layer="51"/>
<wire x1="-0.889" y1="-5.08" x2="-4.572" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-4.572" y1="-5.08" x2="-6.35" y2="-5.08" width="0.127" layer="51"/>
<wire x1="-6.35" y1="-5.08" x2="-6.985" y2="-5.08" width="0.127" layer="21"/>
<pad name="B" x="-5.461" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<pad name="C" x="0" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<pad name="E" x="5.461" y="-3.175" drill="1.397" shape="long" rot="R90"/>
<text x="-7.62" y="-6.858" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-6.858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.096" y="-4.445" size="1.27" layer="51" ratio="10">B</text>
<text x="-0.635" y="-4.445" size="1.27" layer="51" ratio="10">C</text>
<text x="4.826" y="-4.445" size="1.27" layer="51" ratio="10">E</text>
<rectangle x1="-7.874" y1="-1.143" x2="7.874" y2="0" layer="21"/>
<rectangle x1="-7.874" y1="-1.524" x2="-6.858" y2="-1.143" layer="21"/>
<rectangle x1="-4.064" y1="-1.524" x2="-1.397" y2="-1.143" layer="21"/>
<rectangle x1="1.397" y1="-1.524" x2="4.064" y2="-1.143" layer="21"/>
<rectangle x1="6.858" y1="-1.524" x2="7.874" y2="-1.143" layer="21"/>
<rectangle x1="-6.858" y1="-1.524" x2="-4.064" y2="-1.143" layer="51"/>
<rectangle x1="-1.397" y1="-1.524" x2="1.397" y2="-1.143" layer="51"/>
<rectangle x1="4.064" y1="-1.524" x2="6.858" y2="-1.143" layer="51"/>
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
<package name="SOT23-EBC">
<description>&lt;b&gt;SOT-23 (EBC)&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.127" layer="51"/>
<smd name="C" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="B" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="E" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="TO92-BCE">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line B C E from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.1359" x2="2.413" y2="1.1359" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-0.127" x2="-1.136" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.413" y1="1.1359" x2="-2.664" y2="-0.127" width="0.127" layer="51" curve="27.937554"/>
<wire x1="-2.664" y1="-0.127" x2="-2.413" y2="-1.1359" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-0.127" x2="-2.664" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-1.1359" x2="-2.095" y2="-1.651" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-0.127" x2="-1.404" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.413" y1="-1.1359" x2="2.664" y2="-0.127" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-0.127" x2="2.413" y2="1.1359" width="0.127" layer="51" curve="27.937554"/>
<wire x1="2.664" y1="-0.127" x2="1.404" y2="-0.127" width="0.127" layer="51"/>
<wire x1="1.404" y1="-0.127" x2="1.136" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.095" y1="-1.651" x2="2.4247" y2="-1.1118" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO92-CBE">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line  C B E from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.1359" x2="2.413" y2="1.1359" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-0.127" x2="-1.136" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.413" y1="1.1359" x2="-2.664" y2="-0.127" width="0.127" layer="51" curve="27.937554"/>
<wire x1="-2.664" y1="-0.127" x2="-2.413" y2="-1.1359" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-0.127" x2="-2.664" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-1.1359" x2="-2.095" y2="-1.651" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-0.127" x2="-1.404" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.413" y1="-1.1359" x2="2.664" y2="-0.127" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-0.127" x2="2.413" y2="1.1359" width="0.127" layer="51" curve="27.937554"/>
<wire x1="2.664" y1="-0.127" x2="1.404" y2="-0.127" width="0.127" layer="51"/>
<wire x1="1.404" y1="-0.127" x2="1.136" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.095" y1="-1.651" x2="2.4247" y2="-1.1118" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO92-BEC">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line  B E C from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.1359" x2="2.413" y2="1.1359" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-0.127" x2="-1.136" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.413" y1="1.1359" x2="-2.664" y2="-0.127" width="0.127" layer="51" curve="27.937554"/>
<wire x1="-2.664" y1="-0.127" x2="-2.413" y2="-1.1359" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-0.127" x2="-2.664" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-1.1359" x2="-2.095" y2="-1.651" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-0.127" x2="-1.404" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.413" y1="-1.1359" x2="2.664" y2="-0.127" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-0.127" x2="2.413" y2="1.1359" width="0.127" layer="51" curve="27.937554"/>
<wire x1="2.664" y1="-0.127" x2="1.404" y2="-0.127" width="0.127" layer="51"/>
<wire x1="1.404" y1="-0.127" x2="1.136" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.095" y1="-1.651" x2="2.4247" y2="-1.1118" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO92-CEB">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line C E B from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.1359" x2="2.413" y2="1.1359" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-0.127" x2="-1.136" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.413" y1="1.1359" x2="-2.664" y2="-0.127" width="0.127" layer="51" curve="27.937554"/>
<wire x1="-2.664" y1="-0.127" x2="-2.413" y2="-1.1359" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-0.127" x2="-2.664" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-1.1359" x2="-2.095" y2="-1.651" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-0.127" x2="-1.404" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.413" y1="-1.1359" x2="2.664" y2="-0.127" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-0.127" x2="2.413" y2="1.1359" width="0.127" layer="51" curve="27.937554"/>
<wire x1="2.664" y1="-0.127" x2="1.404" y2="-0.127" width="0.127" layer="51"/>
<wire x1="1.404" y1="-0.127" x2="1.136" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.095" y1="-1.651" x2="2.4247" y2="-1.1118" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SC59-BEC">
<description>SC59 (SOT23) Motorola</description>
<wire x1="1.4224" y1="0.8604" x2="1.4224" y2="-0.8604" width="0.127" layer="51"/>
<wire x1="1.4224" y1="-0.8604" x2="-1.4224" y2="-0.8604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="-0.8604" x2="-1.4224" y2="0.8604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="0.8604" x2="1.4224" y2="0.8604" width="0.127" layer="51"/>
<smd name="C" x="0" y="1.2" dx="1" dy="1.4" layer="1"/>
<smd name="E" x="0.95" y="-1.2" dx="1" dy="1.4" layer="1"/>
<smd name="B" x="-0.95" y="-1.2" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.9112" x2="0.2286" y2="1.4954" layer="51"/>
<rectangle x1="0.7112" y1="-1.4954" x2="1.1684" y2="-0.9112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.4954" x2="-0.7112" y2="-0.9112" layer="51"/>
</package>
<package name="SOT89-BCE">
<description>SOT98 Basis Collector Emitter</description>
<wire x1="2.235" y1="-1.245" x2="-2.235" y2="-1.245" width="0.127" layer="51"/>
<wire x1="2.235" y1="1.219" x2="2.235" y2="-1.245" width="0.127" layer="51"/>
<wire x1="-2.235" y1="-1.245" x2="-2.235" y2="1.219" width="0.127" layer="51"/>
<wire x1="-2.235" y1="1.219" x2="2.235" y2="1.219" width="0.127" layer="51"/>
<wire x1="-0.7874" y1="1.5748" x2="-0.3556" y2="2.0066" width="0.1998" layer="51"/>
<wire x1="-0.3556" y1="2.0066" x2="0.3556" y2="2.0066" width="0.1998" layer="51"/>
<wire x1="0.3556" y1="2.0066" x2="0.7874" y2="1.5748" width="0.1998" layer="51"/>
<wire x1="0.7874" y1="1.5748" x2="0.7874" y2="1.2954" width="0.1998" layer="51"/>
<wire x1="0.7874" y1="1.2954" x2="-0.7874" y2="1.2954" width="0.1998" layer="51"/>
<wire x1="-0.7874" y1="1.2954" x2="-0.7874" y2="1.5748" width="0.1998" layer="51"/>
<smd name="B" x="-1.499" y="-1.981" dx="0.8" dy="1.4" layer="1"/>
<smd name="E" x="1.499" y="-1.981" dx="0.8" dy="1.4" layer="1"/>
<smd name="C" x="0" y="-1.727" dx="0.8" dy="1.9" layer="1" stop="no" cream="no"/>
<smd name="C@1" x="0" y="0.94" dx="2.032" dy="3.65" layer="1" roundness="75"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.4051" y="-4.3449" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7272" y1="-2.1082" x2="-1.27" y2="-1.27" layer="51"/>
<rectangle x1="1.27" y1="-2.1082" x2="1.7272" y2="-1.27" layer="51"/>
<rectangle x1="-0.2794" y1="-2.1082" x2="0.2794" y2="-1.27" layer="51"/>
<rectangle x1="-0.4" y1="-2.68" x2="0.4" y2="-1.28" layer="31"/>
<rectangle x1="-0.5" y1="-2.78" x2="0.5" y2="-1.18" layer="29"/>
<polygon width="0.1998" layer="51">
<vertex x="-0.7874" y="1.3208"/>
<vertex x="-0.7874" y="1.5748"/>
<vertex x="-0.3556" y="2.0066"/>
<vertex x="0.3048" y="2.0066"/>
<vertex x="0.3556" y="2.0066"/>
<vertex x="0.7874" y="1.5748"/>
<vertex x="0.7874" y="1.2954"/>
<vertex x="-0.7874" y="1.2954"/>
</polygon>
</package>
<package name="SOT37">
<description>&lt;b&gt;SOT-37&lt;/b&gt;&lt;p&gt;
Motorola CASE 317A-01 ISSUE B&lt;br&gt;
http://www.ee.siue.edu/~alozows/library/datasheets/BFR96.pdf</description>
<wire x1="5.3086" y1="0.508" x2="5.3086" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-5.3086" x2="0.508" y2="-5.3086" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="6.5024" x2="0.508" y2="6.5024" width="0.1524" layer="51"/>
<wire x1="0.508" y1="-2.2352" x2="0.508" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.794" x2="0.508" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-3.048" x2="0.635" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="0.508" y1="-3.429" x2="0.635" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="0.508" y1="-3.429" x2="0.508" y2="-5.3086" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-2.2352" x2="-0.508" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.794" x2="-0.508" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-3.048" x2="-0.635" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-3.429" x2="-0.635" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-3.429" x2="-0.508" y2="-5.3086" width="0.1524" layer="51"/>
<wire x1="2.2352" y1="-0.508" x2="2.794" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-0.635" x2="2.794" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-0.635" x2="3.429" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-0.508" x2="3.429" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-0.508" x2="5.3086" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="2.2098" y1="0.508" x2="2.794" y2="0.508" width="0.1524" layer="21"/>
<wire x1="2.794" y1="0.635" x2="2.794" y2="0.508" width="0.1524" layer="21"/>
<wire x1="3.048" y1="0.635" x2="3.429" y2="0.635" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0.508" x2="3.429" y2="0.635" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0.508" x2="5.3086" y2="0.508" width="0.1524" layer="51"/>
<wire x1="0.508" y1="2.2352" x2="0.508" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.794" x2="0.508" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.635" y1="3.048" x2="0.635" y2="3.429" width="0.1524" layer="51"/>
<wire x1="0.508" y1="3.429" x2="0.635" y2="3.429" width="0.1524" layer="51"/>
<wire x1="0.508" y1="3.429" x2="0.508" y2="6.5024" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="2.2352" x2="-0.508" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.794" x2="-0.508" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="3.048" x2="-0.635" y2="3.429" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="3.429" x2="-0.635" y2="3.429" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="3.429" x2="-0.508" y2="6.5024" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="-2.794" x2="-0.635" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.794" x2="0.635" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-0.635" x2="2.794" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.048" y1="0.635" x2="2.794" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.794" x2="0.635" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.794" x2="-0.635" y2="3.048" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.286" width="0.1524" layer="21"/>
<circle x="0" y="1.524" radius="0.508" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.175" width="0" layer="41"/>
<circle x="0" y="0" radius="3.175" width="0" layer="42"/>
<smd name="3" x="0" y="-5.08" dx="1.9304" dy="3.81" layer="1"/>
<smd name="2" x="5.08" y="0" dx="3.81" dy="1.9304" layer="1"/>
<smd name="1" x="0" y="5.08" dx="1.9304" dy="3.81" layer="1"/>
<text x="4.445" y="1.27" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.35" y="1.27" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="3.175" y="-2.286" size="1.016" layer="21" ratio="10">E</text>
<text x="1.27" y="-4.191" size="1.016" layer="21" ratio="10">B</text>
<text x="1.27" y="3.175" size="1.016" layer="21" ratio="10">C</text>
<text x="-1.524" y="-4.318" size="1.27" layer="47">5,1</text>
<rectangle x1="-0.508" y1="-2.794" x2="0.508" y2="-2.413" layer="21"/>
<rectangle x1="-0.635" y1="-3.048" x2="0.635" y2="-2.794" layer="21"/>
<rectangle x1="-0.635" y1="-3.429" x2="0.635" y2="-3.048" layer="51"/>
<rectangle x1="-0.508" y1="-5.334" x2="0.508" y2="-3.429" layer="51"/>
<rectangle x1="2.413" y1="-0.508" x2="2.794" y2="0.508" layer="21"/>
<rectangle x1="2.794" y1="-0.635" x2="3.048" y2="0.635" layer="21"/>
<rectangle x1="3.048" y1="-0.635" x2="3.429" y2="0.635" layer="51"/>
<rectangle x1="3.429" y1="-0.508" x2="5.334" y2="0.508" layer="51"/>
<rectangle x1="-0.508" y1="3.429" x2="0.508" y2="6.477" layer="51"/>
<rectangle x1="-0.635" y1="3.048" x2="0.635" y2="3.429" layer="51"/>
<rectangle x1="-0.635" y1="2.794" x2="0.635" y2="3.048" layer="21"/>
<rectangle x1="-0.508" y1="2.413" x2="0.508" y2="2.794" layer="21"/>
<hole x="0" y="0" drill="5.08"/>
</package>
<package name="TO92-ECB">
<description>&lt;b&gt;TO-92&lt;/b&gt; Pads In Line E C B from top&lt;p&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.1359" x2="2.413" y2="1.1359" width="0.127" layer="21" curve="-129.583345"/>
<wire x1="1.136" y1="-0.127" x2="-1.136" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.413" y1="1.1359" x2="-2.664" y2="-0.127" width="0.127" layer="51" curve="27.940727"/>
<wire x1="-2.664" y1="-0.127" x2="-2.413" y2="-1.1359" width="0.127" layer="51" curve="22.478763"/>
<wire x1="-1.404" y1="-0.127" x2="-2.664" y2="-0.127" width="0.127" layer="51"/>
<wire x1="-2.4135" y1="-1.1359" x2="-2.095" y2="-1.651" width="0.127" layer="21" curve="13.038528"/>
<wire x1="-1.136" y1="-0.127" x2="-1.404" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.413" y1="-1.1359" x2="2.664" y2="-0.127" width="0.127" layer="51" curve="22.478763"/>
<wire x1="2.664" y1="-0.127" x2="2.413" y2="1.1359" width="0.127" layer="51" curve="27.933325"/>
<wire x1="2.664" y1="-0.127" x2="1.404" y2="-0.127" width="0.127" layer="51"/>
<wire x1="1.404" y1="-0.127" x2="1.136" y2="-0.127" width="0.127" layer="21"/>
<wire x1="2.095" y1="-1.651" x2="2.4247" y2="-1.1118" width="0.127" layer="21" curve="13.609443"/>
<pad name="C" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="B" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
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
</packages>
<symbols>
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
<deviceset name="*-NPN-" prefix="T" uservalue="yes">
<description>NPN Transistror</description>
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="TO3" package="TO3">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
<technology name="2N5885"/>
<technology name="2N5886"/>
</technologies>
</device>
<device name="TO18-EBC" package="TO18">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name="2N2218"/>
<technology name="2N2222"/>
<technology name="2N2222A"/>
<technology name="2N2369"/>
<technology name="2N2369A"/>
<technology name="2N2484"/>
<technology name="2N2896"/>
<technology name="2N3700"/>
<technology name="2N930"/>
<technology name="BC107A"/>
<technology name="BC107B"/>
<technology name="BC108B"/>
<technology name="BC108C"/>
<technology name="BCY58-IX"/>
<technology name="BCY58-VIII"/>
<technology name="BCY59-VII"/>
<technology name="BCY59-VIII"/>
<technology name="BCY59-X"/>
<technology name="BSS71"/>
<technology name="BSS72"/>
<technology name="BSS73"/>
<technology name="BSX20"/>
</technologies>
</device>
<device name="TO18-" package="TO18-">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO202" package="TO202">
<connects>
<connect gate="G$1" pin="B" pad="3"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO202V" package="TO202V">
<connects>
<connect gate="G$1" pin="B" pad="3"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT93" package="SOT93">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT93V" package="SOT93V">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO126" package="TO126">
<connects>
<connect gate="G$1" pin="B" pad="3"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO126V" package="TO126V">
<connects>
<connect gate="G$1" pin="B" pad="3"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO218" package="TO218">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO218V" package="TO218V">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO220" package="TO220">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
<technology name="2N6288"/>
<technology name="2N6292"/>
</technologies>
</device>
<device name="TO220V" package="TO220V">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO225AA" package="TO225AA">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
<technology name="2N5655"/>
<technology name="2N5657"/>
</technologies>
</device>
<device name="TO39-EBC" package="TO39">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name="2N1613"/>
<technology name="2N1711"/>
<technology name="2N1893"/>
<technology name="2N2102"/>
<technology name="2N2218"/>
<technology name="2N2219"/>
<technology name="2N2219A"/>
<technology name="2N3019"/>
<technology name="2N3020"/>
<technology name="2N3439"/>
<technology name="2N3440"/>
<technology name="BC140-10"/>
<technology name="BC140-16"/>
<technology name="BC141-10"/>
<technology name="BC141-16"/>
<technology name="BFY50"/>
<technology name="BSX45-16"/>
<technology name="BSX46-10"/>
<technology name="BSX46-16"/>
</technologies>
</device>
<device name="TO5" package="TO5">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO66" package="TO66">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92" package="TO92">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92-EBC" package="TO92-EBC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
<technology name="2N2222"/>
<technology name="2N3903"/>
<technology name="2N3904"/>
<technology name="2N4123"/>
<technology name="2N4124"/>
<technology name="2N4401"/>
<technology name="2N5088"/>
<technology name="2N5089"/>
<technology name="2N5550"/>
<technology name="2N5551"/>
</technologies>
</device>
<device name="TO92-E1" package="TO92-E1">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="1"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92L" package="TO92L">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TOP3" package="TOP3">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TOP3V" package="TOP3V">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23-BEC" package="SOT23-BEC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="BC808"/>
<technology name="BC817"/>
<technology name="BC817-16"/>
<technology name="BC817-16LT1"/>
<technology name="BC817-25"/>
<technology name="BC817-25LT1"/>
<technology name="BC817-40"/>
<technology name="BC817-40LT1"/>
<technology name="BC818"/>
<technology name="BC818-16"/>
<technology name="BC818-25"/>
<technology name="BC818-40"/>
<technology name="BC846"/>
<technology name="BC846A"/>
<technology name="BC846ALT1"/>
<technology name="BC846B"/>
<technology name="BC846BLT1"/>
<technology name="BC847"/>
<technology name="BC847A"/>
<technology name="BC847ALT1"/>
<technology name="BC847B"/>
<technology name="BC847BLT1"/>
<technology name="BC847C"/>
<technology name="BC847CLT1"/>
<technology name="BC848"/>
<technology name="BC848A"/>
<technology name="BC848ALT1"/>
<technology name="BC848B"/>
<technology name="BC848BLT1"/>
<technology name="BC848C"/>
<technology name="BC848CLT1"/>
<technology name="BC849"/>
<technology name="BC850"/>
<technology name="BCF29"/>
<technology name="BCF30"/>
<technology name="BCF32"/>
<technology name="BCF33"/>
<technology name="BCF81"/>
<technology name="BCV71"/>
<technology name="BCV72"/>
<technology name="BCW31"/>
<technology name="BCW32"/>
<technology name="BCW33"/>
<technology name="BCW60"/>
<technology name="BCW71"/>
<technology name="BCW72"/>
<technology name="BCW81"/>
<technology name="BCX19"/>
<technology name="BCX20"/>
<technology name="BCX70"/>
<technology name="BF820"/>
<technology name="BF822"/>
<technology name="BFR53"/>
<technology name="BFR92"/>
<technology name="BFR92A"/>
<technology name="BFR93"/>
<technology name="BFR93A"/>
<technology name="BFS17"/>
<technology name="BFS19"/>
<technology name="BFS20"/>
<technology name="BFT25"/>
<technology name="BSR12"/>
<technology name="BSR13"/>
<technology name="BSR14"/>
<technology name="BSV52LT1"/>
<technology name="MMBT2222ALT1"/>
<technology name="MMBT2369LT1"/>
<technology name="MMBT2484LT1"/>
<technology name="MMBT3904LT1"/>
<technology name="MMBT4401LT1"/>
<technology name="MMBT5551LT1"/>
<technology name="MMBT6429LT1"/>
<technology name="MMBT6517LT1"/>
<technology name="MMBT918LT1"/>
<technology name="MMBTA42LT1"/>
<technology name="MMBTH10LT1"/>
<technology name="MMBTH24LT1"/>
</technologies>
</device>
<device name="SOT23-EBC" package="SOT23-EBC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92-BCE" package="TO92-BCE">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92-CBE" package="TO92-CBE">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92-BEC" package="TO92-BEC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
<technology name="2N3903"/>
</technologies>
</device>
<device name="TO92-CEB" package="TO92-CEB">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="BF494"/>
<technology name="BF495"/>
</technologies>
</device>
<device name="SC59-BEC" package="SC59-BEC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="MMUN2211LT1"/>
<technology name="MMUN2212LT1"/>
<technology name="MMUN2213LT1"/>
<technology name="MMUN2214LT1"/>
</technologies>
</device>
<device name="SOT89-BCE" package="SOT89-BCE">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
<technology name="BC868"/>
<technology name="BCX54"/>
<technology name="BCX55"/>
<technology name="BCX56"/>
<technology name="BF622"/>
</technologies>
</device>
<device name="SOT-37" package="SOT37">
<connects>
<connect gate="G$1" pin="B" pad="3"/>
<connect gate="G$1" pin="C" pad="1"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name="BFR96"/>
</technologies>
</device>
<device name="TO92-ECB" package="TO92-ECB">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="BC368"/>
<technology name="BC635"/>
</technologies>
</device>
<device name="SOT223" package="SOT223">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="4"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
<technology name="PZT2222A"/>
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
<deviceset name="FERRITE_" prefix="L">
<gates>
<gate name="G$1" symbol="-L" x="0" y="0"/>
</gates>
<devices>
<device name="220OHMS" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="RS" value="724-1302"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND1">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-2.159" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND1" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND1" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND1" x="0" y="0"/>
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
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
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
<part name="FRAME5" library="frames" deviceset="A4L-LOC" device=""/>
<part name="FRAME6" library="frames" deviceset="A4L-LOC" device=""/>
<part name="SD1" library="robotter_connector" deviceset="DM3CS-SF" device=""/>
<part name="C1" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C2" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="+3V2" library="supply1" deviceset="+3V3" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="R1" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H2" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="H3" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.3"/>
<part name="JB2" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="JC2" library="robotter_connector" deviceset="EMBASE_8+8_FEM" device=""/>
<part name="+3V18" library="supply1" deviceset="+3V3" device=""/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="P+2" library="supply1" deviceset="+12V" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="LED1" library="robotter_diode" deviceset="LED_MULTICOLOR" device=""/>
<part name="LA2" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LA1" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LA4" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LA3" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LB3" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LB4" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LB5" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="LB6" library="robotter_diode" deviceset="LED_" device="G" value="GREEN_0805"/>
<part name="FRAME7" library="frames" deviceset="A4L-LOC" device=""/>
<part name="R2" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R3" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="+3V3" library="supply1" deviceset="+3V3" device=""/>
<part name="R4" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R5" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R6" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R7" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R8" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="+3V4" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="IC2" library="robotter_ic" deviceset="MAX3232" device="SE" technology="C"/>
<part name="C3" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C4" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C5" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C6" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C7" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C8" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C9" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C10" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C11" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C12" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="+3V5" library="supply1" deviceset="+3V3" device=""/>
<part name="UART_E0" library="robotter_connector" deviceset="COM_2013_MASTER" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="UART_D0" library="robotter_connector" deviceset="COM_2013_MASTER" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="UART_C0" library="robotter_connector" deviceset="COM_2013_MASTER" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="USB" library="robotter_connector" deviceset="MINI-USB-SHIELD-" device="UX60-MB-5S8" value="UX60SC-MB-5S8"/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="IC3" library="robotter_ic" deviceset="OKI-78SR" device="-3.3/1.5-W36H-C"/>
<part name="IC4" library="robotter_ic" deviceset="OKI-78SR" device="-5/1.5-W36H-C"/>
<part name="+3V6" library="supply1" deviceset="+3V3" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="P+4" library="supply1" deviceset="+12V" device=""/>
<part name="C13" library="robotter_capacitor" deviceset="10UF" device="-C_35V" value="10µF 35V"/>
<part name="C14" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="C15" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="XB1" library="maxstream" deviceset="XBEE" device="-PRO"/>
<part name="C16" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="C17" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="+3V7" library="supply1" deviceset="+3V3" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="D1" library="robotter_diode" deviceset="MBRA340T3" device=""/>
<part name="T1" library="transistor-neu-to92" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="2n2222"/>
<part name="T2" library="transistor-neu-to92" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="2n2222"/>
<part name="T3" library="transistor-neu-to92" deviceset="*-NPN-" device="SOT23-BEC" technology="MMBT2222ALT1" value="2n2222"/>
<part name="R12" library="robotter_resistor" deviceset="1K" device="-F"/>
<part name="R13" library="robotter_resistor" deviceset="1K" device="-F"/>
<part name="R14" library="robotter_resistor" deviceset="1K" device="-F"/>
<part name="R15" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R16" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R17" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R18" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R19" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R20" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="P+5" library="supply1" deviceset="+5V" device=""/>
<part name="LW_BAT" library="robotter_diode" deviceset="LED_" device="R" value="RED_0805"/>
<part name="R21" library="robotter_resistor" deviceset="270" device="-F"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="R22" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R23" library="robotter_resistor" deviceset="8K2" device="-E"/>
<part name="R26" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R27" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R28" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R29" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R30" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="R31" library="robotter_resistor" deviceset="0" device="-F"/>
<part name="IC6" library="robotter_ic" deviceset="ATXMEGA256A3U" device="-AU"/>
<part name="C18" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C19" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C20" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C21" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C22" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="C23" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="L1" library="robotter_inductor" deviceset="FERRITE_" device="220OHMS"/>
<part name="+3V8" library="supply1" deviceset="+3V3" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="Q1" library="robotter_ic" deviceset="CRYSTAL_" device="16MHZ_HC49UP"/>
<part name="C24" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="C25" library="robotter_capacitor" deviceset="15PF" device="-F" value="15pF_0603_100V"/>
<part name="R32" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="+3V9" library="supply1" deviceset="+3V3" device=""/>
<part name="GND26" library="supply1" deviceset="GND" device=""/>
<part name="PRG" library="robotter_connector" deviceset="PDI_ATMEL" device="L"/>
<part name="+3V10" library="supply1" deviceset="+3V3" device=""/>
<part name="GND27" library="supply1" deviceset="GND" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="GND1" device=""/>
<part name="IC5" library="robotter_ic" deviceset="LXES2SBAA4-016" device=""/>
<part name="R33" library="robotter_resistor" deviceset="1M" device="-F" value="10M"/>
<part name="C26" library="robotter_capacitor" deviceset="4.7NF" device="-F"/>
<part name="R35" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R36" library="robotter_resistor" deviceset="7K15_1%" device="-F"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="R34" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="BAT" library="con-molex" deviceset="22-?-02" device="27-2021"/>
<part name="COLOR/START" library="robotter_connector" deviceset="794618-4" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="HP" library="robotter_connector" deviceset="1503_12" device="&quot;"/>
<part name="FRAME8" library="frames" deviceset="A4L-LOC" device=""/>
<part name="R24" library="robotter_resistor" deviceset="470" device="-F" value="470"/>
<part name="R25" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R37" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="IC7" library="robotter_ic" deviceset="LM4871" device="M"/>
<part name="C27" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1UF_50V_1206"/>
<part name="C28" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="C29" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1UF_50V_1206"/>
<part name="P+6" library="supply1" deviceset="+5V" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="GND30" library="supply1" deviceset="GND" device=""/>
<part name="C30" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
<part name="C31" library="robotter_capacitor" deviceset="100NF" device="-F" value="100nF_0603_50V"/>
<part name="R38" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R39" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R40" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R41" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="R42" library="robotter_resistor" deviceset="10K" device="-F"/>
<part name="GND31" library="supply1" deviceset="GND" device=""/>
<part name="GND32" library="supply1" deviceset="GND" device=""/>
<part name="C32" library="robotter_capacitor" deviceset="10UF" device="-C_25V"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="7.62" y="167.64" size="5.08" layer="91">Microcontroller</text>
<text x="269.24" y="167.64" size="5.08" layer="91">Supply</text>
<text x="7.62" y="-12.7" size="5.08" layer="91">Leds</text>
<text x="269.24" y="-12.7" size="5.08" layer="91">Communication</text>
<text x="7.62" y="-193.04" size="5.08" layer="91">Logs</text>
<text x="269.24" y="-193.04" size="5.08" layer="91">Super Unioc connectors</text>
<text x="7.62" y="-373.38" size="5.08" layer="91">User interface</text>
<text x="274.32" y="-490.22" size="1.778" layer="91">WARNING : audio_pwm_3v3 connected both on pwm pin and on dac pin, take care to specify unused pin as input</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="FRAME2" gate="G$1" x="261.62" y="0"/>
<instance part="FRAME3" gate="G$1" x="0" y="-180.34"/>
<instance part="FRAME4" gate="G$1" x="261.62" y="-180.34"/>
<instance part="FRAME5" gate="G$1" x="0" y="-360.68"/>
<instance part="FRAME6" gate="G$1" x="261.62" y="-360.68"/>
<instance part="SD1" gate="G$1" x="106.68" y="-254"/>
<instance part="C1" gate="G$1" x="139.7" y="-246.38"/>
<instance part="C2" gate="G$1" x="167.64" y="-246.38"/>
<instance part="+3V1" gate="G$1" x="167.64" y="-238.76" smashed="yes">
<attribute name="VALUE" x="165.1" y="-243.84" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="+3V2" gate="G$1" x="81.28" y="-261.62" smashed="yes">
<attribute name="VALUE" x="78.74" y="-261.62" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="1" x="167.64" y="-264.16"/>
<instance part="GND2" gate="1" x="281.94" y="7.62"/>
<instance part="GND3" gate="1" x="83.82" y="-284.48"/>
<instance part="R1" gate="G$1" x="83.82" y="-274.32" rot="R90"/>
<instance part="H1" gate="G$1" x="274.32" y="15.24" rot="R90"/>
<instance part="H2" gate="G$1" x="281.94" y="15.24" rot="R90"/>
<instance part="H3" gate="G$1" x="289.56" y="15.24" rot="R90"/>
<instance part="JB2" gate="G$1" x="375.92" y="-231.14"/>
<instance part="JC2" gate="G$1" x="375.92" y="-287.02"/>
<instance part="+3V18" gate="G$1" x="401.32" y="-274.32"/>
<instance part="P+1" gate="1" x="408.94" y="-274.32"/>
<instance part="P+2" gate="1" x="416.56" y="-274.32" smashed="yes">
<attribute name="VALUE" x="414.02" y="-271.78" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="353.06" y="-228.6"/>
<instance part="GND5" gate="1" x="350.52" y="-284.48"/>
<instance part="LED1" gate="_B" x="96.52" y="-33.02"/>
<instance part="LED1" gate="_G" x="111.76" y="-33.02"/>
<instance part="LED1" gate="_R" x="127" y="-33.02"/>
<instance part="LA2" gate="G$1" x="68.58" y="-119.38"/>
<instance part="LA1" gate="G$1" x="78.74" y="-119.38"/>
<instance part="LA4" gate="G$1" x="88.9" y="-119.38"/>
<instance part="LA3" gate="G$1" x="99.06" y="-119.38"/>
<instance part="LB3" gate="G$1" x="109.22" y="-119.38"/>
<instance part="LB4" gate="G$1" x="119.38" y="-119.38"/>
<instance part="LB5" gate="G$1" x="129.54" y="-119.38"/>
<instance part="LB6" gate="G$1" x="139.7" y="-119.38"/>
<instance part="FRAME7" gate="G$1" x="0" y="-541.02"/>
<instance part="R2" gate="G$1" x="144.78" y="-403.86" rot="R90"/>
<instance part="R3" gate="G$1" x="154.94" y="-403.86" rot="R90"/>
<instance part="+3V3" gate="G$1" x="149.86" y="-391.16" smashed="yes">
<attribute name="VALUE" x="147.32" y="-396.24" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R4" gate="G$1" x="68.58" y="-106.68" rot="R90"/>
<instance part="R5" gate="G$1" x="78.74" y="-104.14" rot="R90"/>
<instance part="R6" gate="G$1" x="88.9" y="-101.6" rot="R90"/>
<instance part="R7" gate="G$1" x="99.06" y="-99.06" rot="R90"/>
<instance part="R8" gate="G$1" x="109.22" y="-96.52" rot="R90"/>
<instance part="R9" gate="G$1" x="119.38" y="-93.98" rot="R90"/>
<instance part="R10" gate="G$1" x="129.54" y="-91.44" rot="R90"/>
<instance part="R11" gate="G$1" x="139.7" y="-88.9" rot="R90"/>
<instance part="GND6" gate="1" x="104.14" y="-127"/>
<instance part="GND7" gate="1" x="96.52" y="-73.66"/>
<instance part="+3V4" gate="G$1" x="378.46" y="-88.9"/>
<instance part="GND10" gate="1" x="469.9" y="-106.68"/>
<instance part="GND11" gate="1" x="378.46" y="-109.22"/>
<instance part="IC1" gate="G$1" x="378.46" y="-132.08"/>
<instance part="IC2" gate="G$1" x="469.9" y="-132.08"/>
<instance part="C3" gate="G$1" x="383.54" y="-96.52"/>
<instance part="C4" gate="G$1" x="342.9" y="-119.38"/>
<instance part="C5" gate="G$1" x="342.9" y="-129.54"/>
<instance part="C6" gate="G$1" x="434.34" y="-119.38"/>
<instance part="C7" gate="G$1" x="434.34" y="-129.54"/>
<instance part="C8" gate="G$1" x="474.98" y="-93.98"/>
<instance part="C9" gate="G$1" x="485.14" y="-129.54"/>
<instance part="C10" gate="G$1" x="398.78" y="-129.54"/>
<instance part="IC1" gate="P" x="373.38" y="-99.06"/>
<instance part="IC2" gate="P" x="464.82" y="-96.52"/>
<instance part="C11" gate="G$1" x="411.48" y="-124.46"/>
<instance part="C12" gate="G$1" x="495.3" y="-124.46"/>
<instance part="GND12" gate="1" x="403.86" y="-137.16"/>
<instance part="GND13" gate="1" x="490.22" y="-137.16"/>
<instance part="+3V5" gate="G$1" x="469.9" y="-86.36"/>
<instance part="UART_E0" gate="G$1" x="281.94" y="-127"/>
<instance part="GND15" gate="1" x="304.8" y="-132.08"/>
<instance part="UART_D0" gate="G$1" x="281.94" y="-144.78"/>
<instance part="GND16" gate="1" x="304.8" y="-149.86"/>
<instance part="UART_C0" gate="G$1" x="281.94" y="-162.56"/>
<instance part="GND17" gate="1" x="304.8" y="-167.64"/>
<instance part="USB" gate="G$1" x="281.94" y="-45.72" rot="MR0"/>
<instance part="USB" gate="S" x="284.48" y="-55.88"/>
<instance part="GND18" gate="1" x="309.88" y="-53.34"/>
<instance part="IC3" gate="G$1" x="345.44" y="129.54"/>
<instance part="IC4" gate="G$1" x="345.44" y="96.52"/>
<instance part="+3V6" gate="G$1" x="375.92" y="137.16"/>
<instance part="P+3" gate="1" x="375.92" y="104.14"/>
<instance part="GND20" gate="1" x="345.44" y="86.36"/>
<instance part="GND21" gate="1" x="345.44" y="119.38"/>
<instance part="GND22" gate="1" x="284.48" y="127"/>
<instance part="P+4" gate="1" x="284.48" y="137.16" smashed="yes">
<attribute name="VALUE" x="281.94" y="139.7" size="1.778" layer="96"/>
</instance>
<instance part="C13" gate="G$1" x="314.96" y="99.06"/>
<instance part="C14" gate="G$1" x="375.92" y="132.08"/>
<instance part="C15" gate="G$1" x="375.92" y="99.06"/>
<instance part="XB1" gate="G$1" x="444.5" y="-43.18"/>
<instance part="C16" gate="G$1" x="386.08" y="-17.78"/>
<instance part="C17" gate="G$1" x="403.86" y="-17.78"/>
<instance part="+3V7" gate="G$1" x="386.08" y="-12.7"/>
<instance part="GND23" gate="1" x="386.08" y="-25.4"/>
<instance part="GND24" gate="1" x="421.64" y="-73.66"/>
<instance part="D1" gate="G$1" x="294.64" y="134.62"/>
<instance part="T1" gate="G$1" x="93.98" y="-58.42" smashed="yes">
<attribute name="NAME" x="88.9" y="-60.96" size="1.778" layer="95"/>
<attribute name="VALUE" x="83.82" y="-53.34" size="1.778" layer="96"/>
</instance>
<instance part="T2" gate="G$1" x="109.22" y="-50.8" smashed="yes">
<attribute name="NAME" x="106.68" y="-55.88" size="1.778" layer="95"/>
<attribute name="VALUE" x="99.06" y="-45.72" size="1.778" layer="96"/>
</instance>
<instance part="T3" gate="G$1" x="124.46" y="-43.18" smashed="yes">
<attribute name="NAME" x="121.92" y="-48.26" size="1.778" layer="95"/>
<attribute name="VALUE" x="114.3" y="-38.1" size="1.778" layer="96"/>
</instance>
<instance part="R12" gate="G$1" x="83.82" y="-58.42"/>
<instance part="R13" gate="G$1" x="83.82" y="-50.8"/>
<instance part="R14" gate="G$1" x="83.82" y="-43.18"/>
<instance part="R15" gate="G$1" x="76.2" y="-66.04" rot="R90"/>
<instance part="R16" gate="G$1" x="66.04" y="-66.04" rot="R90"/>
<instance part="R17" gate="G$1" x="55.88" y="-66.04" rot="R90"/>
<instance part="R18" gate="G$1" x="96.52" y="-25.4" rot="R90"/>
<instance part="R19" gate="G$1" x="111.76" y="-25.4" rot="R90"/>
<instance part="R20" gate="G$1" x="127" y="-25.4" rot="R90"/>
<instance part="P+5" gate="1" x="111.76" y="-7.62"/>
<instance part="LW_BAT" gate="G$1" x="68.58" y="-152.4"/>
<instance part="R21" gate="G$1" x="68.58" y="-162.56" rot="R90"/>
<instance part="GND8" gate="1" x="68.58" y="-170.18"/>
<instance part="R22" gate="G$1" x="302.26" y="93.98" rot="R90"/>
<instance part="R23" gate="G$1" x="302.26" y="116.84" rot="R90"/>
<instance part="R26" gate="G$1" x="312.42" y="-124.46"/>
<instance part="R27" gate="G$1" x="312.42" y="-142.24"/>
<instance part="R28" gate="G$1" x="312.42" y="-160.02"/>
<instance part="R29" gate="G$1" x="320.04" y="-162.56"/>
<instance part="R30" gate="G$1" x="320.04" y="-144.78"/>
<instance part="R31" gate="G$1" x="320.04" y="-127"/>
<instance part="IC6" gate="G$1" x="91.44" y="91.44"/>
<instance part="C18" gate="G$1" x="129.54" y="142.24"/>
<instance part="C19" gate="G$1" x="167.64" y="152.4"/>
<instance part="C20" gate="G$1" x="157.48" y="152.4"/>
<instance part="C21" gate="G$1" x="147.32" y="152.4"/>
<instance part="C22" gate="G$1" x="137.16" y="152.4"/>
<instance part="C23" gate="G$1" x="177.8" y="152.4"/>
<instance part="L1" gate="G$1" x="129.54" y="149.86" rot="R90"/>
<instance part="+3V8" gate="G$1" x="177.8" y="160.02"/>
<instance part="GND9" gate="1" x="154.94" y="134.62"/>
<instance part="GND25" gate="1" x="96.52" y="33.02"/>
<instance part="Q1" gate="G$1" x="127" y="63.5"/>
<instance part="C24" gate="G$1" x="121.92" y="58.42" smashed="yes">
<attribute name="NAME" x="123.444" y="58.801" size="1.778" layer="95"/>
<attribute name="VALUE" x="120.904" y="51.181" size="1.778" layer="96"/>
</instance>
<instance part="C25" gate="G$1" x="132.08" y="58.42" smashed="yes">
<attribute name="NAME" x="133.604" y="58.801" size="1.778" layer="95"/>
<attribute name="VALUE" x="133.604" y="53.721" size="1.778" layer="96"/>
</instance>
<instance part="R32" gate="G$1" x="144.78" y="73.66" rot="R90"/>
<instance part="+3V9" gate="G$1" x="144.78" y="81.28"/>
<instance part="GND26" gate="1" x="127" y="45.72"/>
<instance part="PRG" gate="1" x="226.06" y="45.72"/>
<instance part="+3V10" gate="G$1" x="246.38" y="53.34"/>
<instance part="GND27" gate="1" x="246.38" y="40.64"/>
<instance part="SUPPLY1" gate="G$1" x="281.94" y="-71.12"/>
<instance part="IC5" gate="G$1" x="335.28" y="-48.26"/>
<instance part="R33" gate="G$1" x="297.18" y="-63.5" rot="R90"/>
<instance part="C26" gate="G$1" x="302.26" y="-63.5"/>
<instance part="R35" gate="G$1" x="353.06" y="-53.34" rot="R90"/>
<instance part="R36" gate="G$1" x="353.06" y="-43.18" rot="R90"/>
<instance part="GND19" gate="1" x="353.06" y="-60.96"/>
<instance part="R34" gate="G$1" x="93.98" y="-274.32" rot="R90"/>
<instance part="BAT" gate="-1" x="281.94" y="129.54" rot="R180"/>
<instance part="BAT" gate="-2" x="281.94" y="134.62" rot="R180"/>
<instance part="COLOR/START" gate="G$1" x="101.6" y="-414.02"/>
<instance part="GND14" gate="1" x="93.98" y="-421.64"/>
<instance part="HP" gate="G$1" x="434.34" y="-447.04"/>
<instance part="FRAME8" gate="G$1" x="261.62" y="-541.02"/>
<instance part="R24" gate="G$1" x="314.96" y="-434.34"/>
<instance part="R25" gate="G$1" x="350.52" y="-434.34"/>
<instance part="R37" gate="G$1" x="358.14" y="-419.1" rot="R90"/>
<instance part="IC7" gate="G$1" x="375.92" y="-441.96"/>
<instance part="C27" gate="G$1" x="332.74" y="-434.34" rot="R90"/>
<instance part="C28" gate="G$1" x="322.58" y="-449.58" rot="R180"/>
<instance part="C29" gate="G$1" x="353.06" y="-449.58" rot="R180"/>
<instance part="P+6" gate="1" x="414.02" y="-408.94"/>
<instance part="GND28" gate="1" x="386.08" y="-474.98"/>
<instance part="GND29" gate="1" x="322.58" y="-454.66"/>
<instance part="GND30" gate="1" x="414.02" y="-424.18"/>
<instance part="C30" gate="G$1" x="414.02" y="-416.56"/>
<instance part="C31" gate="G$1" x="388.62" y="-416.56"/>
<instance part="R38" gate="G$1" x="360.68" y="-467.36" rot="R90"/>
<instance part="R39" gate="G$1" x="289.56" y="-101.6" rot="R90"/>
<instance part="R40" gate="G$1" x="302.26" y="-101.6" rot="R90"/>
<instance part="R41" gate="G$1" x="314.96" y="-101.6" rot="R90"/>
<instance part="R42" gate="G$1" x="421.64" y="-243.84" rot="R90"/>
<instance part="GND31" gate="1" x="302.26" y="-109.22"/>
<instance part="GND32" gate="1" x="421.64" y="-251.46"/>
<instance part="C32" gate="G$1" x="284.48" y="93.98"/>
</instances>
<busses>
</busses>
<nets>
<net name="SD_CS_3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="CD/DAT3"/>
<wire x1="101.6" y1="-251.46" x2="93.98" y2="-251.46" width="0.1524" layer="91"/>
<label x="53.34" y="-251.46" size="1.778" layer="95"/>
<pinref part="R34" gate="G$1" pin="2"/>
<wire x1="93.98" y1="-251.46" x2="53.34" y2="-251.46" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-269.24" x2="93.98" y2="-251.46" width="0.1524" layer="91"/>
<junction x="93.98" y="-251.46"/>
</segment>
<segment>
<wire x1="152.4" y1="86.36" x2="121.92" y2="86.36" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PF6"/>
<label x="127" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="SD_MOSI_3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="CMD"/>
<wire x1="101.6" y1="-254" x2="53.34" y2="-254" width="0.1524" layer="91"/>
<label x="53.34" y="-254" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="27.94" y1="73.66" x2="58.42" y2="73.66" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PC5/OC1B/XCK1/MOSI"/>
<label x="27.94" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="SD_MISO_3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="DAT0"/>
<wire x1="101.6" y1="-243.84" x2="53.34" y2="-243.84" width="0.1524" layer="91"/>
<label x="53.34" y="-243.84" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PC6/RXD1/MISO"/>
<wire x1="58.42" y1="71.12" x2="27.94" y2="71.12" width="0.1524" layer="91"/>
<label x="27.94" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="SD_SCLK_3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="CLK"/>
<wire x1="101.6" y1="-256.54" x2="53.34" y2="-256.54" width="0.1524" layer="91"/>
<label x="53.34" y="-256.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PC7/TXD1/SCK"/>
<wire x1="58.42" y1="68.58" x2="27.94" y2="68.58" width="0.1524" layer="91"/>
<label x="27.94" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="SD_CONNECTED_3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="CARD_CONNECT1"/>
<wire x1="101.6" y1="-266.7" x2="83.82" y2="-266.7" width="0.1524" layer="91"/>
<label x="53.34" y="-266.7" size="1.778" layer="95"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="83.82" y1="-266.7" x2="53.34" y2="-266.7" width="0.1524" layer="91"/>
<wire x1="83.82" y1="-269.24" x2="83.82" y2="-266.7" width="0.1524" layer="91"/>
<junction x="83.82" y="-266.7"/>
</segment>
<segment>
<wire x1="58.42" y1="53.34" x2="27.94" y2="53.34" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PD4/OC1A/\S\S"/>
<label x="27.94" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="SD1" gate="G$1" pin="VDD"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="134.62" y1="-241.3" x2="139.7" y2="-241.3" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-241.3" x2="167.64" y2="-241.3" width="0.1524" layer="91"/>
<wire x1="167.64" y1="-241.3" x2="167.64" y2="-243.84" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="139.7" y1="-243.84" x2="139.7" y2="-241.3" width="0.1524" layer="91"/>
<junction x="139.7" y="-241.3"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<junction x="167.64" y="-241.3"/>
</segment>
<segment>
<pinref part="SD1" gate="G$1" pin="CARD_CONNECT0"/>
<wire x1="101.6" y1="-264.16" x2="81.28" y2="-264.16" width="0.1524" layer="91"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<wire x1="401.32" y1="-276.86" x2="401.32" y2="-281.94" width="0.1524" layer="91"/>
<wire x1="401.32" y1="-281.94" x2="383.54" y2="-281.94" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="2"/>
<pinref part="+3V18" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="144.78" y1="-398.78" x2="144.78" y2="-393.7" width="0.1524" layer="91"/>
<wire x1="144.78" y1="-393.7" x2="149.86" y2="-393.7" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="149.86" y1="-393.7" x2="154.94" y2="-393.7" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-393.7" x2="154.94" y2="-398.78" width="0.1524" layer="91"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
<junction x="149.86" y="-393.7"/>
</segment>
<segment>
<pinref part="IC1" gate="P" pin="VCC"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="373.38" y1="-91.44" x2="378.46" y2="-91.44" width="0.1524" layer="91"/>
<wire x1="378.46" y1="-91.44" x2="383.54" y2="-91.44" width="0.1524" layer="91"/>
<wire x1="383.54" y1="-91.44" x2="383.54" y2="-93.98" width="0.1524" layer="91"/>
<pinref part="+3V4" gate="G$1" pin="+3V3"/>
<junction x="378.46" y="-91.44"/>
</segment>
<segment>
<pinref part="IC2" gate="P" pin="VCC"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="464.82" y1="-88.9" x2="469.9" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="469.9" y1="-88.9" x2="474.98" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="474.98" y1="-88.9" x2="474.98" y2="-91.44" width="0.1524" layer="91"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
<junction x="469.9" y="-88.9"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="OUT"/>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<wire x1="355.6" y1="134.62" x2="375.92" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<junction x="375.92" y="134.62"/>
</segment>
<segment>
<pinref part="+3V7" gate="G$1" pin="+3V3"/>
<pinref part="XB1" gate="G$1" pin="VCC"/>
<wire x1="386.08" y1="-15.24" x2="403.86" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="403.86" y1="-15.24" x2="429.26" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-15.24" x2="429.26" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<junction x="403.86" y="-15.24"/>
<pinref part="C16" gate="G$1" pin="1"/>
<junction x="386.08" y="-15.24"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="VCC@0"/>
<wire x1="93.98" y1="144.78" x2="93.98" y2="154.94" width="0.1524" layer="91"/>
<wire x1="93.98" y1="154.94" x2="96.52" y2="154.94" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VCC@1"/>
<wire x1="96.52" y1="154.94" x2="99.06" y2="154.94" width="0.1524" layer="91"/>
<wire x1="99.06" y1="154.94" x2="101.6" y2="154.94" width="0.1524" layer="91"/>
<wire x1="101.6" y1="154.94" x2="104.14" y2="154.94" width="0.1524" layer="91"/>
<wire x1="104.14" y1="154.94" x2="129.54" y2="154.94" width="0.1524" layer="91"/>
<wire x1="129.54" y1="154.94" x2="137.16" y2="154.94" width="0.1524" layer="91"/>
<wire x1="137.16" y1="154.94" x2="147.32" y2="154.94" width="0.1524" layer="91"/>
<wire x1="147.32" y1="154.94" x2="157.48" y2="154.94" width="0.1524" layer="91"/>
<wire x1="157.48" y1="154.94" x2="167.64" y2="154.94" width="0.1524" layer="91"/>
<wire x1="96.52" y1="144.78" x2="96.52" y2="154.94" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VCC@2"/>
<wire x1="99.06" y1="144.78" x2="99.06" y2="154.94" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VCC@3"/>
<wire x1="101.6" y1="144.78" x2="101.6" y2="154.94" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="VCC@4"/>
<wire x1="104.14" y1="144.78" x2="104.14" y2="154.94" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<pinref part="C20" gate="G$1" pin="1"/>
<junction x="157.48" y="154.94"/>
<pinref part="C21" gate="G$1" pin="1"/>
<junction x="147.32" y="154.94"/>
<pinref part="C22" gate="G$1" pin="1"/>
<junction x="137.16" y="154.94"/>
<pinref part="L1" gate="G$1" pin="2"/>
<junction x="129.54" y="154.94"/>
<junction x="96.52" y="154.94"/>
<junction x="99.06" y="154.94"/>
<junction x="101.6" y="154.94"/>
<junction x="104.14" y="154.94"/>
<junction x="167.64" y="154.94"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="167.64" y1="154.94" x2="177.8" y2="154.94" width="0.1524" layer="91"/>
<wire x1="177.8" y1="154.94" x2="177.8" y2="157.48" width="0.1524" layer="91"/>
<pinref part="+3V8" gate="G$1" pin="+3V3"/>
<junction x="177.8" y="154.94"/>
</segment>
<segment>
<pinref part="R32" gate="G$1" pin="2"/>
<pinref part="+3V9" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="PRG" gate="1" pin="VCC"/>
<wire x1="238.76" y1="48.26" x2="246.38" y2="48.26" width="0.1524" layer="91"/>
<pinref part="+3V10" gate="G$1" pin="+3V3"/>
<wire x1="246.38" y1="48.26" x2="246.38" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="SD1" gate="G$1" pin="VSS"/>
<wire x1="167.64" y1="-251.46" x2="167.64" y2="-261.62" width="0.1524" layer="91"/>
<wire x1="167.64" y1="-261.62" x2="139.7" y2="-261.62" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="139.7" y1="-261.62" x2="134.62" y2="-261.62" width="0.1524" layer="91"/>
<wire x1="139.7" y1="-261.62" x2="139.7" y2="-251.46" width="0.1524" layer="91"/>
<junction x="139.7" y="-261.62"/>
<pinref part="GND1" gate="1" pin="GND"/>
<junction x="167.64" y="-261.62"/>
</segment>
<segment>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
<wire x1="274.32" y1="12.7" x2="274.32" y2="10.16" width="0.1524" layer="91"/>
<wire x1="274.32" y1="10.16" x2="281.94" y2="10.16" width="0.1524" layer="91"/>
<pinref part="H3" gate="G$1" pin="MOUNT"/>
<wire x1="281.94" y1="10.16" x2="289.56" y2="10.16" width="0.1524" layer="91"/>
<wire x1="289.56" y1="12.7" x2="289.56" y2="10.16" width="0.1524" layer="91"/>
<pinref part="H2" gate="G$1" pin="MOUNT"/>
<wire x1="281.94" y1="12.7" x2="281.94" y2="10.16" width="0.1524" layer="91"/>
<junction x="281.94" y="10.16"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="368.3" y1="-226.06" x2="353.06" y2="-226.06" width="0.1524" layer="91"/>
<pinref part="JB2" gate="G$1" pin="1"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="368.3" y1="-281.94" x2="350.52" y2="-281.94" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="1"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="LA2" gate="G$1" pin="C"/>
<pinref part="LA1" gate="G$1" pin="C"/>
<wire x1="78.74" y1="-124.46" x2="68.58" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="LA4" gate="G$1" pin="C"/>
<wire x1="78.74" y1="-124.46" x2="88.9" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="LA3" gate="G$1" pin="C"/>
<wire x1="88.9" y1="-124.46" x2="99.06" y2="-124.46" width="0.1524" layer="91"/>
<wire x1="104.14" y1="-124.46" x2="99.06" y2="-124.46" width="0.1524" layer="91"/>
<junction x="78.74" y="-124.46"/>
<junction x="88.9" y="-124.46"/>
<junction x="99.06" y="-124.46"/>
<pinref part="LB6" gate="G$1" pin="C"/>
<pinref part="LB5" gate="G$1" pin="C"/>
<wire x1="139.7" y1="-124.46" x2="129.54" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="LB4" gate="G$1" pin="C"/>
<wire x1="129.54" y1="-124.46" x2="119.38" y2="-124.46" width="0.1524" layer="91"/>
<pinref part="LB3" gate="G$1" pin="C"/>
<wire x1="119.38" y1="-124.46" x2="109.22" y2="-124.46" width="0.1524" layer="91"/>
<wire x1="109.22" y1="-124.46" x2="104.14" y2="-124.46" width="0.1524" layer="91"/>
<junction x="109.22" y="-124.46"/>
<junction x="104.14" y="-124.46"/>
<junction x="119.38" y="-124.46"/>
<junction x="129.54" y="-124.46"/>
</segment>
<segment>
<pinref part="IC1" gate="P" pin="GND"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="378.46" y1="-106.68" x2="373.38" y2="-106.68" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="383.54" y1="-101.6" x2="383.54" y2="-106.68" width="0.1524" layer="91"/>
<wire x1="383.54" y1="-106.68" x2="378.46" y2="-106.68" width="0.1524" layer="91"/>
<junction x="378.46" y="-106.68"/>
</segment>
<segment>
<pinref part="IC2" gate="P" pin="GND"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="469.9" y1="-104.14" x2="464.82" y2="-104.14" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="474.98" y1="-99.06" x2="474.98" y2="-104.14" width="0.1524" layer="91"/>
<wire x1="474.98" y1="-104.14" x2="469.9" y2="-104.14" width="0.1524" layer="91"/>
<junction x="469.9" y="-104.14"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="411.48" y1="-129.54" x2="411.48" y2="-134.62" width="0.1524" layer="91"/>
<wire x1="411.48" y1="-134.62" x2="403.86" y2="-134.62" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="403.86" y1="-134.62" x2="398.78" y2="-134.62" width="0.1524" layer="91"/>
<junction x="403.86" y="-134.62"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="485.14" y1="-134.62" x2="490.22" y2="-134.62" width="0.1524" layer="91"/>
<wire x1="490.22" y1="-134.62" x2="495.3" y2="-134.62" width="0.1524" layer="91"/>
<wire x1="495.3" y1="-134.62" x2="495.3" y2="-129.54" width="0.1524" layer="91"/>
<pinref part="GND13" gate="1" pin="GND"/>
<junction x="490.22" y="-134.62"/>
</segment>
<segment>
<pinref part="UART_E0" gate="G$1" pin="GND"/>
<pinref part="GND15" gate="1" pin="GND"/>
<wire x1="292.1" y1="-129.54" x2="304.8" y2="-129.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="UART_D0" gate="G$1" pin="GND"/>
<pinref part="GND16" gate="1" pin="GND"/>
<wire x1="292.1" y1="-147.32" x2="304.8" y2="-147.32" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="UART_C0" gate="G$1" pin="GND"/>
<pinref part="GND17" gate="1" pin="GND"/>
<wire x1="292.1" y1="-165.1" x2="304.8" y2="-165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="USB" gate="G$1" pin="5"/>
<wire x1="287.02" y1="-50.8" x2="297.18" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="GND18" gate="1" pin="GND"/>
<pinref part="R33" gate="G$1" pin="2"/>
<wire x1="297.18" y1="-50.8" x2="302.26" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-50.8" x2="309.88" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="297.18" y1="-58.42" x2="297.18" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="302.26" y1="-60.96" x2="302.26" y2="-50.8" width="0.1524" layer="91"/>
<junction x="297.18" y="-50.8"/>
<junction x="302.26" y="-50.8"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="R34" gate="G$1" pin="1"/>
<wire x1="93.98" y1="-279.4" x2="93.98" y2="-281.94" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-281.94" x2="83.82" y2="-281.94" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="83.82" y1="-279.4" x2="83.82" y2="-281.94" width="0.1524" layer="91"/>
<junction x="83.82" y="-281.94"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="GND"/>
<pinref part="GND20" gate="1" pin="GND"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="314.96" y1="93.98" x2="314.96" y2="88.9" width="0.1524" layer="91"/>
<wire x1="314.96" y1="88.9" x2="345.44" y2="88.9" width="0.1524" layer="91"/>
<wire x1="345.44" y1="88.9" x2="375.92" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="375.92" y1="88.9" x2="375.92" y2="93.98" width="0.1524" layer="91"/>
<junction x="345.44" y="88.9"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="314.96" y1="88.9" x2="302.26" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C32" gate="G$1" pin="2"/>
<wire x1="302.26" y1="88.9" x2="284.48" y2="88.9" width="0.1524" layer="91"/>
<junction x="302.26" y="88.9"/>
<junction x="314.96" y="88.9"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<pinref part="GND21" gate="1" pin="GND"/>
<wire x1="345.44" y1="121.92" x2="375.92" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="375.92" y1="121.92" x2="375.92" y2="127" width="0.1524" layer="91"/>
<junction x="345.44" y="121.92"/>
</segment>
<segment>
<pinref part="GND23" gate="1" pin="GND"/>
<pinref part="C17" gate="G$1" pin="2"/>
<wire x1="386.08" y1="-22.86" x2="403.86" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="2"/>
<junction x="386.08" y="-22.86"/>
</segment>
<segment>
<pinref part="XB1" gate="G$1" pin="GND"/>
<pinref part="GND24" gate="1" pin="GND"/>
<wire x1="421.64" y1="-71.12" x2="429.26" y2="-71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="T1" gate="G$1" pin="E"/>
<wire x1="96.52" y1="-71.12" x2="96.52" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="1"/>
<pinref part="R16" gate="G$1" pin="1"/>
<wire x1="55.88" y1="-71.12" x2="66.04" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="R15" gate="G$1" pin="1"/>
<wire x1="66.04" y1="-71.12" x2="76.2" y2="-71.12" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-71.12" x2="96.52" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="E"/>
<wire x1="96.52" y1="-71.12" x2="111.76" y2="-71.12" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-71.12" x2="111.76" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$1" pin="E"/>
<wire x1="127" y1="-71.12" x2="127" y2="-48.26" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-71.12" x2="127" y2="-71.12" width="0.1524" layer="91"/>
<junction x="96.52" y="-71.12"/>
<junction x="111.76" y="-71.12"/>
<junction x="76.2" y="-71.12"/>
<junction x="66.04" y="-71.12"/>
</segment>
<segment>
<pinref part="R21" gate="G$1" pin="1"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="129.54" y1="137.16" x2="137.16" y2="137.16" width="0.1524" layer="91"/>
<wire x1="137.16" y1="137.16" x2="147.32" y2="137.16" width="0.1524" layer="91"/>
<wire x1="147.32" y1="137.16" x2="154.94" y2="137.16" width="0.1524" layer="91"/>
<wire x1="154.94" y1="137.16" x2="157.48" y2="137.16" width="0.1524" layer="91"/>
<wire x1="157.48" y1="137.16" x2="167.64" y2="137.16" width="0.1524" layer="91"/>
<wire x1="167.64" y1="137.16" x2="177.8" y2="137.16" width="0.1524" layer="91"/>
<wire x1="177.8" y1="137.16" x2="177.8" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="137.16" y1="147.32" x2="137.16" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="147.32" y1="147.32" x2="147.32" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="157.48" y1="147.32" x2="157.48" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="167.64" y1="147.32" x2="167.64" y2="137.16" width="0.1524" layer="91"/>
<junction x="137.16" y="137.16"/>
<junction x="147.32" y="137.16"/>
<junction x="157.48" y="137.16"/>
<junction x="167.64" y="137.16"/>
<pinref part="GND9" gate="1" pin="GND"/>
<junction x="154.94" y="137.16"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="GND@0"/>
<wire x1="91.44" y1="38.1" x2="91.44" y2="35.56" width="0.1524" layer="91"/>
<wire x1="91.44" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@5"/>
<wire x1="93.98" y1="35.56" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<wire x1="96.52" y1="35.56" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<wire x1="99.06" y1="35.56" x2="101.6" y2="35.56" width="0.1524" layer="91"/>
<wire x1="101.6" y1="35.56" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<wire x1="104.14" y1="35.56" x2="104.14" y2="38.1" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@4"/>
<wire x1="101.6" y1="38.1" x2="101.6" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@3"/>
<wire x1="99.06" y1="38.1" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@2"/>
<wire x1="96.52" y1="38.1" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="GND@1"/>
<wire x1="93.98" y1="38.1" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GND25" gate="1" pin="GND"/>
<junction x="96.52" y="35.56"/>
<junction x="93.98" y="35.56"/>
<junction x="99.06" y="35.56"/>
<junction x="101.6" y="35.56"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="2"/>
<wire x1="121.92" y1="53.34" x2="121.92" y2="48.26" width="0.1524" layer="91"/>
<wire x1="121.92" y1="48.26" x2="127" y2="48.26" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="2"/>
<wire x1="127" y1="48.26" x2="132.08" y2="48.26" width="0.1524" layer="91"/>
<wire x1="132.08" y1="48.26" x2="132.08" y2="53.34" width="0.1524" layer="91"/>
<pinref part="GND26" gate="1" pin="GND"/>
<junction x="127" y="48.26"/>
</segment>
<segment>
<pinref part="PRG" gate="1" pin="GND"/>
<pinref part="GND27" gate="1" pin="GND"/>
<wire x1="238.76" y1="43.18" x2="246.38" y2="43.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R35" gate="G$1" pin="1"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND22" gate="1" pin="GND"/>
<pinref part="BAT" gate="-1" pin="S"/>
</segment>
<segment>
<wire x1="96.52" y1="-414.02" x2="93.98" y2="-414.02" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-414.02" x2="93.98" y2="-419.1" width="0.1524" layer="91"/>
<wire x1="96.52" y1="-411.48" x2="93.98" y2="-411.48" width="0.1524" layer="91"/>
<wire x1="93.98" y1="-411.48" x2="93.98" y2="-414.02" width="0.1524" layer="91"/>
<junction x="93.98" y="-414.02"/>
<pinref part="COLOR/START" gate="G$1" pin="1"/>
<pinref part="COLOR/START" gate="G$1" pin="3"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="GND"/>
<pinref part="GND28" gate="1" pin="GND"/>
<pinref part="R38" gate="G$1" pin="1"/>
<wire x1="386.08" y1="-472.44" x2="386.08" y2="-464.82" width="0.1524" layer="91"/>
<wire x1="360.68" y1="-472.44" x2="386.08" y2="-472.44" width="0.1524" layer="91"/>
<junction x="386.08" y="-472.44"/>
</segment>
<segment>
<pinref part="C28" gate="G$1" pin="1"/>
<pinref part="C29" gate="G$1" pin="1"/>
<wire x1="322.58" y1="-452.12" x2="353.06" y2="-452.12" width="0.1524" layer="91"/>
<pinref part="GND29" gate="1" pin="GND"/>
<junction x="322.58" y="-452.12"/>
</segment>
<segment>
<pinref part="C31" gate="G$1" pin="2"/>
<pinref part="GND30" gate="1" pin="GND"/>
<wire x1="414.02" y1="-421.64" x2="388.62" y2="-421.64" width="0.1524" layer="91"/>
<pinref part="C30" gate="G$1" pin="2"/>
<junction x="414.02" y="-421.64"/>
</segment>
<segment>
<pinref part="R39" gate="G$1" pin="1"/>
<pinref part="R41" gate="G$1" pin="1"/>
<wire x1="289.56" y1="-106.68" x2="302.26" y2="-106.68" width="0.1524" layer="91"/>
<pinref part="R40" gate="G$1" pin="1"/>
<wire x1="302.26" y1="-106.68" x2="314.96" y2="-106.68" width="0.1524" layer="91"/>
<junction x="302.26" y="-106.68"/>
<pinref part="GND31" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="R42" gate="G$1" pin="1"/>
<pinref part="GND32" gate="1" pin="GND"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<wire x1="408.94" y1="-284.48" x2="408.94" y2="-276.86" width="0.1524" layer="91"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<pinref part="JC2" gate="G$1" pin="4"/>
<wire x1="383.54" y1="-284.48" x2="408.94" y2="-284.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="OUT"/>
<pinref part="P+3" gate="1" pin="+5V"/>
<wire x1="355.6" y1="101.6" x2="375.92" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<junction x="375.92" y="101.6"/>
</segment>
<segment>
<pinref part="R18" gate="G$1" pin="2"/>
<wire x1="96.52" y1="-20.32" x2="96.52" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="R20" gate="G$1" pin="2"/>
<wire x1="96.52" y1="-12.7" x2="111.76" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-12.7" x2="127" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="127" y1="-12.7" x2="127" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="R19" gate="G$1" pin="2"/>
<wire x1="111.76" y1="-20.32" x2="111.76" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-12.7" x2="111.76" y2="-10.16" width="0.1524" layer="91"/>
<junction x="111.76" y="-12.7"/>
<pinref part="P+5" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="VDD"/>
<wire x1="386.08" y1="-424.18" x2="386.08" y2="-414.02" width="0.1524" layer="91"/>
<pinref part="P+6" gate="1" pin="+5V"/>
<wire x1="386.08" y1="-414.02" x2="388.62" y2="-414.02" width="0.1524" layer="91"/>
<pinref part="C31" gate="G$1" pin="1"/>
<wire x1="388.62" y1="-414.02" x2="414.02" y2="-414.02" width="0.1524" layer="91"/>
<junction x="388.62" y="-414.02"/>
<pinref part="C30" gate="G$1" pin="1"/>
<junction x="414.02" y="-414.02"/>
<wire x1="414.02" y1="-414.02" x2="414.02" y2="-411.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+12V" class="0">
<segment>
<wire x1="416.56" y1="-276.86" x2="416.56" y2="-287.02" width="0.1524" layer="91"/>
<pinref part="P+2" gate="1" pin="+12V"/>
<wire x1="383.54" y1="-287.02" x2="416.56" y2="-287.02" width="0.1524" layer="91"/>
<pinref part="JC2" gate="G$1" pin="6"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="A"/>
<pinref part="P+4" gate="1" pin="+12V"/>
<wire x1="284.48" y1="134.62" x2="292.1" y2="134.62" width="0.1524" layer="91"/>
<pinref part="BAT" gate="-2" pin="S"/>
<junction x="284.48" y="134.62"/>
</segment>
</net>
<net name="PROP_IRQ_1_3V3" class="0">
<segment>
<wire x1="383.54" y1="-241.3" x2="391.16" y2="-241.3" width="0.1524" layer="91"/>
<label x="386.08" y="-241.3" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="14"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="MOSI/XCK1/OC1B/PE5"/>
<wire x1="121.92" y1="111.76" x2="152.4" y2="111.76" width="0.1524" layer="91"/>
<label x="124.46" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="PROP_IRQ_0_3V3" class="0">
<segment>
<wire x1="340.36" y1="-241.3" x2="368.3" y2="-241.3" width="0.1524" layer="91"/>
<label x="340.36" y="-241.3" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="13"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="\S\S/OC1A/PE4"/>
<wire x1="121.92" y1="114.3" x2="152.4" y2="114.3" width="0.1524" layer="91"/>
<label x="124.46" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX_PROP_3V3" class="0">
<segment>
<wire x1="340.36" y1="-238.76" x2="368.3" y2="-238.76" width="0.1524" layer="91"/>
<label x="340.36" y="-238.76" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="11"/>
</segment>
<segment>
<wire x1="121.92" y1="106.68" x2="152.4" y2="106.68" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="SCK/TXD1/PE7"/>
<label x="124.46" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_PROP_3V3" class="0">
<segment>
<label x="386.08" y="-238.76" size="1.778" layer="95"/>
<pinref part="JB2" gate="G$1" pin="12"/>
<pinref part="R42" gate="G$1" pin="2"/>
<wire x1="383.54" y1="-238.76" x2="421.64" y2="-238.76" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="152.4" y1="109.22" x2="121.92" y2="109.22" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="MISO/RXD1/PE6"/>
<label x="124.46" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="COLOR_SELECT_3V3" class="0">
<segment>
<wire x1="58.42" y1="86.36" x2="27.94" y2="86.36" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PC0/OC0A/SDA"/>
<label x="27.94" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="106.68" y1="-414.02" x2="144.78" y2="-414.02" width="0.1524" layer="91"/>
<label x="114.3" y="-414.02" size="1.778" layer="95"/>
<pinref part="COLOR/START" gate="G$1" pin="2"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="144.78" y1="-408.94" x2="144.78" y2="-414.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="STARTING_CORD_3V3" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="154.94" y1="-411.48" x2="154.94" y2="-408.94" width="0.1524" layer="91"/>
<wire x1="106.68" y1="-411.48" x2="154.94" y2="-411.48" width="0.1524" layer="91"/>
<label x="114.3" y="-411.48" size="1.778" layer="95"/>
<pinref part="COLOR/START" gate="G$1" pin="4"/>
</segment>
<segment>
<wire x1="27.94" y1="83.82" x2="58.42" y2="83.82" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PC1/OC0B/XCK0/SCL"/>
<label x="27.94" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="LA4_3V3" class="0">
<segment>
<wire x1="40.64" y1="-96.52" x2="88.9" y2="-96.52" width="0.1524" layer="91"/>
<label x="40.64" y="-96.52" size="1.778" layer="95"/>
<pinref part="R6" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="58.42" y1="121.92" x2="27.94" y2="121.92" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PA4/ADCA4"/>
<label x="27.94" y="121.92" size="1.778" layer="95"/>
</segment>
</net>
<net name="LA3_3V3" class="0">
<segment>
<wire x1="40.64" y1="-93.98" x2="99.06" y2="-93.98" width="0.1524" layer="91"/>
<label x="40.64" y="-93.98" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PA3/ADCA3"/>
<wire x1="27.94" y1="124.46" x2="58.42" y2="124.46" width="0.1524" layer="91"/>
<label x="27.94" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="V-"/>
<pinref part="C9" gate="G$1" pin="1"/>
</segment>
</net>
<net name="V-" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="V-"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="398.78" y1="-127" x2="393.7" y2="-127" width="0.1524" layer="91"/>
<label x="393.7" y="-127" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="R2IN"/>
<wire x1="393.7" y1="-147.32" x2="408.94" y2="-147.32" width="0.1524" layer="91"/>
<label x="396.24" y="-147.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="V+"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="485.14" y1="-121.92" x2="495.3" y2="-121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="V+"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="393.7" y1="-121.92" x2="411.48" y2="-121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="C4" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C1+"/>
<wire x1="342.9" y1="-116.84" x2="363.22" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="363.22" y1="-116.84" x2="363.22" y2="-119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="IC2" gate="G$1" pin="C1+"/>
<wire x1="434.34" y1="-116.84" x2="454.66" y2="-116.84" width="0.1524" layer="91"/>
<wire x1="454.66" y1="-116.84" x2="454.66" y2="-119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="C2+"/>
<wire x1="342.9" y1="-127" x2="363.22" y2="-127" width="0.1524" layer="91"/>
<wire x1="363.22" y1="-127" x2="363.22" y2="-129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="C2-"/>
<wire x1="342.9" y1="-134.62" x2="363.22" y2="-134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="C1-"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="363.22" y1="-124.46" x2="342.9" y2="-124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="C1-"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="454.66" y1="-124.46" x2="434.34" y2="-124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="C2+"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="454.66" y1="-129.54" x2="454.66" y2="-127" width="0.1524" layer="91"/>
<wire x1="454.66" y1="-127" x2="434.34" y2="-127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="C2-"/>
<wire x1="434.34" y1="-134.62" x2="454.66" y2="-134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="TX_E0_232" class="0">
<segment>
<label x="396.24" y="-142.24" size="1.778" layer="95"/>
<wire x1="408.94" y1="-142.24" x2="393.7" y2="-142.24" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="T2OUT"/>
</segment>
<segment>
<pinref part="UART_E0" gate="G$1" pin="RX_O"/>
<wire x1="292.1" y1="-127" x2="314.96" y2="-127" width="0.1524" layer="91"/>
<label x="294.64" y="-127" size="1.778" layer="95"/>
<pinref part="R31" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RX_E0_3V3" class="0">
<segment>
<label x="345.44" y="-144.78" size="1.778" layer="95"/>
<wire x1="363.22" y1="-144.78" x2="345.44" y2="-144.78" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="R1OUT"/>
</segment>
<segment>
<pinref part="R26" gate="G$1" pin="2"/>
<wire x1="317.5" y1="-124.46" x2="332.74" y2="-124.46" width="0.1524" layer="91"/>
<label x="327.66" y="-124.46" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="119.38" x2="121.92" y2="119.38" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="RXD0/OC0C/PE2"/>
<label x="124.46" y="119.38" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R41" gate="G$1" pin="2"/>
<wire x1="279.4" y1="-83.82" x2="314.96" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="314.96" y1="-83.82" x2="314.96" y2="-96.52" width="0.1524" layer="91"/>
<label x="279.4" y="-83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_E0_232" class="0">
<segment>
<pinref part="UART_E0" gate="G$1" pin="TX_I"/>
<wire x1="292.1" y1="-124.46" x2="307.34" y2="-124.46" width="0.1524" layer="91"/>
<label x="294.64" y="-124.46" size="1.778" layer="95"/>
<pinref part="R26" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="393.7" y1="-144.78" x2="408.94" y2="-144.78" width="0.1524" layer="91"/>
<label x="396.24" y="-144.78" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="R1IN"/>
</segment>
</net>
<net name="TX_E0_3V3" class="0">
<segment>
<wire x1="345.44" y1="-142.24" x2="363.22" y2="-142.24" width="0.1524" layer="91"/>
<label x="345.44" y="-142.24" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="T2IN"/>
<pinref part="IC1" gate="G$1" pin="T1IN"/>
<wire x1="363.22" y1="-142.24" x2="363.22" y2="-139.7" width="0.1524" layer="91"/>
<junction x="363.22" y="-142.24"/>
</segment>
<segment>
<pinref part="R31" gate="G$1" pin="2"/>
<wire x1="325.12" y1="-127" x2="332.74" y2="-127" width="0.1524" layer="91"/>
<label x="327.66" y="-127" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="116.84" x2="152.4" y2="116.84" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="TXD0/OC0D/PE3"/>
<label x="124.46" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="RX_D0_232" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="R1IN"/>
<wire x1="485.14" y1="-144.78" x2="505.46" y2="-144.78" width="0.1524" layer="91"/>
<label x="495.3" y="-144.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UART_D0" gate="G$1" pin="TX_I"/>
<wire x1="292.1" y1="-142.24" x2="307.34" y2="-142.24" width="0.1524" layer="91"/>
<label x="294.64" y="-142.24" size="1.778" layer="95"/>
<pinref part="R27" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RX_C0_232" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="R2IN"/>
<wire x1="485.14" y1="-147.32" x2="505.46" y2="-147.32" width="0.1524" layer="91"/>
<label x="495.3" y="-147.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UART_C0" gate="G$1" pin="TX_I"/>
<wire x1="292.1" y1="-160.02" x2="307.34" y2="-160.02" width="0.1524" layer="91"/>
<label x="294.64" y="-160.02" size="1.778" layer="95"/>
<pinref part="R28" gate="G$1" pin="1"/>
</segment>
</net>
<net name="TX_D0_232" class="0">
<segment>
<wire x1="510.54" y1="-139.7" x2="485.14" y2="-139.7" width="0.1524" layer="91"/>
<label x="495.3" y="-139.7" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="T1OUT"/>
</segment>
<segment>
<pinref part="UART_D0" gate="G$1" pin="RX_O"/>
<wire x1="292.1" y1="-144.78" x2="314.96" y2="-144.78" width="0.1524" layer="91"/>
<label x="294.64" y="-144.78" size="1.778" layer="95"/>
<pinref part="R30" gate="G$1" pin="1"/>
</segment>
</net>
<net name="TX_C0_232" class="0">
<segment>
<wire x1="485.14" y1="-142.24" x2="510.54" y2="-142.24" width="0.1524" layer="91"/>
<label x="495.3" y="-142.24" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="T2OUT"/>
</segment>
<segment>
<pinref part="UART_C0" gate="G$1" pin="RX_O"/>
<wire x1="292.1" y1="-162.56" x2="314.96" y2="-162.56" width="0.1524" layer="91"/>
<label x="294.64" y="-162.56" size="1.778" layer="95"/>
<pinref part="R29" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RX_D0_3V3" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="R1OUT"/>
<wire x1="454.66" y1="-144.78" x2="434.34" y2="-144.78" width="0.1524" layer="91"/>
<label x="434.34" y="-144.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="2"/>
<wire x1="332.74" y1="-142.24" x2="317.5" y2="-142.24" width="0.1524" layer="91"/>
<label x="327.66" y="-142.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD2/OC0C/RXD0"/>
<wire x1="58.42" y1="58.42" x2="27.94" y2="58.42" width="0.1524" layer="91"/>
<label x="27.94" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R40" gate="G$1" pin="2"/>
<wire x1="279.4" y1="-86.36" x2="302.26" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-86.36" x2="302.26" y2="-96.52" width="0.1524" layer="91"/>
<label x="279.4" y="-86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="USB_DATA+" class="0">
<segment>
<pinref part="USB" gate="G$1" pin="3"/>
<wire x1="287.02" y1="-45.72" x2="317.5" y2="-45.72" width="0.1524" layer="91"/>
<label x="297.18" y="-45.72" size="1.778" layer="95"/>
<wire x1="317.5" y1="-45.72" x2="317.5" y2="-43.18" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="DATA@0"/>
<wire x1="317.5" y1="-43.18" x2="322.58" y2="-43.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD7/TXD1/SCK/D+"/>
<wire x1="58.42" y1="45.72" x2="27.94" y2="45.72" width="0.1524" layer="91"/>
<label x="27.94" y="45.72" size="1.778" layer="95"/>
</segment>
</net>
<net name="USB_DATA-" class="0">
<segment>
<pinref part="USB" gate="G$1" pin="2"/>
<wire x1="287.02" y1="-43.18" x2="314.96" y2="-43.18" width="0.1524" layer="91"/>
<label x="297.18" y="-43.18" size="1.778" layer="95"/>
<wire x1="314.96" y1="-43.18" x2="314.96" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="DATA@3"/>
<wire x1="314.96" y1="-50.8" x2="322.58" y2="-50.8" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD6/RXD1/MISO/D-"/>
<wire x1="58.42" y1="48.26" x2="27.94" y2="48.26" width="0.1524" layer="91"/>
<label x="27.94" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="USB_5V" class="0">
<segment>
<pinref part="USB" gate="G$1" pin="1"/>
<wire x1="287.02" y1="-40.64" x2="314.96" y2="-40.64" width="0.1524" layer="91"/>
<label x="297.18" y="-40.64" size="1.778" layer="95"/>
<pinref part="IC5" gate="G$1" pin="VCC"/>
<wire x1="314.96" y1="-40.64" x2="322.58" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="314.96" y1="-40.64" x2="314.96" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="314.96" y1="-33.02" x2="353.06" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="353.06" y1="-33.02" x2="353.06" y2="-38.1" width="0.1524" layer="91"/>
<pinref part="R36" gate="G$1" pin="2"/>
<junction x="314.96" y="-40.64"/>
</segment>
</net>
<net name="XBEE_TX_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="DIN/!CONFIG"/>
<wire x1="429.26" y1="-33.02" x2="406.4" y2="-33.02" width="0.1524" layer="91"/>
<label x="406.4" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="93.98" x2="152.4" y2="93.98" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="TXD0/OC0D/PF3"/>
<label x="127" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_RX_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="DOUT"/>
<wire x1="406.4" y1="-35.56" x2="429.26" y2="-35.56" width="0.1524" layer="91"/>
<label x="406.4" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="96.52" x2="121.92" y2="96.52" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="RXD0/OC0C/PF2"/>
<label x="127" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_CTS_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="!CTS!/DIO7"/>
<wire x1="429.26" y1="-45.72" x2="406.4" y2="-45.72" width="0.1524" layer="91"/>
<label x="406.4" y="-45.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="91.44" x2="121.92" y2="91.44" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PF4"/>
<label x="127" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="XBEE_RTS_3V3" class="0">
<segment>
<pinref part="XB1" gate="G$1" pin="!RTS!/AD6/DIO6"/>
<wire x1="429.26" y1="-48.26" x2="406.4" y2="-48.26" width="0.1524" layer="91"/>
<label x="406.4" y="-48.26" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="88.9" x2="152.4" y2="88.9" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PF5"/>
<label x="127" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="C"/>
<pinref part="LED1" gate="_R" pin="C"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="C"/>
<pinref part="LED1" gate="_G" pin="C"/>
<wire x1="111.76" y1="-38.1" x2="111.76" y2="-45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="C"/>
<pinref part="LED1" gate="_B" pin="C"/>
<wire x1="96.52" y1="-38.1" x2="96.52" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="2"/>
<pinref part="T3" gate="G$1" pin="B"/>
<wire x1="88.9" y1="-43.18" x2="121.92" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="B"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="106.68" y1="-50.8" x2="88.9" y2="-50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$53" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<pinref part="T1" gate="G$1" pin="B"/>
<wire x1="88.9" y1="-58.42" x2="91.44" y2="-58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="LED1" gate="_B" pin="A"/>
<pinref part="R18" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$58" class="0">
<segment>
<pinref part="LED1" gate="_G" pin="A"/>
<pinref part="R19" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$59" class="0">
<segment>
<pinref part="LED1" gate="_R" pin="A"/>
<pinref part="R20" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$60" class="0">
<segment>
<pinref part="LW_BAT" gate="G$1" pin="C"/>
<pinref part="R21" gate="G$1" pin="2"/>
</segment>
</net>
<net name="BAT_LED_3V3" class="0">
<segment>
<pinref part="LW_BAT" gate="G$1" pin="A"/>
<wire x1="68.58" y1="-149.86" x2="40.64" y2="-149.86" width="0.1524" layer="91"/>
<label x="40.64" y="-149.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PA0/ADCA0/AREF"/>
<wire x1="58.42" y1="132.08" x2="27.94" y2="132.08" width="0.1524" layer="91"/>
<label x="27.94" y="132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="IN"/>
<wire x1="335.28" y1="101.6" x2="314.96" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="IC3" gate="G$1" pin="IN"/>
<wire x1="335.28" y1="134.62" x2="314.96" y2="134.62" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="C"/>
<wire x1="314.96" y1="134.62" x2="302.26" y2="134.62" width="0.1524" layer="91"/>
<wire x1="302.26" y1="134.62" x2="297.18" y2="134.62" width="0.1524" layer="91"/>
<wire x1="314.96" y1="101.6" x2="314.96" y2="134.62" width="0.1524" layer="91"/>
<junction x="314.96" y="101.6"/>
<junction x="314.96" y="134.62"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="302.26" y1="121.92" x2="302.26" y2="134.62" width="0.1524" layer="91"/>
<junction x="302.26" y="134.62"/>
</segment>
</net>
<net name="VBAT_0_1V" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="2"/>
<pinref part="R23" gate="G$1" pin="1"/>
<wire x1="302.26" y1="99.06" x2="302.26" y2="101.6" width="0.1524" layer="91"/>
<wire x1="302.26" y1="101.6" x2="302.26" y2="111.76" width="0.1524" layer="91"/>
<wire x1="302.26" y1="101.6" x2="284.48" y2="101.6" width="0.1524" layer="91"/>
<junction x="302.26" y="101.6"/>
<label x="281.94" y="101.6" size="1.778" layer="95"/>
<pinref part="C32" gate="G$1" pin="1"/>
<wire x1="284.48" y1="101.6" x2="281.94" y2="101.6" width="0.1524" layer="91"/>
<wire x1="284.48" y1="96.52" x2="284.48" y2="101.6" width="0.1524" layer="91"/>
<junction x="284.48" y="101.6"/>
</segment>
<segment>
<wire x1="27.94" y1="91.44" x2="58.42" y2="91.44" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PB7/ADCB7/TDO"/>
<label x="27.94" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX_D0_3V3" class="0">
<segment>
<pinref part="R30" gate="G$1" pin="2"/>
<wire x1="325.12" y1="-144.78" x2="332.74" y2="-144.78" width="0.1524" layer="91"/>
<label x="327.66" y="-144.78" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="434.34" y1="-139.7" x2="454.66" y2="-139.7" width="0.1524" layer="91"/>
<label x="434.34" y="-139.7" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="T1IN"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD3/OC0D/TXD0"/>
<wire x1="58.42" y1="55.88" x2="27.94" y2="55.88" width="0.1524" layer="91"/>
<label x="27.94" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$71" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="AVCC@0"/>
<wire x1="111.76" y1="144.78" x2="129.54" y2="144.78" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="1"/>
<pinref part="L1" gate="G$1" pin="1"/>
<junction x="129.54" y="144.78"/>
</segment>
</net>
<net name="N$75" class="0">
<segment>
<pinref part="C24" gate="G$1" pin="1"/>
<pinref part="IC6" gate="G$1" pin="PR1/XTAL1"/>
<wire x1="121.92" y1="60.96" x2="121.92" y2="63.5" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<wire x1="121.92" y1="63.5" x2="124.46" y2="63.5" width="0.1524" layer="91"/>
<junction x="121.92" y="63.5"/>
</segment>
</net>
<net name="N$76" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="PR0/XTAL2"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="121.92" y1="66.04" x2="132.08" y2="66.04" width="0.1524" layer="91"/>
<wire x1="132.08" y1="66.04" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="2"/>
<wire x1="132.08" y1="63.5" x2="132.08" y2="60.96" width="0.1524" layer="91"/>
<wire x1="129.54" y1="63.5" x2="132.08" y2="63.5" width="0.1524" layer="91"/>
<junction x="132.08" y="63.5"/>
</segment>
</net>
<net name="/RESET_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="/RESET"/>
<pinref part="R32" gate="G$1" pin="1"/>
<wire x1="121.92" y1="68.58" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
<label x="124.46" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PRG" gate="1" pin="CLK"/>
<wire x1="213.36" y1="43.18" x2="198.12" y2="43.18" width="0.1524" layer="91"/>
<label x="198.12" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="PDI_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="PDI"/>
<wire x1="121.92" y1="71.12" x2="132.08" y2="71.12" width="0.1524" layer="91"/>
<label x="124.46" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PRG" gate="1" pin="DATA"/>
<wire x1="213.36" y1="48.26" x2="198.12" y2="48.26" width="0.1524" layer="91"/>
<label x="198.12" y="48.26" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND1" class="0">
<segment>
<pinref part="USB" gate="S" pin="S1"/>
<pinref part="USB" gate="S" pin="S2"/>
<wire x1="276.86" y1="-58.42" x2="279.4" y2="-58.42" width="0.1524" layer="91"/>
<pinref part="USB" gate="S" pin="S3"/>
<wire x1="279.4" y1="-58.42" x2="281.94" y2="-58.42" width="0.1524" layer="91"/>
<pinref part="USB" gate="S" pin="S4"/>
<wire x1="281.94" y1="-58.42" x2="284.48" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="281.94" y1="-58.42" x2="281.94" y2="-68.58" width="0.1524" layer="91"/>
<junction x="279.4" y="-58.42"/>
<junction x="281.94" y="-58.42"/>
<pinref part="SUPPLY1" gate="G$1" pin="GND1"/>
<wire x1="287.02" y1="-68.58" x2="281.94" y2="-68.58" width="0.1524" layer="91"/>
<junction x="281.94" y="-68.58"/>
<pinref part="IC5" gate="G$1" pin="GND"/>
<wire x1="281.94" y1="-68.58" x2="297.18" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="297.18" y1="-68.58" x2="302.26" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="302.26" y1="-68.58" x2="320.04" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="320.04" y1="-68.58" x2="342.9" y2="-68.58" width="0.1524" layer="91"/>
<wire x1="342.9" y1="-68.58" x2="342.9" y2="-60.96" width="0.1524" layer="91"/>
<pinref part="R33" gate="G$1" pin="1"/>
<junction x="297.18" y="-68.58"/>
<pinref part="C26" gate="G$1" pin="2"/>
<junction x="302.26" y="-68.58"/>
<wire x1="320.04" y1="-68.58" x2="320.04" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="DATA@2"/>
<wire x1="320.04" y1="-48.26" x2="322.58" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="DATA@1"/>
<wire x1="322.58" y1="-45.72" x2="320.04" y2="-45.72" width="0.1524" layer="91"/>
<wire x1="320.04" y1="-45.72" x2="320.04" y2="-48.26" width="0.1524" layer="91"/>
<junction x="320.04" y="-68.58"/>
<junction x="320.04" y="-48.26"/>
</segment>
</net>
<net name="USB_CONNECTED_3V3" class="0">
<segment>
<pinref part="R36" gate="G$1" pin="1"/>
<pinref part="R35" gate="G$1" pin="2"/>
<wire x1="353.06" y1="-48.26" x2="363.22" y2="-48.26" width="0.1524" layer="91"/>
<label x="358.14" y="-48.26" size="1.778" layer="95"/>
<junction x="353.06" y="-48.26"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="XCK0/OC0B/PF1"/>
<wire x1="121.92" y1="99.06" x2="152.4" y2="99.06" width="0.1524" layer="91"/>
<label x="127" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="BYPASS"/>
<pinref part="C29" gate="G$1" pin="2"/>
<wire x1="353.06" y1="-444.5" x2="360.68" y2="-444.5" width="0.1524" layer="91"/>
<pinref part="IC7" gate="G$1" pin="+IN"/>
<wire x1="360.68" y1="-444.5" x2="360.68" y2="-439.42" width="0.1524" layer="91"/>
<junction x="360.68" y="-444.5"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="C28" gate="G$1" pin="2"/>
<wire x1="322.58" y1="-444.5" x2="322.58" y2="-434.34" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="2"/>
<wire x1="322.58" y1="-434.34" x2="320.04" y2="-434.34" width="0.1524" layer="91"/>
<pinref part="C27" gate="G$1" pin="1"/>
<wire x1="330.2" y1="-434.34" x2="322.58" y2="-434.34" width="0.1524" layer="91"/>
<junction x="322.58" y="-434.34"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="1"/>
<pinref part="C27" gate="G$1" pin="2"/>
<wire x1="345.44" y1="-434.34" x2="337.82" y2="-434.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="R25" gate="G$1" pin="2"/>
<pinref part="IC7" gate="G$1" pin="-IN"/>
<wire x1="355.6" y1="-434.34" x2="358.14" y2="-434.34" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="1"/>
<wire x1="358.14" y1="-434.34" x2="360.68" y2="-434.34" width="0.1524" layer="91"/>
<wire x1="358.14" y1="-434.34" x2="358.14" y2="-424.18" width="0.1524" layer="91"/>
<junction x="358.14" y="-434.34"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="R37" gate="G$1" pin="2"/>
<wire x1="358.14" y1="-414.02" x2="358.14" y2="-403.86" width="0.1524" layer="91"/>
<wire x1="358.14" y1="-403.86" x2="429.26" y2="-403.86" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-403.86" x2="429.26" y2="-439.42" width="0.1524" layer="91"/>
<pinref part="IC7" gate="G$1" pin="VO1"/>
<wire x1="429.26" y1="-439.42" x2="398.78" y2="-439.42" width="0.1524" layer="91"/>
<pinref part="HP" gate="G$1" pin="4"/>
<pinref part="HP" gate="G$1" pin="3"/>
<wire x1="429.26" y1="-447.04" x2="429.26" y2="-444.5" width="0.1524" layer="91"/>
<wire x1="429.26" y1="-444.5" x2="429.26" y2="-439.42" width="0.1524" layer="91"/>
<junction x="429.26" y="-444.5"/>
<junction x="429.26" y="-439.42"/>
</segment>
</net>
<net name="AUDIO_PWM_3V3" class="0">
<segment>
<pinref part="R24" gate="G$1" pin="1"/>
<wire x1="309.88" y1="-434.34" x2="289.56" y2="-434.34" width="0.1524" layer="91"/>
<label x="289.56" y="-434.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD0/OC0A"/>
<wire x1="58.42" y1="63.5" x2="20.32" y2="63.5" width="0.1524" layer="91"/>
<label x="20.32" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PB2/ADCB2/DAC0"/>
<wire x1="58.42" y1="104.14" x2="27.94" y2="104.14" width="0.1524" layer="91"/>
<label x="27.94" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="ENABLE_AUDIO_OUPUT_3V3" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="SHUTDOWN"/>
<wire x1="360.68" y1="-457.2" x2="360.68" y2="-462.28" width="0.1524" layer="91"/>
<pinref part="R38" gate="G$1" pin="2"/>
<wire x1="360.68" y1="-462.28" x2="289.56" y2="-462.28" width="0.1524" layer="91"/>
<junction x="360.68" y="-462.28"/>
<label x="289.56" y="-462.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PD1/OC0B/XCK0"/>
<wire x1="58.42" y1="60.96" x2="20.32" y2="60.96" width="0.1524" layer="91"/>
<label x="20.32" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="LA1_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="PA1/ADCA1"/>
<wire x1="58.42" y1="129.54" x2="27.94" y2="129.54" width="0.1524" layer="91"/>
<label x="27.94" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="40.64" y1="-99.06" x2="78.74" y2="-99.06" width="0.1524" layer="91"/>
<label x="40.64" y="-99.06" size="1.778" layer="95"/>
<pinref part="R5" gate="G$1" pin="2"/>
</segment>
</net>
<net name="LA2_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="PA2/ADCA2"/>
<wire x1="27.94" y1="127" x2="58.42" y2="127" width="0.1524" layer="91"/>
<label x="27.94" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="40.64" y1="-101.6" x2="68.58" y2="-101.6" width="0.1524" layer="91"/>
<label x="40.64" y="-101.6" size="1.778" layer="95"/>
<pinref part="R4" gate="G$1" pin="2"/>
</segment>
</net>
<net name="RX_C0_3V3" class="0">
<segment>
<wire x1="58.42" y1="81.28" x2="27.94" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PC2/OC0C/RXD0"/>
<label x="27.94" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="R2OUT"/>
<wire x1="434.34" y1="-147.32" x2="454.66" y2="-147.32" width="0.1524" layer="91"/>
<label x="434.34" y="-147.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R28" gate="G$1" pin="2"/>
<wire x1="317.5" y1="-160.02" x2="332.74" y2="-160.02" width="0.1524" layer="91"/>
<label x="327.66" y="-160.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R39" gate="G$1" pin="2"/>
<wire x1="279.4" y1="-88.9" x2="289.56" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="289.56" y1="-88.9" x2="289.56" y2="-96.52" width="0.1524" layer="91"/>
<label x="279.4" y="-88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="TX_C0_3V3" class="0">
<segment>
<wire x1="27.94" y1="78.74" x2="58.42" y2="78.74" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PC3/OC0D/TXD0"/>
<label x="27.94" y="78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R29" gate="G$1" pin="2"/>
<wire x1="325.12" y1="-162.56" x2="332.74" y2="-162.56" width="0.1524" layer="91"/>
<label x="327.66" y="-162.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="434.34" y1="-142.24" x2="454.66" y2="-142.24" width="0.1524" layer="91"/>
<label x="434.34" y="-142.24" size="1.778" layer="95"/>
<pinref part="IC2" gate="G$1" pin="T2IN"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="LA2" gate="G$1" pin="A"/>
<wire x1="68.58" y1="-116.84" x2="68.58" y2="-111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<pinref part="LA1" gate="G$1" pin="A"/>
<wire x1="78.74" y1="-116.84" x2="78.74" y2="-109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="LA3" gate="G$1" pin="A"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="99.06" y1="-104.14" x2="99.06" y2="-116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LA4" gate="G$1" pin="A"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="88.9" y1="-106.68" x2="88.9" y2="-116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="LB3" gate="G$1" pin="A"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="109.22" y1="-101.6" x2="109.22" y2="-116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="LB4" gate="G$1" pin="A"/>
<wire x1="119.38" y1="-99.06" x2="119.38" y2="-116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="LB5" gate="G$1" pin="A"/>
<wire x1="129.54" y1="-116.84" x2="129.54" y2="-96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="LB6" gate="G$1" pin="A"/>
<wire x1="139.7" y1="-116.84" x2="139.7" y2="-93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="VO2"/>
<wire x1="398.78" y1="-449.58" x2="429.26" y2="-449.58" width="0.1524" layer="91"/>
<pinref part="HP" gate="G$1" pin="5"/>
</segment>
</net>
<net name="LB3_3V3" class="0">
<segment>
<wire x1="109.22" y1="-91.44" x2="40.64" y2="-91.44" width="0.1524" layer="91"/>
<label x="40.64" y="-91.44" size="1.778" layer="95"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="27.94" y1="101.6" x2="58.42" y2="101.6" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PB3/ADCB3/DAC1"/>
<label x="27.94" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="LB4_3V3" class="0">
<segment>
<wire x1="119.38" y1="-88.9" x2="40.64" y2="-88.9" width="0.1524" layer="91"/>
<label x="40.64" y="-88.9" size="1.778" layer="95"/>
<pinref part="R9" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="58.42" y1="99.06" x2="27.94" y2="99.06" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PB4/ADCB4/TMS"/>
<label x="27.94" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="LB5_3V3" class="0">
<segment>
<wire x1="129.54" y1="-86.36" x2="40.64" y2="-86.36" width="0.1524" layer="91"/>
<label x="40.64" y="-86.36" size="1.778" layer="95"/>
<pinref part="R10" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="27.94" y1="96.52" x2="58.42" y2="96.52" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PB5/ADCB5/TDI"/>
<label x="27.94" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="LB6_3V3" class="0">
<segment>
<wire x1="139.7" y1="-83.82" x2="40.64" y2="-83.82" width="0.1524" layer="91"/>
<label x="40.64" y="-83.82" size="1.778" layer="95"/>
<pinref part="R11" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="58.42" y1="93.98" x2="27.94" y2="93.98" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="PB6/ADCB6/TCK"/>
<label x="27.94" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_RED_3V3" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="1"/>
<wire x1="78.74" y1="-43.18" x2="76.2" y2="-43.18" width="0.1524" layer="91"/>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="76.2" y1="-43.18" x2="40.64" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="76.2" y1="-60.96" x2="76.2" y2="-43.18" width="0.1524" layer="91"/>
<junction x="76.2" y="-43.18"/>
<label x="40.64" y="-43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="OC0A/PF0"/>
<wire x1="121.92" y1="101.6" x2="152.4" y2="101.6" width="0.1524" layer="91"/>
<label x="127" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_GREEN_3V3" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="1"/>
<wire x1="40.64" y1="-50.8" x2="66.04" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="66.04" y1="-50.8" x2="78.74" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-60.96" x2="66.04" y2="-50.8" width="0.1524" layer="91"/>
<junction x="66.04" y="-50.8"/>
<label x="40.64" y="-50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="PF7"/>
<wire x1="121.92" y1="83.82" x2="152.4" y2="83.82" width="0.1524" layer="91"/>
<label x="127" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="LED_BLUE_3V3" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="PA7/ADCA7"/>
<wire x1="58.42" y1="114.3" x2="27.94" y2="114.3" width="0.1524" layer="91"/>
<label x="30.48" y="114.3" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="78.74" y1="-58.42" x2="55.88" y2="-58.42" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="55.88" y1="-58.42" x2="40.64" y2="-58.42" width="0.1524" layer="91"/>
<wire x1="55.88" y1="-60.96" x2="55.88" y2="-58.42" width="0.1524" layer="91"/>
<junction x="55.88" y="-58.42"/>
<label x="40.64" y="-58.42" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="104,1,373.38,-91.44,IC1P,VCC,+3V3,,,"/>
<approved hash="104,1,464.82,-88.9,IC2P,VCC,+3V3,,,"/>
<approved hash="202,1,287.02,-48.26,USB,4,,,,"/>
<approved hash="104,1,429.26,-17.78,XB1,VCC,+3V3,,,"/>
<approved hash="202,1,429.26,-20.32,XB1,!RESET,,,,"/>
<approved hash="202,1,429.26,-68.58,XB1,VREF,,,,"/>
</errors>
</schematic>
</drawing>
</eagle>

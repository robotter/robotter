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
<layer number="101" name="Hidden" color="15" fill="1" visible="no" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="no" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="no" active="yes"/>
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
<library name="robotter_connector">
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
</devicesets>
</library>
<library name="robotter_capacitor">
<packages>
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
<attribute name="MOUSER" value="810-C3216X7R1E105K-6" constant="no"/>
<attribute name="RS" value=" 740-7574 " constant="no"/>
<attribute name="VALUE" value="1µF 25V" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="robotter_ic">
<packages>
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
</packages>
<symbols>
<symbol name="ADP3331">
<wire x1="-7.62" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.62" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VIN" x="-10.16" y="5.08" length="short"/>
<pin name="VOUT" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="FB" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="GND" x="0" y="-12.7" length="short" rot="R90"/>
<pin name="/ERR" x="-10.16" y="0" length="short"/>
<pin name="EN" x="-10.16" y="-5.08" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADP3331ARTZ-REEL7" prefix="IC">
<gates>
<gate name="G$1" symbol="ADP3331" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-6">
<connects>
<connect gate="G$1" pin="/ERR" pad="3"/>
<connect gate="G$1" pin="EN" pad="6"/>
<connect gate="G$1" pin="FB" pad="5"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VIN" pad="2"/>
<connect gate="G$1" pin="VOUT" pad="1"/>
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
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
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
<part name="PWMC4" library="con-lstb" deviceset="MA03-1" device=""/>
<part name="CMD_C4" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="C2" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C1" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="IC1" library="robotter_ic" deviceset="ADP3331ARTZ-REEL7" device=""/>
<part name="R2" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R1" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="PWMD2" library="con-lstb" deviceset="MA03-1" device=""/>
<part name="CMD_D2" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="C4" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C3" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="IC2" library="robotter_ic" deviceset="ADP3331ARTZ-REEL7" device=""/>
<part name="R4" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R3" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="PWMD1" library="con-lstb" deviceset="MA03-1" device=""/>
<part name="CMD_D1" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="C6" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C5" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="IC3" library="robotter_ic" deviceset="ADP3331ARTZ-REEL7" device=""/>
<part name="R6" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R5" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="PWMD0" library="con-lstb" deviceset="MA03-1" device=""/>
<part name="CMD_D0" library="robotter_connector" deviceset="22-?-02" device="27-2021"/>
<part name="C8" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="C7" library="robotter_capacitor" deviceset="1UF" device="D_25V" value="1µF 25V"/>
<part name="IC4" library="robotter_ic" deviceset="ADP3331ARTZ-REEL7" device=""/>
<part name="R8" library="robotter_resistor" deviceset="4K7" device="-E"/>
<part name="R7" library="robotter_resistor" deviceset="10K" device="-E"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="H1" library="holes" deviceset="MOUNT-PAD-ROUND" device="3.6"/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="LED_C4" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="LED_D2" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="LED_D1" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="LED_D0" library="robotter_diode" deviceset="LED_" device="G" value="GREEN"/>
<part name="R9" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R10" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R11" library="robotter_resistor" deviceset="270" device="-E"/>
<part name="R12" library="robotter_resistor" deviceset="270" device="-E"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="167.64" y="144.78" size="1.778" layer="91">shall generate 3.7V, 200mA max</text>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="PWMC4" gate="G$1" x="30.48" y="154.94"/>
<instance part="CMD_C4" gate="-1" x="127" y="152.4"/>
<instance part="CMD_C4" gate="-2" x="127" y="149.86"/>
<instance part="C2" gate="G$1" x="43.18" y="149.86"/>
<instance part="C1" gate="G$1" x="109.22" y="157.48"/>
<instance part="IC1" gate="G$1" x="71.12" y="154.94" smashed="yes">
<attribute name="NAME" x="63.5" y="163.83" size="1.778" layer="95"/>
<attribute name="VALUE" x="58.42" y="142.24" size="1.778" layer="96"/>
</instance>
<instance part="R2" gate="G$1" x="93.98" y="144.78" rot="R270"/>
<instance part="R1" gate="G$1" x="93.98" y="154.94" rot="R270"/>
<instance part="GND1" gate="1" x="71.12" y="137.16"/>
<instance part="PWMD2" gate="G$1" x="30.48" y="116.84"/>
<instance part="CMD_D2" gate="-1" x="127" y="114.3"/>
<instance part="CMD_D2" gate="-2" x="127" y="111.76"/>
<instance part="C4" gate="G$1" x="43.18" y="111.76"/>
<instance part="C3" gate="G$1" x="109.22" y="119.38"/>
<instance part="IC2" gate="G$1" x="71.12" y="116.84" smashed="yes">
<attribute name="NAME" x="63.5" y="125.73" size="1.778" layer="95"/>
<attribute name="VALUE" x="58.42" y="104.14" size="1.778" layer="96"/>
</instance>
<instance part="R4" gate="G$1" x="93.98" y="106.68" rot="R270"/>
<instance part="R3" gate="G$1" x="93.98" y="116.84" rot="R270"/>
<instance part="GND2" gate="1" x="71.12" y="99.06"/>
<instance part="PWMD1" gate="G$1" x="30.48" y="78.74"/>
<instance part="CMD_D1" gate="-1" x="127" y="76.2"/>
<instance part="CMD_D1" gate="-2" x="127" y="73.66"/>
<instance part="C6" gate="G$1" x="43.18" y="73.66"/>
<instance part="C5" gate="G$1" x="109.22" y="81.28"/>
<instance part="IC3" gate="G$1" x="71.12" y="78.74" smashed="yes">
<attribute name="NAME" x="63.5" y="87.63" size="1.778" layer="95"/>
<attribute name="VALUE" x="58.42" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="93.98" y="68.58" rot="R270"/>
<instance part="R5" gate="G$1" x="93.98" y="78.74" rot="R270"/>
<instance part="GND3" gate="1" x="71.12" y="60.96"/>
<instance part="PWMD0" gate="G$1" x="30.48" y="40.64"/>
<instance part="CMD_D0" gate="-1" x="127" y="38.1"/>
<instance part="CMD_D0" gate="-2" x="127" y="35.56"/>
<instance part="C8" gate="G$1" x="43.18" y="35.56"/>
<instance part="C7" gate="G$1" x="109.22" y="43.18"/>
<instance part="IC4" gate="G$1" x="71.12" y="40.64" smashed="yes">
<attribute name="NAME" x="63.5" y="49.53" size="1.778" layer="95"/>
<attribute name="VALUE" x="58.42" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="93.98" y="30.48" rot="R270"/>
<instance part="R7" gate="G$1" x="93.98" y="40.64" rot="R270"/>
<instance part="GND4" gate="1" x="71.12" y="22.86"/>
<instance part="H1" gate="G$1" x="198.12" y="40.64" rot="R90"/>
<instance part="GND5" gate="1" x="198.12" y="35.56"/>
<instance part="LED_C4" gate="G$1" x="152.4" y="144.78"/>
<instance part="LED_D2" gate="G$1" x="152.4" y="106.68"/>
<instance part="LED_D1" gate="G$1" x="149.86" y="68.58"/>
<instance part="LED_D0" gate="G$1" x="149.86" y="30.48"/>
<instance part="R9" gate="G$1" x="149.86" y="40.64" rot="R90"/>
<instance part="R10" gate="G$1" x="149.86" y="78.74" rot="R90"/>
<instance part="R11" gate="G$1" x="152.4" y="116.84" rot="R90"/>
<instance part="R12" gate="G$1" x="152.4" y="154.94" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="FB"/>
<wire x1="83.82" y1="149.86" x2="93.98" y2="149.86" width="0.1524" layer="91"/>
<junction x="93.98" y="149.86"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VOUT"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="93.98" y1="160.02" x2="83.82" y2="160.02" width="0.1524" layer="91"/>
<wire x1="93.98" y1="160.02" x2="109.22" y2="160.02" width="0.1524" layer="91"/>
<pinref part="CMD_C4" gate="-1" pin="S"/>
<wire x1="109.22" y1="160.02" x2="124.46" y2="160.02" width="0.1524" layer="91"/>
<wire x1="124.46" y1="160.02" x2="124.46" y2="152.4" width="0.1524" layer="91"/>
<junction x="93.98" y="160.02"/>
<pinref part="C1" gate="G$1" pin="1"/>
<junction x="109.22" y="160.02"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="124.46" y1="160.02" x2="152.4" y2="160.02" width="0.1524" layer="91"/>
<junction x="124.46" y="160.02"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="GND"/>
<wire x1="71.12" y1="142.24" x2="71.12" y2="139.7" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="71.12" y1="139.7" x2="93.98" y2="139.7" width="0.1524" layer="91"/>
<junction x="71.12" y="139.7"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="43.18" y1="144.78" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<wire x1="43.18" y1="139.7" x2="71.12" y2="139.7" width="0.1524" layer="91"/>
<pinref part="PWMC4" gate="G$1" pin="1"/>
<wire x1="38.1" y1="152.4" x2="38.1" y2="139.7" width="0.1524" layer="91"/>
<wire x1="38.1" y1="139.7" x2="43.18" y2="139.7" width="0.1524" layer="91"/>
<junction x="71.12" y="139.7"/>
<junction x="43.18" y="139.7"/>
<pinref part="CMD_C4" gate="-2" pin="S"/>
<wire x1="93.98" y1="139.7" x2="109.22" y2="139.7" width="0.1524" layer="91"/>
<wire x1="109.22" y1="139.7" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
<wire x1="124.46" y1="139.7" x2="124.46" y2="149.86" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="109.22" y1="152.4" x2="109.22" y2="139.7" width="0.1524" layer="91"/>
<junction x="93.98" y="139.7"/>
<junction x="109.22" y="139.7"/>
<pinref part="LED_C4" gate="G$1" pin="C"/>
<wire x1="152.4" y1="139.7" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
<junction x="124.46" y="139.7"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="GND"/>
<wire x1="71.12" y1="104.14" x2="71.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="71.12" y1="101.6" x2="93.98" y2="101.6" width="0.1524" layer="91"/>
<junction x="71.12" y="101.6"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="43.18" y1="106.68" x2="43.18" y2="101.6" width="0.1524" layer="91"/>
<wire x1="43.18" y1="101.6" x2="71.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="PWMD2" gate="G$1" pin="1"/>
<wire x1="38.1" y1="114.3" x2="38.1" y2="101.6" width="0.1524" layer="91"/>
<wire x1="38.1" y1="101.6" x2="43.18" y2="101.6" width="0.1524" layer="91"/>
<junction x="71.12" y="101.6"/>
<junction x="43.18" y="101.6"/>
<pinref part="CMD_D2" gate="-2" pin="S"/>
<wire x1="93.98" y1="101.6" x2="109.22" y2="101.6" width="0.1524" layer="91"/>
<wire x1="109.22" y1="101.6" x2="124.46" y2="101.6" width="0.1524" layer="91"/>
<wire x1="124.46" y1="101.6" x2="124.46" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="109.22" y1="114.3" x2="109.22" y2="101.6" width="0.1524" layer="91"/>
<junction x="93.98" y="101.6"/>
<junction x="109.22" y="101.6"/>
<pinref part="LED_D2" gate="G$1" pin="C"/>
<wire x1="124.46" y1="101.6" x2="152.4" y2="101.6" width="0.1524" layer="91"/>
<junction x="124.46" y="101.6"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<wire x1="71.12" y1="66.04" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="71.12" y1="63.5" x2="93.98" y2="63.5" width="0.1524" layer="91"/>
<junction x="71.12" y="63.5"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="43.18" y1="68.58" x2="43.18" y2="63.5" width="0.1524" layer="91"/>
<wire x1="43.18" y1="63.5" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
<pinref part="PWMD1" gate="G$1" pin="1"/>
<wire x1="38.1" y1="76.2" x2="38.1" y2="63.5" width="0.1524" layer="91"/>
<wire x1="38.1" y1="63.5" x2="43.18" y2="63.5" width="0.1524" layer="91"/>
<junction x="71.12" y="63.5"/>
<junction x="43.18" y="63.5"/>
<pinref part="CMD_D1" gate="-2" pin="S"/>
<wire x1="93.98" y1="63.5" x2="109.22" y2="63.5" width="0.1524" layer="91"/>
<wire x1="109.22" y1="63.5" x2="124.46" y2="63.5" width="0.1524" layer="91"/>
<wire x1="124.46" y1="63.5" x2="124.46" y2="73.66" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="109.22" y1="76.2" x2="109.22" y2="63.5" width="0.1524" layer="91"/>
<junction x="93.98" y="63.5"/>
<junction x="109.22" y="63.5"/>
<pinref part="LED_D1" gate="G$1" pin="C"/>
<wire x1="124.46" y1="63.5" x2="149.86" y2="63.5" width="0.1524" layer="91"/>
<junction x="124.46" y="63.5"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="GND"/>
<wire x1="71.12" y1="27.94" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="71.12" y1="25.4" x2="93.98" y2="25.4" width="0.1524" layer="91"/>
<junction x="71.12" y="25.4"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="43.18" y1="30.48" x2="43.18" y2="25.4" width="0.1524" layer="91"/>
<wire x1="43.18" y1="25.4" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<pinref part="PWMD0" gate="G$1" pin="1"/>
<wire x1="38.1" y1="38.1" x2="38.1" y2="25.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="25.4" x2="43.18" y2="25.4" width="0.1524" layer="91"/>
<junction x="71.12" y="25.4"/>
<junction x="43.18" y="25.4"/>
<pinref part="CMD_D0" gate="-2" pin="S"/>
<wire x1="93.98" y1="25.4" x2="109.22" y2="25.4" width="0.1524" layer="91"/>
<wire x1="109.22" y1="25.4" x2="124.46" y2="25.4" width="0.1524" layer="91"/>
<wire x1="124.46" y1="25.4" x2="124.46" y2="35.56" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="109.22" y1="38.1" x2="109.22" y2="25.4" width="0.1524" layer="91"/>
<junction x="93.98" y="25.4"/>
<junction x="109.22" y="25.4"/>
<pinref part="LED_D0" gate="G$1" pin="C"/>
<wire x1="124.46" y1="25.4" x2="149.86" y2="25.4" width="0.1524" layer="91"/>
<junction x="124.46" y="25.4"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="H1" gate="G$1" pin="MOUNT"/>
</segment>
</net>
<net name="5V_C4" class="0">
<segment>
<pinref part="PWMC4" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="VIN"/>
<wire x1="38.1" y1="154.94" x2="43.18" y2="154.94" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="43.18" y1="154.94" x2="43.18" y2="160.02" width="0.1524" layer="91"/>
<wire x1="43.18" y1="160.02" x2="60.96" y2="160.02" width="0.1524" layer="91"/>
<wire x1="43.18" y1="152.4" x2="43.18" y2="154.94" width="0.1524" layer="91"/>
<junction x="43.18" y="154.94"/>
</segment>
</net>
<net name="PWM_C4_5V" class="0">
<segment>
<pinref part="PWMC4" gate="G$1" pin="3"/>
<wire x1="38.1" y1="157.48" x2="53.34" y2="157.48" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="EN"/>
<wire x1="60.96" y1="149.86" x2="53.34" y2="149.86" width="0.1524" layer="91"/>
<wire x1="53.34" y1="149.86" x2="53.34" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="FB"/>
<wire x1="83.82" y1="111.76" x2="93.98" y2="111.76" width="0.1524" layer="91"/>
<junction x="93.98" y="111.76"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="VOUT"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="93.98" y1="121.92" x2="83.82" y2="121.92" width="0.1524" layer="91"/>
<wire x1="93.98" y1="121.92" x2="109.22" y2="121.92" width="0.1524" layer="91"/>
<pinref part="CMD_D2" gate="-1" pin="S"/>
<wire x1="109.22" y1="121.92" x2="124.46" y2="121.92" width="0.1524" layer="91"/>
<wire x1="124.46" y1="121.92" x2="124.46" y2="114.3" width="0.1524" layer="91"/>
<junction x="93.98" y="121.92"/>
<pinref part="C3" gate="G$1" pin="1"/>
<junction x="109.22" y="121.92"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="124.46" y1="121.92" x2="152.4" y2="121.92" width="0.1524" layer="91"/>
<junction x="124.46" y="121.92"/>
</segment>
</net>
<net name="5V_D2" class="0">
<segment>
<pinref part="PWMD2" gate="G$1" pin="2"/>
<pinref part="IC2" gate="G$1" pin="VIN"/>
<wire x1="38.1" y1="116.84" x2="43.18" y2="116.84" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="43.18" y1="116.84" x2="43.18" y2="121.92" width="0.1524" layer="91"/>
<wire x1="43.18" y1="121.92" x2="60.96" y2="121.92" width="0.1524" layer="91"/>
<wire x1="43.18" y1="114.3" x2="43.18" y2="116.84" width="0.1524" layer="91"/>
<junction x="43.18" y="116.84"/>
</segment>
</net>
<net name="PWM_D2_5V" class="0">
<segment>
<pinref part="PWMD2" gate="G$1" pin="3"/>
<wire x1="38.1" y1="119.38" x2="53.34" y2="119.38" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="EN"/>
<wire x1="60.96" y1="111.76" x2="53.34" y2="111.76" width="0.1524" layer="91"/>
<wire x1="53.34" y1="111.76" x2="53.34" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="R5" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="FB"/>
<wire x1="83.82" y1="73.66" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
<junction x="93.98" y="73.66"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="VOUT"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="93.98" y1="83.82" x2="83.82" y2="83.82" width="0.1524" layer="91"/>
<wire x1="93.98" y1="83.82" x2="109.22" y2="83.82" width="0.1524" layer="91"/>
<pinref part="CMD_D1" gate="-1" pin="S"/>
<wire x1="109.22" y1="83.82" x2="124.46" y2="83.82" width="0.1524" layer="91"/>
<wire x1="124.46" y1="83.82" x2="124.46" y2="76.2" width="0.1524" layer="91"/>
<junction x="93.98" y="83.82"/>
<pinref part="C5" gate="G$1" pin="1"/>
<junction x="109.22" y="83.82"/>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="124.46" y1="83.82" x2="149.86" y2="83.82" width="0.1524" layer="91"/>
<junction x="124.46" y="83.82"/>
</segment>
</net>
<net name="5V_D1" class="0">
<segment>
<pinref part="PWMD1" gate="G$1" pin="2"/>
<pinref part="IC3" gate="G$1" pin="VIN"/>
<wire x1="38.1" y1="78.74" x2="43.18" y2="78.74" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="43.18" y1="78.74" x2="43.18" y2="83.82" width="0.1524" layer="91"/>
<wire x1="43.18" y1="83.82" x2="60.96" y2="83.82" width="0.1524" layer="91"/>
<wire x1="43.18" y1="76.2" x2="43.18" y2="78.74" width="0.1524" layer="91"/>
<junction x="43.18" y="78.74"/>
</segment>
</net>
<net name="PWM_D1_5V" class="0">
<segment>
<pinref part="PWMD1" gate="G$1" pin="3"/>
<wire x1="38.1" y1="81.28" x2="53.34" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="EN"/>
<wire x1="60.96" y1="73.66" x2="53.34" y2="73.66" width="0.1524" layer="91"/>
<wire x1="53.34" y1="73.66" x2="53.34" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="IC4" gate="G$1" pin="FB"/>
<wire x1="83.82" y1="35.56" x2="93.98" y2="35.56" width="0.1524" layer="91"/>
<junction x="93.98" y="35.56"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="VOUT"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="93.98" y1="45.72" x2="83.82" y2="45.72" width="0.1524" layer="91"/>
<wire x1="93.98" y1="45.72" x2="109.22" y2="45.72" width="0.1524" layer="91"/>
<pinref part="CMD_D0" gate="-1" pin="S"/>
<wire x1="109.22" y1="45.72" x2="124.46" y2="45.72" width="0.1524" layer="91"/>
<wire x1="124.46" y1="45.72" x2="124.46" y2="38.1" width="0.1524" layer="91"/>
<junction x="93.98" y="45.72"/>
<pinref part="C7" gate="G$1" pin="1"/>
<junction x="109.22" y="45.72"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="124.46" y1="45.72" x2="149.86" y2="45.72" width="0.1524" layer="91"/>
<junction x="124.46" y="45.72"/>
</segment>
</net>
<net name="5V_D0" class="0">
<segment>
<pinref part="PWMD0" gate="G$1" pin="2"/>
<pinref part="IC4" gate="G$1" pin="VIN"/>
<wire x1="38.1" y1="40.64" x2="43.18" y2="40.64" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="43.18" y1="40.64" x2="43.18" y2="45.72" width="0.1524" layer="91"/>
<wire x1="43.18" y1="45.72" x2="60.96" y2="45.72" width="0.1524" layer="91"/>
<wire x1="43.18" y1="38.1" x2="43.18" y2="40.64" width="0.1524" layer="91"/>
<junction x="43.18" y="40.64"/>
</segment>
</net>
<net name="PWM_D0_5V" class="0">
<segment>
<pinref part="PWMD0" gate="G$1" pin="3"/>
<wire x1="38.1" y1="43.18" x2="53.34" y2="43.18" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="EN"/>
<wire x1="60.96" y1="35.56" x2="53.34" y2="35.56" width="0.1524" layer="91"/>
<wire x1="53.34" y1="35.56" x2="53.34" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="LED_D0" gate="G$1" pin="A"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="149.86" y1="35.56" x2="149.86" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="LED_D1" gate="G$1" pin="A"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="149.86" y1="73.66" x2="149.86" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="LED_C4" gate="G$1" pin="A"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="152.4" y1="149.86" x2="152.4" y2="147.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED_D2" gate="G$1" pin="A"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="152.4" y1="111.76" x2="152.4" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>

# ---------------------------
# Title: INMOS family tree
# Usage: m4 tree.dot.m4 | dot -Tpdf -o tree.pdf
# Description: 
#   A dot/graphviz representation of the relationship of the Bristol Silicon Cluster.
#   It has m4 macros so should be run through the M4 pre-processor prior to dot
#
#   [nodes] Companies are classed as a full 'entity' or a 'branch' of a larger company
#   [edges] Links between companies are classed as 'startup' formed, 'acquired' or
#           people transferred
#
#   To add more information add in the NODES and EDGES sections below
#
#   To give a timeline some companies are placed in RANKs in the timeline section.
#
# Author: Will Robbins
# Date: 12th December 2018
# #---------------------------

digraph g { 

   # Set A4 size output and fill it
   ratio="fill";
   size="8.3,11.7!";

   # Company Type
   define(`entity',`color="blue" ')
   define(`branch',`color="red" ')
   #define(`branch',`shape=box, style=filled, fillcolor = "green"')

   # Transition Type
   define(`startup',`style=dashed, penwidth=2, color="blue"')
   define(`acquired',`style=solid, penwidth=3, color="blue"')
   define(`people',`style=dotted,  penwidth=1, color="blue"') #constraint=false

   node [fontname = "helvetica", shape=box, penwidth = 3];
   edge [fontname = "helvetica"];

   #==================
   # Legend
   #==================
   "Legend0" [label="Company Branch", branch];
   "Legend1" [label="Company Entity", entity];
   "Legend0" -> "Legend1" [label="Startup", startup]
   "Legend0" -> "Legend1" [label="Acquired", acquired]
   "Legend0" -> "Legend1" [label="People", people]

   #==================
   # Companies (NODES)
   #==================

   "INMOS" [label="INMOS\n1978-1989", entity];
   "STMicroelectronics" [label="STMicroelectronics\n1989-2015", branch]
   "Bristol Uni" [label="Bristol Uni\n1595-", entity]
   "Motion Media" [label="Motion Media\nVideo Compression\n1993-2003", entity];
   "Brooktree" [label="Brooktree\nDSP,Video\n1989-1992", branch];
   "Pioneer" [label="Pioneer\nDSP,Video\n1992-1998", branch];
   "Odeum" [label="Odeum\n1996-1998", branch];
   "Oak Technology" [label="Oak Technology\nDSP,Video\n1998-2000", branch];
   "Conexant" [label="Conexant\nDSP,Video\n1996-2000", branch];
   "PicoChip" [label="PicoChip\nMobile Comms\n2001-2012", entity];
   "Mindspeed" [label="Mindspeed\nMobile Comms\n2012-2016", branch];
   "Intel" [label="Intel\nMobile Comms\n2016-2017", branch];
   "Meiko"  [label="Meiko\nSupercomputer\n1985-1996", entity];
   "Division" [label="Division\nVR\n1989-1996\n", entity];
   "PixelFusion" [label="PixelFusion\nGraphics\n1997-2001\n",entity];
   "ClearSpeed" [label="ClearSpeed\nMaths Processor\n2001-2009\n", entity];
   "BluWireless" [label="BluWireless\nWireless Comms\n2009-\n",entity];
   "Quadrics" [label="Quadrics\n1996-2009", entity];
   "Gnodal" [label="Gnodal\nNetworking\n2007-2013", entity];
   "Cray"  [label="Cray\nNetworking\n2013-"branch];
   "XMOS" [label="XMOS\n2005-", entity];
   "Graphcore" [label="Graphcore\nMachine Learning\n2016-", entity];
   "Element14" [label="Element14\nFixed line Comms\n1999-2000"entity];
   "Broadcom"  [label="Broadcom\nFixed line Comms\n2000-", branch];
   "Icera" [label="Icera\nMobile Comms\n2002-11", entity];
   "NVidia"  [label="NVidia\nMobile Comms\n2011-15", branch];
   "Jump Trading"  [label="Jump Trading\nFinTech\n2015-", branch];
   "Ultrahaptics"  [label="Ultrahaptics\n2015-", entity];
   "5AI" [label="5AI\nAutonomous Driving\n2015-", entity];
   "HP" [branch];
   "Elixent" [label="Elixent\nFPGA Fabric\n2000-2006", entity];
   "Panasonic" [label="Panasonic\n2006-2011", branch]
   "Blackmagic Design" [label="Blackmagic Design\nBroadcast Video\n2012-", branch]
   "UltraSoc" [label="UltraSoc\nSoC Analysis\n2016-", entity]
   "Imagination Technology" [label="Imagination Technology\n20??-", branch]
   "AfterThought" [label="AfterThought\nSoftware services\n2012-", entity]
   "Audium" [label="Audium\nMixed Signal ICs\n2006-2010", entity]
   "Siroyan" [label="Siroyan\nDSP IP\n1999-2003", entity]

   #==================
   # Startups (EDGES)
   #==================
   "INMOS" -> "Meiko" [label="1985", startup]
   "INMOS" -> "Division" [label="1989", startup];
   "Division" -> "PixelFusion" [label="1996", startup];
   "INMOS" -> "Brooktree" [label="1989", startup];
   "STMicroelectronics" -> "Motion Media" [label="1993", startup];

   "PixelFusion" -> "ClearSpeed" [label="2001", startup];
   "ClearSpeed" -> "BluWireless" [label="2009", startup];

   "Pioneer" -> "Oak Technology" [label="1992", startup];
   "Conexant" -> "PicoChip" [label="2001", startup];

   "Bristol Uni" -> "XMOS" [label="2005", startup];
   "XMOS" -> "Graphcore" [label="2016", acquired]; # 'Acquired' is cleanest description
   "XMOS" -> "Jump Trading" [label="2015", startup];

   "STMicroelectronics" -> "Element14" [label="1999", startup];
   "Broadcom" -> "Icera" [label="2002", startup];

   "Quadrics" -> "Gnodal" [label="2007", startup];

   "NVidia" -> "5AI"  [label="2015", startup];

   "HP" -> "Elixent" [label="2000", startup];

   "Panasonic" -> "Blackmagic Design" [label="2012", startup];

   "Mindspeed" -> "UltraSoc" [label="2016", startup];
   "NVidia" -> "UltraSoc" [label="2016", startup];

   "Conexant" -> "Audium" [label="2006", startup];
   "PicoChip" -> "Audium" [label="2006", startup];

   "PicoChip" -> "AfterThought" [label="2012", startup];

   "Pioneer" -> "Siroyan" [label="1999", startup];

   #==================
   # Acquisitions (EDGES)
   #==================
   "INMOS" -> "STMicroelectronics" [label="1992", acquired];
   "Brooktree" -> "Pioneer" [label="1992", acquired];
   "Odeum" -> "Oak Technology" [label="1998", acquired];
   "Oak Technology" -> "Conexant" [label="1992", acquired];
   "PicoChip" -> "Mindspeed" [label="2012", acquired];
   "Mindspeed" -> "Intel" [label="2016", acquired];
   "Element14" -> "Broadcom" [label="2000", acquired];
   "Icera" -> "NVidia" [label="2011", acquired];
   "Meiko" -> "Quadrics"  [label="1996", acquired]
   "Gnodal" -> "Cray"  [label="2013", acquired];
   "Elixent" -> "Panasonic" [label="2006", acquired];

   #==================
   # People transferring (EDGES)
   #==================
   "INMOS" -> "Bristol Uni" [people];
   "Bristol Uni" -> "Ultrahaptics" [people];
   "ClearSpeed" -> "Bristol Uni" [people];
   "PicoChip" -> "NVidia" [people];
   "Mindspeed" -> "NVidia" [people];
   "NVidia" -> "Graphcore" [people];
   "NVidia" -> "Jump Trading" [people];
   "Conexant" -> "Elixent" [people];
   "STMicroelectronics" -> "Imagination Technology" [people];
   "Siroyan" -> "Icera" [people];
   "Siroyan" -> "PicoChip" [people];
   "Broadcom" -> "XMOS" [people];

   #==================
   # Timeline (RANK)
   #==================
   rankdir=TB;
   node [fontsize=25; fontcolor=white; fillcolor=dimgrey; style=filled];
   edge [style=invis];

   Past -> 1980 -> 1985 -> 1990 -> 1995 -> 2000 -> 2005 -> 2010 -> 2015 -> 2020;

   { rank=same; Past, "Legend0", "Legend1" }
   { rank=same; 1980, "INMOS"}
   { rank=same; 1985, "Meiko", "HP" }
   { rank=same; 1990, "Division", "Brooktree", "STMicroelectronics" }
   { rank=same; 1995, "PixelFusion", "Motion Media", "Odeum", "Quadrics" }
   { rank=same; 2000, "ClearSpeed", "PicoChip", "Elixent", "Element14" }
   { rank=same; 2005, "Panasonic", "Gnodal", "XMOS", "Audium" }
   { rank=same; 2010, "BluWireless", "NVidia", "Blackmagic Design", "Mindspeed", "AfterThought"}
   { rank=same; 2015, "Ultrahaptics", "5AI", "Graphcore", "Jump Trading", "Cray", "Intel" }
   { rank=same; 2020 }

}
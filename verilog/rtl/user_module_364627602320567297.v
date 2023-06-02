/* Automatically generated from https://wokwi.com/projects/364627602320567297 */

`default_nettype none

module user_module_364627602320567297(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5;
  wire net6 = 1'b1;
  wire net7;
  wire net8;
  wire net9;
  wire net10;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20;
  wire net21;
  wire net22;
  wire net23;
  wire net24;
  wire net25;
  wire net26;
  wire net27;
  wire net28;
  wire net29;
  wire net30;
  wire net31;
  wire net32;
  wire net33;
  wire net34;
  wire net35;
  wire net36;
  wire net37;
  wire net38;
  wire net39;
  wire net40;
  wire net41;
  wire net42;
  wire net43;
  wire net44;
  wire net45;
  wire net46;
  wire net47;
  wire net48;
  wire net49;
  wire net50;
  wire net51;
  wire net52;
  wire net53;
  wire net54;
  wire net55;
  wire net56;
  wire net57;
  wire net58;
  wire net59;
  wire net60;
  wire net61;
  wire net62;
  wire net63;
  wire net64;
  wire net65;
  wire net66;
  wire net67;
  wire net68;
  wire net69;
  wire net70;
  wire net71;
  wire net72;
  wire net73;
  wire net74;
  wire net75;
  wire net76;
  wire net77;
  wire net78;
  wire net79;
  wire net80;
  wire net81;
  wire net82;
  wire net83;
  wire net84;
  wire net85;
  wire net86;
  wire net87;
  wire net88;
  wire net89;
  wire net90;
  wire net91;
  wire net92;
  wire net93;
  wire net94;
  wire net95;
  wire net96;
  wire net97;
  wire net98;
  wire net99;
  wire net100;
  wire net101;
  wire net102;
  wire net103;
  wire net104;
  wire net105;
  wire net106;
  wire net107;
  wire net108;
  wire net109;
  wire net110;
  wire net111;
  wire net112;
  wire net113;
  wire net114;
  wire net115;
  wire net116;
  wire net117;
  wire net118;
  wire net119;
  wire net120;
  wire net121;
  wire net122;
  wire net123;
  wire net124;
  wire net125;
  wire net126;
  wire net127;
  wire net128;
  wire net129;
  wire net130;
  wire net131;
  wire net132;
  wire net133;
  wire net134;
  wire net135 = 1'b0;

  assign io_out[0] = net3;
  assign io_out[1] = net4;
  assign io_out[2] = net5;

  and_cell and6 (
    .a (net7),
    .b (net8),
    .out (net9)
  );
  and_cell and7 (
    .a (net10),
    .b (net11),
    .out (net7)
  );
  dff_cell flop2 (
    .d (net12),
    .clk (net2),
    .notq (net10)
  );
  dff_cell flop3 (
    .d (net13),
    .clk (net2),
    .q (net14),
    .notq (net8)
  );
  dff_cell flop4 (
    .d (net15),
    .clk (net2),
    .q (net16),
    .notq (net17)
  );
  dff_cell flop5 (
    .d (net18),
    .clk (net2),
    .q (net19),
    .notq (net20)
  );
  and_cell and8 (
    .a (net9),
    .b (net16),
    .out (net21)
  );
  and_cell and9 (
    .a (net21),
    .b (net20),
    .out (net22)
  );
  and_cell and10 (
    .a (net23),
    .b (net16),
    .out (net24)
  );
  and_cell and11 (
    .a (net25),
    .b (net8),
    .out (net23)
  );
  and_cell and12 (
    .a (net11),
    .b (net10),
    .out (net25)
  );
  or_cell or1 (
    .a (net22),
    .b (net26),
    .out (net27)
  );
  and_cell and13 (
    .a (net24),
    .b (net19),
    .out (net26)
  );
  or_cell or2 (
    .a (net27),
    .b (net28),
    .out (net29)
  );
  not_cell not2 (
    .in (net1),
    .out (net11)
  );
  and_cell and14 (
    .a (net11),
    .b (net10),
    .out (net30)
  );
  and_cell and15 (
    .a (net30),
    .b (net14),
    .out (net31)
  );
  and_cell and16 (
    .a (net31),
    .b (net17),
    .out (net32)
  );
  and_cell and17 (
    .a (net32),
    .b (net19),
    .out (net28)
  );
  or_cell or3 (
    .a (net29),
    .b (net33),
    .out (net34)
  );
  and_cell and18 (
    .a (net11),
    .b (net10),
    .out (net35)
  );
  and_cell and19 (
    .a (net35),
    .b (net14),
    .out (net36)
  );
  and_cell and20 (
    .a (net36),
    .b (net16),
    .out (net37)
  );
  and_cell and21 (
    .a (net37),
    .b (net20),
    .out (net33)
  );
  or_cell or4 (
    .a (net34),
    .b (net38),
    .out (net39)
  );
  and_cell and22 (
    .a (net1),
    .b (net10),
    .out (net40)
  );
  and_cell and23 (
    .a (net40),
    .b (net8),
    .out (net41)
  );
  and_cell and24 (
    .a (net41),
    .b (net17),
    .out (net42)
  );
  and_cell and25 (
    .a (net42),
    .b (net20),
    .out (net38)
  );
  or_cell or5 (
    .a (net39),
    .b (net43),
    .out (net44)
  );
  and_cell and26 (
    .a (net1),
    .b (net10),
    .out (net45)
  );
  and_cell and27 (
    .a (net45),
    .b (net8),
    .out (net46)
  );
  and_cell and28 (
    .a (net46),
    .b (net17),
    .out (net47)
  );
  and_cell and29 (
    .a (net47),
    .b (net19),
    .out (net43)
  );
  or_cell or6 (
    .a (net44),
    .b (net48),
    .out (net49)
  );
  and_cell and1 (
    .a (net1),
    .b (net10),
    .out (net50)
  );
  and_cell and2 (
    .a (net50),
    .b (net14),
    .out (net51)
  );
  and_cell and3 (
    .a (net51),
    .b (net17),
    .out (net52)
  );
  and_cell and4 (
    .a (net52),
    .b (net19),
    .out (net48)
  );
  or_cell or7 (
    .a (net49),
    .b (net53),
    .out (net13)
  );
  and_cell and5 (
    .a (net54),
    .b (net20),
    .out (net53)
  );
  and_cell and30 (
    .a (net55),
    .b (net16),
    .out (net54)
  );
  and_cell and31 (
    .a (net56),
    .b (net14),
    .out (net55)
  );
  and_cell and32 (
    .a (net1),
    .b (net10),
    .out (net56)
  );
  and_cell and53 (
    .a (net11),
    .b (net10),
    .out (net57)
  );
  and_cell and74 (
    .a (net58),
    .b (net20),
    .out (net59)
  );
  and_cell and75 (
    .a (net60),
    .b (net17),
    .out (net58)
  );
  and_cell and76 (
    .a (net57),
    .b (net8),
    .out (net60)
  );
  and_cell and77 (
    .a (net11),
    .b (net10),
    .out (net61)
  );
  and_cell and78 (
    .a (net61),
    .b (net8),
    .out (net62)
  );
  and_cell and79 (
    .a (net62),
    .b (net16),
    .out (net63)
  );
  and_cell and80 (
    .a (net63),
    .b (net20),
    .out (net64)
  );
  and_cell and81 (
    .a (net1),
    .b (net10),
    .out (net65)
  );
  and_cell and82 (
    .a (net65),
    .b (net8),
    .out (net66)
  );
  and_cell and83 (
    .a (net66),
    .b (net17),
    .out (net67)
  );
  and_cell and84 (
    .a (net67),
    .b (net20),
    .out (net68)
  );
  and_cell and85 (
    .a (net1),
    .b (net10),
    .out (net69)
  );
  and_cell and86 (
    .a (net69),
    .b (net8),
    .out (net70)
  );
  and_cell and87 (
    .a (net70),
    .b (net16),
    .out (net71)
  );
  and_cell and88 (
    .a (net71),
    .b (net20),
    .out (net72)
  );
  and_cell and89 (
    .a (net73),
    .b (net16),
    .out (net74)
  );
  and_cell and90 (
    .a (net75),
    .b (net14),
    .out (net73)
  );
  and_cell and91 (
    .a (net1),
    .b (net10),
    .out (net75)
  );
  and_cell and92 (
    .a (net74),
    .b (net20),
    .out (net76)
  );
  or_cell or16 (
    .a (net59),
    .b (net64),
    .out (net77)
  );
  or_cell or17 (
    .a (net77),
    .b (net68),
    .out (net78)
  );
  or_cell or18 (
    .a (net78),
    .b (net72),
    .out (net79)
  );
  or_cell or19 (
    .a (net79),
    .b (net76),
    .out (net18)
  );
  and_cell and33 (
    .a (net80),
    .b (net8),
    .out (net81)
  );
  and_cell and34 (
    .a (net11),
    .b (net10),
    .out (net80)
  );
  and_cell and35 (
    .a (net82),
    .b (net19),
    .out (net83)
  );
  and_cell and36 (
    .a (net84),
    .b (net17),
    .out (net82)
  );
  and_cell and37 (
    .a (net85),
    .b (net8),
    .out (net84)
  );
  and_cell and38 (
    .a (net11),
    .b (net10),
    .out (net85)
  );
  and_cell and39 (
    .a (net81),
    .b (net16),
    .out (net86)
  );
  and_cell and40 (
    .a (net87),
    .b (net14),
    .out (net88)
  );
  and_cell and41 (
    .a (net10),
    .b (net11),
    .out (net87)
  );
  and_cell and42 (
    .a (net86),
    .b (net20),
    .out (net89)
  );
  and_cell and43 (
    .a (net90),
    .b (net19),
    .out (net91)
  );
  and_cell and44 (
    .a (net88),
    .b (net17),
    .out (net90)
  );
  and_cell and45 (
    .a (net92),
    .b (net16),
    .out (net93)
  );
  and_cell and46 (
    .a (net94),
    .b (net14),
    .out (net92)
  );
  and_cell and47 (
    .a (net10),
    .b (net1),
    .out (net94)
  );
  and_cell and48 (
    .a (net93),
    .b (net20),
    .out (net95)
  );
  and_cell and49 (
    .a (net1),
    .b (net10),
    .out (net96)
  );
  and_cell and50 (
    .a (net96),
    .b (net8),
    .out (net97)
  );
  and_cell and51 (
    .a (net97),
    .b (net17),
    .out (net98)
  );
  and_cell and52 (
    .a (net98),
    .b (net19),
    .out (net99)
  );
  and_cell and54 (
    .a (net1),
    .b (net10),
    .out (net100)
  );
  and_cell and55 (
    .a (net100),
    .b (net8),
    .out (net101)
  );
  and_cell and56 (
    .a (net101),
    .b (net16),
    .out (net102)
  );
  and_cell and57 (
    .a (net102),
    .b (net20),
    .out (net103)
  );
  and_cell and58 (
    .a (net1),
    .b (net10),
    .out (net104)
  );
  and_cell and59 (
    .a (net104),
    .b (net14),
    .out (net105)
  );
  and_cell and60 (
    .a (net105),
    .b (net16),
    .out (net106)
  );
  and_cell and61 (
    .a (net106),
    .b (net19),
    .out (net107)
  );
  and_cell and62 (
    .a (net1),
    .b (net10),
    .out (net108)
  );
  and_cell and63 (
    .a (net108),
    .b (net14),
    .out (net109)
  );
  and_cell and64 (
    .a (net109),
    .b (net16),
    .out (net110)
  );
  and_cell and65 (
    .a (net110),
    .b (net20),
    .out (net111)
  );
  or_cell or8 (
    .a (net112),
    .b (net107),
    .out (net113)
  );
  or_cell or9 (
    .a (net83),
    .b (net89),
    .out (net114)
  );
  or_cell or10 (
    .a (net115),
    .b (net95),
    .out (net116)
  );
  or_cell or11 (
    .a (net114),
    .b (net91),
    .out (net115)
  );
  or_cell or12 (
    .a (net116),
    .b (net99),
    .out (net117)
  );
  or_cell or13 (
    .a (net117),
    .b (net103),
    .out (net112)
  );
  or_cell or14 (
    .a (net113),
    .b (net111),
    .out (net15)
  );
  and_cell and66 (
    .a (net118),
    .b (net14),
    .out (net119)
  );
  and_cell and67 (
    .a (net119),
    .b (net16),
    .out (net120)
  );
  and_cell and68 (
    .a (net11),
    .b (net10),
    .out (net118)
  );
  and_cell and69 (
    .a (net120),
    .b (net19),
    .out (net121)
  );
  and_cell and70 (
    .a (net1),
    .b (net10),
    .out (net122)
  );
  and_cell and71 (
    .a (net122),
    .b (net8),
    .out (net123)
  );
  and_cell and72 (
    .a (net123),
    .b (net16),
    .out (net124)
  );
  and_cell and73 (
    .a (net124),
    .b (net19),
    .out (net125)
  );
  and_cell and93 (
    .a (net1),
    .b (net10),
    .out (net126)
  );
  and_cell and94 (
    .a (net126),
    .b (net14),
    .out (net127)
  );
  and_cell and95 (
    .a (net127),
    .b (net16),
    .out (net128)
  );
  and_cell and96 (
    .a (net128),
    .b (net19),
    .out (net129)
  );
  or_cell or15 (
    .a (net121),
    .b (net125),
    .out (net130)
  );
  or_cell or20 (
    .a (net130),
    .b (net129),
    .out (net12)
  );
  not_cell not1 (
    .in (net4),
    .out (net3)
  );
  and_cell and98 (
    .a (net10),
    .b (net14),
    .out (net131)
  );
  and_cell and99 (
    .a (net131),
    .b (net17),
    .out (net132)
  );
  and_cell and100 (
    .a (net132),
    .b (net20),
    .out (net4)
  );
  and_cell and101 (
    .a (net10),
    .b (net8),
    .out (net133)
  );
  and_cell and102 (
    .a (net133),
    .b (net17),
    .out (net134)
  );
  and_cell and103 (
    .a (net134),
    .b (net20),
    .out (net5)
  );
endmodule

/* Automatically generated from https://wokwi.com/projects/363176375876859905 */

`default_nettype none

module user_module_363176375876859905(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2;
  wire net3;
  wire net4;
  wire net5 = 1'b1;
  wire net6;
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
  wire net38 = 1'b0;
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

  assign io_out[0] = net2;
  assign io_out[1] = net3;
  assign io_out[2] = net4;

  dff_cell flop1 (
    .d (net6),
    .clk (net1),
    .q (net7),
    .notq (net6)
  );
  dff_cell flop2 (
    .d (net8),
    .clk (net7),
    .q (net9),
    .notq (net8)
  );
  dff_cell flop3 (
    .d (net10),
    .clk (net9),
    .q (net11),
    .notq (net10)
  );
  dff_cell flop4 (
    .d (net12),
    .clk (net11),
    .q (net13),
    .notq (net12)
  );
  dff_cell flop5 (
    .d (net14),
    .clk (net13),
    .q (net15),
    .notq (net14)
  );
  dff_cell flop6 (
    .d (net16),
    .clk (net15),
    .q (net17),
    .notq (net16)
  );
  dff_cell flop7 (
    .d (net18),
    .clk (net17),
    .q (net19),
    .notq (net18)
  );
  dff_cell flop8 (
    .d (net20),
    .clk (net19),
    .q (net21),
    .notq (net20)
  );
  dff_cell flop9 (
    .d (net22),
    .clk (net21),
    .q (net23),
    .notq (net22)
  );
  dff_cell flop10 (
    .d (net24),
    .clk (net23),
    .q (net25),
    .notq (net24)
  );
  dff_cell flop11 (
    .d (net26),
    .clk (net25),
    .q (net27),
    .notq (net26)
  );
  dff_cell flop12 (
    .d (net28),
    .clk (net27),
    .q (net29),
    .notq (net28)
  );
  dff_cell flop13 (
    .d (net30),
    .clk (net29),
    .q (net31),
    .notq (net30)
  );
  dff_cell flop14 (
    .d (net32),
    .clk (net31),
    .q (net33),
    .notq (net32)
  );
  dff_cell flop15 (
    .d (net34),
    .clk (net33),
    .q (net35),
    .notq (net34)
  );
  dff_cell flop16 (
    .d (net36),
    .clk (net35),
    .q (net37),
    .notq (net36)
  );
  and_cell and1 (
    .a (net39),
    .b (net40),
    .out (net41)
  );
  dff_cell flop18 (
    .d (net41),
    .clk (net37),
    .q (net42),
    .notq (net39)
  );
  dff_cell flop19 (
    .d (net43),
    .clk (net37),
    .q (net40),
    .notq (net44)
  );
  and_cell and2 (
    .a (net39),
    .b (net44),
    .out (net43)
  );
  and_cell and3 (
    .a (net45),
    .b (net46),
    .out (net2)
  );
  and_cell and4 (
    .a (net47),
    .b (net42),
    .out (net4)
  );
  and_cell and5 (
    .a (net48),
    .b (net40),
    .out (net3)
  );
  not_cell not1 (
    .in (net42),
    .out (net45)
  );
  not_cell not2 (
    .in (net40),
    .out (net46)
  );
  not_cell not3 (
    .in (net42),
    .out (net48)
  );
  not_cell not4 (
    .in (net40),
    .out (net47)
  );
endmodule

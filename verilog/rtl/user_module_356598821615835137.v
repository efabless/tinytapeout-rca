/* Automatically generated from https://wokwi.com/projects/356598821615835137 */

`default_nettype none

module user_module_356598821615835137(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4;
  wire net5 = 1'b1;
  wire net6 = 1'b1;
  wire net7 = 1'b0;
  wire net8;
  wire net9;
  wire net10 = 1'b0;
  wire net11;
  wire net12;
  wire net13;
  wire net14;
  wire net15;
  wire net16;
  wire net17;
  wire net18;
  wire net19;
  wire net20 = 1'b0;
  wire net21 = 1'b0;

  assign io_out[0] = net3;
  assign io_out[1] = net4;

  dff_cell flop2 (
    .d (net8),
    .clk (net2),
    .q (net3)
  );
  dff_cell flop3 (
    .d (net9),
    .clk (net2),
    .q (net4)
  );
  and_cell gate7 (
    .a (net3),
    .b (net4),
    .out (net11)
  );
  and_cell gate8 (
    .a (net1),
    .b (net3),
    .out (net12)
  );
  and_cell gate9 (
    .a (net4),
    .b (net1),
    .out (net13)
  );
  or_cell gate10 (
    .a (net11),
    .b (net12),
    .out (net14)
  );
  or_cell gate11 (
    .a (net14),
    .b (net13),
    .out (net8)
  );
  and_cell gate12 (
    .a (net15),
    .b (net3),
    .out (net16)
  );
  and_cell gate13 (
    .a (net3),
    .b (net1),
    .out (net17)
  );
  and_cell gate14 (
    .a (net1),
    .b (net15),
    .out (net18)
  );
  or_cell gate15 (
    .a (net17),
    .b (net18),
    .out (net19)
  );
  or_cell gate16 (
    .a (net16),
    .b (net19),
    .out (net9)
  );
  not_cell gate17 (
    .in (net4),
    .out (net15)
  );
endmodule

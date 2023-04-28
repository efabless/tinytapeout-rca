/* Automatically generated from https://wokwi.com/projects/363170940975709185 */

`default_nettype none

module user_module_363170940975709185(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b0;
  wire net5 = 1'b1;
  wire net6;
  wire net7;

  assign io_out[0] = net3;

  and_cell and1 (
    .a (net6),
    .b (net7),
    .out (net3)
  );
  not_cell not1 (
    .in (net1),
    .out (net6)
  );
  not_cell not2 (
    .in (net2),
    .out (net7)
  );
endmodule

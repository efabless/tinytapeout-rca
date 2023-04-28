/* Automatically generated from https://wokwi.com/projects/361088881055404033 */

`default_nettype none

module user_module_361088881055404033(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5 = 1'b1;
  wire net6;
  wire net7 = 1'b0;

  assign io_out[0] = net4;

  and_cell and1 (
    .a (net1),
    .b (net3),
    .out (net6)
  );
  or_cell or1 (
    .a (net6),
    .b (net2),
    .out (net4)
  );
endmodule

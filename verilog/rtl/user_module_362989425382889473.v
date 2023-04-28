/* Automatically generated from https://wokwi.com/projects/362989425382889473 */

`default_nettype none

module user_module_362989425382889473(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4;
  wire net5 = 1'b0;
  wire net6 = 1'b1;
  wire net7;
  wire net8;

  assign io_out[0] = net4;

  not_cell not1 (
    .in (net2),
    .out (net7)
  );
  and_cell and1 (
    .a (net1),
    .b (net7),
    .out (net8)
  );
  and_cell and2 (
    .a (net8),
    .b (net3),
    .out (net4)
  );
endmodule

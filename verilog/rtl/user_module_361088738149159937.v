/* Automatically generated from https://wokwi.com/projects/361088738149159937 */

`default_nettype none

module user_module_361088738149159937(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b0;
  wire net5 = 1'b1;
  wire net6;

  assign io_out[0] = net3;

  or_cell or1 (
    .a (net6),
    .b (net2),
    .out (net3)
  );
  not_cell not1 (
    .in (net1),
    .out (net6)
  );
endmodule

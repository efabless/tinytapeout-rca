/* Automatically generated from https://wokwi.com/projects/361088812700822529 */

`default_nettype none

module user_module_361088812700822529(
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

  assign io_out[1] = net4;

  or_cell or1 (
    .a (net1),
    .b (net2),
    .out (net7)
  );
  and_cell and1 (
    .a (net7),
    .b (net3),
    .out (net4)
  );
endmodule

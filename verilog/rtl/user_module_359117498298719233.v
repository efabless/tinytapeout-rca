/* Automatically generated from https://wokwi.com/projects/359117498298719233 */

`default_nettype none

module user_module_359117498298719233(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3 = io_in[2];
  wire net4 = io_in[3];
  wire net5;
  wire net6 = 1'b1;
  wire net7;
  wire net8;
  wire net9;
  wire net10 = 1'b0;

  assign io_out[0] = net5;

  and_cell and1 (
    .a (net1),
    .b (net2),
    .out (net7)
  );
  or_cell or1 (
    .a (net7),
    .b (net4),
    .out (net8)
  );
  and_cell and2 (
    .a (net2),
    .b (net3),
    .out (net9)
  );
  xor_cell xor1 (
    .a (net8),
    .b (net9),
    .out (net5)
  );
endmodule

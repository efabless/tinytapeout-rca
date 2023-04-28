/* Automatically generated from https://wokwi.com/projects/363170982149101569 */

`default_nettype none

module user_module_363170982149101569(
  input [7:0] io_in,
  output [7:0] io_out
);
  wire net1 = io_in[0];
  wire net2 = io_in[1];
  wire net3;
  wire net4 = 1'b1;
  wire net5;

  assign io_out[1] = net3;

  and_cell and1 (
    .a (net1),
    .b (net5),
    .out (net3)
  );
  or_cell or1 (
    .a (net1),
    .b (net2),
    .out (net5)
  );
endmodule

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 * THIS FILE HAS BEEN GENERATED USING multi_tools_project CODEGEN
 * IF YOU NEED TO MAKE EDITS TO IT, EDIT codegen/caravel_iface_header.txt
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,       // User area 1 3.3V supply
    inout vdda2,       // User area 2 3.3V supply
    inout vssa1,       // User area 1 analog ground
    inout vssa2,       // User area 2 analog ground
    inout vccd1,       // User area 1 1.8V supply
    inout vccd2,       // User area 2 1.8v supply
    inout vssd1,       // User area 1 digital ground
    inout vssd2,       // User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    // start of module instantiation

    wire sc_clk_out, sc_data_out, sc_latch_out, sc_scan_out;
    wire sc_clk_in,  sc_data_in;

    scan_controller #(.NUM_DESIGNS(250)) scan_controller (
       .clk                    (wb_clk_i),
       .reset                  (wb_rst_i),
       .active_select          (io_in[20:12]),
       .inputs                 (io_in[28:21]),
       .outputs                (io_out[36:29]),
       .ready                  (io_out[37]),
       .slow_clk               (io_out[10]),
       .set_clk_div            (io_in[11]),

       .scan_clk_out           (sc_clk_out),
       .scan_clk_in            (sc_clk_in),
       .scan_data_out          (sc_data_out),
       .scan_data_in           (sc_data_in),
       .scan_select            (sc_scan_out),
       .scan_latch_en          (sc_latch_out),

       .la_scan_clk_in         (la_data_in[0]),
       .la_scan_data_in        (la_data_in[1]),
       .la_scan_data_out       (la_data_out[0]),
       .la_scan_select         (la_data_in[2]),
       .la_scan_latch_en       (la_data_in[3]),

       .driver_sel             (io_in[9:8]),

       .oeb                    (io_oeb)
    );

    // [000] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_000_clk_out, sw_000_data_out, sw_000_scan_out, sw_000_latch_out;
    wire [7:0] sw_000_module_data_in;
    wire [7:0] sw_000_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_000 (
        .clk_in          (sc_clk_out),
        .data_in         (sc_data_out),
        .scan_select_in  (sc_scan_out),
        .latch_enable_in (sc_latch_out),
        .clk_out         (sw_000_clk_out),
        .data_out        (sw_000_data_out),
        .scan_select_out (sw_000_scan_out),
        .latch_enable_out(sw_000_latch_out),
        .module_data_in  (sw_000_module_data_in),
        .module_data_out (sw_000_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_000 (
        .io_in  (sw_000_module_data_in),
        .io_out (sw_000_module_data_out)
    );

    // [001] https://github.com/pedrosajp/a-and-c-or-b
    wire sw_001_clk_out, sw_001_data_out, sw_001_scan_out, sw_001_latch_out;
    wire [7:0] sw_001_module_data_in;
    wire [7:0] sw_001_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_001 (
        .clk_in          (sw_000_clk_out),
        .data_in         (sw_000_data_out),
        .scan_select_in  (sw_000_scan_out),
        .latch_enable_in (sw_000_latch_out),
        .clk_out         (sw_001_clk_out),
        .data_out        (sw_001_data_out),
        .scan_select_out (sw_001_scan_out),
        .latch_enable_out(sw_001_latch_out),
        .module_data_in  (sw_001_module_data_in),
        .module_data_out (sw_001_module_data_out)
    );

    user_module_361088881055404033 user_module_361088881055404033_001 (
        .io_in  (sw_001_module_data_in),
        .io_out (sw_001_module_data_out)
    );

    // [002] https://github.com/carterclay2/A-OR-B-AND-C
    wire sw_002_clk_out, sw_002_data_out, sw_002_scan_out, sw_002_latch_out;
    wire [7:0] sw_002_module_data_in;
    wire [7:0] sw_002_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_002 (
        .clk_in          (sw_001_clk_out),
        .data_in         (sw_001_data_out),
        .scan_select_in  (sw_001_scan_out),
        .latch_enable_in (sw_001_latch_out),
        .clk_out         (sw_002_clk_out),
        .data_out        (sw_002_data_out),
        .scan_select_out (sw_002_scan_out),
        .latch_enable_out(sw_002_latch_out),
        .module_data_in  (sw_002_module_data_in),
        .module_data_out (sw_002_module_data_out)
    );

    user_module_361088812700822529 user_module_361088812700822529_002 (
        .io_in  (sw_002_module_data_in),
        .io_out (sw_002_module_data_out)
    );

    // [003] https://github.com/ImmanuelZL/B-and-C-or-A
    wire sw_003_clk_out, sw_003_data_out, sw_003_scan_out, sw_003_latch_out;
    wire [7:0] sw_003_module_data_in;
    wire [7:0] sw_003_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_003 (
        .clk_in          (sw_002_clk_out),
        .data_in         (sw_002_data_out),
        .scan_select_in  (sw_002_scan_out),
        .latch_enable_in (sw_002_latch_out),
        .clk_out         (sw_003_clk_out),
        .data_out        (sw_003_data_out),
        .scan_select_out (sw_003_scan_out),
        .latch_enable_out(sw_003_latch_out),
        .module_data_in  (sw_003_module_data_in),
        .module_data_out (sw_003_module_data_out)
    );

    user_module_361088803642172417 user_module_361088803642172417_003 (
        .io_in  (sw_003_module_data_in),
        .io_out (sw_003_module_data_out)
    );

    // [004] https://github.com/CharlizeH/Tiny-Tapeout-A-OR-NOT-B-OR-C
    wire sw_004_clk_out, sw_004_data_out, sw_004_scan_out, sw_004_latch_out;
    wire [7:0] sw_004_module_data_in;
    wire [7:0] sw_004_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_004 (
        .clk_in          (sw_003_clk_out),
        .data_in         (sw_003_data_out),
        .scan_select_in  (sw_003_scan_out),
        .latch_enable_in (sw_003_latch_out),
        .clk_out         (sw_004_clk_out),
        .data_out        (sw_004_data_out),
        .scan_select_out (sw_004_scan_out),
        .latch_enable_out(sw_004_latch_out),
        .module_data_in  (sw_004_module_data_in),
        .module_data_out (sw_004_module_data_out)
    );

    user_module_359117498298719233 user_module_359117498298719233_004 (
        .io_in  (sw_004_module_data_in),
        .io_out (sw_004_module_data_out)
    );

    // [005] https://github.com/dinobambino1/A-xor-B-and-C
    wire sw_005_clk_out, sw_005_data_out, sw_005_scan_out, sw_005_latch_out;
    wire [7:0] sw_005_module_data_in;
    wire [7:0] sw_005_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_005 (
        .clk_in          (sw_004_clk_out),
        .data_in         (sw_004_data_out),
        .scan_select_in  (sw_004_scan_out),
        .latch_enable_in (sw_004_latch_out),
        .clk_out         (sw_005_clk_out),
        .data_out        (sw_005_data_out),
        .scan_select_out (sw_005_scan_out),
        .latch_enable_out(sw_005_latch_out),
        .module_data_in  (sw_005_module_data_in),
        .module_data_out (sw_005_module_data_out)
    );

    user_module_361721071853260801 user_module_361721071853260801_005 (
        .io_in  (sw_005_module_data_in),
        .io_out (sw_005_module_data_out)
    );

    // [006] https://github.com/JermaineRM/jermaines-fork
    wire sw_006_clk_out, sw_006_data_out, sw_006_scan_out, sw_006_latch_out;
    wire [7:0] sw_006_module_data_in;
    wire [7:0] sw_006_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_006 (
        .clk_in          (sw_005_clk_out),
        .data_in         (sw_005_data_out),
        .scan_select_in  (sw_005_scan_out),
        .latch_enable_in (sw_005_latch_out),
        .clk_out         (sw_006_clk_out),
        .data_out        (sw_006_data_out),
        .scan_select_out (sw_006_scan_out),
        .latch_enable_out(sw_006_latch_out),
        .module_data_in  (sw_006_module_data_in),
        .module_data_out (sw_006_module_data_out)
    );

    user_module_363170982149101569 user_module_363170982149101569_006 (
        .io_in  (sw_006_module_data_in),
        .io_out (sw_006_module_data_out)
    );

    // [007] https://github.com/DanieljosC/not-a-and-not-b-
    wire sw_007_clk_out, sw_007_data_out, sw_007_scan_out, sw_007_latch_out;
    wire [7:0] sw_007_module_data_in;
    wire [7:0] sw_007_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_007 (
        .clk_in          (sw_006_clk_out),
        .data_in         (sw_006_data_out),
        .scan_select_in  (sw_006_scan_out),
        .latch_enable_in (sw_006_latch_out),
        .clk_out         (sw_007_clk_out),
        .data_out        (sw_007_data_out),
        .scan_select_out (sw_007_scan_out),
        .latch_enable_out(sw_007_latch_out),
        .module_data_in  (sw_007_module_data_in),
        .module_data_out (sw_007_module_data_out)
    );

    user_module_363170940975709185 user_module_363170940975709185_007 (
        .io_in  (sw_007_module_data_in),
        .io_out (sw_007_module_data_out)
    );

    // [008] https://github.com/RCAstudent10/A-not-B-and-C
    wire sw_008_clk_out, sw_008_data_out, sw_008_scan_out, sw_008_latch_out;
    wire [7:0] sw_008_module_data_in;
    wire [7:0] sw_008_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_008 (
        .clk_in          (sw_007_clk_out),
        .data_in         (sw_007_data_out),
        .scan_select_in  (sw_007_scan_out),
        .latch_enable_in (sw_007_latch_out),
        .clk_out         (sw_008_clk_out),
        .data_out        (sw_008_data_out),
        .scan_select_out (sw_008_scan_out),
        .latch_enable_out(sw_008_latch_out),
        .module_data_in  (sw_008_module_data_in),
        .module_data_out (sw_008_module_data_out)
    );

    user_module_362989425382889473 user_module_362989425382889473_008 (
        .io_in  (sw_008_module_data_in),
        .io_out (sw_008_module_data_out)
    );

    // [009] https://github.com/ldholmes2000/Not-A-Or-B
    wire sw_009_clk_out, sw_009_data_out, sw_009_scan_out, sw_009_latch_out;
    wire [7:0] sw_009_module_data_in;
    wire [7:0] sw_009_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_009 (
        .clk_in          (sw_008_clk_out),
        .data_in         (sw_008_data_out),
        .scan_select_in  (sw_008_scan_out),
        .latch_enable_in (sw_008_latch_out),
        .clk_out         (sw_009_clk_out),
        .data_out        (sw_009_data_out),
        .scan_select_out (sw_009_scan_out),
        .latch_enable_out(sw_009_latch_out),
        .module_data_in  (sw_009_module_data_in),
        .module_data_out (sw_009_module_data_out)
    );

    user_module_361088738149159937 user_module_361088738149159937_009 (
        .io_in  (sw_009_module_data_in),
        .io_out (sw_009_module_data_out)
    );

    // [010] https://github.com/fiumad/Tiny-Tapeout-Simple-Elevator
    wire sw_010_clk_out, sw_010_data_out, sw_010_scan_out, sw_010_latch_out;
    wire [7:0] sw_010_module_data_in;
    wire [7:0] sw_010_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_010 (
        .clk_in          (sw_009_clk_out),
        .data_in         (sw_009_data_out),
        .scan_select_in  (sw_009_scan_out),
        .latch_enable_in (sw_009_latch_out),
        .clk_out         (sw_010_clk_out),
        .data_out        (sw_010_data_out),
        .scan_select_out (sw_010_scan_out),
        .latch_enable_out(sw_010_latch_out),
        .module_data_in  (sw_010_module_data_in),
        .module_data_out (sw_010_module_data_out)
    );

    user_module_356598821615835137 user_module_356598821615835137_010 (
        .io_in  (sw_010_module_data_in),
        .io_out (sw_010_module_data_out)
    );

    // [011] https://github.com/fiumad/RCA-Traffic-Light
    wire sw_011_clk_out, sw_011_data_out, sw_011_scan_out, sw_011_latch_out;
    wire [7:0] sw_011_module_data_in;
    wire [7:0] sw_011_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_011 (
        .clk_in          (sw_010_clk_out),
        .data_in         (sw_010_data_out),
        .scan_select_in  (sw_010_scan_out),
        .latch_enable_in (sw_010_latch_out),
        .clk_out         (sw_011_clk_out),
        .data_out        (sw_011_data_out),
        .scan_select_out (sw_011_scan_out),
        .latch_enable_out(sw_011_latch_out),
        .module_data_in  (sw_011_module_data_in),
        .module_data_out (sw_011_module_data_out)
    );

    user_module_363176375876859905 user_module_363176375876859905_011 (
        .io_in  (sw_011_module_data_in),
        .io_out (sw_011_module_data_out)
    );

    // [012] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_012_clk_out, sw_012_data_out, sw_012_scan_out, sw_012_latch_out;
    wire [7:0] sw_012_module_data_in;
    wire [7:0] sw_012_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_012 (
        .clk_in          (sw_011_clk_out),
        .data_in         (sw_011_data_out),
        .scan_select_in  (sw_011_scan_out),
        .latch_enable_in (sw_011_latch_out),
        .clk_out         (sw_012_clk_out),
        .data_out        (sw_012_data_out),
        .scan_select_out (sw_012_scan_out),
        .latch_enable_out(sw_012_latch_out),
        .module_data_in  (sw_012_module_data_in),
        .module_data_out (sw_012_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_012 (
        .io_in  (sw_012_module_data_in),
        .io_out (sw_012_module_data_out)
    );

    // [013] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_013_clk_out, sw_013_data_out, sw_013_scan_out, sw_013_latch_out;
    wire [7:0] sw_013_module_data_in;
    wire [7:0] sw_013_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_013 (
        .clk_in          (sw_012_clk_out),
        .data_in         (sw_012_data_out),
        .scan_select_in  (sw_012_scan_out),
        .latch_enable_in (sw_012_latch_out),
        .clk_out         (sw_013_clk_out),
        .data_out        (sw_013_data_out),
        .scan_select_out (sw_013_scan_out),
        .latch_enable_out(sw_013_latch_out),
        .module_data_in  (sw_013_module_data_in),
        .module_data_out (sw_013_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_013 (
        .io_in  (sw_013_module_data_in),
        .io_out (sw_013_module_data_out)
    );

    // [014] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_014_clk_out, sw_014_data_out, sw_014_scan_out, sw_014_latch_out;
    wire [7:0] sw_014_module_data_in;
    wire [7:0] sw_014_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_014 (
        .clk_in          (sw_013_clk_out),
        .data_in         (sw_013_data_out),
        .scan_select_in  (sw_013_scan_out),
        .latch_enable_in (sw_013_latch_out),
        .clk_out         (sw_014_clk_out),
        .data_out        (sw_014_data_out),
        .scan_select_out (sw_014_scan_out),
        .latch_enable_out(sw_014_latch_out),
        .module_data_in  (sw_014_module_data_in),
        .module_data_out (sw_014_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_014 (
        .io_in  (sw_014_module_data_in),
        .io_out (sw_014_module_data_out)
    );

    // [015] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_015_clk_out, sw_015_data_out, sw_015_scan_out, sw_015_latch_out;
    wire [7:0] sw_015_module_data_in;
    wire [7:0] sw_015_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_015 (
        .clk_in          (sw_014_clk_out),
        .data_in         (sw_014_data_out),
        .scan_select_in  (sw_014_scan_out),
        .latch_enable_in (sw_014_latch_out),
        .clk_out         (sw_015_clk_out),
        .data_out        (sw_015_data_out),
        .scan_select_out (sw_015_scan_out),
        .latch_enable_out(sw_015_latch_out),
        .module_data_in  (sw_015_module_data_in),
        .module_data_out (sw_015_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_015 (
        .io_in  (sw_015_module_data_in),
        .io_out (sw_015_module_data_out)
    );

    // [016] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_016_clk_out, sw_016_data_out, sw_016_scan_out, sw_016_latch_out;
    wire [7:0] sw_016_module_data_in;
    wire [7:0] sw_016_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_016 (
        .clk_in          (sw_015_clk_out),
        .data_in         (sw_015_data_out),
        .scan_select_in  (sw_015_scan_out),
        .latch_enable_in (sw_015_latch_out),
        .clk_out         (sw_016_clk_out),
        .data_out        (sw_016_data_out),
        .scan_select_out (sw_016_scan_out),
        .latch_enable_out(sw_016_latch_out),
        .module_data_in  (sw_016_module_data_in),
        .module_data_out (sw_016_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_016 (
        .io_in  (sw_016_module_data_in),
        .io_out (sw_016_module_data_out)
    );

    // [017] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_017_clk_out, sw_017_data_out, sw_017_scan_out, sw_017_latch_out;
    wire [7:0] sw_017_module_data_in;
    wire [7:0] sw_017_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_017 (
        .clk_in          (sw_016_clk_out),
        .data_in         (sw_016_data_out),
        .scan_select_in  (sw_016_scan_out),
        .latch_enable_in (sw_016_latch_out),
        .clk_out         (sw_017_clk_out),
        .data_out        (sw_017_data_out),
        .scan_select_out (sw_017_scan_out),
        .latch_enable_out(sw_017_latch_out),
        .module_data_in  (sw_017_module_data_in),
        .module_data_out (sw_017_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_017 (
        .io_in  (sw_017_module_data_in),
        .io_out (sw_017_module_data_out)
    );

    // [018] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_018_clk_out, sw_018_data_out, sw_018_scan_out, sw_018_latch_out;
    wire [7:0] sw_018_module_data_in;
    wire [7:0] sw_018_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_018 (
        .clk_in          (sw_017_clk_out),
        .data_in         (sw_017_data_out),
        .scan_select_in  (sw_017_scan_out),
        .latch_enable_in (sw_017_latch_out),
        .clk_out         (sw_018_clk_out),
        .data_out        (sw_018_data_out),
        .scan_select_out (sw_018_scan_out),
        .latch_enable_out(sw_018_latch_out),
        .module_data_in  (sw_018_module_data_in),
        .module_data_out (sw_018_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_018 (
        .io_in  (sw_018_module_data_in),
        .io_out (sw_018_module_data_out)
    );

    // [019] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_019_clk_out, sw_019_data_out, sw_019_scan_out, sw_019_latch_out;
    wire [7:0] sw_019_module_data_in;
    wire [7:0] sw_019_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_019 (
        .clk_in          (sw_018_clk_out),
        .data_in         (sw_018_data_out),
        .scan_select_in  (sw_018_scan_out),
        .latch_enable_in (sw_018_latch_out),
        .clk_out         (sw_019_clk_out),
        .data_out        (sw_019_data_out),
        .scan_select_out (sw_019_scan_out),
        .latch_enable_out(sw_019_latch_out),
        .module_data_in  (sw_019_module_data_in),
        .module_data_out (sw_019_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_019 (
        .io_in  (sw_019_module_data_in),
        .io_out (sw_019_module_data_out)
    );

    // [020] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_020_clk_out, sw_020_data_out, sw_020_scan_out, sw_020_latch_out;
    wire [7:0] sw_020_module_data_in;
    wire [7:0] sw_020_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_020 (
        .clk_in          (sw_019_clk_out),
        .data_in         (sw_019_data_out),
        .scan_select_in  (sw_019_scan_out),
        .latch_enable_in (sw_019_latch_out),
        .clk_out         (sw_020_clk_out),
        .data_out        (sw_020_data_out),
        .scan_select_out (sw_020_scan_out),
        .latch_enable_out(sw_020_latch_out),
        .module_data_in  (sw_020_module_data_in),
        .module_data_out (sw_020_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_020 (
        .io_in  (sw_020_module_data_in),
        .io_out (sw_020_module_data_out)
    );

    // [021] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_021_clk_out, sw_021_data_out, sw_021_scan_out, sw_021_latch_out;
    wire [7:0] sw_021_module_data_in;
    wire [7:0] sw_021_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_021 (
        .clk_in          (sw_020_clk_out),
        .data_in         (sw_020_data_out),
        .scan_select_in  (sw_020_scan_out),
        .latch_enable_in (sw_020_latch_out),
        .clk_out         (sw_021_clk_out),
        .data_out        (sw_021_data_out),
        .scan_select_out (sw_021_scan_out),
        .latch_enable_out(sw_021_latch_out),
        .module_data_in  (sw_021_module_data_in),
        .module_data_out (sw_021_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_021 (
        .io_in  (sw_021_module_data_in),
        .io_out (sw_021_module_data_out)
    );

    // [022] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_022_clk_out, sw_022_data_out, sw_022_scan_out, sw_022_latch_out;
    wire [7:0] sw_022_module_data_in;
    wire [7:0] sw_022_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_022 (
        .clk_in          (sw_021_clk_out),
        .data_in         (sw_021_data_out),
        .scan_select_in  (sw_021_scan_out),
        .latch_enable_in (sw_021_latch_out),
        .clk_out         (sw_022_clk_out),
        .data_out        (sw_022_data_out),
        .scan_select_out (sw_022_scan_out),
        .latch_enable_out(sw_022_latch_out),
        .module_data_in  (sw_022_module_data_in),
        .module_data_out (sw_022_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_022 (
        .io_in  (sw_022_module_data_in),
        .io_out (sw_022_module_data_out)
    );

    // [023] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_023_clk_out, sw_023_data_out, sw_023_scan_out, sw_023_latch_out;
    wire [7:0] sw_023_module_data_in;
    wire [7:0] sw_023_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_023 (
        .clk_in          (sw_022_clk_out),
        .data_in         (sw_022_data_out),
        .scan_select_in  (sw_022_scan_out),
        .latch_enable_in (sw_022_latch_out),
        .clk_out         (sw_023_clk_out),
        .data_out        (sw_023_data_out),
        .scan_select_out (sw_023_scan_out),
        .latch_enable_out(sw_023_latch_out),
        .module_data_in  (sw_023_module_data_in),
        .module_data_out (sw_023_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_023 (
        .io_in  (sw_023_module_data_in),
        .io_out (sw_023_module_data_out)
    );

    // [024] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_024_clk_out, sw_024_data_out, sw_024_scan_out, sw_024_latch_out;
    wire [7:0] sw_024_module_data_in;
    wire [7:0] sw_024_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_024 (
        .clk_in          (sw_023_clk_out),
        .data_in         (sw_023_data_out),
        .scan_select_in  (sw_023_scan_out),
        .latch_enable_in (sw_023_latch_out),
        .clk_out         (sw_024_clk_out),
        .data_out        (sw_024_data_out),
        .scan_select_out (sw_024_scan_out),
        .latch_enable_out(sw_024_latch_out),
        .module_data_in  (sw_024_module_data_in),
        .module_data_out (sw_024_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_024 (
        .io_in  (sw_024_module_data_in),
        .io_out (sw_024_module_data_out)
    );

    // [025] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_025_clk_out, sw_025_data_out, sw_025_scan_out, sw_025_latch_out;
    wire [7:0] sw_025_module_data_in;
    wire [7:0] sw_025_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_025 (
        .clk_in          (sw_024_clk_out),
        .data_in         (sw_024_data_out),
        .scan_select_in  (sw_024_scan_out),
        .latch_enable_in (sw_024_latch_out),
        .clk_out         (sw_025_clk_out),
        .data_out        (sw_025_data_out),
        .scan_select_out (sw_025_scan_out),
        .latch_enable_out(sw_025_latch_out),
        .module_data_in  (sw_025_module_data_in),
        .module_data_out (sw_025_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_025 (
        .io_in  (sw_025_module_data_in),
        .io_out (sw_025_module_data_out)
    );

    // [026] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_026_clk_out, sw_026_data_out, sw_026_scan_out, sw_026_latch_out;
    wire [7:0] sw_026_module_data_in;
    wire [7:0] sw_026_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_026 (
        .clk_in          (sw_025_clk_out),
        .data_in         (sw_025_data_out),
        .scan_select_in  (sw_025_scan_out),
        .latch_enable_in (sw_025_latch_out),
        .clk_out         (sw_026_clk_out),
        .data_out        (sw_026_data_out),
        .scan_select_out (sw_026_scan_out),
        .latch_enable_out(sw_026_latch_out),
        .module_data_in  (sw_026_module_data_in),
        .module_data_out (sw_026_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_026 (
        .io_in  (sw_026_module_data_in),
        .io_out (sw_026_module_data_out)
    );

    // [027] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_027_clk_out, sw_027_data_out, sw_027_scan_out, sw_027_latch_out;
    wire [7:0] sw_027_module_data_in;
    wire [7:0] sw_027_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_027 (
        .clk_in          (sw_026_clk_out),
        .data_in         (sw_026_data_out),
        .scan_select_in  (sw_026_scan_out),
        .latch_enable_in (sw_026_latch_out),
        .clk_out         (sw_027_clk_out),
        .data_out        (sw_027_data_out),
        .scan_select_out (sw_027_scan_out),
        .latch_enable_out(sw_027_latch_out),
        .module_data_in  (sw_027_module_data_in),
        .module_data_out (sw_027_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_027 (
        .io_in  (sw_027_module_data_in),
        .io_out (sw_027_module_data_out)
    );

    // [028] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_028_clk_out, sw_028_data_out, sw_028_scan_out, sw_028_latch_out;
    wire [7:0] sw_028_module_data_in;
    wire [7:0] sw_028_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_028 (
        .clk_in          (sw_027_clk_out),
        .data_in         (sw_027_data_out),
        .scan_select_in  (sw_027_scan_out),
        .latch_enable_in (sw_027_latch_out),
        .clk_out         (sw_028_clk_out),
        .data_out        (sw_028_data_out),
        .scan_select_out (sw_028_scan_out),
        .latch_enable_out(sw_028_latch_out),
        .module_data_in  (sw_028_module_data_in),
        .module_data_out (sw_028_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_028 (
        .io_in  (sw_028_module_data_in),
        .io_out (sw_028_module_data_out)
    );

    // [029] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_029_clk_out, sw_029_data_out, sw_029_scan_out, sw_029_latch_out;
    wire [7:0] sw_029_module_data_in;
    wire [7:0] sw_029_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_029 (
        .clk_in          (sw_028_clk_out),
        .data_in         (sw_028_data_out),
        .scan_select_in  (sw_028_scan_out),
        .latch_enable_in (sw_028_latch_out),
        .clk_out         (sw_029_clk_out),
        .data_out        (sw_029_data_out),
        .scan_select_out (sw_029_scan_out),
        .latch_enable_out(sw_029_latch_out),
        .module_data_in  (sw_029_module_data_in),
        .module_data_out (sw_029_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_029 (
        .io_in  (sw_029_module_data_in),
        .io_out (sw_029_module_data_out)
    );

    // [030] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_030_clk_out, sw_030_data_out, sw_030_scan_out, sw_030_latch_out;
    wire [7:0] sw_030_module_data_in;
    wire [7:0] sw_030_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_030 (
        .clk_in          (sw_029_clk_out),
        .data_in         (sw_029_data_out),
        .scan_select_in  (sw_029_scan_out),
        .latch_enable_in (sw_029_latch_out),
        .clk_out         (sw_030_clk_out),
        .data_out        (sw_030_data_out),
        .scan_select_out (sw_030_scan_out),
        .latch_enable_out(sw_030_latch_out),
        .module_data_in  (sw_030_module_data_in),
        .module_data_out (sw_030_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_030 (
        .io_in  (sw_030_module_data_in),
        .io_out (sw_030_module_data_out)
    );

    // [031] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_031_clk_out, sw_031_data_out, sw_031_scan_out, sw_031_latch_out;
    wire [7:0] sw_031_module_data_in;
    wire [7:0] sw_031_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_031 (
        .clk_in          (sw_030_clk_out),
        .data_in         (sw_030_data_out),
        .scan_select_in  (sw_030_scan_out),
        .latch_enable_in (sw_030_latch_out),
        .clk_out         (sw_031_clk_out),
        .data_out        (sw_031_data_out),
        .scan_select_out (sw_031_scan_out),
        .latch_enable_out(sw_031_latch_out),
        .module_data_in  (sw_031_module_data_in),
        .module_data_out (sw_031_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_031 (
        .io_in  (sw_031_module_data_in),
        .io_out (sw_031_module_data_out)
    );

    // [032] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_032_clk_out, sw_032_data_out, sw_032_scan_out, sw_032_latch_out;
    wire [7:0] sw_032_module_data_in;
    wire [7:0] sw_032_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_032 (
        .clk_in          (sw_031_clk_out),
        .data_in         (sw_031_data_out),
        .scan_select_in  (sw_031_scan_out),
        .latch_enable_in (sw_031_latch_out),
        .clk_out         (sw_032_clk_out),
        .data_out        (sw_032_data_out),
        .scan_select_out (sw_032_scan_out),
        .latch_enable_out(sw_032_latch_out),
        .module_data_in  (sw_032_module_data_in),
        .module_data_out (sw_032_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_032 (
        .io_in  (sw_032_module_data_in),
        .io_out (sw_032_module_data_out)
    );

    // [033] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_033_clk_out, sw_033_data_out, sw_033_scan_out, sw_033_latch_out;
    wire [7:0] sw_033_module_data_in;
    wire [7:0] sw_033_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_033 (
        .clk_in          (sw_032_clk_out),
        .data_in         (sw_032_data_out),
        .scan_select_in  (sw_032_scan_out),
        .latch_enable_in (sw_032_latch_out),
        .clk_out         (sw_033_clk_out),
        .data_out        (sw_033_data_out),
        .scan_select_out (sw_033_scan_out),
        .latch_enable_out(sw_033_latch_out),
        .module_data_in  (sw_033_module_data_in),
        .module_data_out (sw_033_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_033 (
        .io_in  (sw_033_module_data_in),
        .io_out (sw_033_module_data_out)
    );

    // [034] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_034_clk_out, sw_034_data_out, sw_034_scan_out, sw_034_latch_out;
    wire [7:0] sw_034_module_data_in;
    wire [7:0] sw_034_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_034 (
        .clk_in          (sw_033_clk_out),
        .data_in         (sw_033_data_out),
        .scan_select_in  (sw_033_scan_out),
        .latch_enable_in (sw_033_latch_out),
        .clk_out         (sw_034_clk_out),
        .data_out        (sw_034_data_out),
        .scan_select_out (sw_034_scan_out),
        .latch_enable_out(sw_034_latch_out),
        .module_data_in  (sw_034_module_data_in),
        .module_data_out (sw_034_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_034 (
        .io_in  (sw_034_module_data_in),
        .io_out (sw_034_module_data_out)
    );

    // [035] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_035_clk_out, sw_035_data_out, sw_035_scan_out, sw_035_latch_out;
    wire [7:0] sw_035_module_data_in;
    wire [7:0] sw_035_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_035 (
        .clk_in          (sw_034_clk_out),
        .data_in         (sw_034_data_out),
        .scan_select_in  (sw_034_scan_out),
        .latch_enable_in (sw_034_latch_out),
        .clk_out         (sw_035_clk_out),
        .data_out        (sw_035_data_out),
        .scan_select_out (sw_035_scan_out),
        .latch_enable_out(sw_035_latch_out),
        .module_data_in  (sw_035_module_data_in),
        .module_data_out (sw_035_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_035 (
        .io_in  (sw_035_module_data_in),
        .io_out (sw_035_module_data_out)
    );

    // [036] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_036_clk_out, sw_036_data_out, sw_036_scan_out, sw_036_latch_out;
    wire [7:0] sw_036_module_data_in;
    wire [7:0] sw_036_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_036 (
        .clk_in          (sw_035_clk_out),
        .data_in         (sw_035_data_out),
        .scan_select_in  (sw_035_scan_out),
        .latch_enable_in (sw_035_latch_out),
        .clk_out         (sw_036_clk_out),
        .data_out        (sw_036_data_out),
        .scan_select_out (sw_036_scan_out),
        .latch_enable_out(sw_036_latch_out),
        .module_data_in  (sw_036_module_data_in),
        .module_data_out (sw_036_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_036 (
        .io_in  (sw_036_module_data_in),
        .io_out (sw_036_module_data_out)
    );

    // [037] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_037_clk_out, sw_037_data_out, sw_037_scan_out, sw_037_latch_out;
    wire [7:0] sw_037_module_data_in;
    wire [7:0] sw_037_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_037 (
        .clk_in          (sw_036_clk_out),
        .data_in         (sw_036_data_out),
        .scan_select_in  (sw_036_scan_out),
        .latch_enable_in (sw_036_latch_out),
        .clk_out         (sw_037_clk_out),
        .data_out        (sw_037_data_out),
        .scan_select_out (sw_037_scan_out),
        .latch_enable_out(sw_037_latch_out),
        .module_data_in  (sw_037_module_data_in),
        .module_data_out (sw_037_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_037 (
        .io_in  (sw_037_module_data_in),
        .io_out (sw_037_module_data_out)
    );

    // [038] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_038_clk_out, sw_038_data_out, sw_038_scan_out, sw_038_latch_out;
    wire [7:0] sw_038_module_data_in;
    wire [7:0] sw_038_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_038 (
        .clk_in          (sw_037_clk_out),
        .data_in         (sw_037_data_out),
        .scan_select_in  (sw_037_scan_out),
        .latch_enable_in (sw_037_latch_out),
        .clk_out         (sw_038_clk_out),
        .data_out        (sw_038_data_out),
        .scan_select_out (sw_038_scan_out),
        .latch_enable_out(sw_038_latch_out),
        .module_data_in  (sw_038_module_data_in),
        .module_data_out (sw_038_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_038 (
        .io_in  (sw_038_module_data_in),
        .io_out (sw_038_module_data_out)
    );

    // [039] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_039_clk_out, sw_039_data_out, sw_039_scan_out, sw_039_latch_out;
    wire [7:0] sw_039_module_data_in;
    wire [7:0] sw_039_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_039 (
        .clk_in          (sw_038_clk_out),
        .data_in         (sw_038_data_out),
        .scan_select_in  (sw_038_scan_out),
        .latch_enable_in (sw_038_latch_out),
        .clk_out         (sw_039_clk_out),
        .data_out        (sw_039_data_out),
        .scan_select_out (sw_039_scan_out),
        .latch_enable_out(sw_039_latch_out),
        .module_data_in  (sw_039_module_data_in),
        .module_data_out (sw_039_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_039 (
        .io_in  (sw_039_module_data_in),
        .io_out (sw_039_module_data_out)
    );

    // [040] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_040_clk_out, sw_040_data_out, sw_040_scan_out, sw_040_latch_out;
    wire [7:0] sw_040_module_data_in;
    wire [7:0] sw_040_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_040 (
        .clk_in          (sw_039_clk_out),
        .data_in         (sw_039_data_out),
        .scan_select_in  (sw_039_scan_out),
        .latch_enable_in (sw_039_latch_out),
        .clk_out         (sw_040_clk_out),
        .data_out        (sw_040_data_out),
        .scan_select_out (sw_040_scan_out),
        .latch_enable_out(sw_040_latch_out),
        .module_data_in  (sw_040_module_data_in),
        .module_data_out (sw_040_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_040 (
        .io_in  (sw_040_module_data_in),
        .io_out (sw_040_module_data_out)
    );

    // [041] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_041_clk_out, sw_041_data_out, sw_041_scan_out, sw_041_latch_out;
    wire [7:0] sw_041_module_data_in;
    wire [7:0] sw_041_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_041 (
        .clk_in          (sw_040_clk_out),
        .data_in         (sw_040_data_out),
        .scan_select_in  (sw_040_scan_out),
        .latch_enable_in (sw_040_latch_out),
        .clk_out         (sw_041_clk_out),
        .data_out        (sw_041_data_out),
        .scan_select_out (sw_041_scan_out),
        .latch_enable_out(sw_041_latch_out),
        .module_data_in  (sw_041_module_data_in),
        .module_data_out (sw_041_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_041 (
        .io_in  (sw_041_module_data_in),
        .io_out (sw_041_module_data_out)
    );

    // [042] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_042_clk_out, sw_042_data_out, sw_042_scan_out, sw_042_latch_out;
    wire [7:0] sw_042_module_data_in;
    wire [7:0] sw_042_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_042 (
        .clk_in          (sw_041_clk_out),
        .data_in         (sw_041_data_out),
        .scan_select_in  (sw_041_scan_out),
        .latch_enable_in (sw_041_latch_out),
        .clk_out         (sw_042_clk_out),
        .data_out        (sw_042_data_out),
        .scan_select_out (sw_042_scan_out),
        .latch_enable_out(sw_042_latch_out),
        .module_data_in  (sw_042_module_data_in),
        .module_data_out (sw_042_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_042 (
        .io_in  (sw_042_module_data_in),
        .io_out (sw_042_module_data_out)
    );

    // [043] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_043_clk_out, sw_043_data_out, sw_043_scan_out, sw_043_latch_out;
    wire [7:0] sw_043_module_data_in;
    wire [7:0] sw_043_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_043 (
        .clk_in          (sw_042_clk_out),
        .data_in         (sw_042_data_out),
        .scan_select_in  (sw_042_scan_out),
        .latch_enable_in (sw_042_latch_out),
        .clk_out         (sw_043_clk_out),
        .data_out        (sw_043_data_out),
        .scan_select_out (sw_043_scan_out),
        .latch_enable_out(sw_043_latch_out),
        .module_data_in  (sw_043_module_data_in),
        .module_data_out (sw_043_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_043 (
        .io_in  (sw_043_module_data_in),
        .io_out (sw_043_module_data_out)
    );

    // [044] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_044_clk_out, sw_044_data_out, sw_044_scan_out, sw_044_latch_out;
    wire [7:0] sw_044_module_data_in;
    wire [7:0] sw_044_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_044 (
        .clk_in          (sw_043_clk_out),
        .data_in         (sw_043_data_out),
        .scan_select_in  (sw_043_scan_out),
        .latch_enable_in (sw_043_latch_out),
        .clk_out         (sw_044_clk_out),
        .data_out        (sw_044_data_out),
        .scan_select_out (sw_044_scan_out),
        .latch_enable_out(sw_044_latch_out),
        .module_data_in  (sw_044_module_data_in),
        .module_data_out (sw_044_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_044 (
        .io_in  (sw_044_module_data_in),
        .io_out (sw_044_module_data_out)
    );

    // [045] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_045_clk_out, sw_045_data_out, sw_045_scan_out, sw_045_latch_out;
    wire [7:0] sw_045_module_data_in;
    wire [7:0] sw_045_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_045 (
        .clk_in          (sw_044_clk_out),
        .data_in         (sw_044_data_out),
        .scan_select_in  (sw_044_scan_out),
        .latch_enable_in (sw_044_latch_out),
        .clk_out         (sw_045_clk_out),
        .data_out        (sw_045_data_out),
        .scan_select_out (sw_045_scan_out),
        .latch_enable_out(sw_045_latch_out),
        .module_data_in  (sw_045_module_data_in),
        .module_data_out (sw_045_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_045 (
        .io_in  (sw_045_module_data_in),
        .io_out (sw_045_module_data_out)
    );

    // [046] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_046_clk_out, sw_046_data_out, sw_046_scan_out, sw_046_latch_out;
    wire [7:0] sw_046_module_data_in;
    wire [7:0] sw_046_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_046 (
        .clk_in          (sw_045_clk_out),
        .data_in         (sw_045_data_out),
        .scan_select_in  (sw_045_scan_out),
        .latch_enable_in (sw_045_latch_out),
        .clk_out         (sw_046_clk_out),
        .data_out        (sw_046_data_out),
        .scan_select_out (sw_046_scan_out),
        .latch_enable_out(sw_046_latch_out),
        .module_data_in  (sw_046_module_data_in),
        .module_data_out (sw_046_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_046 (
        .io_in  (sw_046_module_data_in),
        .io_out (sw_046_module_data_out)
    );

    // [047] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_047_clk_out, sw_047_data_out, sw_047_scan_out, sw_047_latch_out;
    wire [7:0] sw_047_module_data_in;
    wire [7:0] sw_047_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_047 (
        .clk_in          (sw_046_clk_out),
        .data_in         (sw_046_data_out),
        .scan_select_in  (sw_046_scan_out),
        .latch_enable_in (sw_046_latch_out),
        .clk_out         (sw_047_clk_out),
        .data_out        (sw_047_data_out),
        .scan_select_out (sw_047_scan_out),
        .latch_enable_out(sw_047_latch_out),
        .module_data_in  (sw_047_module_data_in),
        .module_data_out (sw_047_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_047 (
        .io_in  (sw_047_module_data_in),
        .io_out (sw_047_module_data_out)
    );

    // [048] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_048_clk_out, sw_048_data_out, sw_048_scan_out, sw_048_latch_out;
    wire [7:0] sw_048_module_data_in;
    wire [7:0] sw_048_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_048 (
        .clk_in          (sw_047_clk_out),
        .data_in         (sw_047_data_out),
        .scan_select_in  (sw_047_scan_out),
        .latch_enable_in (sw_047_latch_out),
        .clk_out         (sw_048_clk_out),
        .data_out        (sw_048_data_out),
        .scan_select_out (sw_048_scan_out),
        .latch_enable_out(sw_048_latch_out),
        .module_data_in  (sw_048_module_data_in),
        .module_data_out (sw_048_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_048 (
        .io_in  (sw_048_module_data_in),
        .io_out (sw_048_module_data_out)
    );

    // [049] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_049_clk_out, sw_049_data_out, sw_049_scan_out, sw_049_latch_out;
    wire [7:0] sw_049_module_data_in;
    wire [7:0] sw_049_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_049 (
        .clk_in          (sw_048_clk_out),
        .data_in         (sw_048_data_out),
        .scan_select_in  (sw_048_scan_out),
        .latch_enable_in (sw_048_latch_out),
        .clk_out         (sw_049_clk_out),
        .data_out        (sw_049_data_out),
        .scan_select_out (sw_049_scan_out),
        .latch_enable_out(sw_049_latch_out),
        .module_data_in  (sw_049_module_data_in),
        .module_data_out (sw_049_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_049 (
        .io_in  (sw_049_module_data_in),
        .io_out (sw_049_module_data_out)
    );

    // [050] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_050_clk_out, sw_050_data_out, sw_050_scan_out, sw_050_latch_out;
    wire [7:0] sw_050_module_data_in;
    wire [7:0] sw_050_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_050 (
        .clk_in          (sw_049_clk_out),
        .data_in         (sw_049_data_out),
        .scan_select_in  (sw_049_scan_out),
        .latch_enable_in (sw_049_latch_out),
        .clk_out         (sw_050_clk_out),
        .data_out        (sw_050_data_out),
        .scan_select_out (sw_050_scan_out),
        .latch_enable_out(sw_050_latch_out),
        .module_data_in  (sw_050_module_data_in),
        .module_data_out (sw_050_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_050 (
        .io_in  (sw_050_module_data_in),
        .io_out (sw_050_module_data_out)
    );

    // [051] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_051_clk_out, sw_051_data_out, sw_051_scan_out, sw_051_latch_out;
    wire [7:0] sw_051_module_data_in;
    wire [7:0] sw_051_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_051 (
        .clk_in          (sw_050_clk_out),
        .data_in         (sw_050_data_out),
        .scan_select_in  (sw_050_scan_out),
        .latch_enable_in (sw_050_latch_out),
        .clk_out         (sw_051_clk_out),
        .data_out        (sw_051_data_out),
        .scan_select_out (sw_051_scan_out),
        .latch_enable_out(sw_051_latch_out),
        .module_data_in  (sw_051_module_data_in),
        .module_data_out (sw_051_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_051 (
        .io_in  (sw_051_module_data_in),
        .io_out (sw_051_module_data_out)
    );

    // [052] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_052_clk_out, sw_052_data_out, sw_052_scan_out, sw_052_latch_out;
    wire [7:0] sw_052_module_data_in;
    wire [7:0] sw_052_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_052 (
        .clk_in          (sw_051_clk_out),
        .data_in         (sw_051_data_out),
        .scan_select_in  (sw_051_scan_out),
        .latch_enable_in (sw_051_latch_out),
        .clk_out         (sw_052_clk_out),
        .data_out        (sw_052_data_out),
        .scan_select_out (sw_052_scan_out),
        .latch_enable_out(sw_052_latch_out),
        .module_data_in  (sw_052_module_data_in),
        .module_data_out (sw_052_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_052 (
        .io_in  (sw_052_module_data_in),
        .io_out (sw_052_module_data_out)
    );

    // [053] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_053_clk_out, sw_053_data_out, sw_053_scan_out, sw_053_latch_out;
    wire [7:0] sw_053_module_data_in;
    wire [7:0] sw_053_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_053 (
        .clk_in          (sw_052_clk_out),
        .data_in         (sw_052_data_out),
        .scan_select_in  (sw_052_scan_out),
        .latch_enable_in (sw_052_latch_out),
        .clk_out         (sw_053_clk_out),
        .data_out        (sw_053_data_out),
        .scan_select_out (sw_053_scan_out),
        .latch_enable_out(sw_053_latch_out),
        .module_data_in  (sw_053_module_data_in),
        .module_data_out (sw_053_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_053 (
        .io_in  (sw_053_module_data_in),
        .io_out (sw_053_module_data_out)
    );

    // [054] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_054_clk_out, sw_054_data_out, sw_054_scan_out, sw_054_latch_out;
    wire [7:0] sw_054_module_data_in;
    wire [7:0] sw_054_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_054 (
        .clk_in          (sw_053_clk_out),
        .data_in         (sw_053_data_out),
        .scan_select_in  (sw_053_scan_out),
        .latch_enable_in (sw_053_latch_out),
        .clk_out         (sw_054_clk_out),
        .data_out        (sw_054_data_out),
        .scan_select_out (sw_054_scan_out),
        .latch_enable_out(sw_054_latch_out),
        .module_data_in  (sw_054_module_data_in),
        .module_data_out (sw_054_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_054 (
        .io_in  (sw_054_module_data_in),
        .io_out (sw_054_module_data_out)
    );

    // [055] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_055_clk_out, sw_055_data_out, sw_055_scan_out, sw_055_latch_out;
    wire [7:0] sw_055_module_data_in;
    wire [7:0] sw_055_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_055 (
        .clk_in          (sw_054_clk_out),
        .data_in         (sw_054_data_out),
        .scan_select_in  (sw_054_scan_out),
        .latch_enable_in (sw_054_latch_out),
        .clk_out         (sw_055_clk_out),
        .data_out        (sw_055_data_out),
        .scan_select_out (sw_055_scan_out),
        .latch_enable_out(sw_055_latch_out),
        .module_data_in  (sw_055_module_data_in),
        .module_data_out (sw_055_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_055 (
        .io_in  (sw_055_module_data_in),
        .io_out (sw_055_module_data_out)
    );

    // [056] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_056_clk_out, sw_056_data_out, sw_056_scan_out, sw_056_latch_out;
    wire [7:0] sw_056_module_data_in;
    wire [7:0] sw_056_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_056 (
        .clk_in          (sw_055_clk_out),
        .data_in         (sw_055_data_out),
        .scan_select_in  (sw_055_scan_out),
        .latch_enable_in (sw_055_latch_out),
        .clk_out         (sw_056_clk_out),
        .data_out        (sw_056_data_out),
        .scan_select_out (sw_056_scan_out),
        .latch_enable_out(sw_056_latch_out),
        .module_data_in  (sw_056_module_data_in),
        .module_data_out (sw_056_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_056 (
        .io_in  (sw_056_module_data_in),
        .io_out (sw_056_module_data_out)
    );

    // [057] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_057_clk_out, sw_057_data_out, sw_057_scan_out, sw_057_latch_out;
    wire [7:0] sw_057_module_data_in;
    wire [7:0] sw_057_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_057 (
        .clk_in          (sw_056_clk_out),
        .data_in         (sw_056_data_out),
        .scan_select_in  (sw_056_scan_out),
        .latch_enable_in (sw_056_latch_out),
        .clk_out         (sw_057_clk_out),
        .data_out        (sw_057_data_out),
        .scan_select_out (sw_057_scan_out),
        .latch_enable_out(sw_057_latch_out),
        .module_data_in  (sw_057_module_data_in),
        .module_data_out (sw_057_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_057 (
        .io_in  (sw_057_module_data_in),
        .io_out (sw_057_module_data_out)
    );

    // [058] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_058_clk_out, sw_058_data_out, sw_058_scan_out, sw_058_latch_out;
    wire [7:0] sw_058_module_data_in;
    wire [7:0] sw_058_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_058 (
        .clk_in          (sw_057_clk_out),
        .data_in         (sw_057_data_out),
        .scan_select_in  (sw_057_scan_out),
        .latch_enable_in (sw_057_latch_out),
        .clk_out         (sw_058_clk_out),
        .data_out        (sw_058_data_out),
        .scan_select_out (sw_058_scan_out),
        .latch_enable_out(sw_058_latch_out),
        .module_data_in  (sw_058_module_data_in),
        .module_data_out (sw_058_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_058 (
        .io_in  (sw_058_module_data_in),
        .io_out (sw_058_module_data_out)
    );

    // [059] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_059_clk_out, sw_059_data_out, sw_059_scan_out, sw_059_latch_out;
    wire [7:0] sw_059_module_data_in;
    wire [7:0] sw_059_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_059 (
        .clk_in          (sw_058_clk_out),
        .data_in         (sw_058_data_out),
        .scan_select_in  (sw_058_scan_out),
        .latch_enable_in (sw_058_latch_out),
        .clk_out         (sw_059_clk_out),
        .data_out        (sw_059_data_out),
        .scan_select_out (sw_059_scan_out),
        .latch_enable_out(sw_059_latch_out),
        .module_data_in  (sw_059_module_data_in),
        .module_data_out (sw_059_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_059 (
        .io_in  (sw_059_module_data_in),
        .io_out (sw_059_module_data_out)
    );

    // [060] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_060_clk_out, sw_060_data_out, sw_060_scan_out, sw_060_latch_out;
    wire [7:0] sw_060_module_data_in;
    wire [7:0] sw_060_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_060 (
        .clk_in          (sw_059_clk_out),
        .data_in         (sw_059_data_out),
        .scan_select_in  (sw_059_scan_out),
        .latch_enable_in (sw_059_latch_out),
        .clk_out         (sw_060_clk_out),
        .data_out        (sw_060_data_out),
        .scan_select_out (sw_060_scan_out),
        .latch_enable_out(sw_060_latch_out),
        .module_data_in  (sw_060_module_data_in),
        .module_data_out (sw_060_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_060 (
        .io_in  (sw_060_module_data_in),
        .io_out (sw_060_module_data_out)
    );

    // [061] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_061_clk_out, sw_061_data_out, sw_061_scan_out, sw_061_latch_out;
    wire [7:0] sw_061_module_data_in;
    wire [7:0] sw_061_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_061 (
        .clk_in          (sw_060_clk_out),
        .data_in         (sw_060_data_out),
        .scan_select_in  (sw_060_scan_out),
        .latch_enable_in (sw_060_latch_out),
        .clk_out         (sw_061_clk_out),
        .data_out        (sw_061_data_out),
        .scan_select_out (sw_061_scan_out),
        .latch_enable_out(sw_061_latch_out),
        .module_data_in  (sw_061_module_data_in),
        .module_data_out (sw_061_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_061 (
        .io_in  (sw_061_module_data_in),
        .io_out (sw_061_module_data_out)
    );

    // [062] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_062_clk_out, sw_062_data_out, sw_062_scan_out, sw_062_latch_out;
    wire [7:0] sw_062_module_data_in;
    wire [7:0] sw_062_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_062 (
        .clk_in          (sw_061_clk_out),
        .data_in         (sw_061_data_out),
        .scan_select_in  (sw_061_scan_out),
        .latch_enable_in (sw_061_latch_out),
        .clk_out         (sw_062_clk_out),
        .data_out        (sw_062_data_out),
        .scan_select_out (sw_062_scan_out),
        .latch_enable_out(sw_062_latch_out),
        .module_data_in  (sw_062_module_data_in),
        .module_data_out (sw_062_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_062 (
        .io_in  (sw_062_module_data_in),
        .io_out (sw_062_module_data_out)
    );

    // [063] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_063_clk_out, sw_063_data_out, sw_063_scan_out, sw_063_latch_out;
    wire [7:0] sw_063_module_data_in;
    wire [7:0] sw_063_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_063 (
        .clk_in          (sw_062_clk_out),
        .data_in         (sw_062_data_out),
        .scan_select_in  (sw_062_scan_out),
        .latch_enable_in (sw_062_latch_out),
        .clk_out         (sw_063_clk_out),
        .data_out        (sw_063_data_out),
        .scan_select_out (sw_063_scan_out),
        .latch_enable_out(sw_063_latch_out),
        .module_data_in  (sw_063_module_data_in),
        .module_data_out (sw_063_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_063 (
        .io_in  (sw_063_module_data_in),
        .io_out (sw_063_module_data_out)
    );

    // [064] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_064_clk_out, sw_064_data_out, sw_064_scan_out, sw_064_latch_out;
    wire [7:0] sw_064_module_data_in;
    wire [7:0] sw_064_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_064 (
        .clk_in          (sw_063_clk_out),
        .data_in         (sw_063_data_out),
        .scan_select_in  (sw_063_scan_out),
        .latch_enable_in (sw_063_latch_out),
        .clk_out         (sw_064_clk_out),
        .data_out        (sw_064_data_out),
        .scan_select_out (sw_064_scan_out),
        .latch_enable_out(sw_064_latch_out),
        .module_data_in  (sw_064_module_data_in),
        .module_data_out (sw_064_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_064 (
        .io_in  (sw_064_module_data_in),
        .io_out (sw_064_module_data_out)
    );

    // [065] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_065_clk_out, sw_065_data_out, sw_065_scan_out, sw_065_latch_out;
    wire [7:0] sw_065_module_data_in;
    wire [7:0] sw_065_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_065 (
        .clk_in          (sw_064_clk_out),
        .data_in         (sw_064_data_out),
        .scan_select_in  (sw_064_scan_out),
        .latch_enable_in (sw_064_latch_out),
        .clk_out         (sw_065_clk_out),
        .data_out        (sw_065_data_out),
        .scan_select_out (sw_065_scan_out),
        .latch_enable_out(sw_065_latch_out),
        .module_data_in  (sw_065_module_data_in),
        .module_data_out (sw_065_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_065 (
        .io_in  (sw_065_module_data_in),
        .io_out (sw_065_module_data_out)
    );

    // [066] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_066_clk_out, sw_066_data_out, sw_066_scan_out, sw_066_latch_out;
    wire [7:0] sw_066_module_data_in;
    wire [7:0] sw_066_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_066 (
        .clk_in          (sw_065_clk_out),
        .data_in         (sw_065_data_out),
        .scan_select_in  (sw_065_scan_out),
        .latch_enable_in (sw_065_latch_out),
        .clk_out         (sw_066_clk_out),
        .data_out        (sw_066_data_out),
        .scan_select_out (sw_066_scan_out),
        .latch_enable_out(sw_066_latch_out),
        .module_data_in  (sw_066_module_data_in),
        .module_data_out (sw_066_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_066 (
        .io_in  (sw_066_module_data_in),
        .io_out (sw_066_module_data_out)
    );

    // [067] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_067_clk_out, sw_067_data_out, sw_067_scan_out, sw_067_latch_out;
    wire [7:0] sw_067_module_data_in;
    wire [7:0] sw_067_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_067 (
        .clk_in          (sw_066_clk_out),
        .data_in         (sw_066_data_out),
        .scan_select_in  (sw_066_scan_out),
        .latch_enable_in (sw_066_latch_out),
        .clk_out         (sw_067_clk_out),
        .data_out        (sw_067_data_out),
        .scan_select_out (sw_067_scan_out),
        .latch_enable_out(sw_067_latch_out),
        .module_data_in  (sw_067_module_data_in),
        .module_data_out (sw_067_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_067 (
        .io_in  (sw_067_module_data_in),
        .io_out (sw_067_module_data_out)
    );

    // [068] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_068_clk_out, sw_068_data_out, sw_068_scan_out, sw_068_latch_out;
    wire [7:0] sw_068_module_data_in;
    wire [7:0] sw_068_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_068 (
        .clk_in          (sw_067_clk_out),
        .data_in         (sw_067_data_out),
        .scan_select_in  (sw_067_scan_out),
        .latch_enable_in (sw_067_latch_out),
        .clk_out         (sw_068_clk_out),
        .data_out        (sw_068_data_out),
        .scan_select_out (sw_068_scan_out),
        .latch_enable_out(sw_068_latch_out),
        .module_data_in  (sw_068_module_data_in),
        .module_data_out (sw_068_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_068 (
        .io_in  (sw_068_module_data_in),
        .io_out (sw_068_module_data_out)
    );

    // [069] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_069_clk_out, sw_069_data_out, sw_069_scan_out, sw_069_latch_out;
    wire [7:0] sw_069_module_data_in;
    wire [7:0] sw_069_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_069 (
        .clk_in          (sw_068_clk_out),
        .data_in         (sw_068_data_out),
        .scan_select_in  (sw_068_scan_out),
        .latch_enable_in (sw_068_latch_out),
        .clk_out         (sw_069_clk_out),
        .data_out        (sw_069_data_out),
        .scan_select_out (sw_069_scan_out),
        .latch_enable_out(sw_069_latch_out),
        .module_data_in  (sw_069_module_data_in),
        .module_data_out (sw_069_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_069 (
        .io_in  (sw_069_module_data_in),
        .io_out (sw_069_module_data_out)
    );

    // [070] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_070_clk_out, sw_070_data_out, sw_070_scan_out, sw_070_latch_out;
    wire [7:0] sw_070_module_data_in;
    wire [7:0] sw_070_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_070 (
        .clk_in          (sw_069_clk_out),
        .data_in         (sw_069_data_out),
        .scan_select_in  (sw_069_scan_out),
        .latch_enable_in (sw_069_latch_out),
        .clk_out         (sw_070_clk_out),
        .data_out        (sw_070_data_out),
        .scan_select_out (sw_070_scan_out),
        .latch_enable_out(sw_070_latch_out),
        .module_data_in  (sw_070_module_data_in),
        .module_data_out (sw_070_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_070 (
        .io_in  (sw_070_module_data_in),
        .io_out (sw_070_module_data_out)
    );

    // [071] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_071_clk_out, sw_071_data_out, sw_071_scan_out, sw_071_latch_out;
    wire [7:0] sw_071_module_data_in;
    wire [7:0] sw_071_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_071 (
        .clk_in          (sw_070_clk_out),
        .data_in         (sw_070_data_out),
        .scan_select_in  (sw_070_scan_out),
        .latch_enable_in (sw_070_latch_out),
        .clk_out         (sw_071_clk_out),
        .data_out        (sw_071_data_out),
        .scan_select_out (sw_071_scan_out),
        .latch_enable_out(sw_071_latch_out),
        .module_data_in  (sw_071_module_data_in),
        .module_data_out (sw_071_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_071 (
        .io_in  (sw_071_module_data_in),
        .io_out (sw_071_module_data_out)
    );

    // [072] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_072_clk_out, sw_072_data_out, sw_072_scan_out, sw_072_latch_out;
    wire [7:0] sw_072_module_data_in;
    wire [7:0] sw_072_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_072 (
        .clk_in          (sw_071_clk_out),
        .data_in         (sw_071_data_out),
        .scan_select_in  (sw_071_scan_out),
        .latch_enable_in (sw_071_latch_out),
        .clk_out         (sw_072_clk_out),
        .data_out        (sw_072_data_out),
        .scan_select_out (sw_072_scan_out),
        .latch_enable_out(sw_072_latch_out),
        .module_data_in  (sw_072_module_data_in),
        .module_data_out (sw_072_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_072 (
        .io_in  (sw_072_module_data_in),
        .io_out (sw_072_module_data_out)
    );

    // [073] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_073_clk_out, sw_073_data_out, sw_073_scan_out, sw_073_latch_out;
    wire [7:0] sw_073_module_data_in;
    wire [7:0] sw_073_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_073 (
        .clk_in          (sw_072_clk_out),
        .data_in         (sw_072_data_out),
        .scan_select_in  (sw_072_scan_out),
        .latch_enable_in (sw_072_latch_out),
        .clk_out         (sw_073_clk_out),
        .data_out        (sw_073_data_out),
        .scan_select_out (sw_073_scan_out),
        .latch_enable_out(sw_073_latch_out),
        .module_data_in  (sw_073_module_data_in),
        .module_data_out (sw_073_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_073 (
        .io_in  (sw_073_module_data_in),
        .io_out (sw_073_module_data_out)
    );

    // [074] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_074_clk_out, sw_074_data_out, sw_074_scan_out, sw_074_latch_out;
    wire [7:0] sw_074_module_data_in;
    wire [7:0] sw_074_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_074 (
        .clk_in          (sw_073_clk_out),
        .data_in         (sw_073_data_out),
        .scan_select_in  (sw_073_scan_out),
        .latch_enable_in (sw_073_latch_out),
        .clk_out         (sw_074_clk_out),
        .data_out        (sw_074_data_out),
        .scan_select_out (sw_074_scan_out),
        .latch_enable_out(sw_074_latch_out),
        .module_data_in  (sw_074_module_data_in),
        .module_data_out (sw_074_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_074 (
        .io_in  (sw_074_module_data_in),
        .io_out (sw_074_module_data_out)
    );

    // [075] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_075_clk_out, sw_075_data_out, sw_075_scan_out, sw_075_latch_out;
    wire [7:0] sw_075_module_data_in;
    wire [7:0] sw_075_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_075 (
        .clk_in          (sw_074_clk_out),
        .data_in         (sw_074_data_out),
        .scan_select_in  (sw_074_scan_out),
        .latch_enable_in (sw_074_latch_out),
        .clk_out         (sw_075_clk_out),
        .data_out        (sw_075_data_out),
        .scan_select_out (sw_075_scan_out),
        .latch_enable_out(sw_075_latch_out),
        .module_data_in  (sw_075_module_data_in),
        .module_data_out (sw_075_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_075 (
        .io_in  (sw_075_module_data_in),
        .io_out (sw_075_module_data_out)
    );

    // [076] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_076_clk_out, sw_076_data_out, sw_076_scan_out, sw_076_latch_out;
    wire [7:0] sw_076_module_data_in;
    wire [7:0] sw_076_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_076 (
        .clk_in          (sw_075_clk_out),
        .data_in         (sw_075_data_out),
        .scan_select_in  (sw_075_scan_out),
        .latch_enable_in (sw_075_latch_out),
        .clk_out         (sw_076_clk_out),
        .data_out        (sw_076_data_out),
        .scan_select_out (sw_076_scan_out),
        .latch_enable_out(sw_076_latch_out),
        .module_data_in  (sw_076_module_data_in),
        .module_data_out (sw_076_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_076 (
        .io_in  (sw_076_module_data_in),
        .io_out (sw_076_module_data_out)
    );

    // [077] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_077_clk_out, sw_077_data_out, sw_077_scan_out, sw_077_latch_out;
    wire [7:0] sw_077_module_data_in;
    wire [7:0] sw_077_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_077 (
        .clk_in          (sw_076_clk_out),
        .data_in         (sw_076_data_out),
        .scan_select_in  (sw_076_scan_out),
        .latch_enable_in (sw_076_latch_out),
        .clk_out         (sw_077_clk_out),
        .data_out        (sw_077_data_out),
        .scan_select_out (sw_077_scan_out),
        .latch_enable_out(sw_077_latch_out),
        .module_data_in  (sw_077_module_data_in),
        .module_data_out (sw_077_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_077 (
        .io_in  (sw_077_module_data_in),
        .io_out (sw_077_module_data_out)
    );

    // [078] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_078_clk_out, sw_078_data_out, sw_078_scan_out, sw_078_latch_out;
    wire [7:0] sw_078_module_data_in;
    wire [7:0] sw_078_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_078 (
        .clk_in          (sw_077_clk_out),
        .data_in         (sw_077_data_out),
        .scan_select_in  (sw_077_scan_out),
        .latch_enable_in (sw_077_latch_out),
        .clk_out         (sw_078_clk_out),
        .data_out        (sw_078_data_out),
        .scan_select_out (sw_078_scan_out),
        .latch_enable_out(sw_078_latch_out),
        .module_data_in  (sw_078_module_data_in),
        .module_data_out (sw_078_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_078 (
        .io_in  (sw_078_module_data_in),
        .io_out (sw_078_module_data_out)
    );

    // [079] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_079_clk_out, sw_079_data_out, sw_079_scan_out, sw_079_latch_out;
    wire [7:0] sw_079_module_data_in;
    wire [7:0] sw_079_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_079 (
        .clk_in          (sw_078_clk_out),
        .data_in         (sw_078_data_out),
        .scan_select_in  (sw_078_scan_out),
        .latch_enable_in (sw_078_latch_out),
        .clk_out         (sw_079_clk_out),
        .data_out        (sw_079_data_out),
        .scan_select_out (sw_079_scan_out),
        .latch_enable_out(sw_079_latch_out),
        .module_data_in  (sw_079_module_data_in),
        .module_data_out (sw_079_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_079 (
        .io_in  (sw_079_module_data_in),
        .io_out (sw_079_module_data_out)
    );

    // [080] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_080_clk_out, sw_080_data_out, sw_080_scan_out, sw_080_latch_out;
    wire [7:0] sw_080_module_data_in;
    wire [7:0] sw_080_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_080 (
        .clk_in          (sw_079_clk_out),
        .data_in         (sw_079_data_out),
        .scan_select_in  (sw_079_scan_out),
        .latch_enable_in (sw_079_latch_out),
        .clk_out         (sw_080_clk_out),
        .data_out        (sw_080_data_out),
        .scan_select_out (sw_080_scan_out),
        .latch_enable_out(sw_080_latch_out),
        .module_data_in  (sw_080_module_data_in),
        .module_data_out (sw_080_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_080 (
        .io_in  (sw_080_module_data_in),
        .io_out (sw_080_module_data_out)
    );

    // [081] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_081_clk_out, sw_081_data_out, sw_081_scan_out, sw_081_latch_out;
    wire [7:0] sw_081_module_data_in;
    wire [7:0] sw_081_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_081 (
        .clk_in          (sw_080_clk_out),
        .data_in         (sw_080_data_out),
        .scan_select_in  (sw_080_scan_out),
        .latch_enable_in (sw_080_latch_out),
        .clk_out         (sw_081_clk_out),
        .data_out        (sw_081_data_out),
        .scan_select_out (sw_081_scan_out),
        .latch_enable_out(sw_081_latch_out),
        .module_data_in  (sw_081_module_data_in),
        .module_data_out (sw_081_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_081 (
        .io_in  (sw_081_module_data_in),
        .io_out (sw_081_module_data_out)
    );

    // [082] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_082_clk_out, sw_082_data_out, sw_082_scan_out, sw_082_latch_out;
    wire [7:0] sw_082_module_data_in;
    wire [7:0] sw_082_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_082 (
        .clk_in          (sw_081_clk_out),
        .data_in         (sw_081_data_out),
        .scan_select_in  (sw_081_scan_out),
        .latch_enable_in (sw_081_latch_out),
        .clk_out         (sw_082_clk_out),
        .data_out        (sw_082_data_out),
        .scan_select_out (sw_082_scan_out),
        .latch_enable_out(sw_082_latch_out),
        .module_data_in  (sw_082_module_data_in),
        .module_data_out (sw_082_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_082 (
        .io_in  (sw_082_module_data_in),
        .io_out (sw_082_module_data_out)
    );

    // [083] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_083_clk_out, sw_083_data_out, sw_083_scan_out, sw_083_latch_out;
    wire [7:0] sw_083_module_data_in;
    wire [7:0] sw_083_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_083 (
        .clk_in          (sw_082_clk_out),
        .data_in         (sw_082_data_out),
        .scan_select_in  (sw_082_scan_out),
        .latch_enable_in (sw_082_latch_out),
        .clk_out         (sw_083_clk_out),
        .data_out        (sw_083_data_out),
        .scan_select_out (sw_083_scan_out),
        .latch_enable_out(sw_083_latch_out),
        .module_data_in  (sw_083_module_data_in),
        .module_data_out (sw_083_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_083 (
        .io_in  (sw_083_module_data_in),
        .io_out (sw_083_module_data_out)
    );

    // [084] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_084_clk_out, sw_084_data_out, sw_084_scan_out, sw_084_latch_out;
    wire [7:0] sw_084_module_data_in;
    wire [7:0] sw_084_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_084 (
        .clk_in          (sw_083_clk_out),
        .data_in         (sw_083_data_out),
        .scan_select_in  (sw_083_scan_out),
        .latch_enable_in (sw_083_latch_out),
        .clk_out         (sw_084_clk_out),
        .data_out        (sw_084_data_out),
        .scan_select_out (sw_084_scan_out),
        .latch_enable_out(sw_084_latch_out),
        .module_data_in  (sw_084_module_data_in),
        .module_data_out (sw_084_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_084 (
        .io_in  (sw_084_module_data_in),
        .io_out (sw_084_module_data_out)
    );

    // [085] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_085_clk_out, sw_085_data_out, sw_085_scan_out, sw_085_latch_out;
    wire [7:0] sw_085_module_data_in;
    wire [7:0] sw_085_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_085 (
        .clk_in          (sw_084_clk_out),
        .data_in         (sw_084_data_out),
        .scan_select_in  (sw_084_scan_out),
        .latch_enable_in (sw_084_latch_out),
        .clk_out         (sw_085_clk_out),
        .data_out        (sw_085_data_out),
        .scan_select_out (sw_085_scan_out),
        .latch_enable_out(sw_085_latch_out),
        .module_data_in  (sw_085_module_data_in),
        .module_data_out (sw_085_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_085 (
        .io_in  (sw_085_module_data_in),
        .io_out (sw_085_module_data_out)
    );

    // [086] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_086_clk_out, sw_086_data_out, sw_086_scan_out, sw_086_latch_out;
    wire [7:0] sw_086_module_data_in;
    wire [7:0] sw_086_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_086 (
        .clk_in          (sw_085_clk_out),
        .data_in         (sw_085_data_out),
        .scan_select_in  (sw_085_scan_out),
        .latch_enable_in (sw_085_latch_out),
        .clk_out         (sw_086_clk_out),
        .data_out        (sw_086_data_out),
        .scan_select_out (sw_086_scan_out),
        .latch_enable_out(sw_086_latch_out),
        .module_data_in  (sw_086_module_data_in),
        .module_data_out (sw_086_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_086 (
        .io_in  (sw_086_module_data_in),
        .io_out (sw_086_module_data_out)
    );

    // [087] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_087_clk_out, sw_087_data_out, sw_087_scan_out, sw_087_latch_out;
    wire [7:0] sw_087_module_data_in;
    wire [7:0] sw_087_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_087 (
        .clk_in          (sw_086_clk_out),
        .data_in         (sw_086_data_out),
        .scan_select_in  (sw_086_scan_out),
        .latch_enable_in (sw_086_latch_out),
        .clk_out         (sw_087_clk_out),
        .data_out        (sw_087_data_out),
        .scan_select_out (sw_087_scan_out),
        .latch_enable_out(sw_087_latch_out),
        .module_data_in  (sw_087_module_data_in),
        .module_data_out (sw_087_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_087 (
        .io_in  (sw_087_module_data_in),
        .io_out (sw_087_module_data_out)
    );

    // [088] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_088_clk_out, sw_088_data_out, sw_088_scan_out, sw_088_latch_out;
    wire [7:0] sw_088_module_data_in;
    wire [7:0] sw_088_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_088 (
        .clk_in          (sw_087_clk_out),
        .data_in         (sw_087_data_out),
        .scan_select_in  (sw_087_scan_out),
        .latch_enable_in (sw_087_latch_out),
        .clk_out         (sw_088_clk_out),
        .data_out        (sw_088_data_out),
        .scan_select_out (sw_088_scan_out),
        .latch_enable_out(sw_088_latch_out),
        .module_data_in  (sw_088_module_data_in),
        .module_data_out (sw_088_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_088 (
        .io_in  (sw_088_module_data_in),
        .io_out (sw_088_module_data_out)
    );

    // [089] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_089_clk_out, sw_089_data_out, sw_089_scan_out, sw_089_latch_out;
    wire [7:0] sw_089_module_data_in;
    wire [7:0] sw_089_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_089 (
        .clk_in          (sw_088_clk_out),
        .data_in         (sw_088_data_out),
        .scan_select_in  (sw_088_scan_out),
        .latch_enable_in (sw_088_latch_out),
        .clk_out         (sw_089_clk_out),
        .data_out        (sw_089_data_out),
        .scan_select_out (sw_089_scan_out),
        .latch_enable_out(sw_089_latch_out),
        .module_data_in  (sw_089_module_data_in),
        .module_data_out (sw_089_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_089 (
        .io_in  (sw_089_module_data_in),
        .io_out (sw_089_module_data_out)
    );

    // [090] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_090_clk_out, sw_090_data_out, sw_090_scan_out, sw_090_latch_out;
    wire [7:0] sw_090_module_data_in;
    wire [7:0] sw_090_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_090 (
        .clk_in          (sw_089_clk_out),
        .data_in         (sw_089_data_out),
        .scan_select_in  (sw_089_scan_out),
        .latch_enable_in (sw_089_latch_out),
        .clk_out         (sw_090_clk_out),
        .data_out        (sw_090_data_out),
        .scan_select_out (sw_090_scan_out),
        .latch_enable_out(sw_090_latch_out),
        .module_data_in  (sw_090_module_data_in),
        .module_data_out (sw_090_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_090 (
        .io_in  (sw_090_module_data_in),
        .io_out (sw_090_module_data_out)
    );

    // [091] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_091_clk_out, sw_091_data_out, sw_091_scan_out, sw_091_latch_out;
    wire [7:0] sw_091_module_data_in;
    wire [7:0] sw_091_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_091 (
        .clk_in          (sw_090_clk_out),
        .data_in         (sw_090_data_out),
        .scan_select_in  (sw_090_scan_out),
        .latch_enable_in (sw_090_latch_out),
        .clk_out         (sw_091_clk_out),
        .data_out        (sw_091_data_out),
        .scan_select_out (sw_091_scan_out),
        .latch_enable_out(sw_091_latch_out),
        .module_data_in  (sw_091_module_data_in),
        .module_data_out (sw_091_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_091 (
        .io_in  (sw_091_module_data_in),
        .io_out (sw_091_module_data_out)
    );

    // [092] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_092_clk_out, sw_092_data_out, sw_092_scan_out, sw_092_latch_out;
    wire [7:0] sw_092_module_data_in;
    wire [7:0] sw_092_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_092 (
        .clk_in          (sw_091_clk_out),
        .data_in         (sw_091_data_out),
        .scan_select_in  (sw_091_scan_out),
        .latch_enable_in (sw_091_latch_out),
        .clk_out         (sw_092_clk_out),
        .data_out        (sw_092_data_out),
        .scan_select_out (sw_092_scan_out),
        .latch_enable_out(sw_092_latch_out),
        .module_data_in  (sw_092_module_data_in),
        .module_data_out (sw_092_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_092 (
        .io_in  (sw_092_module_data_in),
        .io_out (sw_092_module_data_out)
    );

    // [093] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_093_clk_out, sw_093_data_out, sw_093_scan_out, sw_093_latch_out;
    wire [7:0] sw_093_module_data_in;
    wire [7:0] sw_093_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_093 (
        .clk_in          (sw_092_clk_out),
        .data_in         (sw_092_data_out),
        .scan_select_in  (sw_092_scan_out),
        .latch_enable_in (sw_092_latch_out),
        .clk_out         (sw_093_clk_out),
        .data_out        (sw_093_data_out),
        .scan_select_out (sw_093_scan_out),
        .latch_enable_out(sw_093_latch_out),
        .module_data_in  (sw_093_module_data_in),
        .module_data_out (sw_093_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_093 (
        .io_in  (sw_093_module_data_in),
        .io_out (sw_093_module_data_out)
    );

    // [094] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_094_clk_out, sw_094_data_out, sw_094_scan_out, sw_094_latch_out;
    wire [7:0] sw_094_module_data_in;
    wire [7:0] sw_094_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_094 (
        .clk_in          (sw_093_clk_out),
        .data_in         (sw_093_data_out),
        .scan_select_in  (sw_093_scan_out),
        .latch_enable_in (sw_093_latch_out),
        .clk_out         (sw_094_clk_out),
        .data_out        (sw_094_data_out),
        .scan_select_out (sw_094_scan_out),
        .latch_enable_out(sw_094_latch_out),
        .module_data_in  (sw_094_module_data_in),
        .module_data_out (sw_094_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_094 (
        .io_in  (sw_094_module_data_in),
        .io_out (sw_094_module_data_out)
    );

    // [095] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_095_clk_out, sw_095_data_out, sw_095_scan_out, sw_095_latch_out;
    wire [7:0] sw_095_module_data_in;
    wire [7:0] sw_095_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_095 (
        .clk_in          (sw_094_clk_out),
        .data_in         (sw_094_data_out),
        .scan_select_in  (sw_094_scan_out),
        .latch_enable_in (sw_094_latch_out),
        .clk_out         (sw_095_clk_out),
        .data_out        (sw_095_data_out),
        .scan_select_out (sw_095_scan_out),
        .latch_enable_out(sw_095_latch_out),
        .module_data_in  (sw_095_module_data_in),
        .module_data_out (sw_095_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_095 (
        .io_in  (sw_095_module_data_in),
        .io_out (sw_095_module_data_out)
    );

    // [096] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_096_clk_out, sw_096_data_out, sw_096_scan_out, sw_096_latch_out;
    wire [7:0] sw_096_module_data_in;
    wire [7:0] sw_096_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_096 (
        .clk_in          (sw_095_clk_out),
        .data_in         (sw_095_data_out),
        .scan_select_in  (sw_095_scan_out),
        .latch_enable_in (sw_095_latch_out),
        .clk_out         (sw_096_clk_out),
        .data_out        (sw_096_data_out),
        .scan_select_out (sw_096_scan_out),
        .latch_enable_out(sw_096_latch_out),
        .module_data_in  (sw_096_module_data_in),
        .module_data_out (sw_096_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_096 (
        .io_in  (sw_096_module_data_in),
        .io_out (sw_096_module_data_out)
    );

    // [097] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_097_clk_out, sw_097_data_out, sw_097_scan_out, sw_097_latch_out;
    wire [7:0] sw_097_module_data_in;
    wire [7:0] sw_097_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_097 (
        .clk_in          (sw_096_clk_out),
        .data_in         (sw_096_data_out),
        .scan_select_in  (sw_096_scan_out),
        .latch_enable_in (sw_096_latch_out),
        .clk_out         (sw_097_clk_out),
        .data_out        (sw_097_data_out),
        .scan_select_out (sw_097_scan_out),
        .latch_enable_out(sw_097_latch_out),
        .module_data_in  (sw_097_module_data_in),
        .module_data_out (sw_097_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_097 (
        .io_in  (sw_097_module_data_in),
        .io_out (sw_097_module_data_out)
    );

    // [098] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_098_clk_out, sw_098_data_out, sw_098_scan_out, sw_098_latch_out;
    wire [7:0] sw_098_module_data_in;
    wire [7:0] sw_098_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_098 (
        .clk_in          (sw_097_clk_out),
        .data_in         (sw_097_data_out),
        .scan_select_in  (sw_097_scan_out),
        .latch_enable_in (sw_097_latch_out),
        .clk_out         (sw_098_clk_out),
        .data_out        (sw_098_data_out),
        .scan_select_out (sw_098_scan_out),
        .latch_enable_out(sw_098_latch_out),
        .module_data_in  (sw_098_module_data_in),
        .module_data_out (sw_098_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_098 (
        .io_in  (sw_098_module_data_in),
        .io_out (sw_098_module_data_out)
    );

    // [099] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_099_clk_out, sw_099_data_out, sw_099_scan_out, sw_099_latch_out;
    wire [7:0] sw_099_module_data_in;
    wire [7:0] sw_099_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_099 (
        .clk_in          (sw_098_clk_out),
        .data_in         (sw_098_data_out),
        .scan_select_in  (sw_098_scan_out),
        .latch_enable_in (sw_098_latch_out),
        .clk_out         (sw_099_clk_out),
        .data_out        (sw_099_data_out),
        .scan_select_out (sw_099_scan_out),
        .latch_enable_out(sw_099_latch_out),
        .module_data_in  (sw_099_module_data_in),
        .module_data_out (sw_099_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_099 (
        .io_in  (sw_099_module_data_in),
        .io_out (sw_099_module_data_out)
    );

    // [100] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_100_clk_out, sw_100_data_out, sw_100_scan_out, sw_100_latch_out;
    wire [7:0] sw_100_module_data_in;
    wire [7:0] sw_100_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_100 (
        .clk_in          (sw_099_clk_out),
        .data_in         (sw_099_data_out),
        .scan_select_in  (sw_099_scan_out),
        .latch_enable_in (sw_099_latch_out),
        .clk_out         (sw_100_clk_out),
        .data_out        (sw_100_data_out),
        .scan_select_out (sw_100_scan_out),
        .latch_enable_out(sw_100_latch_out),
        .module_data_in  (sw_100_module_data_in),
        .module_data_out (sw_100_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_100 (
        .io_in  (sw_100_module_data_in),
        .io_out (sw_100_module_data_out)
    );

    // [101] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_101_clk_out, sw_101_data_out, sw_101_scan_out, sw_101_latch_out;
    wire [7:0] sw_101_module_data_in;
    wire [7:0] sw_101_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_101 (
        .clk_in          (sw_100_clk_out),
        .data_in         (sw_100_data_out),
        .scan_select_in  (sw_100_scan_out),
        .latch_enable_in (sw_100_latch_out),
        .clk_out         (sw_101_clk_out),
        .data_out        (sw_101_data_out),
        .scan_select_out (sw_101_scan_out),
        .latch_enable_out(sw_101_latch_out),
        .module_data_in  (sw_101_module_data_in),
        .module_data_out (sw_101_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_101 (
        .io_in  (sw_101_module_data_in),
        .io_out (sw_101_module_data_out)
    );

    // [102] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_102_clk_out, sw_102_data_out, sw_102_scan_out, sw_102_latch_out;
    wire [7:0] sw_102_module_data_in;
    wire [7:0] sw_102_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_102 (
        .clk_in          (sw_101_clk_out),
        .data_in         (sw_101_data_out),
        .scan_select_in  (sw_101_scan_out),
        .latch_enable_in (sw_101_latch_out),
        .clk_out         (sw_102_clk_out),
        .data_out        (sw_102_data_out),
        .scan_select_out (sw_102_scan_out),
        .latch_enable_out(sw_102_latch_out),
        .module_data_in  (sw_102_module_data_in),
        .module_data_out (sw_102_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_102 (
        .io_in  (sw_102_module_data_in),
        .io_out (sw_102_module_data_out)
    );

    // [103] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_103_clk_out, sw_103_data_out, sw_103_scan_out, sw_103_latch_out;
    wire [7:0] sw_103_module_data_in;
    wire [7:0] sw_103_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_103 (
        .clk_in          (sw_102_clk_out),
        .data_in         (sw_102_data_out),
        .scan_select_in  (sw_102_scan_out),
        .latch_enable_in (sw_102_latch_out),
        .clk_out         (sw_103_clk_out),
        .data_out        (sw_103_data_out),
        .scan_select_out (sw_103_scan_out),
        .latch_enable_out(sw_103_latch_out),
        .module_data_in  (sw_103_module_data_in),
        .module_data_out (sw_103_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_103 (
        .io_in  (sw_103_module_data_in),
        .io_out (sw_103_module_data_out)
    );

    // [104] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_104_clk_out, sw_104_data_out, sw_104_scan_out, sw_104_latch_out;
    wire [7:0] sw_104_module_data_in;
    wire [7:0] sw_104_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_104 (
        .clk_in          (sw_103_clk_out),
        .data_in         (sw_103_data_out),
        .scan_select_in  (sw_103_scan_out),
        .latch_enable_in (sw_103_latch_out),
        .clk_out         (sw_104_clk_out),
        .data_out        (sw_104_data_out),
        .scan_select_out (sw_104_scan_out),
        .latch_enable_out(sw_104_latch_out),
        .module_data_in  (sw_104_module_data_in),
        .module_data_out (sw_104_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_104 (
        .io_in  (sw_104_module_data_in),
        .io_out (sw_104_module_data_out)
    );

    // [105] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_105_clk_out, sw_105_data_out, sw_105_scan_out, sw_105_latch_out;
    wire [7:0] sw_105_module_data_in;
    wire [7:0] sw_105_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_105 (
        .clk_in          (sw_104_clk_out),
        .data_in         (sw_104_data_out),
        .scan_select_in  (sw_104_scan_out),
        .latch_enable_in (sw_104_latch_out),
        .clk_out         (sw_105_clk_out),
        .data_out        (sw_105_data_out),
        .scan_select_out (sw_105_scan_out),
        .latch_enable_out(sw_105_latch_out),
        .module_data_in  (sw_105_module_data_in),
        .module_data_out (sw_105_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_105 (
        .io_in  (sw_105_module_data_in),
        .io_out (sw_105_module_data_out)
    );

    // [106] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_106_clk_out, sw_106_data_out, sw_106_scan_out, sw_106_latch_out;
    wire [7:0] sw_106_module_data_in;
    wire [7:0] sw_106_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_106 (
        .clk_in          (sw_105_clk_out),
        .data_in         (sw_105_data_out),
        .scan_select_in  (sw_105_scan_out),
        .latch_enable_in (sw_105_latch_out),
        .clk_out         (sw_106_clk_out),
        .data_out        (sw_106_data_out),
        .scan_select_out (sw_106_scan_out),
        .latch_enable_out(sw_106_latch_out),
        .module_data_in  (sw_106_module_data_in),
        .module_data_out (sw_106_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_106 (
        .io_in  (sw_106_module_data_in),
        .io_out (sw_106_module_data_out)
    );

    // [107] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_107_clk_out, sw_107_data_out, sw_107_scan_out, sw_107_latch_out;
    wire [7:0] sw_107_module_data_in;
    wire [7:0] sw_107_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_107 (
        .clk_in          (sw_106_clk_out),
        .data_in         (sw_106_data_out),
        .scan_select_in  (sw_106_scan_out),
        .latch_enable_in (sw_106_latch_out),
        .clk_out         (sw_107_clk_out),
        .data_out        (sw_107_data_out),
        .scan_select_out (sw_107_scan_out),
        .latch_enable_out(sw_107_latch_out),
        .module_data_in  (sw_107_module_data_in),
        .module_data_out (sw_107_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_107 (
        .io_in  (sw_107_module_data_in),
        .io_out (sw_107_module_data_out)
    );

    // [108] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_108_clk_out, sw_108_data_out, sw_108_scan_out, sw_108_latch_out;
    wire [7:0] sw_108_module_data_in;
    wire [7:0] sw_108_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_108 (
        .clk_in          (sw_107_clk_out),
        .data_in         (sw_107_data_out),
        .scan_select_in  (sw_107_scan_out),
        .latch_enable_in (sw_107_latch_out),
        .clk_out         (sw_108_clk_out),
        .data_out        (sw_108_data_out),
        .scan_select_out (sw_108_scan_out),
        .latch_enable_out(sw_108_latch_out),
        .module_data_in  (sw_108_module_data_in),
        .module_data_out (sw_108_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_108 (
        .io_in  (sw_108_module_data_in),
        .io_out (sw_108_module_data_out)
    );

    // [109] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_109_clk_out, sw_109_data_out, sw_109_scan_out, sw_109_latch_out;
    wire [7:0] sw_109_module_data_in;
    wire [7:0] sw_109_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_109 (
        .clk_in          (sw_108_clk_out),
        .data_in         (sw_108_data_out),
        .scan_select_in  (sw_108_scan_out),
        .latch_enable_in (sw_108_latch_out),
        .clk_out         (sw_109_clk_out),
        .data_out        (sw_109_data_out),
        .scan_select_out (sw_109_scan_out),
        .latch_enable_out(sw_109_latch_out),
        .module_data_in  (sw_109_module_data_in),
        .module_data_out (sw_109_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_109 (
        .io_in  (sw_109_module_data_in),
        .io_out (sw_109_module_data_out)
    );

    // [110] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_110_clk_out, sw_110_data_out, sw_110_scan_out, sw_110_latch_out;
    wire [7:0] sw_110_module_data_in;
    wire [7:0] sw_110_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_110 (
        .clk_in          (sw_109_clk_out),
        .data_in         (sw_109_data_out),
        .scan_select_in  (sw_109_scan_out),
        .latch_enable_in (sw_109_latch_out),
        .clk_out         (sw_110_clk_out),
        .data_out        (sw_110_data_out),
        .scan_select_out (sw_110_scan_out),
        .latch_enable_out(sw_110_latch_out),
        .module_data_in  (sw_110_module_data_in),
        .module_data_out (sw_110_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_110 (
        .io_in  (sw_110_module_data_in),
        .io_out (sw_110_module_data_out)
    );

    // [111] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_111_clk_out, sw_111_data_out, sw_111_scan_out, sw_111_latch_out;
    wire [7:0] sw_111_module_data_in;
    wire [7:0] sw_111_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_111 (
        .clk_in          (sw_110_clk_out),
        .data_in         (sw_110_data_out),
        .scan_select_in  (sw_110_scan_out),
        .latch_enable_in (sw_110_latch_out),
        .clk_out         (sw_111_clk_out),
        .data_out        (sw_111_data_out),
        .scan_select_out (sw_111_scan_out),
        .latch_enable_out(sw_111_latch_out),
        .module_data_in  (sw_111_module_data_in),
        .module_data_out (sw_111_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_111 (
        .io_in  (sw_111_module_data_in),
        .io_out (sw_111_module_data_out)
    );

    // [112] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_112_clk_out, sw_112_data_out, sw_112_scan_out, sw_112_latch_out;
    wire [7:0] sw_112_module_data_in;
    wire [7:0] sw_112_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_112 (
        .clk_in          (sw_111_clk_out),
        .data_in         (sw_111_data_out),
        .scan_select_in  (sw_111_scan_out),
        .latch_enable_in (sw_111_latch_out),
        .clk_out         (sw_112_clk_out),
        .data_out        (sw_112_data_out),
        .scan_select_out (sw_112_scan_out),
        .latch_enable_out(sw_112_latch_out),
        .module_data_in  (sw_112_module_data_in),
        .module_data_out (sw_112_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_112 (
        .io_in  (sw_112_module_data_in),
        .io_out (sw_112_module_data_out)
    );

    // [113] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_113_clk_out, sw_113_data_out, sw_113_scan_out, sw_113_latch_out;
    wire [7:0] sw_113_module_data_in;
    wire [7:0] sw_113_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_113 (
        .clk_in          (sw_112_clk_out),
        .data_in         (sw_112_data_out),
        .scan_select_in  (sw_112_scan_out),
        .latch_enable_in (sw_112_latch_out),
        .clk_out         (sw_113_clk_out),
        .data_out        (sw_113_data_out),
        .scan_select_out (sw_113_scan_out),
        .latch_enable_out(sw_113_latch_out),
        .module_data_in  (sw_113_module_data_in),
        .module_data_out (sw_113_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_113 (
        .io_in  (sw_113_module_data_in),
        .io_out (sw_113_module_data_out)
    );

    // [114] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_114_clk_out, sw_114_data_out, sw_114_scan_out, sw_114_latch_out;
    wire [7:0] sw_114_module_data_in;
    wire [7:0] sw_114_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_114 (
        .clk_in          (sw_113_clk_out),
        .data_in         (sw_113_data_out),
        .scan_select_in  (sw_113_scan_out),
        .latch_enable_in (sw_113_latch_out),
        .clk_out         (sw_114_clk_out),
        .data_out        (sw_114_data_out),
        .scan_select_out (sw_114_scan_out),
        .latch_enable_out(sw_114_latch_out),
        .module_data_in  (sw_114_module_data_in),
        .module_data_out (sw_114_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_114 (
        .io_in  (sw_114_module_data_in),
        .io_out (sw_114_module_data_out)
    );

    // [115] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_115_clk_out, sw_115_data_out, sw_115_scan_out, sw_115_latch_out;
    wire [7:0] sw_115_module_data_in;
    wire [7:0] sw_115_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_115 (
        .clk_in          (sw_114_clk_out),
        .data_in         (sw_114_data_out),
        .scan_select_in  (sw_114_scan_out),
        .latch_enable_in (sw_114_latch_out),
        .clk_out         (sw_115_clk_out),
        .data_out        (sw_115_data_out),
        .scan_select_out (sw_115_scan_out),
        .latch_enable_out(sw_115_latch_out),
        .module_data_in  (sw_115_module_data_in),
        .module_data_out (sw_115_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_115 (
        .io_in  (sw_115_module_data_in),
        .io_out (sw_115_module_data_out)
    );

    // [116] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_116_clk_out, sw_116_data_out, sw_116_scan_out, sw_116_latch_out;
    wire [7:0] sw_116_module_data_in;
    wire [7:0] sw_116_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_116 (
        .clk_in          (sw_115_clk_out),
        .data_in         (sw_115_data_out),
        .scan_select_in  (sw_115_scan_out),
        .latch_enable_in (sw_115_latch_out),
        .clk_out         (sw_116_clk_out),
        .data_out        (sw_116_data_out),
        .scan_select_out (sw_116_scan_out),
        .latch_enable_out(sw_116_latch_out),
        .module_data_in  (sw_116_module_data_in),
        .module_data_out (sw_116_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_116 (
        .io_in  (sw_116_module_data_in),
        .io_out (sw_116_module_data_out)
    );

    // [117] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_117_clk_out, sw_117_data_out, sw_117_scan_out, sw_117_latch_out;
    wire [7:0] sw_117_module_data_in;
    wire [7:0] sw_117_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_117 (
        .clk_in          (sw_116_clk_out),
        .data_in         (sw_116_data_out),
        .scan_select_in  (sw_116_scan_out),
        .latch_enable_in (sw_116_latch_out),
        .clk_out         (sw_117_clk_out),
        .data_out        (sw_117_data_out),
        .scan_select_out (sw_117_scan_out),
        .latch_enable_out(sw_117_latch_out),
        .module_data_in  (sw_117_module_data_in),
        .module_data_out (sw_117_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_117 (
        .io_in  (sw_117_module_data_in),
        .io_out (sw_117_module_data_out)
    );

    // [118] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_118_clk_out, sw_118_data_out, sw_118_scan_out, sw_118_latch_out;
    wire [7:0] sw_118_module_data_in;
    wire [7:0] sw_118_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_118 (
        .clk_in          (sw_117_clk_out),
        .data_in         (sw_117_data_out),
        .scan_select_in  (sw_117_scan_out),
        .latch_enable_in (sw_117_latch_out),
        .clk_out         (sw_118_clk_out),
        .data_out        (sw_118_data_out),
        .scan_select_out (sw_118_scan_out),
        .latch_enable_out(sw_118_latch_out),
        .module_data_in  (sw_118_module_data_in),
        .module_data_out (sw_118_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_118 (
        .io_in  (sw_118_module_data_in),
        .io_out (sw_118_module_data_out)
    );

    // [119] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_119_clk_out, sw_119_data_out, sw_119_scan_out, sw_119_latch_out;
    wire [7:0] sw_119_module_data_in;
    wire [7:0] sw_119_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_119 (
        .clk_in          (sw_118_clk_out),
        .data_in         (sw_118_data_out),
        .scan_select_in  (sw_118_scan_out),
        .latch_enable_in (sw_118_latch_out),
        .clk_out         (sw_119_clk_out),
        .data_out        (sw_119_data_out),
        .scan_select_out (sw_119_scan_out),
        .latch_enable_out(sw_119_latch_out),
        .module_data_in  (sw_119_module_data_in),
        .module_data_out (sw_119_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_119 (
        .io_in  (sw_119_module_data_in),
        .io_out (sw_119_module_data_out)
    );

    // [120] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_120_clk_out, sw_120_data_out, sw_120_scan_out, sw_120_latch_out;
    wire [7:0] sw_120_module_data_in;
    wire [7:0] sw_120_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_120 (
        .clk_in          (sw_119_clk_out),
        .data_in         (sw_119_data_out),
        .scan_select_in  (sw_119_scan_out),
        .latch_enable_in (sw_119_latch_out),
        .clk_out         (sw_120_clk_out),
        .data_out        (sw_120_data_out),
        .scan_select_out (sw_120_scan_out),
        .latch_enable_out(sw_120_latch_out),
        .module_data_in  (sw_120_module_data_in),
        .module_data_out (sw_120_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_120 (
        .io_in  (sw_120_module_data_in),
        .io_out (sw_120_module_data_out)
    );

    // [121] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_121_clk_out, sw_121_data_out, sw_121_scan_out, sw_121_latch_out;
    wire [7:0] sw_121_module_data_in;
    wire [7:0] sw_121_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_121 (
        .clk_in          (sw_120_clk_out),
        .data_in         (sw_120_data_out),
        .scan_select_in  (sw_120_scan_out),
        .latch_enable_in (sw_120_latch_out),
        .clk_out         (sw_121_clk_out),
        .data_out        (sw_121_data_out),
        .scan_select_out (sw_121_scan_out),
        .latch_enable_out(sw_121_latch_out),
        .module_data_in  (sw_121_module_data_in),
        .module_data_out (sw_121_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_121 (
        .io_in  (sw_121_module_data_in),
        .io_out (sw_121_module_data_out)
    );

    // [122] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_122_clk_out, sw_122_data_out, sw_122_scan_out, sw_122_latch_out;
    wire [7:0] sw_122_module_data_in;
    wire [7:0] sw_122_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_122 (
        .clk_in          (sw_121_clk_out),
        .data_in         (sw_121_data_out),
        .scan_select_in  (sw_121_scan_out),
        .latch_enable_in (sw_121_latch_out),
        .clk_out         (sw_122_clk_out),
        .data_out        (sw_122_data_out),
        .scan_select_out (sw_122_scan_out),
        .latch_enable_out(sw_122_latch_out),
        .module_data_in  (sw_122_module_data_in),
        .module_data_out (sw_122_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_122 (
        .io_in  (sw_122_module_data_in),
        .io_out (sw_122_module_data_out)
    );

    // [123] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_123_clk_out, sw_123_data_out, sw_123_scan_out, sw_123_latch_out;
    wire [7:0] sw_123_module_data_in;
    wire [7:0] sw_123_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_123 (
        .clk_in          (sw_122_clk_out),
        .data_in         (sw_122_data_out),
        .scan_select_in  (sw_122_scan_out),
        .latch_enable_in (sw_122_latch_out),
        .clk_out         (sw_123_clk_out),
        .data_out        (sw_123_data_out),
        .scan_select_out (sw_123_scan_out),
        .latch_enable_out(sw_123_latch_out),
        .module_data_in  (sw_123_module_data_in),
        .module_data_out (sw_123_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_123 (
        .io_in  (sw_123_module_data_in),
        .io_out (sw_123_module_data_out)
    );

    // [124] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_124_clk_out, sw_124_data_out, sw_124_scan_out, sw_124_latch_out;
    wire [7:0] sw_124_module_data_in;
    wire [7:0] sw_124_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_124 (
        .clk_in          (sw_123_clk_out),
        .data_in         (sw_123_data_out),
        .scan_select_in  (sw_123_scan_out),
        .latch_enable_in (sw_123_latch_out),
        .clk_out         (sw_124_clk_out),
        .data_out        (sw_124_data_out),
        .scan_select_out (sw_124_scan_out),
        .latch_enable_out(sw_124_latch_out),
        .module_data_in  (sw_124_module_data_in),
        .module_data_out (sw_124_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_124 (
        .io_in  (sw_124_module_data_in),
        .io_out (sw_124_module_data_out)
    );

    // [125] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_125_clk_out, sw_125_data_out, sw_125_scan_out, sw_125_latch_out;
    wire [7:0] sw_125_module_data_in;
    wire [7:0] sw_125_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_125 (
        .clk_in          (sw_124_clk_out),
        .data_in         (sw_124_data_out),
        .scan_select_in  (sw_124_scan_out),
        .latch_enable_in (sw_124_latch_out),
        .clk_out         (sw_125_clk_out),
        .data_out        (sw_125_data_out),
        .scan_select_out (sw_125_scan_out),
        .latch_enable_out(sw_125_latch_out),
        .module_data_in  (sw_125_module_data_in),
        .module_data_out (sw_125_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_125 (
        .io_in  (sw_125_module_data_in),
        .io_out (sw_125_module_data_out)
    );

    // [126] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_126_clk_out, sw_126_data_out, sw_126_scan_out, sw_126_latch_out;
    wire [7:0] sw_126_module_data_in;
    wire [7:0] sw_126_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_126 (
        .clk_in          (sw_125_clk_out),
        .data_in         (sw_125_data_out),
        .scan_select_in  (sw_125_scan_out),
        .latch_enable_in (sw_125_latch_out),
        .clk_out         (sw_126_clk_out),
        .data_out        (sw_126_data_out),
        .scan_select_out (sw_126_scan_out),
        .latch_enable_out(sw_126_latch_out),
        .module_data_in  (sw_126_module_data_in),
        .module_data_out (sw_126_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_126 (
        .io_in  (sw_126_module_data_in),
        .io_out (sw_126_module_data_out)
    );

    // [127] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_127_clk_out, sw_127_data_out, sw_127_scan_out, sw_127_latch_out;
    wire [7:0] sw_127_module_data_in;
    wire [7:0] sw_127_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_127 (
        .clk_in          (sw_126_clk_out),
        .data_in         (sw_126_data_out),
        .scan_select_in  (sw_126_scan_out),
        .latch_enable_in (sw_126_latch_out),
        .clk_out         (sw_127_clk_out),
        .data_out        (sw_127_data_out),
        .scan_select_out (sw_127_scan_out),
        .latch_enable_out(sw_127_latch_out),
        .module_data_in  (sw_127_module_data_in),
        .module_data_out (sw_127_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_127 (
        .io_in  (sw_127_module_data_in),
        .io_out (sw_127_module_data_out)
    );

    // [128] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_128_clk_out, sw_128_data_out, sw_128_scan_out, sw_128_latch_out;
    wire [7:0] sw_128_module_data_in;
    wire [7:0] sw_128_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_128 (
        .clk_in          (sw_127_clk_out),
        .data_in         (sw_127_data_out),
        .scan_select_in  (sw_127_scan_out),
        .latch_enable_in (sw_127_latch_out),
        .clk_out         (sw_128_clk_out),
        .data_out        (sw_128_data_out),
        .scan_select_out (sw_128_scan_out),
        .latch_enable_out(sw_128_latch_out),
        .module_data_in  (sw_128_module_data_in),
        .module_data_out (sw_128_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_128 (
        .io_in  (sw_128_module_data_in),
        .io_out (sw_128_module_data_out)
    );

    // [129] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_129_clk_out, sw_129_data_out, sw_129_scan_out, sw_129_latch_out;
    wire [7:0] sw_129_module_data_in;
    wire [7:0] sw_129_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_129 (
        .clk_in          (sw_128_clk_out),
        .data_in         (sw_128_data_out),
        .scan_select_in  (sw_128_scan_out),
        .latch_enable_in (sw_128_latch_out),
        .clk_out         (sw_129_clk_out),
        .data_out        (sw_129_data_out),
        .scan_select_out (sw_129_scan_out),
        .latch_enable_out(sw_129_latch_out),
        .module_data_in  (sw_129_module_data_in),
        .module_data_out (sw_129_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_129 (
        .io_in  (sw_129_module_data_in),
        .io_out (sw_129_module_data_out)
    );

    // [130] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_130_clk_out, sw_130_data_out, sw_130_scan_out, sw_130_latch_out;
    wire [7:0] sw_130_module_data_in;
    wire [7:0] sw_130_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_130 (
        .clk_in          (sw_129_clk_out),
        .data_in         (sw_129_data_out),
        .scan_select_in  (sw_129_scan_out),
        .latch_enable_in (sw_129_latch_out),
        .clk_out         (sw_130_clk_out),
        .data_out        (sw_130_data_out),
        .scan_select_out (sw_130_scan_out),
        .latch_enable_out(sw_130_latch_out),
        .module_data_in  (sw_130_module_data_in),
        .module_data_out (sw_130_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_130 (
        .io_in  (sw_130_module_data_in),
        .io_out (sw_130_module_data_out)
    );

    // [131] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_131_clk_out, sw_131_data_out, sw_131_scan_out, sw_131_latch_out;
    wire [7:0] sw_131_module_data_in;
    wire [7:0] sw_131_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_131 (
        .clk_in          (sw_130_clk_out),
        .data_in         (sw_130_data_out),
        .scan_select_in  (sw_130_scan_out),
        .latch_enable_in (sw_130_latch_out),
        .clk_out         (sw_131_clk_out),
        .data_out        (sw_131_data_out),
        .scan_select_out (sw_131_scan_out),
        .latch_enable_out(sw_131_latch_out),
        .module_data_in  (sw_131_module_data_in),
        .module_data_out (sw_131_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_131 (
        .io_in  (sw_131_module_data_in),
        .io_out (sw_131_module_data_out)
    );

    // [132] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_132_clk_out, sw_132_data_out, sw_132_scan_out, sw_132_latch_out;
    wire [7:0] sw_132_module_data_in;
    wire [7:0] sw_132_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_132 (
        .clk_in          (sw_131_clk_out),
        .data_in         (sw_131_data_out),
        .scan_select_in  (sw_131_scan_out),
        .latch_enable_in (sw_131_latch_out),
        .clk_out         (sw_132_clk_out),
        .data_out        (sw_132_data_out),
        .scan_select_out (sw_132_scan_out),
        .latch_enable_out(sw_132_latch_out),
        .module_data_in  (sw_132_module_data_in),
        .module_data_out (sw_132_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_132 (
        .io_in  (sw_132_module_data_in),
        .io_out (sw_132_module_data_out)
    );

    // [133] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_133_clk_out, sw_133_data_out, sw_133_scan_out, sw_133_latch_out;
    wire [7:0] sw_133_module_data_in;
    wire [7:0] sw_133_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_133 (
        .clk_in          (sw_132_clk_out),
        .data_in         (sw_132_data_out),
        .scan_select_in  (sw_132_scan_out),
        .latch_enable_in (sw_132_latch_out),
        .clk_out         (sw_133_clk_out),
        .data_out        (sw_133_data_out),
        .scan_select_out (sw_133_scan_out),
        .latch_enable_out(sw_133_latch_out),
        .module_data_in  (sw_133_module_data_in),
        .module_data_out (sw_133_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_133 (
        .io_in  (sw_133_module_data_in),
        .io_out (sw_133_module_data_out)
    );

    // [134] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_134_clk_out, sw_134_data_out, sw_134_scan_out, sw_134_latch_out;
    wire [7:0] sw_134_module_data_in;
    wire [7:0] sw_134_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_134 (
        .clk_in          (sw_133_clk_out),
        .data_in         (sw_133_data_out),
        .scan_select_in  (sw_133_scan_out),
        .latch_enable_in (sw_133_latch_out),
        .clk_out         (sw_134_clk_out),
        .data_out        (sw_134_data_out),
        .scan_select_out (sw_134_scan_out),
        .latch_enable_out(sw_134_latch_out),
        .module_data_in  (sw_134_module_data_in),
        .module_data_out (sw_134_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_134 (
        .io_in  (sw_134_module_data_in),
        .io_out (sw_134_module_data_out)
    );

    // [135] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_135_clk_out, sw_135_data_out, sw_135_scan_out, sw_135_latch_out;
    wire [7:0] sw_135_module_data_in;
    wire [7:0] sw_135_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_135 (
        .clk_in          (sw_134_clk_out),
        .data_in         (sw_134_data_out),
        .scan_select_in  (sw_134_scan_out),
        .latch_enable_in (sw_134_latch_out),
        .clk_out         (sw_135_clk_out),
        .data_out        (sw_135_data_out),
        .scan_select_out (sw_135_scan_out),
        .latch_enable_out(sw_135_latch_out),
        .module_data_in  (sw_135_module_data_in),
        .module_data_out (sw_135_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_135 (
        .io_in  (sw_135_module_data_in),
        .io_out (sw_135_module_data_out)
    );

    // [136] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_136_clk_out, sw_136_data_out, sw_136_scan_out, sw_136_latch_out;
    wire [7:0] sw_136_module_data_in;
    wire [7:0] sw_136_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_136 (
        .clk_in          (sw_135_clk_out),
        .data_in         (sw_135_data_out),
        .scan_select_in  (sw_135_scan_out),
        .latch_enable_in (sw_135_latch_out),
        .clk_out         (sw_136_clk_out),
        .data_out        (sw_136_data_out),
        .scan_select_out (sw_136_scan_out),
        .latch_enable_out(sw_136_latch_out),
        .module_data_in  (sw_136_module_data_in),
        .module_data_out (sw_136_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_136 (
        .io_in  (sw_136_module_data_in),
        .io_out (sw_136_module_data_out)
    );

    // [137] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_137_clk_out, sw_137_data_out, sw_137_scan_out, sw_137_latch_out;
    wire [7:0] sw_137_module_data_in;
    wire [7:0] sw_137_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_137 (
        .clk_in          (sw_136_clk_out),
        .data_in         (sw_136_data_out),
        .scan_select_in  (sw_136_scan_out),
        .latch_enable_in (sw_136_latch_out),
        .clk_out         (sw_137_clk_out),
        .data_out        (sw_137_data_out),
        .scan_select_out (sw_137_scan_out),
        .latch_enable_out(sw_137_latch_out),
        .module_data_in  (sw_137_module_data_in),
        .module_data_out (sw_137_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_137 (
        .io_in  (sw_137_module_data_in),
        .io_out (sw_137_module_data_out)
    );

    // [138] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_138_clk_out, sw_138_data_out, sw_138_scan_out, sw_138_latch_out;
    wire [7:0] sw_138_module_data_in;
    wire [7:0] sw_138_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_138 (
        .clk_in          (sw_137_clk_out),
        .data_in         (sw_137_data_out),
        .scan_select_in  (sw_137_scan_out),
        .latch_enable_in (sw_137_latch_out),
        .clk_out         (sw_138_clk_out),
        .data_out        (sw_138_data_out),
        .scan_select_out (sw_138_scan_out),
        .latch_enable_out(sw_138_latch_out),
        .module_data_in  (sw_138_module_data_in),
        .module_data_out (sw_138_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_138 (
        .io_in  (sw_138_module_data_in),
        .io_out (sw_138_module_data_out)
    );

    // [139] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_139_clk_out, sw_139_data_out, sw_139_scan_out, sw_139_latch_out;
    wire [7:0] sw_139_module_data_in;
    wire [7:0] sw_139_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_139 (
        .clk_in          (sw_138_clk_out),
        .data_in         (sw_138_data_out),
        .scan_select_in  (sw_138_scan_out),
        .latch_enable_in (sw_138_latch_out),
        .clk_out         (sw_139_clk_out),
        .data_out        (sw_139_data_out),
        .scan_select_out (sw_139_scan_out),
        .latch_enable_out(sw_139_latch_out),
        .module_data_in  (sw_139_module_data_in),
        .module_data_out (sw_139_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_139 (
        .io_in  (sw_139_module_data_in),
        .io_out (sw_139_module_data_out)
    );

    // [140] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_140_clk_out, sw_140_data_out, sw_140_scan_out, sw_140_latch_out;
    wire [7:0] sw_140_module_data_in;
    wire [7:0] sw_140_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_140 (
        .clk_in          (sw_139_clk_out),
        .data_in         (sw_139_data_out),
        .scan_select_in  (sw_139_scan_out),
        .latch_enable_in (sw_139_latch_out),
        .clk_out         (sw_140_clk_out),
        .data_out        (sw_140_data_out),
        .scan_select_out (sw_140_scan_out),
        .latch_enable_out(sw_140_latch_out),
        .module_data_in  (sw_140_module_data_in),
        .module_data_out (sw_140_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_140 (
        .io_in  (sw_140_module_data_in),
        .io_out (sw_140_module_data_out)
    );

    // [141] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_141_clk_out, sw_141_data_out, sw_141_scan_out, sw_141_latch_out;
    wire [7:0] sw_141_module_data_in;
    wire [7:0] sw_141_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_141 (
        .clk_in          (sw_140_clk_out),
        .data_in         (sw_140_data_out),
        .scan_select_in  (sw_140_scan_out),
        .latch_enable_in (sw_140_latch_out),
        .clk_out         (sw_141_clk_out),
        .data_out        (sw_141_data_out),
        .scan_select_out (sw_141_scan_out),
        .latch_enable_out(sw_141_latch_out),
        .module_data_in  (sw_141_module_data_in),
        .module_data_out (sw_141_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_141 (
        .io_in  (sw_141_module_data_in),
        .io_out (sw_141_module_data_out)
    );

    // [142] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_142_clk_out, sw_142_data_out, sw_142_scan_out, sw_142_latch_out;
    wire [7:0] sw_142_module_data_in;
    wire [7:0] sw_142_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_142 (
        .clk_in          (sw_141_clk_out),
        .data_in         (sw_141_data_out),
        .scan_select_in  (sw_141_scan_out),
        .latch_enable_in (sw_141_latch_out),
        .clk_out         (sw_142_clk_out),
        .data_out        (sw_142_data_out),
        .scan_select_out (sw_142_scan_out),
        .latch_enable_out(sw_142_latch_out),
        .module_data_in  (sw_142_module_data_in),
        .module_data_out (sw_142_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_142 (
        .io_in  (sw_142_module_data_in),
        .io_out (sw_142_module_data_out)
    );

    // [143] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_143_clk_out, sw_143_data_out, sw_143_scan_out, sw_143_latch_out;
    wire [7:0] sw_143_module_data_in;
    wire [7:0] sw_143_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_143 (
        .clk_in          (sw_142_clk_out),
        .data_in         (sw_142_data_out),
        .scan_select_in  (sw_142_scan_out),
        .latch_enable_in (sw_142_latch_out),
        .clk_out         (sw_143_clk_out),
        .data_out        (sw_143_data_out),
        .scan_select_out (sw_143_scan_out),
        .latch_enable_out(sw_143_latch_out),
        .module_data_in  (sw_143_module_data_in),
        .module_data_out (sw_143_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_143 (
        .io_in  (sw_143_module_data_in),
        .io_out (sw_143_module_data_out)
    );

    // [144] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_144_clk_out, sw_144_data_out, sw_144_scan_out, sw_144_latch_out;
    wire [7:0] sw_144_module_data_in;
    wire [7:0] sw_144_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_144 (
        .clk_in          (sw_143_clk_out),
        .data_in         (sw_143_data_out),
        .scan_select_in  (sw_143_scan_out),
        .latch_enable_in (sw_143_latch_out),
        .clk_out         (sw_144_clk_out),
        .data_out        (sw_144_data_out),
        .scan_select_out (sw_144_scan_out),
        .latch_enable_out(sw_144_latch_out),
        .module_data_in  (sw_144_module_data_in),
        .module_data_out (sw_144_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_144 (
        .io_in  (sw_144_module_data_in),
        .io_out (sw_144_module_data_out)
    );

    // [145] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_145_clk_out, sw_145_data_out, sw_145_scan_out, sw_145_latch_out;
    wire [7:0] sw_145_module_data_in;
    wire [7:0] sw_145_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_145 (
        .clk_in          (sw_144_clk_out),
        .data_in         (sw_144_data_out),
        .scan_select_in  (sw_144_scan_out),
        .latch_enable_in (sw_144_latch_out),
        .clk_out         (sw_145_clk_out),
        .data_out        (sw_145_data_out),
        .scan_select_out (sw_145_scan_out),
        .latch_enable_out(sw_145_latch_out),
        .module_data_in  (sw_145_module_data_in),
        .module_data_out (sw_145_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_145 (
        .io_in  (sw_145_module_data_in),
        .io_out (sw_145_module_data_out)
    );

    // [146] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_146_clk_out, sw_146_data_out, sw_146_scan_out, sw_146_latch_out;
    wire [7:0] sw_146_module_data_in;
    wire [7:0] sw_146_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_146 (
        .clk_in          (sw_145_clk_out),
        .data_in         (sw_145_data_out),
        .scan_select_in  (sw_145_scan_out),
        .latch_enable_in (sw_145_latch_out),
        .clk_out         (sw_146_clk_out),
        .data_out        (sw_146_data_out),
        .scan_select_out (sw_146_scan_out),
        .latch_enable_out(sw_146_latch_out),
        .module_data_in  (sw_146_module_data_in),
        .module_data_out (sw_146_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_146 (
        .io_in  (sw_146_module_data_in),
        .io_out (sw_146_module_data_out)
    );

    // [147] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_147_clk_out, sw_147_data_out, sw_147_scan_out, sw_147_latch_out;
    wire [7:0] sw_147_module_data_in;
    wire [7:0] sw_147_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_147 (
        .clk_in          (sw_146_clk_out),
        .data_in         (sw_146_data_out),
        .scan_select_in  (sw_146_scan_out),
        .latch_enable_in (sw_146_latch_out),
        .clk_out         (sw_147_clk_out),
        .data_out        (sw_147_data_out),
        .scan_select_out (sw_147_scan_out),
        .latch_enable_out(sw_147_latch_out),
        .module_data_in  (sw_147_module_data_in),
        .module_data_out (sw_147_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_147 (
        .io_in  (sw_147_module_data_in),
        .io_out (sw_147_module_data_out)
    );

    // [148] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_148_clk_out, sw_148_data_out, sw_148_scan_out, sw_148_latch_out;
    wire [7:0] sw_148_module_data_in;
    wire [7:0] sw_148_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_148 (
        .clk_in          (sw_147_clk_out),
        .data_in         (sw_147_data_out),
        .scan_select_in  (sw_147_scan_out),
        .latch_enable_in (sw_147_latch_out),
        .clk_out         (sw_148_clk_out),
        .data_out        (sw_148_data_out),
        .scan_select_out (sw_148_scan_out),
        .latch_enable_out(sw_148_latch_out),
        .module_data_in  (sw_148_module_data_in),
        .module_data_out (sw_148_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_148 (
        .io_in  (sw_148_module_data_in),
        .io_out (sw_148_module_data_out)
    );

    // [149] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_149_clk_out, sw_149_data_out, sw_149_scan_out, sw_149_latch_out;
    wire [7:0] sw_149_module_data_in;
    wire [7:0] sw_149_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_149 (
        .clk_in          (sw_148_clk_out),
        .data_in         (sw_148_data_out),
        .scan_select_in  (sw_148_scan_out),
        .latch_enable_in (sw_148_latch_out),
        .clk_out         (sw_149_clk_out),
        .data_out        (sw_149_data_out),
        .scan_select_out (sw_149_scan_out),
        .latch_enable_out(sw_149_latch_out),
        .module_data_in  (sw_149_module_data_in),
        .module_data_out (sw_149_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_149 (
        .io_in  (sw_149_module_data_in),
        .io_out (sw_149_module_data_out)
    );

    // [150] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_150_clk_out, sw_150_data_out, sw_150_scan_out, sw_150_latch_out;
    wire [7:0] sw_150_module_data_in;
    wire [7:0] sw_150_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_150 (
        .clk_in          (sw_149_clk_out),
        .data_in         (sw_149_data_out),
        .scan_select_in  (sw_149_scan_out),
        .latch_enable_in (sw_149_latch_out),
        .clk_out         (sw_150_clk_out),
        .data_out        (sw_150_data_out),
        .scan_select_out (sw_150_scan_out),
        .latch_enable_out(sw_150_latch_out),
        .module_data_in  (sw_150_module_data_in),
        .module_data_out (sw_150_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_150 (
        .io_in  (sw_150_module_data_in),
        .io_out (sw_150_module_data_out)
    );

    // [151] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_151_clk_out, sw_151_data_out, sw_151_scan_out, sw_151_latch_out;
    wire [7:0] sw_151_module_data_in;
    wire [7:0] sw_151_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_151 (
        .clk_in          (sw_150_clk_out),
        .data_in         (sw_150_data_out),
        .scan_select_in  (sw_150_scan_out),
        .latch_enable_in (sw_150_latch_out),
        .clk_out         (sw_151_clk_out),
        .data_out        (sw_151_data_out),
        .scan_select_out (sw_151_scan_out),
        .latch_enable_out(sw_151_latch_out),
        .module_data_in  (sw_151_module_data_in),
        .module_data_out (sw_151_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_151 (
        .io_in  (sw_151_module_data_in),
        .io_out (sw_151_module_data_out)
    );

    // [152] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_152_clk_out, sw_152_data_out, sw_152_scan_out, sw_152_latch_out;
    wire [7:0] sw_152_module_data_in;
    wire [7:0] sw_152_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_152 (
        .clk_in          (sw_151_clk_out),
        .data_in         (sw_151_data_out),
        .scan_select_in  (sw_151_scan_out),
        .latch_enable_in (sw_151_latch_out),
        .clk_out         (sw_152_clk_out),
        .data_out        (sw_152_data_out),
        .scan_select_out (sw_152_scan_out),
        .latch_enable_out(sw_152_latch_out),
        .module_data_in  (sw_152_module_data_in),
        .module_data_out (sw_152_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_152 (
        .io_in  (sw_152_module_data_in),
        .io_out (sw_152_module_data_out)
    );

    // [153] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_153_clk_out, sw_153_data_out, sw_153_scan_out, sw_153_latch_out;
    wire [7:0] sw_153_module_data_in;
    wire [7:0] sw_153_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_153 (
        .clk_in          (sw_152_clk_out),
        .data_in         (sw_152_data_out),
        .scan_select_in  (sw_152_scan_out),
        .latch_enable_in (sw_152_latch_out),
        .clk_out         (sw_153_clk_out),
        .data_out        (sw_153_data_out),
        .scan_select_out (sw_153_scan_out),
        .latch_enable_out(sw_153_latch_out),
        .module_data_in  (sw_153_module_data_in),
        .module_data_out (sw_153_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_153 (
        .io_in  (sw_153_module_data_in),
        .io_out (sw_153_module_data_out)
    );

    // [154] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_154_clk_out, sw_154_data_out, sw_154_scan_out, sw_154_latch_out;
    wire [7:0] sw_154_module_data_in;
    wire [7:0] sw_154_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_154 (
        .clk_in          (sw_153_clk_out),
        .data_in         (sw_153_data_out),
        .scan_select_in  (sw_153_scan_out),
        .latch_enable_in (sw_153_latch_out),
        .clk_out         (sw_154_clk_out),
        .data_out        (sw_154_data_out),
        .scan_select_out (sw_154_scan_out),
        .latch_enable_out(sw_154_latch_out),
        .module_data_in  (sw_154_module_data_in),
        .module_data_out (sw_154_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_154 (
        .io_in  (sw_154_module_data_in),
        .io_out (sw_154_module_data_out)
    );

    // [155] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_155_clk_out, sw_155_data_out, sw_155_scan_out, sw_155_latch_out;
    wire [7:0] sw_155_module_data_in;
    wire [7:0] sw_155_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_155 (
        .clk_in          (sw_154_clk_out),
        .data_in         (sw_154_data_out),
        .scan_select_in  (sw_154_scan_out),
        .latch_enable_in (sw_154_latch_out),
        .clk_out         (sw_155_clk_out),
        .data_out        (sw_155_data_out),
        .scan_select_out (sw_155_scan_out),
        .latch_enable_out(sw_155_latch_out),
        .module_data_in  (sw_155_module_data_in),
        .module_data_out (sw_155_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_155 (
        .io_in  (sw_155_module_data_in),
        .io_out (sw_155_module_data_out)
    );

    // [156] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_156_clk_out, sw_156_data_out, sw_156_scan_out, sw_156_latch_out;
    wire [7:0] sw_156_module_data_in;
    wire [7:0] sw_156_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_156 (
        .clk_in          (sw_155_clk_out),
        .data_in         (sw_155_data_out),
        .scan_select_in  (sw_155_scan_out),
        .latch_enable_in (sw_155_latch_out),
        .clk_out         (sw_156_clk_out),
        .data_out        (sw_156_data_out),
        .scan_select_out (sw_156_scan_out),
        .latch_enable_out(sw_156_latch_out),
        .module_data_in  (sw_156_module_data_in),
        .module_data_out (sw_156_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_156 (
        .io_in  (sw_156_module_data_in),
        .io_out (sw_156_module_data_out)
    );

    // [157] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_157_clk_out, sw_157_data_out, sw_157_scan_out, sw_157_latch_out;
    wire [7:0] sw_157_module_data_in;
    wire [7:0] sw_157_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_157 (
        .clk_in          (sw_156_clk_out),
        .data_in         (sw_156_data_out),
        .scan_select_in  (sw_156_scan_out),
        .latch_enable_in (sw_156_latch_out),
        .clk_out         (sw_157_clk_out),
        .data_out        (sw_157_data_out),
        .scan_select_out (sw_157_scan_out),
        .latch_enable_out(sw_157_latch_out),
        .module_data_in  (sw_157_module_data_in),
        .module_data_out (sw_157_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_157 (
        .io_in  (sw_157_module_data_in),
        .io_out (sw_157_module_data_out)
    );

    // [158] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_158_clk_out, sw_158_data_out, sw_158_scan_out, sw_158_latch_out;
    wire [7:0] sw_158_module_data_in;
    wire [7:0] sw_158_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_158 (
        .clk_in          (sw_157_clk_out),
        .data_in         (sw_157_data_out),
        .scan_select_in  (sw_157_scan_out),
        .latch_enable_in (sw_157_latch_out),
        .clk_out         (sw_158_clk_out),
        .data_out        (sw_158_data_out),
        .scan_select_out (sw_158_scan_out),
        .latch_enable_out(sw_158_latch_out),
        .module_data_in  (sw_158_module_data_in),
        .module_data_out (sw_158_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_158 (
        .io_in  (sw_158_module_data_in),
        .io_out (sw_158_module_data_out)
    );

    // [159] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_159_clk_out, sw_159_data_out, sw_159_scan_out, sw_159_latch_out;
    wire [7:0] sw_159_module_data_in;
    wire [7:0] sw_159_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_159 (
        .clk_in          (sw_158_clk_out),
        .data_in         (sw_158_data_out),
        .scan_select_in  (sw_158_scan_out),
        .latch_enable_in (sw_158_latch_out),
        .clk_out         (sw_159_clk_out),
        .data_out        (sw_159_data_out),
        .scan_select_out (sw_159_scan_out),
        .latch_enable_out(sw_159_latch_out),
        .module_data_in  (sw_159_module_data_in),
        .module_data_out (sw_159_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_159 (
        .io_in  (sw_159_module_data_in),
        .io_out (sw_159_module_data_out)
    );

    // [160] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_160_clk_out, sw_160_data_out, sw_160_scan_out, sw_160_latch_out;
    wire [7:0] sw_160_module_data_in;
    wire [7:0] sw_160_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_160 (
        .clk_in          (sw_159_clk_out),
        .data_in         (sw_159_data_out),
        .scan_select_in  (sw_159_scan_out),
        .latch_enable_in (sw_159_latch_out),
        .clk_out         (sw_160_clk_out),
        .data_out        (sw_160_data_out),
        .scan_select_out (sw_160_scan_out),
        .latch_enable_out(sw_160_latch_out),
        .module_data_in  (sw_160_module_data_in),
        .module_data_out (sw_160_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_160 (
        .io_in  (sw_160_module_data_in),
        .io_out (sw_160_module_data_out)
    );

    // [161] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_161_clk_out, sw_161_data_out, sw_161_scan_out, sw_161_latch_out;
    wire [7:0] sw_161_module_data_in;
    wire [7:0] sw_161_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_161 (
        .clk_in          (sw_160_clk_out),
        .data_in         (sw_160_data_out),
        .scan_select_in  (sw_160_scan_out),
        .latch_enable_in (sw_160_latch_out),
        .clk_out         (sw_161_clk_out),
        .data_out        (sw_161_data_out),
        .scan_select_out (sw_161_scan_out),
        .latch_enable_out(sw_161_latch_out),
        .module_data_in  (sw_161_module_data_in),
        .module_data_out (sw_161_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_161 (
        .io_in  (sw_161_module_data_in),
        .io_out (sw_161_module_data_out)
    );

    // [162] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_162_clk_out, sw_162_data_out, sw_162_scan_out, sw_162_latch_out;
    wire [7:0] sw_162_module_data_in;
    wire [7:0] sw_162_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_162 (
        .clk_in          (sw_161_clk_out),
        .data_in         (sw_161_data_out),
        .scan_select_in  (sw_161_scan_out),
        .latch_enable_in (sw_161_latch_out),
        .clk_out         (sw_162_clk_out),
        .data_out        (sw_162_data_out),
        .scan_select_out (sw_162_scan_out),
        .latch_enable_out(sw_162_latch_out),
        .module_data_in  (sw_162_module_data_in),
        .module_data_out (sw_162_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_162 (
        .io_in  (sw_162_module_data_in),
        .io_out (sw_162_module_data_out)
    );

    // [163] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_163_clk_out, sw_163_data_out, sw_163_scan_out, sw_163_latch_out;
    wire [7:0] sw_163_module_data_in;
    wire [7:0] sw_163_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_163 (
        .clk_in          (sw_162_clk_out),
        .data_in         (sw_162_data_out),
        .scan_select_in  (sw_162_scan_out),
        .latch_enable_in (sw_162_latch_out),
        .clk_out         (sw_163_clk_out),
        .data_out        (sw_163_data_out),
        .scan_select_out (sw_163_scan_out),
        .latch_enable_out(sw_163_latch_out),
        .module_data_in  (sw_163_module_data_in),
        .module_data_out (sw_163_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_163 (
        .io_in  (sw_163_module_data_in),
        .io_out (sw_163_module_data_out)
    );

    // [164] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_164_clk_out, sw_164_data_out, sw_164_scan_out, sw_164_latch_out;
    wire [7:0] sw_164_module_data_in;
    wire [7:0] sw_164_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_164 (
        .clk_in          (sw_163_clk_out),
        .data_in         (sw_163_data_out),
        .scan_select_in  (sw_163_scan_out),
        .latch_enable_in (sw_163_latch_out),
        .clk_out         (sw_164_clk_out),
        .data_out        (sw_164_data_out),
        .scan_select_out (sw_164_scan_out),
        .latch_enable_out(sw_164_latch_out),
        .module_data_in  (sw_164_module_data_in),
        .module_data_out (sw_164_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_164 (
        .io_in  (sw_164_module_data_in),
        .io_out (sw_164_module_data_out)
    );

    // [165] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_165_clk_out, sw_165_data_out, sw_165_scan_out, sw_165_latch_out;
    wire [7:0] sw_165_module_data_in;
    wire [7:0] sw_165_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_165 (
        .clk_in          (sw_164_clk_out),
        .data_in         (sw_164_data_out),
        .scan_select_in  (sw_164_scan_out),
        .latch_enable_in (sw_164_latch_out),
        .clk_out         (sw_165_clk_out),
        .data_out        (sw_165_data_out),
        .scan_select_out (sw_165_scan_out),
        .latch_enable_out(sw_165_latch_out),
        .module_data_in  (sw_165_module_data_in),
        .module_data_out (sw_165_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_165 (
        .io_in  (sw_165_module_data_in),
        .io_out (sw_165_module_data_out)
    );

    // [166] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_166_clk_out, sw_166_data_out, sw_166_scan_out, sw_166_latch_out;
    wire [7:0] sw_166_module_data_in;
    wire [7:0] sw_166_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_166 (
        .clk_in          (sw_165_clk_out),
        .data_in         (sw_165_data_out),
        .scan_select_in  (sw_165_scan_out),
        .latch_enable_in (sw_165_latch_out),
        .clk_out         (sw_166_clk_out),
        .data_out        (sw_166_data_out),
        .scan_select_out (sw_166_scan_out),
        .latch_enable_out(sw_166_latch_out),
        .module_data_in  (sw_166_module_data_in),
        .module_data_out (sw_166_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_166 (
        .io_in  (sw_166_module_data_in),
        .io_out (sw_166_module_data_out)
    );

    // [167] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_167_clk_out, sw_167_data_out, sw_167_scan_out, sw_167_latch_out;
    wire [7:0] sw_167_module_data_in;
    wire [7:0] sw_167_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_167 (
        .clk_in          (sw_166_clk_out),
        .data_in         (sw_166_data_out),
        .scan_select_in  (sw_166_scan_out),
        .latch_enable_in (sw_166_latch_out),
        .clk_out         (sw_167_clk_out),
        .data_out        (sw_167_data_out),
        .scan_select_out (sw_167_scan_out),
        .latch_enable_out(sw_167_latch_out),
        .module_data_in  (sw_167_module_data_in),
        .module_data_out (sw_167_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_167 (
        .io_in  (sw_167_module_data_in),
        .io_out (sw_167_module_data_out)
    );

    // [168] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_168_clk_out, sw_168_data_out, sw_168_scan_out, sw_168_latch_out;
    wire [7:0] sw_168_module_data_in;
    wire [7:0] sw_168_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_168 (
        .clk_in          (sw_167_clk_out),
        .data_in         (sw_167_data_out),
        .scan_select_in  (sw_167_scan_out),
        .latch_enable_in (sw_167_latch_out),
        .clk_out         (sw_168_clk_out),
        .data_out        (sw_168_data_out),
        .scan_select_out (sw_168_scan_out),
        .latch_enable_out(sw_168_latch_out),
        .module_data_in  (sw_168_module_data_in),
        .module_data_out (sw_168_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_168 (
        .io_in  (sw_168_module_data_in),
        .io_out (sw_168_module_data_out)
    );

    // [169] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_169_clk_out, sw_169_data_out, sw_169_scan_out, sw_169_latch_out;
    wire [7:0] sw_169_module_data_in;
    wire [7:0] sw_169_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_169 (
        .clk_in          (sw_168_clk_out),
        .data_in         (sw_168_data_out),
        .scan_select_in  (sw_168_scan_out),
        .latch_enable_in (sw_168_latch_out),
        .clk_out         (sw_169_clk_out),
        .data_out        (sw_169_data_out),
        .scan_select_out (sw_169_scan_out),
        .latch_enable_out(sw_169_latch_out),
        .module_data_in  (sw_169_module_data_in),
        .module_data_out (sw_169_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_169 (
        .io_in  (sw_169_module_data_in),
        .io_out (sw_169_module_data_out)
    );

    // [170] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_170_clk_out, sw_170_data_out, sw_170_scan_out, sw_170_latch_out;
    wire [7:0] sw_170_module_data_in;
    wire [7:0] sw_170_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_170 (
        .clk_in          (sw_169_clk_out),
        .data_in         (sw_169_data_out),
        .scan_select_in  (sw_169_scan_out),
        .latch_enable_in (sw_169_latch_out),
        .clk_out         (sw_170_clk_out),
        .data_out        (sw_170_data_out),
        .scan_select_out (sw_170_scan_out),
        .latch_enable_out(sw_170_latch_out),
        .module_data_in  (sw_170_module_data_in),
        .module_data_out (sw_170_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_170 (
        .io_in  (sw_170_module_data_in),
        .io_out (sw_170_module_data_out)
    );

    // [171] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_171_clk_out, sw_171_data_out, sw_171_scan_out, sw_171_latch_out;
    wire [7:0] sw_171_module_data_in;
    wire [7:0] sw_171_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_171 (
        .clk_in          (sw_170_clk_out),
        .data_in         (sw_170_data_out),
        .scan_select_in  (sw_170_scan_out),
        .latch_enable_in (sw_170_latch_out),
        .clk_out         (sw_171_clk_out),
        .data_out        (sw_171_data_out),
        .scan_select_out (sw_171_scan_out),
        .latch_enable_out(sw_171_latch_out),
        .module_data_in  (sw_171_module_data_in),
        .module_data_out (sw_171_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_171 (
        .io_in  (sw_171_module_data_in),
        .io_out (sw_171_module_data_out)
    );

    // [172] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_172_clk_out, sw_172_data_out, sw_172_scan_out, sw_172_latch_out;
    wire [7:0] sw_172_module_data_in;
    wire [7:0] sw_172_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_172 (
        .clk_in          (sw_171_clk_out),
        .data_in         (sw_171_data_out),
        .scan_select_in  (sw_171_scan_out),
        .latch_enable_in (sw_171_latch_out),
        .clk_out         (sw_172_clk_out),
        .data_out        (sw_172_data_out),
        .scan_select_out (sw_172_scan_out),
        .latch_enable_out(sw_172_latch_out),
        .module_data_in  (sw_172_module_data_in),
        .module_data_out (sw_172_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_172 (
        .io_in  (sw_172_module_data_in),
        .io_out (sw_172_module_data_out)
    );

    // [173] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_173_clk_out, sw_173_data_out, sw_173_scan_out, sw_173_latch_out;
    wire [7:0] sw_173_module_data_in;
    wire [7:0] sw_173_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_173 (
        .clk_in          (sw_172_clk_out),
        .data_in         (sw_172_data_out),
        .scan_select_in  (sw_172_scan_out),
        .latch_enable_in (sw_172_latch_out),
        .clk_out         (sw_173_clk_out),
        .data_out        (sw_173_data_out),
        .scan_select_out (sw_173_scan_out),
        .latch_enable_out(sw_173_latch_out),
        .module_data_in  (sw_173_module_data_in),
        .module_data_out (sw_173_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_173 (
        .io_in  (sw_173_module_data_in),
        .io_out (sw_173_module_data_out)
    );

    // [174] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_174_clk_out, sw_174_data_out, sw_174_scan_out, sw_174_latch_out;
    wire [7:0] sw_174_module_data_in;
    wire [7:0] sw_174_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_174 (
        .clk_in          (sw_173_clk_out),
        .data_in         (sw_173_data_out),
        .scan_select_in  (sw_173_scan_out),
        .latch_enable_in (sw_173_latch_out),
        .clk_out         (sw_174_clk_out),
        .data_out        (sw_174_data_out),
        .scan_select_out (sw_174_scan_out),
        .latch_enable_out(sw_174_latch_out),
        .module_data_in  (sw_174_module_data_in),
        .module_data_out (sw_174_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_174 (
        .io_in  (sw_174_module_data_in),
        .io_out (sw_174_module_data_out)
    );

    // [175] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_175_clk_out, sw_175_data_out, sw_175_scan_out, sw_175_latch_out;
    wire [7:0] sw_175_module_data_in;
    wire [7:0] sw_175_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_175 (
        .clk_in          (sw_174_clk_out),
        .data_in         (sw_174_data_out),
        .scan_select_in  (sw_174_scan_out),
        .latch_enable_in (sw_174_latch_out),
        .clk_out         (sw_175_clk_out),
        .data_out        (sw_175_data_out),
        .scan_select_out (sw_175_scan_out),
        .latch_enable_out(sw_175_latch_out),
        .module_data_in  (sw_175_module_data_in),
        .module_data_out (sw_175_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_175 (
        .io_in  (sw_175_module_data_in),
        .io_out (sw_175_module_data_out)
    );

    // [176] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_176_clk_out, sw_176_data_out, sw_176_scan_out, sw_176_latch_out;
    wire [7:0] sw_176_module_data_in;
    wire [7:0] sw_176_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_176 (
        .clk_in          (sw_175_clk_out),
        .data_in         (sw_175_data_out),
        .scan_select_in  (sw_175_scan_out),
        .latch_enable_in (sw_175_latch_out),
        .clk_out         (sw_176_clk_out),
        .data_out        (sw_176_data_out),
        .scan_select_out (sw_176_scan_out),
        .latch_enable_out(sw_176_latch_out),
        .module_data_in  (sw_176_module_data_in),
        .module_data_out (sw_176_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_176 (
        .io_in  (sw_176_module_data_in),
        .io_out (sw_176_module_data_out)
    );

    // [177] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_177_clk_out, sw_177_data_out, sw_177_scan_out, sw_177_latch_out;
    wire [7:0] sw_177_module_data_in;
    wire [7:0] sw_177_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_177 (
        .clk_in          (sw_176_clk_out),
        .data_in         (sw_176_data_out),
        .scan_select_in  (sw_176_scan_out),
        .latch_enable_in (sw_176_latch_out),
        .clk_out         (sw_177_clk_out),
        .data_out        (sw_177_data_out),
        .scan_select_out (sw_177_scan_out),
        .latch_enable_out(sw_177_latch_out),
        .module_data_in  (sw_177_module_data_in),
        .module_data_out (sw_177_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_177 (
        .io_in  (sw_177_module_data_in),
        .io_out (sw_177_module_data_out)
    );

    // [178] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_178_clk_out, sw_178_data_out, sw_178_scan_out, sw_178_latch_out;
    wire [7:0] sw_178_module_data_in;
    wire [7:0] sw_178_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_178 (
        .clk_in          (sw_177_clk_out),
        .data_in         (sw_177_data_out),
        .scan_select_in  (sw_177_scan_out),
        .latch_enable_in (sw_177_latch_out),
        .clk_out         (sw_178_clk_out),
        .data_out        (sw_178_data_out),
        .scan_select_out (sw_178_scan_out),
        .latch_enable_out(sw_178_latch_out),
        .module_data_in  (sw_178_module_data_in),
        .module_data_out (sw_178_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_178 (
        .io_in  (sw_178_module_data_in),
        .io_out (sw_178_module_data_out)
    );

    // [179] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_179_clk_out, sw_179_data_out, sw_179_scan_out, sw_179_latch_out;
    wire [7:0] sw_179_module_data_in;
    wire [7:0] sw_179_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_179 (
        .clk_in          (sw_178_clk_out),
        .data_in         (sw_178_data_out),
        .scan_select_in  (sw_178_scan_out),
        .latch_enable_in (sw_178_latch_out),
        .clk_out         (sw_179_clk_out),
        .data_out        (sw_179_data_out),
        .scan_select_out (sw_179_scan_out),
        .latch_enable_out(sw_179_latch_out),
        .module_data_in  (sw_179_module_data_in),
        .module_data_out (sw_179_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_179 (
        .io_in  (sw_179_module_data_in),
        .io_out (sw_179_module_data_out)
    );

    // [180] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_180_clk_out, sw_180_data_out, sw_180_scan_out, sw_180_latch_out;
    wire [7:0] sw_180_module_data_in;
    wire [7:0] sw_180_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_180 (
        .clk_in          (sw_179_clk_out),
        .data_in         (sw_179_data_out),
        .scan_select_in  (sw_179_scan_out),
        .latch_enable_in (sw_179_latch_out),
        .clk_out         (sw_180_clk_out),
        .data_out        (sw_180_data_out),
        .scan_select_out (sw_180_scan_out),
        .latch_enable_out(sw_180_latch_out),
        .module_data_in  (sw_180_module_data_in),
        .module_data_out (sw_180_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_180 (
        .io_in  (sw_180_module_data_in),
        .io_out (sw_180_module_data_out)
    );

    // [181] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_181_clk_out, sw_181_data_out, sw_181_scan_out, sw_181_latch_out;
    wire [7:0] sw_181_module_data_in;
    wire [7:0] sw_181_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_181 (
        .clk_in          (sw_180_clk_out),
        .data_in         (sw_180_data_out),
        .scan_select_in  (sw_180_scan_out),
        .latch_enable_in (sw_180_latch_out),
        .clk_out         (sw_181_clk_out),
        .data_out        (sw_181_data_out),
        .scan_select_out (sw_181_scan_out),
        .latch_enable_out(sw_181_latch_out),
        .module_data_in  (sw_181_module_data_in),
        .module_data_out (sw_181_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_181 (
        .io_in  (sw_181_module_data_in),
        .io_out (sw_181_module_data_out)
    );

    // [182] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_182_clk_out, sw_182_data_out, sw_182_scan_out, sw_182_latch_out;
    wire [7:0] sw_182_module_data_in;
    wire [7:0] sw_182_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_182 (
        .clk_in          (sw_181_clk_out),
        .data_in         (sw_181_data_out),
        .scan_select_in  (sw_181_scan_out),
        .latch_enable_in (sw_181_latch_out),
        .clk_out         (sw_182_clk_out),
        .data_out        (sw_182_data_out),
        .scan_select_out (sw_182_scan_out),
        .latch_enable_out(sw_182_latch_out),
        .module_data_in  (sw_182_module_data_in),
        .module_data_out (sw_182_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_182 (
        .io_in  (sw_182_module_data_in),
        .io_out (sw_182_module_data_out)
    );

    // [183] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_183_clk_out, sw_183_data_out, sw_183_scan_out, sw_183_latch_out;
    wire [7:0] sw_183_module_data_in;
    wire [7:0] sw_183_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_183 (
        .clk_in          (sw_182_clk_out),
        .data_in         (sw_182_data_out),
        .scan_select_in  (sw_182_scan_out),
        .latch_enable_in (sw_182_latch_out),
        .clk_out         (sw_183_clk_out),
        .data_out        (sw_183_data_out),
        .scan_select_out (sw_183_scan_out),
        .latch_enable_out(sw_183_latch_out),
        .module_data_in  (sw_183_module_data_in),
        .module_data_out (sw_183_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_183 (
        .io_in  (sw_183_module_data_in),
        .io_out (sw_183_module_data_out)
    );

    // [184] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_184_clk_out, sw_184_data_out, sw_184_scan_out, sw_184_latch_out;
    wire [7:0] sw_184_module_data_in;
    wire [7:0] sw_184_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_184 (
        .clk_in          (sw_183_clk_out),
        .data_in         (sw_183_data_out),
        .scan_select_in  (sw_183_scan_out),
        .latch_enable_in (sw_183_latch_out),
        .clk_out         (sw_184_clk_out),
        .data_out        (sw_184_data_out),
        .scan_select_out (sw_184_scan_out),
        .latch_enable_out(sw_184_latch_out),
        .module_data_in  (sw_184_module_data_in),
        .module_data_out (sw_184_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_184 (
        .io_in  (sw_184_module_data_in),
        .io_out (sw_184_module_data_out)
    );

    // [185] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_185_clk_out, sw_185_data_out, sw_185_scan_out, sw_185_latch_out;
    wire [7:0] sw_185_module_data_in;
    wire [7:0] sw_185_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_185 (
        .clk_in          (sw_184_clk_out),
        .data_in         (sw_184_data_out),
        .scan_select_in  (sw_184_scan_out),
        .latch_enable_in (sw_184_latch_out),
        .clk_out         (sw_185_clk_out),
        .data_out        (sw_185_data_out),
        .scan_select_out (sw_185_scan_out),
        .latch_enable_out(sw_185_latch_out),
        .module_data_in  (sw_185_module_data_in),
        .module_data_out (sw_185_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_185 (
        .io_in  (sw_185_module_data_in),
        .io_out (sw_185_module_data_out)
    );

    // [186] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_186_clk_out, sw_186_data_out, sw_186_scan_out, sw_186_latch_out;
    wire [7:0] sw_186_module_data_in;
    wire [7:0] sw_186_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_186 (
        .clk_in          (sw_185_clk_out),
        .data_in         (sw_185_data_out),
        .scan_select_in  (sw_185_scan_out),
        .latch_enable_in (sw_185_latch_out),
        .clk_out         (sw_186_clk_out),
        .data_out        (sw_186_data_out),
        .scan_select_out (sw_186_scan_out),
        .latch_enable_out(sw_186_latch_out),
        .module_data_in  (sw_186_module_data_in),
        .module_data_out (sw_186_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_186 (
        .io_in  (sw_186_module_data_in),
        .io_out (sw_186_module_data_out)
    );

    // [187] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_187_clk_out, sw_187_data_out, sw_187_scan_out, sw_187_latch_out;
    wire [7:0] sw_187_module_data_in;
    wire [7:0] sw_187_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_187 (
        .clk_in          (sw_186_clk_out),
        .data_in         (sw_186_data_out),
        .scan_select_in  (sw_186_scan_out),
        .latch_enable_in (sw_186_latch_out),
        .clk_out         (sw_187_clk_out),
        .data_out        (sw_187_data_out),
        .scan_select_out (sw_187_scan_out),
        .latch_enable_out(sw_187_latch_out),
        .module_data_in  (sw_187_module_data_in),
        .module_data_out (sw_187_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_187 (
        .io_in  (sw_187_module_data_in),
        .io_out (sw_187_module_data_out)
    );

    // [188] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_188_clk_out, sw_188_data_out, sw_188_scan_out, sw_188_latch_out;
    wire [7:0] sw_188_module_data_in;
    wire [7:0] sw_188_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_188 (
        .clk_in          (sw_187_clk_out),
        .data_in         (sw_187_data_out),
        .scan_select_in  (sw_187_scan_out),
        .latch_enable_in (sw_187_latch_out),
        .clk_out         (sw_188_clk_out),
        .data_out        (sw_188_data_out),
        .scan_select_out (sw_188_scan_out),
        .latch_enable_out(sw_188_latch_out),
        .module_data_in  (sw_188_module_data_in),
        .module_data_out (sw_188_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_188 (
        .io_in  (sw_188_module_data_in),
        .io_out (sw_188_module_data_out)
    );

    // [189] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_189_clk_out, sw_189_data_out, sw_189_scan_out, sw_189_latch_out;
    wire [7:0] sw_189_module_data_in;
    wire [7:0] sw_189_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_189 (
        .clk_in          (sw_188_clk_out),
        .data_in         (sw_188_data_out),
        .scan_select_in  (sw_188_scan_out),
        .latch_enable_in (sw_188_latch_out),
        .clk_out         (sw_189_clk_out),
        .data_out        (sw_189_data_out),
        .scan_select_out (sw_189_scan_out),
        .latch_enable_out(sw_189_latch_out),
        .module_data_in  (sw_189_module_data_in),
        .module_data_out (sw_189_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_189 (
        .io_in  (sw_189_module_data_in),
        .io_out (sw_189_module_data_out)
    );

    // [190] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_190_clk_out, sw_190_data_out, sw_190_scan_out, sw_190_latch_out;
    wire [7:0] sw_190_module_data_in;
    wire [7:0] sw_190_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_190 (
        .clk_in          (sw_189_clk_out),
        .data_in         (sw_189_data_out),
        .scan_select_in  (sw_189_scan_out),
        .latch_enable_in (sw_189_latch_out),
        .clk_out         (sw_190_clk_out),
        .data_out        (sw_190_data_out),
        .scan_select_out (sw_190_scan_out),
        .latch_enable_out(sw_190_latch_out),
        .module_data_in  (sw_190_module_data_in),
        .module_data_out (sw_190_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_190 (
        .io_in  (sw_190_module_data_in),
        .io_out (sw_190_module_data_out)
    );

    // [191] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_191_clk_out, sw_191_data_out, sw_191_scan_out, sw_191_latch_out;
    wire [7:0] sw_191_module_data_in;
    wire [7:0] sw_191_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_191 (
        .clk_in          (sw_190_clk_out),
        .data_in         (sw_190_data_out),
        .scan_select_in  (sw_190_scan_out),
        .latch_enable_in (sw_190_latch_out),
        .clk_out         (sw_191_clk_out),
        .data_out        (sw_191_data_out),
        .scan_select_out (sw_191_scan_out),
        .latch_enable_out(sw_191_latch_out),
        .module_data_in  (sw_191_module_data_in),
        .module_data_out (sw_191_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_191 (
        .io_in  (sw_191_module_data_in),
        .io_out (sw_191_module_data_out)
    );

    // [192] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_192_clk_out, sw_192_data_out, sw_192_scan_out, sw_192_latch_out;
    wire [7:0] sw_192_module_data_in;
    wire [7:0] sw_192_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_192 (
        .clk_in          (sw_191_clk_out),
        .data_in         (sw_191_data_out),
        .scan_select_in  (sw_191_scan_out),
        .latch_enable_in (sw_191_latch_out),
        .clk_out         (sw_192_clk_out),
        .data_out        (sw_192_data_out),
        .scan_select_out (sw_192_scan_out),
        .latch_enable_out(sw_192_latch_out),
        .module_data_in  (sw_192_module_data_in),
        .module_data_out (sw_192_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_192 (
        .io_in  (sw_192_module_data_in),
        .io_out (sw_192_module_data_out)
    );

    // [193] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_193_clk_out, sw_193_data_out, sw_193_scan_out, sw_193_latch_out;
    wire [7:0] sw_193_module_data_in;
    wire [7:0] sw_193_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_193 (
        .clk_in          (sw_192_clk_out),
        .data_in         (sw_192_data_out),
        .scan_select_in  (sw_192_scan_out),
        .latch_enable_in (sw_192_latch_out),
        .clk_out         (sw_193_clk_out),
        .data_out        (sw_193_data_out),
        .scan_select_out (sw_193_scan_out),
        .latch_enable_out(sw_193_latch_out),
        .module_data_in  (sw_193_module_data_in),
        .module_data_out (sw_193_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_193 (
        .io_in  (sw_193_module_data_in),
        .io_out (sw_193_module_data_out)
    );

    // [194] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_194_clk_out, sw_194_data_out, sw_194_scan_out, sw_194_latch_out;
    wire [7:0] sw_194_module_data_in;
    wire [7:0] sw_194_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_194 (
        .clk_in          (sw_193_clk_out),
        .data_in         (sw_193_data_out),
        .scan_select_in  (sw_193_scan_out),
        .latch_enable_in (sw_193_latch_out),
        .clk_out         (sw_194_clk_out),
        .data_out        (sw_194_data_out),
        .scan_select_out (sw_194_scan_out),
        .latch_enable_out(sw_194_latch_out),
        .module_data_in  (sw_194_module_data_in),
        .module_data_out (sw_194_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_194 (
        .io_in  (sw_194_module_data_in),
        .io_out (sw_194_module_data_out)
    );

    // [195] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_195_clk_out, sw_195_data_out, sw_195_scan_out, sw_195_latch_out;
    wire [7:0] sw_195_module_data_in;
    wire [7:0] sw_195_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_195 (
        .clk_in          (sw_194_clk_out),
        .data_in         (sw_194_data_out),
        .scan_select_in  (sw_194_scan_out),
        .latch_enable_in (sw_194_latch_out),
        .clk_out         (sw_195_clk_out),
        .data_out        (sw_195_data_out),
        .scan_select_out (sw_195_scan_out),
        .latch_enable_out(sw_195_latch_out),
        .module_data_in  (sw_195_module_data_in),
        .module_data_out (sw_195_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_195 (
        .io_in  (sw_195_module_data_in),
        .io_out (sw_195_module_data_out)
    );

    // [196] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_196_clk_out, sw_196_data_out, sw_196_scan_out, sw_196_latch_out;
    wire [7:0] sw_196_module_data_in;
    wire [7:0] sw_196_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_196 (
        .clk_in          (sw_195_clk_out),
        .data_in         (sw_195_data_out),
        .scan_select_in  (sw_195_scan_out),
        .latch_enable_in (sw_195_latch_out),
        .clk_out         (sw_196_clk_out),
        .data_out        (sw_196_data_out),
        .scan_select_out (sw_196_scan_out),
        .latch_enable_out(sw_196_latch_out),
        .module_data_in  (sw_196_module_data_in),
        .module_data_out (sw_196_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_196 (
        .io_in  (sw_196_module_data_in),
        .io_out (sw_196_module_data_out)
    );

    // [197] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_197_clk_out, sw_197_data_out, sw_197_scan_out, sw_197_latch_out;
    wire [7:0] sw_197_module_data_in;
    wire [7:0] sw_197_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_197 (
        .clk_in          (sw_196_clk_out),
        .data_in         (sw_196_data_out),
        .scan_select_in  (sw_196_scan_out),
        .latch_enable_in (sw_196_latch_out),
        .clk_out         (sw_197_clk_out),
        .data_out        (sw_197_data_out),
        .scan_select_out (sw_197_scan_out),
        .latch_enable_out(sw_197_latch_out),
        .module_data_in  (sw_197_module_data_in),
        .module_data_out (sw_197_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_197 (
        .io_in  (sw_197_module_data_in),
        .io_out (sw_197_module_data_out)
    );

    // [198] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_198_clk_out, sw_198_data_out, sw_198_scan_out, sw_198_latch_out;
    wire [7:0] sw_198_module_data_in;
    wire [7:0] sw_198_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_198 (
        .clk_in          (sw_197_clk_out),
        .data_in         (sw_197_data_out),
        .scan_select_in  (sw_197_scan_out),
        .latch_enable_in (sw_197_latch_out),
        .clk_out         (sw_198_clk_out),
        .data_out        (sw_198_data_out),
        .scan_select_out (sw_198_scan_out),
        .latch_enable_out(sw_198_latch_out),
        .module_data_in  (sw_198_module_data_in),
        .module_data_out (sw_198_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_198 (
        .io_in  (sw_198_module_data_in),
        .io_out (sw_198_module_data_out)
    );

    // [199] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_199_clk_out, sw_199_data_out, sw_199_scan_out, sw_199_latch_out;
    wire [7:0] sw_199_module_data_in;
    wire [7:0] sw_199_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_199 (
        .clk_in          (sw_198_clk_out),
        .data_in         (sw_198_data_out),
        .scan_select_in  (sw_198_scan_out),
        .latch_enable_in (sw_198_latch_out),
        .clk_out         (sw_199_clk_out),
        .data_out        (sw_199_data_out),
        .scan_select_out (sw_199_scan_out),
        .latch_enable_out(sw_199_latch_out),
        .module_data_in  (sw_199_module_data_in),
        .module_data_out (sw_199_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_199 (
        .io_in  (sw_199_module_data_in),
        .io_out (sw_199_module_data_out)
    );

    // [200] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_200_clk_out, sw_200_data_out, sw_200_scan_out, sw_200_latch_out;
    wire [7:0] sw_200_module_data_in;
    wire [7:0] sw_200_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_200 (
        .clk_in          (sw_199_clk_out),
        .data_in         (sw_199_data_out),
        .scan_select_in  (sw_199_scan_out),
        .latch_enable_in (sw_199_latch_out),
        .clk_out         (sw_200_clk_out),
        .data_out        (sw_200_data_out),
        .scan_select_out (sw_200_scan_out),
        .latch_enable_out(sw_200_latch_out),
        .module_data_in  (sw_200_module_data_in),
        .module_data_out (sw_200_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_200 (
        .io_in  (sw_200_module_data_in),
        .io_out (sw_200_module_data_out)
    );

    // [201] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_201_clk_out, sw_201_data_out, sw_201_scan_out, sw_201_latch_out;
    wire [7:0] sw_201_module_data_in;
    wire [7:0] sw_201_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_201 (
        .clk_in          (sw_200_clk_out),
        .data_in         (sw_200_data_out),
        .scan_select_in  (sw_200_scan_out),
        .latch_enable_in (sw_200_latch_out),
        .clk_out         (sw_201_clk_out),
        .data_out        (sw_201_data_out),
        .scan_select_out (sw_201_scan_out),
        .latch_enable_out(sw_201_latch_out),
        .module_data_in  (sw_201_module_data_in),
        .module_data_out (sw_201_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_201 (
        .io_in  (sw_201_module_data_in),
        .io_out (sw_201_module_data_out)
    );

    // [202] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_202_clk_out, sw_202_data_out, sw_202_scan_out, sw_202_latch_out;
    wire [7:0] sw_202_module_data_in;
    wire [7:0] sw_202_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_202 (
        .clk_in          (sw_201_clk_out),
        .data_in         (sw_201_data_out),
        .scan_select_in  (sw_201_scan_out),
        .latch_enable_in (sw_201_latch_out),
        .clk_out         (sw_202_clk_out),
        .data_out        (sw_202_data_out),
        .scan_select_out (sw_202_scan_out),
        .latch_enable_out(sw_202_latch_out),
        .module_data_in  (sw_202_module_data_in),
        .module_data_out (sw_202_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_202 (
        .io_in  (sw_202_module_data_in),
        .io_out (sw_202_module_data_out)
    );

    // [203] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_203_clk_out, sw_203_data_out, sw_203_scan_out, sw_203_latch_out;
    wire [7:0] sw_203_module_data_in;
    wire [7:0] sw_203_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_203 (
        .clk_in          (sw_202_clk_out),
        .data_in         (sw_202_data_out),
        .scan_select_in  (sw_202_scan_out),
        .latch_enable_in (sw_202_latch_out),
        .clk_out         (sw_203_clk_out),
        .data_out        (sw_203_data_out),
        .scan_select_out (sw_203_scan_out),
        .latch_enable_out(sw_203_latch_out),
        .module_data_in  (sw_203_module_data_in),
        .module_data_out (sw_203_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_203 (
        .io_in  (sw_203_module_data_in),
        .io_out (sw_203_module_data_out)
    );

    // [204] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_204_clk_out, sw_204_data_out, sw_204_scan_out, sw_204_latch_out;
    wire [7:0] sw_204_module_data_in;
    wire [7:0] sw_204_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_204 (
        .clk_in          (sw_203_clk_out),
        .data_in         (sw_203_data_out),
        .scan_select_in  (sw_203_scan_out),
        .latch_enable_in (sw_203_latch_out),
        .clk_out         (sw_204_clk_out),
        .data_out        (sw_204_data_out),
        .scan_select_out (sw_204_scan_out),
        .latch_enable_out(sw_204_latch_out),
        .module_data_in  (sw_204_module_data_in),
        .module_data_out (sw_204_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_204 (
        .io_in  (sw_204_module_data_in),
        .io_out (sw_204_module_data_out)
    );

    // [205] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_205_clk_out, sw_205_data_out, sw_205_scan_out, sw_205_latch_out;
    wire [7:0] sw_205_module_data_in;
    wire [7:0] sw_205_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_205 (
        .clk_in          (sw_204_clk_out),
        .data_in         (sw_204_data_out),
        .scan_select_in  (sw_204_scan_out),
        .latch_enable_in (sw_204_latch_out),
        .clk_out         (sw_205_clk_out),
        .data_out        (sw_205_data_out),
        .scan_select_out (sw_205_scan_out),
        .latch_enable_out(sw_205_latch_out),
        .module_data_in  (sw_205_module_data_in),
        .module_data_out (sw_205_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_205 (
        .io_in  (sw_205_module_data_in),
        .io_out (sw_205_module_data_out)
    );

    // [206] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_206_clk_out, sw_206_data_out, sw_206_scan_out, sw_206_latch_out;
    wire [7:0] sw_206_module_data_in;
    wire [7:0] sw_206_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_206 (
        .clk_in          (sw_205_clk_out),
        .data_in         (sw_205_data_out),
        .scan_select_in  (sw_205_scan_out),
        .latch_enable_in (sw_205_latch_out),
        .clk_out         (sw_206_clk_out),
        .data_out        (sw_206_data_out),
        .scan_select_out (sw_206_scan_out),
        .latch_enable_out(sw_206_latch_out),
        .module_data_in  (sw_206_module_data_in),
        .module_data_out (sw_206_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_206 (
        .io_in  (sw_206_module_data_in),
        .io_out (sw_206_module_data_out)
    );

    // [207] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_207_clk_out, sw_207_data_out, sw_207_scan_out, sw_207_latch_out;
    wire [7:0] sw_207_module_data_in;
    wire [7:0] sw_207_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_207 (
        .clk_in          (sw_206_clk_out),
        .data_in         (sw_206_data_out),
        .scan_select_in  (sw_206_scan_out),
        .latch_enable_in (sw_206_latch_out),
        .clk_out         (sw_207_clk_out),
        .data_out        (sw_207_data_out),
        .scan_select_out (sw_207_scan_out),
        .latch_enable_out(sw_207_latch_out),
        .module_data_in  (sw_207_module_data_in),
        .module_data_out (sw_207_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_207 (
        .io_in  (sw_207_module_data_in),
        .io_out (sw_207_module_data_out)
    );

    // [208] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_208_clk_out, sw_208_data_out, sw_208_scan_out, sw_208_latch_out;
    wire [7:0] sw_208_module_data_in;
    wire [7:0] sw_208_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_208 (
        .clk_in          (sw_207_clk_out),
        .data_in         (sw_207_data_out),
        .scan_select_in  (sw_207_scan_out),
        .latch_enable_in (sw_207_latch_out),
        .clk_out         (sw_208_clk_out),
        .data_out        (sw_208_data_out),
        .scan_select_out (sw_208_scan_out),
        .latch_enable_out(sw_208_latch_out),
        .module_data_in  (sw_208_module_data_in),
        .module_data_out (sw_208_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_208 (
        .io_in  (sw_208_module_data_in),
        .io_out (sw_208_module_data_out)
    );

    // [209] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_209_clk_out, sw_209_data_out, sw_209_scan_out, sw_209_latch_out;
    wire [7:0] sw_209_module_data_in;
    wire [7:0] sw_209_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_209 (
        .clk_in          (sw_208_clk_out),
        .data_in         (sw_208_data_out),
        .scan_select_in  (sw_208_scan_out),
        .latch_enable_in (sw_208_latch_out),
        .clk_out         (sw_209_clk_out),
        .data_out        (sw_209_data_out),
        .scan_select_out (sw_209_scan_out),
        .latch_enable_out(sw_209_latch_out),
        .module_data_in  (sw_209_module_data_in),
        .module_data_out (sw_209_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_209 (
        .io_in  (sw_209_module_data_in),
        .io_out (sw_209_module_data_out)
    );

    // [210] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_210_clk_out, sw_210_data_out, sw_210_scan_out, sw_210_latch_out;
    wire [7:0] sw_210_module_data_in;
    wire [7:0] sw_210_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_210 (
        .clk_in          (sw_209_clk_out),
        .data_in         (sw_209_data_out),
        .scan_select_in  (sw_209_scan_out),
        .latch_enable_in (sw_209_latch_out),
        .clk_out         (sw_210_clk_out),
        .data_out        (sw_210_data_out),
        .scan_select_out (sw_210_scan_out),
        .latch_enable_out(sw_210_latch_out),
        .module_data_in  (sw_210_module_data_in),
        .module_data_out (sw_210_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_210 (
        .io_in  (sw_210_module_data_in),
        .io_out (sw_210_module_data_out)
    );

    // [211] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_211_clk_out, sw_211_data_out, sw_211_scan_out, sw_211_latch_out;
    wire [7:0] sw_211_module_data_in;
    wire [7:0] sw_211_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_211 (
        .clk_in          (sw_210_clk_out),
        .data_in         (sw_210_data_out),
        .scan_select_in  (sw_210_scan_out),
        .latch_enable_in (sw_210_latch_out),
        .clk_out         (sw_211_clk_out),
        .data_out        (sw_211_data_out),
        .scan_select_out (sw_211_scan_out),
        .latch_enable_out(sw_211_latch_out),
        .module_data_in  (sw_211_module_data_in),
        .module_data_out (sw_211_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_211 (
        .io_in  (sw_211_module_data_in),
        .io_out (sw_211_module_data_out)
    );

    // [212] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_212_clk_out, sw_212_data_out, sw_212_scan_out, sw_212_latch_out;
    wire [7:0] sw_212_module_data_in;
    wire [7:0] sw_212_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_212 (
        .clk_in          (sw_211_clk_out),
        .data_in         (sw_211_data_out),
        .scan_select_in  (sw_211_scan_out),
        .latch_enable_in (sw_211_latch_out),
        .clk_out         (sw_212_clk_out),
        .data_out        (sw_212_data_out),
        .scan_select_out (sw_212_scan_out),
        .latch_enable_out(sw_212_latch_out),
        .module_data_in  (sw_212_module_data_in),
        .module_data_out (sw_212_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_212 (
        .io_in  (sw_212_module_data_in),
        .io_out (sw_212_module_data_out)
    );

    // [213] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_213_clk_out, sw_213_data_out, sw_213_scan_out, sw_213_latch_out;
    wire [7:0] sw_213_module_data_in;
    wire [7:0] sw_213_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_213 (
        .clk_in          (sw_212_clk_out),
        .data_in         (sw_212_data_out),
        .scan_select_in  (sw_212_scan_out),
        .latch_enable_in (sw_212_latch_out),
        .clk_out         (sw_213_clk_out),
        .data_out        (sw_213_data_out),
        .scan_select_out (sw_213_scan_out),
        .latch_enable_out(sw_213_latch_out),
        .module_data_in  (sw_213_module_data_in),
        .module_data_out (sw_213_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_213 (
        .io_in  (sw_213_module_data_in),
        .io_out (sw_213_module_data_out)
    );

    // [214] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_214_clk_out, sw_214_data_out, sw_214_scan_out, sw_214_latch_out;
    wire [7:0] sw_214_module_data_in;
    wire [7:0] sw_214_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_214 (
        .clk_in          (sw_213_clk_out),
        .data_in         (sw_213_data_out),
        .scan_select_in  (sw_213_scan_out),
        .latch_enable_in (sw_213_latch_out),
        .clk_out         (sw_214_clk_out),
        .data_out        (sw_214_data_out),
        .scan_select_out (sw_214_scan_out),
        .latch_enable_out(sw_214_latch_out),
        .module_data_in  (sw_214_module_data_in),
        .module_data_out (sw_214_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_214 (
        .io_in  (sw_214_module_data_in),
        .io_out (sw_214_module_data_out)
    );

    // [215] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_215_clk_out, sw_215_data_out, sw_215_scan_out, sw_215_latch_out;
    wire [7:0] sw_215_module_data_in;
    wire [7:0] sw_215_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_215 (
        .clk_in          (sw_214_clk_out),
        .data_in         (sw_214_data_out),
        .scan_select_in  (sw_214_scan_out),
        .latch_enable_in (sw_214_latch_out),
        .clk_out         (sw_215_clk_out),
        .data_out        (sw_215_data_out),
        .scan_select_out (sw_215_scan_out),
        .latch_enable_out(sw_215_latch_out),
        .module_data_in  (sw_215_module_data_in),
        .module_data_out (sw_215_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_215 (
        .io_in  (sw_215_module_data_in),
        .io_out (sw_215_module_data_out)
    );

    // [216] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_216_clk_out, sw_216_data_out, sw_216_scan_out, sw_216_latch_out;
    wire [7:0] sw_216_module_data_in;
    wire [7:0] sw_216_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_216 (
        .clk_in          (sw_215_clk_out),
        .data_in         (sw_215_data_out),
        .scan_select_in  (sw_215_scan_out),
        .latch_enable_in (sw_215_latch_out),
        .clk_out         (sw_216_clk_out),
        .data_out        (sw_216_data_out),
        .scan_select_out (sw_216_scan_out),
        .latch_enable_out(sw_216_latch_out),
        .module_data_in  (sw_216_module_data_in),
        .module_data_out (sw_216_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_216 (
        .io_in  (sw_216_module_data_in),
        .io_out (sw_216_module_data_out)
    );

    // [217] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_217_clk_out, sw_217_data_out, sw_217_scan_out, sw_217_latch_out;
    wire [7:0] sw_217_module_data_in;
    wire [7:0] sw_217_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_217 (
        .clk_in          (sw_216_clk_out),
        .data_in         (sw_216_data_out),
        .scan_select_in  (sw_216_scan_out),
        .latch_enable_in (sw_216_latch_out),
        .clk_out         (sw_217_clk_out),
        .data_out        (sw_217_data_out),
        .scan_select_out (sw_217_scan_out),
        .latch_enable_out(sw_217_latch_out),
        .module_data_in  (sw_217_module_data_in),
        .module_data_out (sw_217_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_217 (
        .io_in  (sw_217_module_data_in),
        .io_out (sw_217_module_data_out)
    );

    // [218] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_218_clk_out, sw_218_data_out, sw_218_scan_out, sw_218_latch_out;
    wire [7:0] sw_218_module_data_in;
    wire [7:0] sw_218_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_218 (
        .clk_in          (sw_217_clk_out),
        .data_in         (sw_217_data_out),
        .scan_select_in  (sw_217_scan_out),
        .latch_enable_in (sw_217_latch_out),
        .clk_out         (sw_218_clk_out),
        .data_out        (sw_218_data_out),
        .scan_select_out (sw_218_scan_out),
        .latch_enable_out(sw_218_latch_out),
        .module_data_in  (sw_218_module_data_in),
        .module_data_out (sw_218_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_218 (
        .io_in  (sw_218_module_data_in),
        .io_out (sw_218_module_data_out)
    );

    // [219] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_219_clk_out, sw_219_data_out, sw_219_scan_out, sw_219_latch_out;
    wire [7:0] sw_219_module_data_in;
    wire [7:0] sw_219_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_219 (
        .clk_in          (sw_218_clk_out),
        .data_in         (sw_218_data_out),
        .scan_select_in  (sw_218_scan_out),
        .latch_enable_in (sw_218_latch_out),
        .clk_out         (sw_219_clk_out),
        .data_out        (sw_219_data_out),
        .scan_select_out (sw_219_scan_out),
        .latch_enable_out(sw_219_latch_out),
        .module_data_in  (sw_219_module_data_in),
        .module_data_out (sw_219_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_219 (
        .io_in  (sw_219_module_data_in),
        .io_out (sw_219_module_data_out)
    );

    // [220] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_220_clk_out, sw_220_data_out, sw_220_scan_out, sw_220_latch_out;
    wire [7:0] sw_220_module_data_in;
    wire [7:0] sw_220_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_220 (
        .clk_in          (sw_219_clk_out),
        .data_in         (sw_219_data_out),
        .scan_select_in  (sw_219_scan_out),
        .latch_enable_in (sw_219_latch_out),
        .clk_out         (sw_220_clk_out),
        .data_out        (sw_220_data_out),
        .scan_select_out (sw_220_scan_out),
        .latch_enable_out(sw_220_latch_out),
        .module_data_in  (sw_220_module_data_in),
        .module_data_out (sw_220_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_220 (
        .io_in  (sw_220_module_data_in),
        .io_out (sw_220_module_data_out)
    );

    // [221] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_221_clk_out, sw_221_data_out, sw_221_scan_out, sw_221_latch_out;
    wire [7:0] sw_221_module_data_in;
    wire [7:0] sw_221_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_221 (
        .clk_in          (sw_220_clk_out),
        .data_in         (sw_220_data_out),
        .scan_select_in  (sw_220_scan_out),
        .latch_enable_in (sw_220_latch_out),
        .clk_out         (sw_221_clk_out),
        .data_out        (sw_221_data_out),
        .scan_select_out (sw_221_scan_out),
        .latch_enable_out(sw_221_latch_out),
        .module_data_in  (sw_221_module_data_in),
        .module_data_out (sw_221_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_221 (
        .io_in  (sw_221_module_data_in),
        .io_out (sw_221_module_data_out)
    );

    // [222] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_222_clk_out, sw_222_data_out, sw_222_scan_out, sw_222_latch_out;
    wire [7:0] sw_222_module_data_in;
    wire [7:0] sw_222_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_222 (
        .clk_in          (sw_221_clk_out),
        .data_in         (sw_221_data_out),
        .scan_select_in  (sw_221_scan_out),
        .latch_enable_in (sw_221_latch_out),
        .clk_out         (sw_222_clk_out),
        .data_out        (sw_222_data_out),
        .scan_select_out (sw_222_scan_out),
        .latch_enable_out(sw_222_latch_out),
        .module_data_in  (sw_222_module_data_in),
        .module_data_out (sw_222_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_222 (
        .io_in  (sw_222_module_data_in),
        .io_out (sw_222_module_data_out)
    );

    // [223] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_223_clk_out, sw_223_data_out, sw_223_scan_out, sw_223_latch_out;
    wire [7:0] sw_223_module_data_in;
    wire [7:0] sw_223_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_223 (
        .clk_in          (sw_222_clk_out),
        .data_in         (sw_222_data_out),
        .scan_select_in  (sw_222_scan_out),
        .latch_enable_in (sw_222_latch_out),
        .clk_out         (sw_223_clk_out),
        .data_out        (sw_223_data_out),
        .scan_select_out (sw_223_scan_out),
        .latch_enable_out(sw_223_latch_out),
        .module_data_in  (sw_223_module_data_in),
        .module_data_out (sw_223_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_223 (
        .io_in  (sw_223_module_data_in),
        .io_out (sw_223_module_data_out)
    );

    // [224] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_224_clk_out, sw_224_data_out, sw_224_scan_out, sw_224_latch_out;
    wire [7:0] sw_224_module_data_in;
    wire [7:0] sw_224_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_224 (
        .clk_in          (sw_223_clk_out),
        .data_in         (sw_223_data_out),
        .scan_select_in  (sw_223_scan_out),
        .latch_enable_in (sw_223_latch_out),
        .clk_out         (sw_224_clk_out),
        .data_out        (sw_224_data_out),
        .scan_select_out (sw_224_scan_out),
        .latch_enable_out(sw_224_latch_out),
        .module_data_in  (sw_224_module_data_in),
        .module_data_out (sw_224_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_224 (
        .io_in  (sw_224_module_data_in),
        .io_out (sw_224_module_data_out)
    );

    // [225] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_225_clk_out, sw_225_data_out, sw_225_scan_out, sw_225_latch_out;
    wire [7:0] sw_225_module_data_in;
    wire [7:0] sw_225_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_225 (
        .clk_in          (sw_224_clk_out),
        .data_in         (sw_224_data_out),
        .scan_select_in  (sw_224_scan_out),
        .latch_enable_in (sw_224_latch_out),
        .clk_out         (sw_225_clk_out),
        .data_out        (sw_225_data_out),
        .scan_select_out (sw_225_scan_out),
        .latch_enable_out(sw_225_latch_out),
        .module_data_in  (sw_225_module_data_in),
        .module_data_out (sw_225_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_225 (
        .io_in  (sw_225_module_data_in),
        .io_out (sw_225_module_data_out)
    );

    // [226] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_226_clk_out, sw_226_data_out, sw_226_scan_out, sw_226_latch_out;
    wire [7:0] sw_226_module_data_in;
    wire [7:0] sw_226_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_226 (
        .clk_in          (sw_225_clk_out),
        .data_in         (sw_225_data_out),
        .scan_select_in  (sw_225_scan_out),
        .latch_enable_in (sw_225_latch_out),
        .clk_out         (sw_226_clk_out),
        .data_out        (sw_226_data_out),
        .scan_select_out (sw_226_scan_out),
        .latch_enable_out(sw_226_latch_out),
        .module_data_in  (sw_226_module_data_in),
        .module_data_out (sw_226_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_226 (
        .io_in  (sw_226_module_data_in),
        .io_out (sw_226_module_data_out)
    );

    // [227] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_227_clk_out, sw_227_data_out, sw_227_scan_out, sw_227_latch_out;
    wire [7:0] sw_227_module_data_in;
    wire [7:0] sw_227_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_227 (
        .clk_in          (sw_226_clk_out),
        .data_in         (sw_226_data_out),
        .scan_select_in  (sw_226_scan_out),
        .latch_enable_in (sw_226_latch_out),
        .clk_out         (sw_227_clk_out),
        .data_out        (sw_227_data_out),
        .scan_select_out (sw_227_scan_out),
        .latch_enable_out(sw_227_latch_out),
        .module_data_in  (sw_227_module_data_in),
        .module_data_out (sw_227_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_227 (
        .io_in  (sw_227_module_data_in),
        .io_out (sw_227_module_data_out)
    );

    // [228] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_228_clk_out, sw_228_data_out, sw_228_scan_out, sw_228_latch_out;
    wire [7:0] sw_228_module_data_in;
    wire [7:0] sw_228_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_228 (
        .clk_in          (sw_227_clk_out),
        .data_in         (sw_227_data_out),
        .scan_select_in  (sw_227_scan_out),
        .latch_enable_in (sw_227_latch_out),
        .clk_out         (sw_228_clk_out),
        .data_out        (sw_228_data_out),
        .scan_select_out (sw_228_scan_out),
        .latch_enable_out(sw_228_latch_out),
        .module_data_in  (sw_228_module_data_in),
        .module_data_out (sw_228_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_228 (
        .io_in  (sw_228_module_data_in),
        .io_out (sw_228_module_data_out)
    );

    // [229] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_229_clk_out, sw_229_data_out, sw_229_scan_out, sw_229_latch_out;
    wire [7:0] sw_229_module_data_in;
    wire [7:0] sw_229_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_229 (
        .clk_in          (sw_228_clk_out),
        .data_in         (sw_228_data_out),
        .scan_select_in  (sw_228_scan_out),
        .latch_enable_in (sw_228_latch_out),
        .clk_out         (sw_229_clk_out),
        .data_out        (sw_229_data_out),
        .scan_select_out (sw_229_scan_out),
        .latch_enable_out(sw_229_latch_out),
        .module_data_in  (sw_229_module_data_in),
        .module_data_out (sw_229_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_229 (
        .io_in  (sw_229_module_data_in),
        .io_out (sw_229_module_data_out)
    );

    // [230] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_230_clk_out, sw_230_data_out, sw_230_scan_out, sw_230_latch_out;
    wire [7:0] sw_230_module_data_in;
    wire [7:0] sw_230_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_230 (
        .clk_in          (sw_229_clk_out),
        .data_in         (sw_229_data_out),
        .scan_select_in  (sw_229_scan_out),
        .latch_enable_in (sw_229_latch_out),
        .clk_out         (sw_230_clk_out),
        .data_out        (sw_230_data_out),
        .scan_select_out (sw_230_scan_out),
        .latch_enable_out(sw_230_latch_out),
        .module_data_in  (sw_230_module_data_in),
        .module_data_out (sw_230_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_230 (
        .io_in  (sw_230_module_data_in),
        .io_out (sw_230_module_data_out)
    );

    // [231] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_231_clk_out, sw_231_data_out, sw_231_scan_out, sw_231_latch_out;
    wire [7:0] sw_231_module_data_in;
    wire [7:0] sw_231_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_231 (
        .clk_in          (sw_230_clk_out),
        .data_in         (sw_230_data_out),
        .scan_select_in  (sw_230_scan_out),
        .latch_enable_in (sw_230_latch_out),
        .clk_out         (sw_231_clk_out),
        .data_out        (sw_231_data_out),
        .scan_select_out (sw_231_scan_out),
        .latch_enable_out(sw_231_latch_out),
        .module_data_in  (sw_231_module_data_in),
        .module_data_out (sw_231_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_231 (
        .io_in  (sw_231_module_data_in),
        .io_out (sw_231_module_data_out)
    );

    // [232] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_232_clk_out, sw_232_data_out, sw_232_scan_out, sw_232_latch_out;
    wire [7:0] sw_232_module_data_in;
    wire [7:0] sw_232_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_232 (
        .clk_in          (sw_231_clk_out),
        .data_in         (sw_231_data_out),
        .scan_select_in  (sw_231_scan_out),
        .latch_enable_in (sw_231_latch_out),
        .clk_out         (sw_232_clk_out),
        .data_out        (sw_232_data_out),
        .scan_select_out (sw_232_scan_out),
        .latch_enable_out(sw_232_latch_out),
        .module_data_in  (sw_232_module_data_in),
        .module_data_out (sw_232_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_232 (
        .io_in  (sw_232_module_data_in),
        .io_out (sw_232_module_data_out)
    );

    // [233] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_233_clk_out, sw_233_data_out, sw_233_scan_out, sw_233_latch_out;
    wire [7:0] sw_233_module_data_in;
    wire [7:0] sw_233_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_233 (
        .clk_in          (sw_232_clk_out),
        .data_in         (sw_232_data_out),
        .scan_select_in  (sw_232_scan_out),
        .latch_enable_in (sw_232_latch_out),
        .clk_out         (sw_233_clk_out),
        .data_out        (sw_233_data_out),
        .scan_select_out (sw_233_scan_out),
        .latch_enable_out(sw_233_latch_out),
        .module_data_in  (sw_233_module_data_in),
        .module_data_out (sw_233_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_233 (
        .io_in  (sw_233_module_data_in),
        .io_out (sw_233_module_data_out)
    );

    // [234] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_234_clk_out, sw_234_data_out, sw_234_scan_out, sw_234_latch_out;
    wire [7:0] sw_234_module_data_in;
    wire [7:0] sw_234_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_234 (
        .clk_in          (sw_233_clk_out),
        .data_in         (sw_233_data_out),
        .scan_select_in  (sw_233_scan_out),
        .latch_enable_in (sw_233_latch_out),
        .clk_out         (sw_234_clk_out),
        .data_out        (sw_234_data_out),
        .scan_select_out (sw_234_scan_out),
        .latch_enable_out(sw_234_latch_out),
        .module_data_in  (sw_234_module_data_in),
        .module_data_out (sw_234_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_234 (
        .io_in  (sw_234_module_data_in),
        .io_out (sw_234_module_data_out)
    );

    // [235] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_235_clk_out, sw_235_data_out, sw_235_scan_out, sw_235_latch_out;
    wire [7:0] sw_235_module_data_in;
    wire [7:0] sw_235_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_235 (
        .clk_in          (sw_234_clk_out),
        .data_in         (sw_234_data_out),
        .scan_select_in  (sw_234_scan_out),
        .latch_enable_in (sw_234_latch_out),
        .clk_out         (sw_235_clk_out),
        .data_out        (sw_235_data_out),
        .scan_select_out (sw_235_scan_out),
        .latch_enable_out(sw_235_latch_out),
        .module_data_in  (sw_235_module_data_in),
        .module_data_out (sw_235_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_235 (
        .io_in  (sw_235_module_data_in),
        .io_out (sw_235_module_data_out)
    );

    // [236] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_236_clk_out, sw_236_data_out, sw_236_scan_out, sw_236_latch_out;
    wire [7:0] sw_236_module_data_in;
    wire [7:0] sw_236_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_236 (
        .clk_in          (sw_235_clk_out),
        .data_in         (sw_235_data_out),
        .scan_select_in  (sw_235_scan_out),
        .latch_enable_in (sw_235_latch_out),
        .clk_out         (sw_236_clk_out),
        .data_out        (sw_236_data_out),
        .scan_select_out (sw_236_scan_out),
        .latch_enable_out(sw_236_latch_out),
        .module_data_in  (sw_236_module_data_in),
        .module_data_out (sw_236_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_236 (
        .io_in  (sw_236_module_data_in),
        .io_out (sw_236_module_data_out)
    );

    // [237] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_237_clk_out, sw_237_data_out, sw_237_scan_out, sw_237_latch_out;
    wire [7:0] sw_237_module_data_in;
    wire [7:0] sw_237_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_237 (
        .clk_in          (sw_236_clk_out),
        .data_in         (sw_236_data_out),
        .scan_select_in  (sw_236_scan_out),
        .latch_enable_in (sw_236_latch_out),
        .clk_out         (sw_237_clk_out),
        .data_out        (sw_237_data_out),
        .scan_select_out (sw_237_scan_out),
        .latch_enable_out(sw_237_latch_out),
        .module_data_in  (sw_237_module_data_in),
        .module_data_out (sw_237_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_237 (
        .io_in  (sw_237_module_data_in),
        .io_out (sw_237_module_data_out)
    );

    // [238] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_238_clk_out, sw_238_data_out, sw_238_scan_out, sw_238_latch_out;
    wire [7:0] sw_238_module_data_in;
    wire [7:0] sw_238_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_238 (
        .clk_in          (sw_237_clk_out),
        .data_in         (sw_237_data_out),
        .scan_select_in  (sw_237_scan_out),
        .latch_enable_in (sw_237_latch_out),
        .clk_out         (sw_238_clk_out),
        .data_out        (sw_238_data_out),
        .scan_select_out (sw_238_scan_out),
        .latch_enable_out(sw_238_latch_out),
        .module_data_in  (sw_238_module_data_in),
        .module_data_out (sw_238_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_238 (
        .io_in  (sw_238_module_data_in),
        .io_out (sw_238_module_data_out)
    );

    // [239] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_239_clk_out, sw_239_data_out, sw_239_scan_out, sw_239_latch_out;
    wire [7:0] sw_239_module_data_in;
    wire [7:0] sw_239_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_239 (
        .clk_in          (sw_238_clk_out),
        .data_in         (sw_238_data_out),
        .scan_select_in  (sw_238_scan_out),
        .latch_enable_in (sw_238_latch_out),
        .clk_out         (sw_239_clk_out),
        .data_out        (sw_239_data_out),
        .scan_select_out (sw_239_scan_out),
        .latch_enable_out(sw_239_latch_out),
        .module_data_in  (sw_239_module_data_in),
        .module_data_out (sw_239_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_239 (
        .io_in  (sw_239_module_data_in),
        .io_out (sw_239_module_data_out)
    );

    // [240] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_240_clk_out, sw_240_data_out, sw_240_scan_out, sw_240_latch_out;
    wire [7:0] sw_240_module_data_in;
    wire [7:0] sw_240_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_240 (
        .clk_in          (sw_239_clk_out),
        .data_in         (sw_239_data_out),
        .scan_select_in  (sw_239_scan_out),
        .latch_enable_in (sw_239_latch_out),
        .clk_out         (sw_240_clk_out),
        .data_out        (sw_240_data_out),
        .scan_select_out (sw_240_scan_out),
        .latch_enable_out(sw_240_latch_out),
        .module_data_in  (sw_240_module_data_in),
        .module_data_out (sw_240_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_240 (
        .io_in  (sw_240_module_data_in),
        .io_out (sw_240_module_data_out)
    );

    // [241] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_241_clk_out, sw_241_data_out, sw_241_scan_out, sw_241_latch_out;
    wire [7:0] sw_241_module_data_in;
    wire [7:0] sw_241_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_241 (
        .clk_in          (sw_240_clk_out),
        .data_in         (sw_240_data_out),
        .scan_select_in  (sw_240_scan_out),
        .latch_enable_in (sw_240_latch_out),
        .clk_out         (sw_241_clk_out),
        .data_out        (sw_241_data_out),
        .scan_select_out (sw_241_scan_out),
        .latch_enable_out(sw_241_latch_out),
        .module_data_in  (sw_241_module_data_in),
        .module_data_out (sw_241_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_241 (
        .io_in  (sw_241_module_data_in),
        .io_out (sw_241_module_data_out)
    );

    // [242] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_242_clk_out, sw_242_data_out, sw_242_scan_out, sw_242_latch_out;
    wire [7:0] sw_242_module_data_in;
    wire [7:0] sw_242_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_242 (
        .clk_in          (sw_241_clk_out),
        .data_in         (sw_241_data_out),
        .scan_select_in  (sw_241_scan_out),
        .latch_enable_in (sw_241_latch_out),
        .clk_out         (sw_242_clk_out),
        .data_out        (sw_242_data_out),
        .scan_select_out (sw_242_scan_out),
        .latch_enable_out(sw_242_latch_out),
        .module_data_in  (sw_242_module_data_in),
        .module_data_out (sw_242_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_242 (
        .io_in  (sw_242_module_data_in),
        .io_out (sw_242_module_data_out)
    );

    // [243] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_243_clk_out, sw_243_data_out, sw_243_scan_out, sw_243_latch_out;
    wire [7:0] sw_243_module_data_in;
    wire [7:0] sw_243_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_243 (
        .clk_in          (sw_242_clk_out),
        .data_in         (sw_242_data_out),
        .scan_select_in  (sw_242_scan_out),
        .latch_enable_in (sw_242_latch_out),
        .clk_out         (sw_243_clk_out),
        .data_out        (sw_243_data_out),
        .scan_select_out (sw_243_scan_out),
        .latch_enable_out(sw_243_latch_out),
        .module_data_in  (sw_243_module_data_in),
        .module_data_out (sw_243_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_243 (
        .io_in  (sw_243_module_data_in),
        .io_out (sw_243_module_data_out)
    );

    // [244] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_244_clk_out, sw_244_data_out, sw_244_scan_out, sw_244_latch_out;
    wire [7:0] sw_244_module_data_in;
    wire [7:0] sw_244_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_244 (
        .clk_in          (sw_243_clk_out),
        .data_in         (sw_243_data_out),
        .scan_select_in  (sw_243_scan_out),
        .latch_enable_in (sw_243_latch_out),
        .clk_out         (sw_244_clk_out),
        .data_out        (sw_244_data_out),
        .scan_select_out (sw_244_scan_out),
        .latch_enable_out(sw_244_latch_out),
        .module_data_in  (sw_244_module_data_in),
        .module_data_out (sw_244_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_244 (
        .io_in  (sw_244_module_data_in),
        .io_out (sw_244_module_data_out)
    );

    // [245] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_245_clk_out, sw_245_data_out, sw_245_scan_out, sw_245_latch_out;
    wire [7:0] sw_245_module_data_in;
    wire [7:0] sw_245_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_245 (
        .clk_in          (sw_244_clk_out),
        .data_in         (sw_244_data_out),
        .scan_select_in  (sw_244_scan_out),
        .latch_enable_in (sw_244_latch_out),
        .clk_out         (sw_245_clk_out),
        .data_out        (sw_245_data_out),
        .scan_select_out (sw_245_scan_out),
        .latch_enable_out(sw_245_latch_out),
        .module_data_in  (sw_245_module_data_in),
        .module_data_out (sw_245_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_245 (
        .io_in  (sw_245_module_data_in),
        .io_out (sw_245_module_data_out)
    );

    // [246] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_246_clk_out, sw_246_data_out, sw_246_scan_out, sw_246_latch_out;
    wire [7:0] sw_246_module_data_in;
    wire [7:0] sw_246_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_246 (
        .clk_in          (sw_245_clk_out),
        .data_in         (sw_245_data_out),
        .scan_select_in  (sw_245_scan_out),
        .latch_enable_in (sw_245_latch_out),
        .clk_out         (sw_246_clk_out),
        .data_out        (sw_246_data_out),
        .scan_select_out (sw_246_scan_out),
        .latch_enable_out(sw_246_latch_out),
        .module_data_in  (sw_246_module_data_in),
        .module_data_out (sw_246_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_246 (
        .io_in  (sw_246_module_data_in),
        .io_out (sw_246_module_data_out)
    );

    // [247] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_247_clk_out, sw_247_data_out, sw_247_scan_out, sw_247_latch_out;
    wire [7:0] sw_247_module_data_in;
    wire [7:0] sw_247_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_247 (
        .clk_in          (sw_246_clk_out),
        .data_in         (sw_246_data_out),
        .scan_select_in  (sw_246_scan_out),
        .latch_enable_in (sw_246_latch_out),
        .clk_out         (sw_247_clk_out),
        .data_out        (sw_247_data_out),
        .scan_select_out (sw_247_scan_out),
        .latch_enable_out(sw_247_latch_out),
        .module_data_in  (sw_247_module_data_in),
        .module_data_out (sw_247_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_247 (
        .io_in  (sw_247_module_data_in),
        .io_out (sw_247_module_data_out)
    );

    // [248] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_248_clk_out, sw_248_data_out, sw_248_scan_out, sw_248_latch_out;
    wire [7:0] sw_248_module_data_in;
    wire [7:0] sw_248_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_248 (
        .clk_in          (sw_247_clk_out),
        .data_in         (sw_247_data_out),
        .scan_select_in  (sw_247_scan_out),
        .latch_enable_in (sw_247_latch_out),
        .clk_out         (sw_248_clk_out),
        .data_out        (sw_248_data_out),
        .scan_select_out (sw_248_scan_out),
        .latch_enable_out(sw_248_latch_out),
        .module_data_in  (sw_248_module_data_in),
        .module_data_out (sw_248_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_248 (
        .io_in  (sw_248_module_data_in),
        .io_out (sw_248_module_data_out)
    );

    // [249] https://github.com/TinyTapeout/tt03-test-invert
    wire sw_249_clk_out, sw_249_data_out, sw_249_scan_out, sw_249_latch_out;
    wire [7:0] sw_249_module_data_in;
    wire [7:0] sw_249_module_data_out;
    scanchain #(.NUM_IOS(8)) scanchain_249 (
        .clk_in          (sw_248_clk_out),
        .data_in         (sw_248_data_out),
        .scan_select_in  (sw_248_scan_out),
        .latch_enable_in (sw_248_latch_out),
        .clk_out         (sw_249_clk_out),
        .data_out        (sw_249_data_out),
        .scan_select_out (sw_249_scan_out),
        .latch_enable_out(sw_249_latch_out),
        .module_data_in  (sw_249_module_data_in),
        .module_data_out (sw_249_module_data_out)
    );

    user_module_361728533238569985 user_module_361728533238569985_249 (
        .io_in  (sw_249_module_data_in),
        .io_out (sw_249_module_data_out)
    );

    // Connect final signals back to the scan controller
    assign sc_clk_in  = sw_249_clk_out;
    assign sc_data_in = sw_249_data_out;

    // end of module instantiation

endmodule	// user_project_wrapper
`default_nettype wire

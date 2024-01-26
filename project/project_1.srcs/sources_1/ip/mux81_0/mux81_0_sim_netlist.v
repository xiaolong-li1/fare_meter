// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 31 20:45:06 2023
// Host        : Student0051 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/admin/srbj/srbj.srcs/sources_1/ip/mux81_0/mux81_0_sim_netlist.v
// Design      : mux81_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mux81_0,mux81,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "mux81,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module mux81_0
   (out,
    i0,
    i1,
    i2,
    i3,
    i4,
    i5,
    i6,
    i7,
    A,
    B,
    C);
  output out;
  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input A;
  input B;
  input C;

  wire A;
  wire B;
  wire C;
  wire i0;
  wire i1;
  wire i2;
  wire i3;
  wire i4;
  wire i5;
  wire i6;
  wire i7;
  wire out;

  mux81_0_mux81 inst
       (.A(A),
        .B(B),
        .C(C),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .out(out));
endmodule

(* ORIG_REF_NAME = "mux81" *) 
module mux81_0_mux81
   (out,
    A,
    i3,
    i2,
    B,
    i1,
    C,
    i0,
    i7,
    i6,
    i5,
    i4);
  output out;
  input A;
  input i3;
  input i2;
  input B;
  input i1;
  input C;
  input i0;
  input i7;
  input i6;
  input i5;
  input i4;

  wire A;
  wire B;
  wire C;
  wire i0;
  wire i1;
  wire i2;
  wire i3;
  wire i4;
  wire i5;
  wire i6;
  wire i7;
  wire out;
  wire out_INST_0_i_1_n_0;
  wire out_INST_0_i_2_n_0;

  MUXF7 out_INST_0
       (.I0(out_INST_0_i_1_n_0),
        .I1(out_INST_0_i_2_n_0),
        .O(out),
        .S(A));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    out_INST_0_i_1
       (.I0(i3),
        .I1(i2),
        .I2(B),
        .I3(i1),
        .I4(C),
        .I5(i0),
        .O(out_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    out_INST_0_i_2
       (.I0(i7),
        .I1(i6),
        .I2(B),
        .I3(i5),
        .I4(C),
        .I5(i4),
        .O(out_INST_0_i_2_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 31 20:45:06 2023
// Host        : Student0051 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub c:/Users/admin/srbj/srbj.srcs/sources_1/ip/mux81_0/mux81_0_stub.v
// Design      : mux81_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mux81,Vivado 2019.2" *)
module mux81_0(out, i0, i1, i2, i3, i4, i5, i6, i7, A, B, C)
/* synthesis syn_black_box black_box_pad_pin="out,i0,i1,i2,i3,i4,i5,i6,i7,A,B,C" */;
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
endmodule

-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 31 20:45:06 2023
-- Host        : Student0051 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub c:/Users/admin/srbj/srbj.srcs/sources_1/ip/mux81_0/mux81_0_stub.vhdl
-- Design      : mux81_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux81_0 is
  Port ( 
    \out\ : out STD_LOGIC;
    i0 : in STD_LOGIC;
    i1 : in STD_LOGIC;
    i2 : in STD_LOGIC;
    i3 : in STD_LOGIC;
    i4 : in STD_LOGIC;
    i5 : in STD_LOGIC;
    i6 : in STD_LOGIC;
    i7 : in STD_LOGIC;
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    C : in STD_LOGIC
  );

end mux81_0;

architecture stub of mux81_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "\out\,i0,i1,i2,i3,i4,i5,i6,i7,A,B,C";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mux81,Vivado 2019.2";
begin
end;

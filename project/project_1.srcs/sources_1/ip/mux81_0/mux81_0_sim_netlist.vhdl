-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Oct 31 20:45:06 2023
-- Host        : Student0051 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/admin/srbj/srbj.srcs/sources_1/ip/mux81_0/mux81_0_sim_netlist.vhdl
-- Design      : mux81_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux81_0_mux81 is
  port (
    \out\ : out STD_LOGIC;
    A : in STD_LOGIC;
    i3 : in STD_LOGIC;
    i2 : in STD_LOGIC;
    B : in STD_LOGIC;
    i1 : in STD_LOGIC;
    C : in STD_LOGIC;
    i0 : in STD_LOGIC;
    i7 : in STD_LOGIC;
    i6 : in STD_LOGIC;
    i5 : in STD_LOGIC;
    i4 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mux81_0_mux81 : entity is "mux81";
end mux81_0_mux81;

architecture STRUCTURE of mux81_0_mux81 is
  signal out_INST_0_i_1_n_0 : STD_LOGIC;
  signal out_INST_0_i_2_n_0 : STD_LOGIC;
begin
out_INST_0: unisim.vcomponents.MUXF7
     port map (
      I0 => out_INST_0_i_1_n_0,
      I1 => out_INST_0_i_2_n_0,
      O => \out\,
      S => A
    );
out_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => i3,
      I1 => i2,
      I2 => B,
      I3 => i1,
      I4 => C,
      I5 => i0,
      O => out_INST_0_i_1_n_0
    );
out_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => i7,
      I1 => i6,
      I2 => B,
      I3 => i5,
      I4 => C,
      I5 => i4,
      O => out_INST_0_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux81_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mux81_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mux81_0 : entity is "mux81_0,mux81,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of mux81_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of mux81_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of mux81_0 : entity is "mux81,Vivado 2019.2";
end mux81_0;

architecture STRUCTURE of mux81_0 is
begin
inst: entity work.mux81_0_mux81
     port map (
      A => A,
      B => B,
      C => C,
      i0 => i0,
      i1 => i1,
      i2 => i2,
      i3 => i3,
      i4 => i4,
      i5 => i5,
      i6 => i6,
      i7 => i7,
      \out\ => \out\
    );
end STRUCTURE;

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/31 20:31:59
// Design Name: 
// Module Name: mux81
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux81(
    output out,
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    input i5,
    input i6,
    input i7,
    input A,
    input B,
    input C
    );
    reg out;
    always @(A or B or C or i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7)
        begin
            case({A,B,C})
            3'b000: out = i0;
            3'b001: out = i1;
            3'b010: out = i2;
            3'b011: out = i3;
            3'b100: out = i4;
            3'b101: out = i5;
            3'b110: out = i6;
            3'b111: out = i7;
            endcase
       end
endmodule

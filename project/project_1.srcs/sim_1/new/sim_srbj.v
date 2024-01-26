`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/31 20:56:50
// Design Name: 
// Module Name: sim_srbj
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


module sim_srbj(

    );
    reg A,B,C;
    wire f;
    srbj f1(A,B,C,f);
    initial
        begin
         A = 0; B = 0; C = 0;
        end
    always #10 {A,B,C} = {A,B,C} + 1;
    
endmodule

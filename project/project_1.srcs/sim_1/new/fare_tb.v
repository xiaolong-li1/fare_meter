`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 19:48:55
// Design Name: 
// Module Name: fare_tb
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


module fare_tb;
    reg clk0;
    reg hand_clk;       // 价格增加时钟
    reg run;           // 计价模式控制
    reg reset;          // reset为1则全部清0
    reg [1:0] control;  // 选择模式
    reg [2:0] enable;
    wire [31:0] data;      // 输出数据用于连接数码管



 fare_meter fare(
    .clk0(clk0),          // 初始时钟
    .hand_clk(hand_clk),       // 价格增加时钟
    .run(run),            // 计价模式控制
    .reset(reset),          // reset为1则全部清0
    .control(control),  // 选择模式
    .enable(enable),
    .data(data)      // 输出数据用于连接数码管
);


  always begin  
    #1 clk0 = ~clk0;  
  end  
  // 问题
  // 
  // 
  initial begin
//    data = 32'b0;
    clk0 = 0;
    run = 0;
    reset = 0;
    hand_clk = 0;
    enable = 111;
    control = 11;
    #1 reset = 1; #1 reset = 0;
    #2 enable = 001;control = 10;  // 可以确定mode=00后第一个上升沿置0，reset只要为1就置0
    #1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;
    #1 control = 00; #2 control = 10;
    #1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;
    #1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;
    #5 enable = 010; control = 10;
    #1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;
    #1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;#1 hand_clk = 1;#1 hand_clk = 0;
    #2 enable = 100; control = 00; control = 10; 
    #1 run = 1; 
//    #300 control = 00; #1 control = 10;
    #1000 run = 0;
    #100
    $finish; 
  end  
endmodule

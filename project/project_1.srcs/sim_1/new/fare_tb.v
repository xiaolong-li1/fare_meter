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
    reg hand_clk;       // �۸�����ʱ��
    reg run;           // �Ƽ�ģʽ����
    reg reset;          // resetΪ1��ȫ����0
    reg [1:0] control;  // ѡ��ģʽ
    reg [2:0] enable;
    wire [31:0] data;      // ��������������������



 fare_meter fare(
    .clk0(clk0),          // ��ʼʱ��
    .hand_clk(hand_clk),       // �۸�����ʱ��
    .run(run),            // �Ƽ�ģʽ����
    .reset(reset),          // resetΪ1��ȫ����0
    .control(control),  // ѡ��ģʽ
    .enable(enable),
    .data(data)      // ��������������������
);


  always begin  
    #1 clk0 = ~clk0;  
  end  
  // ����
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
    #2 enable = 001;control = 10;  // ����ȷ��mode=00���һ����������0��resetֻҪΪ1����0
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

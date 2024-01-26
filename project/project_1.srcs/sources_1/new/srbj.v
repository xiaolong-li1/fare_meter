`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2023/11/11 15:24:11
//// Design Name: 
//// Module Name: fare_meter
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module whole_work(
    input wire clk0,           // ��ʼʱ��
    input wire hand_op,       // �۸�����ʱ��
    input wire run,            // �Ƽ�ģʽ����
    input wire reset,          // resetΪ1��ȫ����0
    input wire [1:0] control,  // ѡ��ģʽ
    input wire [2:0] enable,
    output[7:0] seg,//��ѡ������Ч
    output[7:0] seg1,
    output[7:0] an); //λѡ������Ч
    
    
    wire[31:0] data;
    fare_meter f1(    
    clk0,           // ��ʼʱ��
     hand_op,       // �۸�����ʱ��
     run,            // �Ƽ�ģʽ����
    reset,          // resetΪ1��ȫ����0
     control,  // ѡ��ģʽ
    enable,
    data);    // ��������������������
    v_smg_1(clk0,
    data,
    seg,
    seg1,
    an);
    
    
   endmodule
module fare_meter(
    input wire clk0,           // ��ʼʱ��
    input wire hand_op,       // �۸�����ʱ��
    input wire run,            // �Ƽ�ģʽ����
    input wire reset,          // resetΪ1��ȫ����0
    input wire [1:0] control,  // ѡ��ģʽ
    input wire [2:0] enable,
    output reg[31:0] data      // ��������������������
);

// ʱ�ӷ�Ƶģ�⹫��������͵ȴ�ʱ�������
reg [25:0] km_counter;
reg [25:0] wait_counter;
reg  km_add1;      // km_add1Ϊ1���һ��km_price��������Ϊ0
reg  wait_add1;   //  wait_add1Ϊ1���һ��wait_price��������Ϊ0
reg  count_clk; //��Ϊclk0����ͬʱ��������������������ֵ
reg  clk_2; //��Ƶ�ģ��õ�Ƶ�ʽ�����²���
  reg clk;   
  // ģ���ܼۼ��� (100)
  reg [1:0] mode3;
  reg [1:0] mode4;
  wire [31:0] price_data;
  wire [31:0] people_counter;
  reg reset4;
  reg reset3;
  Decimal_Counter total_price (  
    .clk(clk),  
    .mode(mode3),  
    .reset(reset3),              
    .data(price_data)  
  ); 
  Decimal_Counter total_people (  
    .clk(clk_hand),  
    .mode(mode4),  
    .reset(reset4),              
    .data(people_counter)  
  ); 
// lxl-change
//always @(posedge clk0) begin
//clk_2=~clk_2;
//end
reg clk_hand;
always @(posedge clk0) begin
clk_2=~clk_2;//lxl-add
clk_hand=hand_op;//lxl-add

    if(reset) begin
        reset1 <= 1'b1;
        reset2 <= 1'b1;
        reset3 <= 1'b1;
        reset4 <= 1'b1;
    end
    // enable Ϊ��ǰ���κ�һ��״̬��
    if(enable == 3'b001) begin
        mode2 = 2'b11;
        mode3 = 2'b11;
        mode4 = 2'b11;        
    end
    else if(enable == 3'b010) begin
        mode1 = 2'b11;
        mode3 = 2'b11;
        mode4 = 2'b11;
    end
    else if(enable == 3'b100) begin
        mode1 = 2'b11;
        mode2 = 2'b11;
        mode4 = 2'b11;
    end
    else if(enable == 3'b111) begin
        mode1 = 2'b11;
        mode2 = 2'b11;
        mode3 = 2'b11;
    end
    // enable�����κ�һ��״̬�򱣳ֲ���->״̬�л��Ĺ�����
    else begin
        mode1 = 2'b11;
        mode2 = 2'b11;
        mode3 = 2'b11;
        mode4=  2'b11;
    end
    // ר���޸�->�Ѷ��������������޸Ķ���д����������
    case(enable)
        //   enable == 001 �����ʹ���ֶ�ʱ�������ӻ����
        3'b111: begin
            case(control)
                2'b10:begin
                    mode4 = 2'b10;
                    reset4 <= 1'b0;
                end
                2'b01:begin
                    mode4 = 2'b01;
                    reset4 <= 1'b0;
                end
                2'b00:begin 
                    mode4 = 2'b00;
                    reset4 = 1;
                end
            endcase
        end
        3'b001: begin
            case(control)
                2'b10:begin
                    mode1 = 2'b10;
                    reset1 <= 1'b0;
                end
                2'b01:begin
                    mode1 = 2'b01;
                    reset1 <= 1'b0;
                end
                2'b00:begin 
                    mode1 = 2'b00;
                    reset1 = 1;
                end
            endcase
        end
        3'b010: begin
            case(control)
                2'b10:begin
                    mode2 = 2'b10;
                    reset2 <= 1'b0;
                end
                2'b01:begin
                    mode2 = 2'b01;
                    reset2 <= 1'b0;
                end
                2'b00:begin 
                    mode2 = 2'b00;
                    reset2 <= 1'b1;
                end
            endcase
        end
        3'b100: begin
            case(control)
                2'b10:begin
                    mode3 = 2'b10;
                    reset3 <= 1'b0;
                end
                2'b01:begin
                    mode3 = 2'b01;
                    reset3 <= 1'b0;
                end
                2'b00:begin 
                    mode3 = 2'b00;
                    reset3 <= 1'b1;
                end
            endcase
        end          
    endcase//lxl-add
    
    
if(reset3 == 1) begin
//      count_clk<=0;
//      clk_2<=0;
//      clk <= 0;
//      reset0 <= 1'b1;
    end
    if(km_add1 > 0 ) begin
        if(add_data == km_data) begin
            km_add1 <= 1'b0;  // test real wait_add1 - 2
            reset0 <= 1'b1;
        end
        else begin
            reset0 <= 1'b0;
            mode0 = 2'b10;              
            count_clk=count_clk+1;
            clk=count_clk;
        end
    end
    else if(wait_add1 > 0 ) begin
        if(add_data == wait_data) begin
            wait_add1 <= 1'b0; 
            reset0 <= 1'b1;
        end
        else begin
            reset0 <= 1'b0;
            mode0 = 2'b10;
            count_clk=count_clk+1;
            clk=count_clk;
        end
    end
    else begin
        reset0 <= 1'b1;
        mode0 <= 2'b00;
    end//lxl-add
    
    
    
  if(reset3 == 1'b1) begin
      count_clk<=0;
      clk_2<=0;
      km_counter <= 26'b0;
      km_add1 <= 1'b0;
      wait_counter <= 25'b0;
      wait_add1 <= 1'b0;
  end  
  if(enable == 3'b100 && control == 2'b10) begin
        case(run)
        1'b1: begin
          if (km_counter == 26'b10111110101111000010000000) begin            // real 11111111111111111111111111
            km_counter <= 26'b0;
            km_add1 <= 1'b1;    // ����Ϊ1'b1 Ȼ��һ���Լ�����  
          end
          else begin
            km_counter <= km_counter + 1; // ��������1
          end
        end
        1'b0: begin
          if (wait_counter == 26'b10111110101111000010000000) begin         // real 1111111111111111111111111
            wait_counter <= 26'b0;
            wait_add1 <= 1'b1;
          end
          else begin
            wait_counter <= wait_counter + 1; // ��������1
          end
       end
      endcase
  end

  // mode 00 ��0  -  10 ������  -  01  ������  -  11  ����  
  // ģ�⹫��۸���� ��001��
  end
  reg [1:0] mode1;
  wire [31:0] km_data;
  reg reset1;
  Decimal_Counter km_price (  
    .clk(clk_hand),  
    .mode(mode1), 
    .reset(reset1),             
    .data(km_data)  
  );  
  
    // ģ��ȴ��ۼ��� (010)
  reg [1:0] mode2;
  wire [31:0] wait_data;
  reg reset2;
  Decimal_Counter wait_price (  
    .clk(clk_hand),  
    .mode(mode2),   
    .reset(reset2),             
    .data(wait_data)  
  ); 
  
  // �������������Ӽ�Ǯ
  reg [1:0] mode0;
  wire [31:0] add_data;
  reg reset0;
  Decimal_Counter add_sim (  
    .clk(clk_2),  
    .mode(mode0), 
    .reset(reset0),               
    .data(add_data)  
  );  
//always  @(posedge clk0) begin
//    if(reset3 == 1) begin
////      count_clk<=0;
////      clk_2<=0;
////      clk <= 0;
////      reset0 <= 1'b1;
//    end
//    if(km_add1 > 0 ) begin
//        if(add_data == km_data) begin
//            km_add1 <= 1'b0;  // test real wait_add1 - 2
//            reset0 <= 1'b1;
//        end
//        else begin
//            reset0 <= 1'b0;
//            mode0 = 2'b10;              
//            count_clk=count_clk+1;
//            clk=count_clk;
//        end
//    end
//    else if(wait_add1 > 0 ) begin
//        if(add_data == wait_data) begin
//            wait_add1 <= 1'b0; 
//            reset0 <= 1'b1;
//        end
//        else begin
//            reset0 <= 1'b0;
//            mode0 = 2'b10;
//            count_clk=count_clk+1;
//            clk=count_clk;
//        end
//    end
//    else begin
//        reset0 <= 1'b1;
//        mode0 <= 2'b00;
//    end
//end

//always @(posedge clk0) begin
//    // resetΪ1��ȫ����0���ᰴť
//    if(reset) begin
//        reset1 <= 1'b1;
//        reset2 <= 1'b1;
//        reset3 <= 1'b1;
//    end
//    // enable Ϊ��ǰ���κ�һ��״̬��
//    if(enable == 3'b001) begin
//        mode2 = 2'b11;
//        mode3 = 2'b11;
//    end
//    else if(enable == 3'b010) begin
//        mode1 = 2'b11;
//        mode3 = 2'b11;
//    end
//    else if(enable == 3'b100) begin
//        mode1 = 2'b11;
//        mode2 = 2'b11;
//    end
//    // enable�����κ�һ��״̬�򱣳ֲ���->״̬�л��Ĺ�����
//    else begin
//        mode1 = 2'b11;
//        mode2 = 2'b11;
//        mode3 = 2'b11;
//    end
//    // ר���޸�->�Ѷ��������������޸Ķ���д����������
//    case(enable)
//        //   enable == 001 �����ʹ���ֶ�ʱ�������ӻ����
//        3'b001: begin
//            case(control)
//                2'b10:begin
//                    mode1 = 2'b10;
//                    reset1 <= 1'b0;
//                end
//                2'b01:begin
//                    mode1 = 2'b01;
//                    reset1 <= 1'b0;
//                end
//                2'b00:begin 
//                    mode1 = 2'b00;
//                    reset1 = 1;
//                end
//            endcase
//        end
//        3'b010: begin
//            case(control)
//                2'b10:begin
//                    mode2 = 2'b10;
//                    reset2 <= 1'b0;
//                end
//                2'b01:begin
//                    mode2 = 2'b01;
//                    reset2 <= 1'b0;
//                end
//                2'b00:begin 
//                    mode2 = 2'b00;
//                    reset2 <= 1'b1;
//                end
//            endcase
//        end
//        3'b100: begin
//            case(control)
//                2'b10:begin
//                    mode3 = 2'b10;
//                    reset3 <= 1'b0;
//                end
//                2'b01:begin
//                    mode3 = 2'b01;
//                    reset3 <= 1'b0;
//                end
//                2'b00:begin 
//                    mode3 = 2'b00;
//                    reset3 <= 1'b1;
//                end
//            endcase
//        end          
//    endcase
// end

always @ (enable or km_data or wait_data or price_data )
begin
    case(enable)
        3'b001: data = km_data;
        3'b010: data = wait_data;
        3'b100: data = price_data;
        3'b111: data = people_counter;        
        default: data = 32'b0; // Ĭ����������0
    endcase
end


endmodule



// //  //  //  //  //  //  //  //  //  //  //
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/06 10:49:28
// Design Name: 
// Module Name: Decimal_Counter
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



//module fare_meter(
//    input wire clk0,           // ��ʼʱ��
//    input wire hand_clk,       // �۸�����ʱ��
//    input wire run,            // �Ƽ�ģʽ����
//    input wire reset,          // resetΪ1��ȫ����0
//    input wire [1:0] control,  // ѡ��ģʽ
//    input wire [2:0] enable,
//    output reg[31:0] data      // ��������������������
//);

//// ʱ�ӷ�Ƶģ�⹫��������͵ȴ�ʱ�������
//reg [25:0] km_counter;
//reg [24:0] wait_counter;
//reg  km_add1;      // km_add1Ϊ1���һ��km_price��������Ϊ0
//reg  wait_add1;   //  wait_add1Ϊ1���һ��wait_price��������Ϊ0
//reg  count_clk; //��Ϊclk0����ͬʱ��������������������ֵ
//reg  clk_2; //��Ƶ�ģ��õ�Ƶ�ʽ�����²���
//reg clk;   
//// ģ���ܼۼ��� (100)
//reg [1:0] mode3;
//wire [31:0] price_data;
//reg reset3;
//Decimal_Counter total_price (  
//    .clk(clk),  
//    .mode(mode3),  
//    .reset(reset3),              
//    .data(price_data)  
//); 

//// mode 00 ��0  -  10 ������  -  01  ������  -  11  ����  
//// ģ�⹫��۸���� ��001��
//reg [1:0] mode1;
//wire [31:0] km_data;
//reg reset1;
//Decimal_Counter km_price (  
//    .clk(hand_clk),  
//    .mode(mode1), 
//    .reset(reset1),             
//    .data(km_data)  
//);  
  
//// ģ��ȴ��ۼ��� (010)
//reg [1:0] mode2;
//wire [31:0] wait_data;
//reg reset2;
//Decimal_Counter wait_price (  
//    .clk(hand_clk),  
//    .mode(mode2),   
//    .reset(reset2),             
//    .data(wait_data)  
//); 
  
//// �������������Ӽ�Ǯ
//reg [1:0] mode0;
//wire [31:0] add_data;
//reg reset0;
//Decimal_Counter add_sim (  
//    .clk(clk_2),  
//    .mode(mode0), 
//    .reset(reset0),               
//    .data(add_data)  
//);  

//always  @(posedge clk0) begin
//    if(reset == 1) begin
//      count_clk<=0;
//      clk_2<=0;
//      clk <= 0;
//      reset0 <= 1'b1;
//      reset1 <= 1'b1;
//      reset2 <= 1'b1;
//      reset3 <= 1'b1;
//      km_counter <= 26'b0;
//      km_add1 <= 1'b0;
//      wait_counter <= 25'b0;
//      wait_add1 <= 1'b0;
//    end  
//    else begin
//      clk_2=~clk_2;
//      if(enable == 3'b100 && control == 2'b10) begin
//        case(run)
//        1'b1: begin
//          if (km_counter == 26'b00000000000000000000111111) begin            // real 11111111111111111111111111
//            km_counter <= 26'b0;
//            km_add1 <= 1'b1;    // ����Ϊ1'b1 Ȼ��һ���Լ�����  
//          end
//          else begin
//            km_counter <= km_counter + 1; // ��������1
//          end
//        end
//        1'b0: begin
//          if (wait_counter == 25'b0000000000000000000011111) begin         // real 1111111111111111111111111
//            wait_counter <= 25'b0;
//            wait_add1 <= 1'b1;
//          end
//          else begin
//            wait_counter <= wait_counter + 1; // ��������1
//          end
//       end
//      endcase
//      end
//      if(km_add1 > 0 ) begin
//        if(add_data == km_data) begin
//            km_add1 <= 1'b0;  // test real wait_add1 - 2
//            reset0 <= 1'b1;
//        end
//        else begin
//            reset0 <= 1'b0;
//            mode0 = 2'b10;              
//            count_clk=count_clk+1;
//            clk=count_clk;
//        end
//      end
//      else if(wait_add1 > 0 ) begin
//        if(add_data == wait_data) begin
//            wait_add1 <= 1'b0; 
//            reset0 <= 1'b1;
//        end
//        else begin
//            reset0 <= 1'b0;
//            mode0 = 2'b10;
//            count_clk=count_clk+1;
//            clk=count_clk;
//        end
//      end
//      else begin
//        reset0 <= 1'b1;
//        mode0 <= 2'b00;
//      end
//    end
//end

//always @(posedge clk0) begin
//    // enable Ϊ��ǰ���κ�һ��״̬��
//    if(enable == 3'b001) begin
//        mode2 = 2'b11;
//        mode3 = 2'b11;
//    end
//    else if(enable == 3'b010) begin
//        mode1 = 2'b11;
//        mode3 = 2'b11;
//    end
//    else if(enable == 3'b100) begin
//        mode1 = 2'b11;
//        mode2 = 2'b11;
//    end
//    // enable�����κ�һ��״̬�򱣳ֲ���->״̬�л��Ĺ�����
//    else begin
//        mode1 = 2'b11;
//        mode2 = 2'b11;
//        mode3 = 2'b11;
//    end
//end

//always @ (enable or km_data or wait_data or price_data )
//begin
//    case(enable)
//        3'b001: data = km_data;
//        3'b010: data = wait_data;
//        3'b100: data = price_data;
//        default: data = 32'b0; // Ĭ����������0
//    endcase
//end


//endmodule




//////////////////////////////////////////////////////////////////////////////////////////////////

module Decimal_Counter(
  input wire clk,                 // ʱ���ź�
  input wire [1:0] mode,           // �Ӽ���������ź�
  input wire reset,
  output wire [31:0] data
 );
 
 wire clk1, clk2, clk3, clk4, clk5, clk6, clk7;


  // ʵ����8��mode10ģ��
  mode10_IP_0 count0 (
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .count(data[3:0]),
    .newclk(clk1)
  );
  
  
    mode10_IP_0 count1 (
    .clk(clk1),
    .reset(reset),
    .mode(mode),
    .count(data[7:4]),
    .newclk(clk2)
  );
  

  
    mode10_IP_0 count2 (
    .clk(clk2),
    .reset(reset),
    .mode(mode),
    .count(data[11:8]),
    .newclk(clk3)
  );
  

  
     mode10_IP_0 count3 (
    .clk(clk3),
    .reset(reset),
    .mode(mode),
    .count(data[15:12]),
    .newclk(clk4)
  );
  
  
      mode10_IP_0 count4 (
    .clk(clk4),
    .reset(reset),
    .mode(mode),
    .count(data[19:16]),
    .newclk(clk5)
  );



      mode10_IP_0 count5 (
    .clk(clk5),
    .reset(reset),
    .mode(mode),
    .count(data[23:20]),
    .newclk(clk6)
  );
  


  
    mode10_IP_0 count6 (
    .clk(clk6),
    .reset(reset),
    .mode(mode),
    .count(data[27:24]),
    .newclk(clk7)
  );
  

  
    mode10_IP_0 count7 (
    .clk(clk7),
    .reset(reset),
    .mode(mode),
    .count(data[31:28]),
    .newclk(clk8)
  );
  

  
endmodule
module mode10_IP_0 (    
  input wire clk,                 // ʱ���ź�    
  input wire reset,               // ��λ�ź�    
  input wire [1:0] mode,           // �Ӽ���������ź�    
  output reg [3:0] count,          // ���������    
  output reg newclk    
);    
  
    // always����������ʱ���߼�����Ҫ��posedge�¼�����ʱִ��  
    always @(posedge clk or posedge reset) begin   // clk���һ���������ź�    
        if (reset) begin    
            // ��λʱ������������  
            count <= 4'b0000;            
            newclk <= 1'b0;     
        end    
        else begin    
            case(mode)  
                2'b10: begin           // �Ӽ�����״̬    
                    if (count == 4'b1001) begin      // 1001 == 9(10)    
                        count <= 4'b0000;              // ���һ��ѭ����������������    
                        newclk <= 1'b1;    
                    end    
                    else begin    
                        // ��1  
                        count <= count + 1;              
                        newclk <= 1'b0;  
                    end              
                end    
                2'b01: begin       // ��������״̬    
                    if (count == 4'b0000) begin    
                        count <= 4'b1001;             
                        newclk <= 1'b1;    
                    end    
                    else begin    
                        // ��1  
                        count <= count - 1;               
                        newclk <= 1'b0;    
                    end              
                end    
            endcase    
        end    
    end  
    
      
endmodule



module v_smg_1(
    input clk,
    input[31:0] sw, //����
    output[7:0] seg,//��ѡ������Ч
    output[7:0] seg1,
    output[7:0] an //λѡ������Ч
);
    reg[18:0] divclk_cnt = 0;//��Ƶ������
    reg divclk = 0;//��Ƶ���ʱ��
    reg[7:0] seg=0;//����
    reg[7:0] seg1=0;
    reg[7:0] an=8'b00000001;//λ��
    reg[3:0] disp_dat=0;//Ҫ��ʾ������
    reg[2:0] disp_bit=0;//Ҫ��ʾ��λ
    parameter maxcnt = 50000;// ���ڣ�50000*2/100M
    always@(posedge clk)
    begin
        if(divclk_cnt==maxcnt)
        begin
            divclk=~divclk;
            divclk_cnt=0;
        end
        else
        begin
            divclk_cnt=divclk_cnt+1'b1;
        end
    end
    always@(posedge divclk) begin
        if(disp_bit >= 7)
            disp_bit=0;
         else
            disp_bit=disp_bit+1'b1;
         case (disp_bit)
            3'b000 :
            begin
                disp_dat=sw[3:0];
                an=8'b00000001;//��ʾ��һ������ܣ��ߵ�ƽ��Ч
            end
            3'b001 :
            begin
                disp_dat=sw[7:4];
                an=8'b00000010;//��ʾ�ڶ�������ܣ��͵�ƽ��Ч
            end
            3'b010 :
            begin
                disp_dat=sw[11:8];
                an=8'b00000100;//��ʾ����������ܣ��͵�ƽ��Ч
            end
            3'b011 :
            begin
                disp_dat=sw[15:12];
                an=8'b00001000;//��ʾ���ĸ�����ܣ��͵�ƽ��Ч
            end
            3'b100 :
            begin
                disp_dat=sw[19:16];
                an=8'b00010000;//��ʾ���������ܣ��͵�ƽ��Ч
            end
            3'b101 :
            begin
                disp_dat=sw[24:21];
                an=8'b00100000;//��ʾ����������ܣ��͵�ƽ��Ч
            end
            3'b110 :
            begin
                disp_dat=sw[28:25];
                an=8'b01000000;//��ʾ���߸�����ܣ��͵�ƽ��Ч
            end
            3'b111 :
            begin
                disp_dat=sw[31:29];
                an=8'b10000000;//��ʾ�ڰ˸�����ܣ��͵�ƽ��Ч
            end
            default:
            begin
                disp_dat=0;
                an=8'b00000000;
            end
        endcase
    end
    always@(disp_dat)
    begin
        if(an > 8'b00001000) begin
            case (disp_dat)
            //��ʾ0-F
            4'h0 : seg = 8'hfc;
            4'h1 : seg = 8'h60;
            4'h2 : seg = 8'hda;
            4'h3 : seg = 8'hf2;
            4'h4 : seg = 8'h66;
            4'h5 : seg = 8'hb6;
            4'h6 : seg = 8'hbe;
            4'h7 : seg = 8'he0;
            4'h8 : seg = 8'hfe;
            4'h9 : seg = 8'hf6;
            4'ha : seg = 8'hee;
            4'hb : seg = 8'h3e;
            4'hc : seg = 8'h9c;
            4'hd : seg = 8'h7a;
            4'he : seg = 8'h9e;
            4'hf : seg = 8'h8e;
            endcase
        end
        else begin
            case (disp_dat)
            //��ʾ0-F
            4'h0 : seg1 = 8'hfc;
            4'h1 : seg1 = 8'h60;
            4'h2 : seg1 = 8'hda;
            4'h3 : seg1 = 8'hf2;
            4'h4 : seg1 = 8'h66;
            4'h5 : seg1 = 8'hb6;
            4'h6 : seg1 = 8'hbe;
            4'h7 : seg1 = 8'he0;
            4'h8 : seg1 = 8'hfe;
            4'h9 : seg1 = 8'hf6;
            4'ha : seg1 = 8'hee;
            4'hb : seg1 = 8'h3e;
            4'hc : seg1 = 8'h9c;
            4'hd : seg1 = 8'h7a;
            4'he : seg1 = 8'h9e;
            4'hf : seg1 = 8'h8e;
            endcase
        end
    end
endmodule

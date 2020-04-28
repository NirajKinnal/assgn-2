//testbench
module test_bench;
  reg clk;
  reg reset;
  reg input1;
  reg input2;
  reg cin;
  wire s;
  wire cout;
  
  serial_adder uut (.clk(clk), .reset(reset), .input1(i1), .input2(i2), .cin(cin), .s(s), .cout(cout));
  
  always
    #5 clk = ~clk;
  
  initial begin
    clk = 1;
    reset = 0;
    input1 = 0;
    input2 = 0;
    cin = 0;
    reset = 1;  
    #20;
    reset = 0;
        
    input1 = 1; input2 = 1; cin = 1;
    #5;
    input1 = 1; input2 = 0; cin = 0;
    #5;
    input1 = 1; input2 = 1; cin = 0;
    #5;
    input1 = 1; input2 = 1; cin = 0;
    #5;
    reset = 1;
    #5;
    reset = 0;
    input1 = 1; input2 = 1; cin = 1;
    #5;
    input1 = 1; input2 = 0; cin = 0;
    #5;
    input1 = 0; input2 = 0; cin = 0;  
    #5;
    input1 = 1; input2 = 0; cin = 0;  
    #5;
    input1 = 1; input2 = 1; cin = 0;
    #5;
    reset = 1;
    #5;
  end
endmodule

//design

module serial_adder 
  ( input clk,reset,  
    input i1,i2,cin,  
    output reg s,cout 
        );
  reg cy,flag;
  always@(posedge clk or posedge reset)
    begin
      if(reset == 1) begin 
        s = 0;
        cout = cy;
        flag = 0;
      end 
      else begin
        if(flag == 0)
          begin
            cy = cin;
            flag = 1;  
          end 
        cout = 0;
        s = i1 ^ i2 ^ cy;  
        c = (i1 & i2) | (cy & i2) | (i1 & cy);  
      end 
    end
endmodule

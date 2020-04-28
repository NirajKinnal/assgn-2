//testbench

module up_counter;
  reg clk,clr;
  wire [7:0] out;
  
  counter CNT (clr,clk,out);
  
  initial clk = 1'b0;
  
  always #5 clk = ~clk;
  
  initial
    begin
      clr = 1'b1;
      #15 clr = 1'b0;
      #100 clr = 1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile ("counter.vcd");
      $dumpvars (0, up_counter);
      $monitor($time,"count: %d", out);
    end
endmodule
      
//design

module counter(clear, clock,count);
  parameter N=7;
  input clear, clock;
  output reg[0:N] count;
  
  always @(negedge clock)
    if(clear)
      count <=0;
  else
    count <= count + 1;
endmodule
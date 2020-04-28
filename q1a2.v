//testbench
module test_bench;
  parameter size = 4;
 
  reg clk;
  reg reset;
  wire [size-1:0] out;
  
 
  jcounter u0 (.clk (clk), .reset (reset), .out (out));
  
  
  always #10 clk = ~clk;
 
  initial begin
    {clk, reset} <= 0;
 
    $monitor ("T=%0t out=%b", $time, out);
    repeat (2) @(posedge clk);
    reset <= 1;
    repeat (15) @(posedge clk);
    $finish;
  end
endmodule


//design

module jcounter #(parameter size=4) 
  (  
  input clk,                
  input reset,
    output reg [size-1:0] out
  );    
 
  always @ (posedge clk) begin
    if (!reset)
         out <= 1;
      else begin
        out[size-1] <= ~out[0];
        for (int a = 0; a < size-1; a=a+1) begin
          out[a] <= out[a+1];
        end
      end
  end
endmodule
 
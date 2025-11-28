
module tb;
  reg clk;
  reg reset;
  
  wire [3:0] out;
  
  tenCounter t10(clk,reset,out);
  
  always
    #5 clk = ~ clk;
  
  initial
  {clk, reset} = {0,0};
  
  initial begin
    $dumpfile("mod10_tb.vcd");
    $dumpvars(0, tb);
    #10 reset <= 1;
    #300 $finish;
  end  
  
endmodule
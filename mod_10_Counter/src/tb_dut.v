
module tb;
  reg clk;
  reg reset;

  wire [3:0] out;

  tenCounter t10(clk, reset, out);

  always
    #5 clk = ~clk;

  initial begin
    // initialize signals at time 0 with sized values
    clk   = 1'b0;
    reset = 1'b0;

    $dumpfile("mod10_tb.vcd");
    $dumpvars(0, tb);
    #10 reset = 1'b1;
    #300 $finish;
  end

endmodule
`timescale 1ns/1ps
module tb;
  reg clk = 0;
  reg rst_n = 0;
  reg d = 0;
  wire q;

  dff u_dff(.clk(clk), .rst_n(rst_n), .d(d), .q(q));

  // clock: 10ns period -> 100 MHz
  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    // release reset
    #12 rst_n = 1;

    // stimulus
    #10 d = 1;
    #10 d = 0;
    #20 d = 1;
    #20 d = 0;
    #30 d = 1;

    #80 $finish;
  end
endmodule

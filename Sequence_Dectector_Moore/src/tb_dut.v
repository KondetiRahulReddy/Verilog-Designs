`timescale 1ns/1ps

// Simple testbench for det_1101
module tb;
  reg clk, rstn, in;
  wire out;
  
  det_1101 dut(.clk(clk), .rstn(rstn), .in(in), .out(out));
  
  // clock: 10 ns period
  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    rstn = 0;
    in = 0;
    // hold reset for two cycles
    repeat (2) @(posedge clk);
    rstn = 1;   // release reset

    @(posedge clk) in <= 1; // IDLE -> S1
    @(posedge clk) in <= 1; // S1   -> S11
    @(posedge clk) in <= 0; // S11  -> S110
    @(posedge clk) in <= 1; // S110 -> S1101  (out = 1 here)

    #10;

    @(posedge clk) in <= 1; // IDLE -> S1
    @(posedge clk) in <= 1; // S1   -> S11
    @(posedge clk) in <= 0; // S11  -> S110
    @(posedge clk) in <= 1; // S110 -> S1101  (out = 1 here)

    #200 $finish;
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end 
endmodule
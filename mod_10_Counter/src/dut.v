// Code your design here
module tenCounter(input clk, reset, output reg[3:0] out);
  always @ (posedge clk) begin
    if (reset == 0)
      out <= 0;
    else begin
      if (out == 10)
        out <= 0;
      out <= out + 1;
    end 
      
  end 
endmodule
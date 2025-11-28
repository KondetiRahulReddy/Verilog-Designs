
module tenCounter(input clk, reset, output reg[3:0] out);
  always @ (posedge clk) begin
    if (reset == 0)
      out <= 4'd0;
    else begin
      // count 0..9 then wrap to 0
      if (out == 4'd9)
        out <= 4'd0;
      else
        out <= out + 4'd1;
    end
  end
endmodule
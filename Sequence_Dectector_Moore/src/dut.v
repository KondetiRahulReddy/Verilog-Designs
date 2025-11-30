// Simple Moore FSM to detect sequence 1101
module det_1101 (
  input clk,
  input rstn,
  input in,
  output reg out
);

  // State encodings
  localparam IDLE  = 3'd0,
             S1    = 3'd1,
             S11   = 3'd2,
             S110  = 3'd3,
             S1101 = 3'd4;

  reg [2:0] curr_state, next_state;

  // output is a Moore output based on current state
  always @(*) begin
    out = (curr_state == S1101) ? 1'b1 : 1'b0;
  end

  // state register
  always @(posedge clk or negedge rstn) begin
    if (!rstn)
      curr_state <= IDLE;
    else
      curr_state <= next_state;
  end

  // next state combinational logic
  always @(*) begin
    // default
    next_state = IDLE;
    case (curr_state)
      IDLE: begin
        if (in)
          next_state = S1;
        else
          next_state = IDLE;
      end
      S1: begin
        if (in)
          next_state = S11;
        else
          next_state = IDLE;
      end
      S11: begin
        if (in)
          next_state = IDLE; // seeing 1 after 11 => maybe start over
        else
          next_state = S110;
      end
      S110: begin
        if (in)
          next_state = S1101;
        else
          next_state = IDLE;
      end
      S1101: begin
        if (in)
          next_state = S1;
        else
          next_state = IDLE;
      end
      default: next_state = IDLE;
    endcase
  end

endmodule

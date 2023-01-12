`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:35 11/05/2015
// Design Name: 
// Module Name:    Clock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Clock(
    input clk,
    output reg [5:0] second,minute,hour,
    output reg newDay 
  );

	//Clock counter for second
	reg [25:0] cnt_clk = 0;
	reg [25:0] next_cnt_clk = 0;
	//Second counter
	reg [5:0] next_second = 0;
	//Minutes counter
	reg [5:0] next_minute = 0;
	//Hour counter
	reg [5:0] next_hour = 0;
	
	initial begin
		second <= 6'd0;
		minute <= 6'd13;
		hour <= 6'd8;
	end
	
	// SYNCHRONOUS ASSIGNMENTS
	always @(posedge clk) begin
	 cnt_clk <= next_cnt_clk;
	 second <= next_second;
	 minute <= next_minute;
	 hour <= next_hour;
	end
	  
	// COMBINATIONAL CALCULATIONS
	always @* begin
		// DEFAULT VALUES
		next_cnt_clk = cnt_clk + 1;
		next_second = second;
		next_minute = minute;
		next_hour = hour;
		
		// ... other default
		
      // IF CLOCK COUNT İS 1 SECOND
      if (next_cnt_clk == 26'd50000000) begin
        next_cnt_clk = 26'd0;
        next_second = second + 1;
      end
		
      // IF SECOND COUNT İS 60, RESET İT
      if (next_second == 6'd60) begin
        next_second = 6'd0;
        next_minute = minute + 1;
      end
		
      // IF MINUTE COUNT İS 60, RESET İT
      if (next_minute == 6'd60) begin
        next_minute = 6'd0;
        next_hour = hour + 1;
      end
		
      // IF HOUR COUNT İS 24, RESET İT
      if (next_hour == 6'd24) begin
        next_hour = 6'd0;
        newDay = 1;
      end

	 end

endmodule
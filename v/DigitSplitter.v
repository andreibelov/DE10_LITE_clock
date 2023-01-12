`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:22 11/09/2015 
// Design Name: 
// Module Name:    split_output 
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
module split_output(
    input [5:0] total,
    output reg [3:0] left, right
  );


	always @* begin
		if (total < 8'd10) begin
		  left  = 4'b0000;
		  right = total[3:0];
		end
		else if (total < 8'd20) begin
		  left  = 4'b0001;
		  right = total-10;
		end
		else if (total < 8'd30) begin
		  left  = 4'b0010;
		  right = total-20;
		end
		else if (total < 8'd40) begin
		  left  = 4'b0011;
		  right = total-30;
		end
		else if (total < 8'd50) begin
		  left  = 4'b0100;
		  right = total-40;
		end
		else if (total < 8'd60) begin
		  left  = 4'b0101;
		  right = total-50;
		end
		else begin // final is 'else'
			left  = 4'b0110;
			right = 4'b0000; 
		end
	end

endmodule
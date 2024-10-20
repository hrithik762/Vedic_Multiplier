`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 09:05:01
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module vedic4mul_tb();
	reg [3:0] a;
	reg [3:0] b;
	wire [7:0] c;

	// Instantiate the Unit Under Test (UUT)
	vedic4mul gautam (.a(a),.b(b), .c(c));

	initial
	 begin
	$monitor($time," a= %b, b=%b,  --- c= %b\n", a, b, c);
	
		a = 4'b0000;
		b = 4'b0000;
		#100;
		
		a = 4'b0010;
		b = 4'b0010;
		#100;
		
		a = 4'b1000;
		b = 4'b0001;
		#100;
		
		a = 4'b0010;
		b = 4'b1010;
		#100;

		
		a = 4'b0011;
		b = 4'b1001;
		#100;
		
		a = 4'b0101;
		b = 4'b1001;
		#100;
		end
      
      
endmodule

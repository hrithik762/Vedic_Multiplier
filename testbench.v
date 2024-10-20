`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024
// Design Name: Vedic 4-bit Multiplier Testbench
// Module Name: testbench
// Project Name: Vedic Multiplier Testbench
// Target Devices: ARTIX-7 FPGA KIT
// Tool Versions: Any compatible version
// Description: Testbench for 4x4 bit Vedic Multiplier
// 
// Dependencies: vedic4mul module
// 
// Revision: 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vedic4mul_tb();
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] c;

    // Instantiate the Unit Under Test (UUT)
    vedic4mul gautam (
        .a(a), 
        .b(b), 
        .c(c)
    );

    initial begin
        // Monitor the values of a, b, and c
        $monitor($time, " a = %b, b = %b, --- c = %b\n", a, b, c);
        
        // Test case 1
        a = 4'b0000;
        b = 4'b0000;
        #100;
        
        // Test case 2
        a = 4'b0010;
        b = 4'b0010;
        #100;
        
        // Test case 3
        a = 4'b1000;
        b = 4'b0001;
        #100;
        
        // Test case 4
        a = 4'b0010;
        b = 4'b1010;
        #100;
        
        // Test case 5
        a = 4'b0011;
        b = 4'b1001;
        #100;
        
        // Test case 6
        a = 4'b0101;
        b = 4'b1001;
        #100;
    end
endmodule

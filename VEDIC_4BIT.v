`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024
// Design Name: 4-bit Vedic Multiplier
// Module Name: VEDIC_4BIT
// Project Name: Vedic Multiplier
// Target Devices: ARTIX-7 FPGA KIT
// Tool Versions: Any compatible version
// Description: 4x4 bit Vedic Multiplier using 2x2 Vedic Multiplier
// 
// Dependencies: None
// 
// Revision: 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// 6-bit Adder Module
module add_6_bit (
    input [5:0] a,
    input [5:0] b,
    output [5:0] sum
);
    assign sum = a + b;
endmodule

// Half Adder Module
module ha (
    input a, 
    input b, 
    output sum, 
    output carry
);
    xor(sum, a, b);
    and(carry, a, b);
endmodule

// 2x2 Vedic Multiplier
module vedic_2_x_2 (
    input [1:0] a,
    input [1:0] b,
    output [3:0] c
);
    wire [3:0] temp;
    
    // Partial product generation
    assign c[0] = a[0] & b[0]; 
    assign temp[0] = a[1] & b[0];
    assign temp[1] = a[0] & b[1];
    assign temp[2] = a[1] & b[1];

    // Summation of partial products using half adders
    ha z1(temp[0], temp[1], c[1], temp[3]);
    ha z2(temp[2], temp[3], c[2], c[3]);
endmodule

// 4x4 Vedic Multiplier
module vedic4mul (
    input [3:0] a,
    input [3:0] b,
    output [7:0] c
);
    wire [3:0] q0, q1, q2, q3;		
    wire [5:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7;

    // Instantiate 2x2 Vedic Multipliers
    vedic_2_x_2 z1(a[1:0], b[1:0], q0[3:0]);
    vedic_2_x_2 z2(a[3:2], b[1:0], q1[3:0]);
    vedic_2_x_2 z3(a[1:0], b[3:2], q2[3:0]);
    vedic_2_x_2 z4(a[3:2], b[3:2], q3[3:0]);

    // Adding partial results
    assign temp1 = {4'b0, q0[3:2]};
    assign temp2 = {2'b0, q1[3:0]};
    add_6_bit z5(temp1, temp2, temp3);

    assign temp4 = {2'b0, q2[3:0]};
    assign temp5 = {q3[3:0], 2'b0};
    add_6_bit z6(temp4, temp5, temp6);

    add_6_bit z7(temp3, temp6, temp7);

    // Final output assignment
    assign c[1:0] = q0[1:0];
    assign c[7:2] = temp7[5:0];
endmodule

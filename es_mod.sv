`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 04:03:29 PM
// Design Name: 
// Module Name: es_mod
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


module es_mod(
    //input logic s_a,
    //input logic s_b,
    //output logic s_c,
    input logic [7:0] e_a,
    input logic [7:0] e_b,
    output logic signed [7:0] e_c
    );

// sign computation
//assign s_c = s_a ^ s_b;

// exponent computation
assign e_c = e_a + e_b - 127;
    

endmodule

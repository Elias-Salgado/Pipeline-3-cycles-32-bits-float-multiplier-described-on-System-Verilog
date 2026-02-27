`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 01:48:23 PM
// Design Name: 
// Module Name: reg_3
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


module reg_3(
    input clk,
    input rst,
    input [310:0] fs_c,
    output [31:0] f_c
    );

logic [31:0] fso_c;
   
always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            fso_c <= 32'h00000000;
        end else begin
            fso_c <= fs_c;
        end
end

assign f_c = fso_c;

endmodule
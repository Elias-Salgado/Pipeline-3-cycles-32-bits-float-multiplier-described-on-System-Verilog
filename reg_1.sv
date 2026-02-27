`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:38:09 PM
// Design Name: 
// Module Name: reg_1
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
  
module reg_1(
    input clk,
    input rst,
    input [31:0] f_a,
    input [31:0] f_b,
    output [31:0] fs_a,
    output [31:0] fs_b
    );
   
logic [31:0] fsy_a;
logic [31:0] fsy_b; 
   
always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            fsy_a <= 32'h00000000;
            fsy_b <= 32'h00000000;
        end else begin
            fsy_a <= f_a;
            fsy_b <= f_b; 
        end
end

assign fs_a = fsy_a;
assign fs_b = fsy_b;
    
endmodule

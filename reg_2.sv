`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 02:00:06 PM
// Design Name: 
// Module Name: reg_2
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


module reg_2(
    input clk,
    input rst,
    input [31:0] fs_a,
    input [31:0] fs_b,
    input [30:0] fsn_c,
    input [30:0] fn_c,
    input [30:0] fnn_c,
    input [30:0] fzn_c,
    output [31:0] fso_a,
    output [31:0] fso_b,
    output [30:0] fo_sn_c,
    output [30:0] fo_n_c,
    output [30:0] fo_nn_c,
    output [30:0] fo_zn_c
    );
    
logic [31:0] fs_so_a; 
logic [31:0] fs_so_b;    
logic [30:0] fs_sn_c;
logic [30:0] fs_n_c; 
logic [30:0] fs_nn_c;
logic [30:0] fs_zn_c;
   
always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            fs_so_a <= 32'h00000000;
            fs_so_b <= 32'h00000000;
            fs_sn_c <= 32'h00000000;
            fs_n_c  <= 32'h00000000;
            fs_nn_c <= 32'h00000000;
            fs_zn_c <= 32'h00000000;
        end else begin
            fs_so_a <= fs_a;
            fs_so_b <= fs_b;
            fs_sn_c <= fsn_c;
            fs_n_c  <= fn_c;
            fs_nn_c <= fnn_c;
            fs_zn_c <= fzn_c; 
        end
end

assign fso_a = fs_so_a;
assign fso_b = fs_so_b;
assign fo_sn_c = fs_sn_c;
assign fo_n_c  = fs_n_c;
assign fo_nn_c = fs_nn_c;
assign fo_zn_c = fs_zn_c;
    
endmodule

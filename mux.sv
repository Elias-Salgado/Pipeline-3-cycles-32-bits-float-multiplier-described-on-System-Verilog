`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 01:19:21 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input logic [3:0] sel,
    input logic [30:0] fo_sn_c,
    input logic [30:0] fo_n_c,
    input logic [30:0] fo_nn_c,
    input logic [30:0] fo_zn_c,
    input logic [31:0] fso_a,
    input logic [31:0] fso_b,
    output logic [31:0] f_c
    );
    
logic sign;

assign sign = fso_a[31] ^ fso_b[31];  
    
always_comb
	begin: signal_select
	case (sel)
		4'b0000: begin
		f_c = {sign,fo_sn_c}; // fsn_c
		end
		4'b0001: begin
		f_c = {sign,fo_n_c}; // fn_c
		end
		4'b0010: begin
		f_c = {sign,fo_nn_c}; // fnn_c
		end
		4'b0011: begin
		f_c = {sign,fo_zn_c}; // fzn_c
		end
		4'b0100: begin
		f_c = {sign,8'hFF,{23{1'b0}}}; // Infinity
		end
		4'b0101: begin
		f_c = {sign,8'h00,{23{1'b0}}}; // Zero
		end
		4'b0110: begin
		f_c = {fso_a[31:23],1'b1,fso_a[21:0]}; // f_a
		end
		4'b0111: begin
		f_c = {fso_b[31:23],1'b1,fso_b[21:0]}; // f_b
		end
		4'b0110: begin
		f_c = {32{1'b0}}; // Nan
		end
	endcase		
end
    
endmodule

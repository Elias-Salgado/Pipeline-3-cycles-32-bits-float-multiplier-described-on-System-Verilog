`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 02:03:58 PM
// Design Name: 
// Module Name: no_normalize
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


module no_normalize(
    input logic [47:0] mul,
    output logic [22:0] s_mul,
    input logic [7:0] fexp,
    output logic [7:0] nexp
    );

logic [47:0] mul_inn;
logic [7:0] exp_mag;

assign exp_mag = ~fexp + 1;

assign nexp = 8'h00;

always_comb
	begin: reg_select
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		mul_inn = (mul) >> (exp_mag - 1); // Rounding process
		s_mul = {mul_inn[47:25] + ((mul_inn[24] & (|mul_inn[23:0])) || (mul_inn[25] & mul_inn[24]))};
		end
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		mul_inn = (mul) >> (exp_mag - 1); // Rounding process
		s_mul = {mul_inn[47:25] + ((mul_inn[24] & (|mul_inn[23:0])) || (mul_inn[25] & mul_inn[24]))};
		end
		default: begin
	    mul_inn = 24'h000000; 
	    end
	endcase
end

endmodule

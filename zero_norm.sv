`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 10:49:31 AM
// Design Name: 
// Module Name: zero_norm
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


module zero_norm(
    input logic [47:0] mul,
    output logic [22:0] n_mul,
    input logic [7:0] fexp,
    output logic [7:0] nexp
    );
    
    
always_comb
	begin: reg_select
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		n_mul = mul[46:24] + ((mul[23] & |mul[22:0]) || (mul[24] & mul[23])); 
		nexp = 1;
		end
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		n_mul = mul[46:24] + ((mul[23] & |mul[22:0]) || (mul[24] & mul[23]));  
		nexp = 0;
		end
		{4'b001X,44'hXXXXXXXXXXX}: begin 
		n_mul = mul[46:24] + ((mul[23] & |mul[22:0]) || (mul[24] & mul[23])); 
		nexp = 0;
		end
	default: begin
	n_mul = 24'h000000; 
	nexp = '0; // underflow
	end
	endcase
end
   
    
endmodule

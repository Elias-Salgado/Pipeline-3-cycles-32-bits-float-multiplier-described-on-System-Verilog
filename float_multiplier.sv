`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 12:03:02 PM
// Design Name: 
// Module Name: float_multiplier
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


module float_multiplier(
    input logic [47:0] mul,
    output logic [22:0] n_mul,
    input logic [7:0] fexp,
    output logic [7:0] nexp
    );
    
logic [23:0] carry_mul;

assign n_mul = carry_mul[22:0];

always_comb
	begin: reg_select
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		carry_mul = mul[46:24] + ((mul[23] & |mul[22:0]) || (mul[24] & mul[23])); 
		nexp = fexp + 1 + carry_mul[23];
		end
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		carry_mul = mul[45:23] + ((mul[22] & |mul[21:0]) || (mul[23] & mul[22])); 
		nexp = fexp + carry_mul[23];
		end
		{4'b001X,44'hXXXXXXXXXXX}: begin 
		carry_mul = mul[44:22] + ((mul[21] & |mul[20:0]) || (mul[22] & mul[21]));  
		nexp = fexp - 1 + carry_mul[23];
		end
		{4'b0001,44'hXXXXXXXXXXX}: begin
		carry_mul = mul[43:21] + ((mul[20] & |mul[19:0]) || (mul[21] & mul[20]));  
		nexp = fexp - 2 + carry_mul[23];
		end
		{4'h0,4'b1XXX,40'hXXXXXXXXXX}: begin
		carry_mul = mul[42:20] + ((mul[19] & |mul[18:0]) || (mul[20] & mul[19]));  
		nexp = fexp - 3 + carry_mul[23];
		end
		{4'h0,4'b01XX,40'hXXXXXXXXXX}: begin
		carry_mul = mul[41:19] + ((mul[18] & |mul[17:0]) || (mul[19] & mul[18]));  
		nexp = fexp - 4 + carry_mul[23];
		end
		{4'h0,4'b001X,40'hXXXXXXXXXX}: begin
		carry_mul = mul[40:18] + ((mul[17] & |mul[16:0]) || (mul[18] & mul[17]));  
		nexp = fexp - 5 + carry_mul[23];
		end
		{4'h0,4'b0001,40'hXXXXXXXXXX}: begin
		carry_mul = mul[39:17] + ((mul[16] & |mul[15:0]) || (mul[17] & mul[16]));  
		nexp = fexp - 6 + carry_mul[23];
		end
		{8'h00,4'b1XXX,36'hXXXXXXXXX}: begin
		carry_mul = mul[38:16] + ((mul[15] & |mul[14:0]) || (mul[16] & mul[15]));  
		nexp = fexp - 7 + carry_mul[23];
		end
		{8'h00,4'b01XX,36'hXXXXXXXXX}: begin
		carry_mul = mul[37:15] + ((mul[14] & |mul[13:0]) || (mul[15] & mul[14]));  
		nexp = fexp - 8 + carry_mul[23];
		end
		{8'h00,4'b001X,36'hXXXXXXXXX}: begin
		carry_mul = mul[36:14] + ((mul[13] & |mul[12:0]) || (mul[14] & mul[13]));  
		nexp = fexp - 9 + carry_mul[23];
		end
		{8'h00,4'b0001,36'hXXXXXXXXX}: begin
		carry_mul = mul[35:13] + ((mul[12] & |mul[11:0]) || (mul[13] & mul[12]));  
		nexp = fexp - 10 + carry_mul[23];
		end
		{12'h000,4'b1XXX,32'hXXXXXXXX}: begin
		carry_mul = mul[34:12] + ((mul[11] & |mul[10:0]) || (mul[12] & mul[11]));  
		nexp = fexp - 11 + carry_mul[23];
		end
		{12'h000,4'b01XX,32'hXXXXXXXX}: begin
		carry_mul = mul[33:11] + ((mul[10] & |mul[9:0]) || (mul[11] & mul[10]));  
		nexp = fexp - 12 + carry_mul[23];
		end
		{12'h000,4'b001X,32'hXXXXXXXX}: begin
		carry_mul = mul[32:10] + ((mul[9] & |mul[8:0]) || (mul[10] & mul[9]));  
		nexp = fexp - 13 + carry_mul[23];
		end
		{12'h000,4'b0001,32'hXXXXXXXX}: begin
		carry_mul = mul[31:9] + ((mul[8] & |mul[7:0]) || (mul[9] & mul[8]));  
		nexp = fexp - 14 + carry_mul[23];
		end
		{16'h0000,4'b1XXX,28'hXXXXXXX}: begin
		carry_mul = mul[30:8] + ((mul[7] & |mul[6:0]) || (mul[8] & mul[7]));  
		nexp = fexp - 15 + carry_mul[23];
		end
		{16'h0000,4'b01XX,28'hXXXXXXX}: begin
		carry_mul = mul[29:7] + ((mul[6] & |mul[5:0]) || (mul[7] & mul[6]));  
		nexp = fexp - 16 + carry_mul[23];
		end
		{16'h0000,4'b001X,28'hXXXXXXX}: begin
		carry_mul = mul[28:6] + ((mul[5] & |mul[4:0]) || (mul[6] & mul[5]));  
		nexp = fexp - 17 + carry_mul[23];
		end
		{16'h0000,4'b0001,28'hXXXXXXX}: begin
		carry_mul = mul[27:5] + ((mul[4] & |mul[3:0]) || (mul[5] & mul[4]));  
		nexp = fexp - 18 + carry_mul[23];
		end
		{20'h00000,4'b1XXX,24'hXXXXXX}: begin 
		carry_mul = mul[26:4] + ((mul[3] & |mul[2:0]) || (mul[4] & mul[3]));  
		nexp = fexp - 19 + carry_mul[23];
		end
		{20'h00000,4'b01XX,24'hXXXXXX}: begin
		carry_mul = mul[25:3] + ((mul[2] & |mul[1:0]) || (mul[3] & mul[2]));  
		nexp = fexp - 20 + carry_mul[23];
		end
		{20'h00000,4'b001X,24'hXXXXXX}: begin
		carry_mul = mul[24:2] + ((mul[1] & mul[0]) || (mul[2] & mul[1]));   
		nexp = fexp - 21 + carry_mul[23];
		end
		{20'h00000,4'b0001,24'hXXXXXX}: begin
		carry_mul = mul[23:1] + (mul[1] & mul[0]); // last rounding
		nexp = fexp - 22 + carry_mul[23];
		end
		{24'h000000,4'b1XXX,20'hXXXXX}: begin
		carry_mul = mul[22:0];
		nexp = fexp - 23;
		end
		{24'h000000,4'b01XX,20'hXXXXX}: begin
		carry_mul = {mul[21:0],1'b0};
		nexp = fexp - 24;
		end
		{24'h000000,4'b001X,20'hXXXXX}: begin
		carry_mul = {mul[20:0],2'b00};
		nexp = fexp - 25;
		end
		{24'h000000,4'b0001,20'hXXXXX}: begin
		carry_mul = {mul[19:0],3'b000};
		nexp = fexp - 26;
		end
		{28'h0000000,4'b1XXX,16'hXXXX}: begin
		carry_mul = {mul[18:0],4'b0000};
		nexp = fexp - 27;
		end
		{28'h0000000,4'b01XX,16'hXXXX}: begin
		carry_mul = {mul[17:0],5'b00000};
		nexp = fexp - 28;
		end
		{28'h0000000,4'b001X,16'hXXXX}: begin
		carry_mul = {mul[16:0],6'b000000};
		nexp = fexp - 29;
		end
		{28'h0000000,4'b0001,16'hXXXX}: begin
		carry_mul = {mul[15:0],7'b0000000};
		nexp = fexp - 30;
		end
		{32'h00000000,4'b1XXX,12'hXXX}: begin
		carry_mul = {mul[14:0],8'b00000000};
		nexp = fexp - 31;
		end
		{32'h00000000,4'b01XX,12'hXXX}: begin
		carry_mul = {mul[13:0],9'b000000000};
		nexp = fexp - 32;
		end
		{32'h00000000,4'b001X,12'hXXX}: begin
		carry_mul = {mul[12:0],10'b0000000000};
		nexp = fexp - 33;
		end
		{32'h00000000,4'b0001,12'hXXX}: begin
		carry_mul = {mul[11:0],11'b00000000000};
		nexp = fexp - 34;
		end
		{36'h000000000,4'b1XXX,8'hXX}: begin
		carry_mul = {mul[10:0],12'b000000000000};
		nexp = fexp - 35;
		end
		{36'h000000000,4'b01XX,8'hXX}: begin
		carry_mul = {mul[9:0],13'b0000000000000};
		nexp = fexp - 36;
		end
		{36'h000000000,4'b001X,8'hXX}: begin
		carry_mul = {mul[8:0],14'b00000000000000};
		nexp = fexp - 37;
		end
		{36'h000000000,4'b0001,8'hXX}: begin
		carry_mul = {mul[7:0],15'b000000000000000};
		nexp = fexp - 38;
		end
		{40'h0000000000,4'b1XXX,4'hX}: begin
		carry_mul = {mul[6:0],16'b000000000000000};
		nexp = fexp - 39;
		end
		{40'h0000000000,4'b01XX,4'hX}: begin
		carry_mul = {mul[5:0],17'b0000000000000000};
		nexp = fexp - 40;
		end
		{40'h0000000000,4'b001X,4'hX}: begin
		carry_mul = {mul[4:0],18'b00000000000000000};
		nexp = fexp - 41;
		end
		{40'h0000000000,4'b0001,4'hX}: begin
		carry_mul = {mul[3:0],19'b000000000000000000};
		nexp = fexp - 42;
		end
		{44'h00000000000,4'b1XXX}: begin 
		carry_mul = {mul[2:0],20'b0000000000000000000};
		nexp = fexp - 43;
		end
		{44'h00000000000,4'b01XX}: begin
		carry_mul = {mul[1:0],21'b00000000000000000000};
		nexp = fexp - 44;
		end
		{44'h00000000000,4'b001X}: begin
		carry_mul = {mul[0],22'b000000000000000000000};
		nexp = fexp - 45;
		end
	default: begin
	carry_mul = 24'h000000; 
	nexp = '0; // underflow
	end
	endcase
end

endmodule

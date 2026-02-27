`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 01:01:02 PM
// Design Name: 
// Module Name: mod_normalizer
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


module mod_normalizer(
    input logic [47:0] mul,
    output logic [22:0] n_mul,
    input logic [7:0] fexp,
    output logic [7:0] nexp,
    input logic signed [9:0] s_dif
    );
   
logic [22:0] n_mul_1;
logic [22:0] n_mul_2;
logic [22:0] n_mul_3;

logic [47:0] a_mul;
logic [47:0] t_mul;

logic signed [7:0] nexp_1;
logic [7:0] res_exp;

logic signed [7:0] m_count;
logic signed [9:0] me_dif;

logic [7:0] in_exp;
logic [7:0] nexp_2;
logic [7:0] nexp_3;
logic [7:0] exp_mag;

assign exp_mag = ~fexp + 1;
   
assign me_dif = m_count - s_dif;

always_comb
	begin: out_select
	if ((s_dif >= 0) && (me_dif >= 0) && (m_count >= 0)) begin
	n_mul = n_mul_3;
	nexp  = 0;
	end else begin
	if (s_dif >= 0) begin
	n_mul = n_mul_1;
	nexp  = nexp_1;
	end else begin
	n_mul = n_mul_2;
	nexp  = nexp_2;
	end
	end
end
		
always_comb
	begin: reg_select
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		n_mul_1 = mul[46:24] + ((mul[23] & |mul[22:0]) || (mul[24] & mul[23])); 
		nexp_1 = fexp + 2;
		end
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		n_mul_1 = mul[45:23] + ((mul[22] & |mul[21:0]) || (mul[23] & mul[22]));  
		nexp_1 = fexp + 1;
		end
		{4'b001X,44'hXXXXXXXXXXX}: begin 
		n_mul_1 = mul[44:22] + ((mul[21] & |mul[20:0]) || (mul[22] & mul[21])); 
		nexp_1 = fexp;
		end
		{4'b0001,44'hXXXXXXXXXXX}: begin
		n_mul_1 = mul[43:21] + ((mul[20] & |mul[19:0]) || (mul[21] & mul[20]));
		nexp_1 = fexp - 1;
		end
		{4'h0,4'b1XXX,40'hXXXXXXXXXX}: begin
		n_mul_1 = mul[42:20] + ((mul[19] & |mul[18:0]) || (mul[20] & mul[19]));
		nexp_1 = fexp - 2;
		end
		{4'h0,4'b01XX,40'hXXXXXXXXXX}: begin
		n_mul_1 = mul[41:19] + ((mul[18] & |mul[17:0]) || (mul[19] & mul[18]));
		nexp_1 = fexp - 3;
		end
		{4'h0,4'b001X,40'hXXXXXXXXXX}: begin
		n_mul_1 = mul[40:18] + ((mul[17] & |mul[16:0]) || (mul[18] & mul[17]));
		nexp_1 = fexp - 4;
		end
		{4'h0,4'b0001,40'hXXXXXXXXXX}: begin
		n_mul_1 = mul[39:17] + ((mul[16] & |mul[15:0]) || (mul[17] & mul[16]));
		nexp_1 = fexp - 5;
		end
		{8'h00,4'b1XXX,36'hXXXXXXXXX}: begin
		n_mul_1 = mul[38:16] + ((mul[15] & |mul[14:0]) || (mul[16] & mul[15]));
		nexp_1 = fexp - 6;
		end
		{8'h00,4'b01XX,36'hXXXXXXXXX}: begin
		n_mul_1 = mul[37:15] + ((mul[14] & |mul[13:0]) || (mul[15] & mul[14]));
		nexp_1 = fexp - 7;
		end
		{8'h00,4'b001X,36'hXXXXXXXXX}: begin
		n_mul_1 = mul[36:14] + ((mul[13] & |mul[12:0]) || (mul[14] & mul[13]));
		nexp_1 = fexp - 8;
		end
		{8'h00,4'b0001,36'hXXXXXXXXX}: begin
		n_mul_1 = mul[35:13] + ((mul[12] & |mul[11:0]) || (mul[13] & mul[12]));
		nexp_1 = fexp - 9;
		end
		{12'h000,4'b1XXX,32'hXXXXXXXX}: begin
		n_mul_1 = mul[34:12] + ((mul[11] & |mul[10:0]) || (mul[12] & mul[11]));
		nexp_1 = fexp - 10;
		end
		{12'h000,4'b01XX,32'hXXXXXXXX}: begin
		n_mul_1 = mul[33:11] + ((mul[10] & |mul[9:0]) || (mul[11] & mul[10]));
		nexp_1 = fexp - 11;
		end
		{12'h000,4'b001X,32'hXXXXXXXX}: begin
		n_mul_1 = mul[32:10] + ((mul[9] & |mul[8:0]) || (mul[10] & mul[9]));
		nexp_1 = fexp - 12;
		end
		{12'h000,4'b0001,32'hXXXXXXXX}: begin
		n_mul_1 = mul[31:9] + ((mul[8] & |mul[7:0]) || (mul[9] & mul[8]));
		nexp_1 = fexp - 13;
		end
		{16'h0000,4'b1XXX,28'hXXXXXXX}: begin
		n_mul_1 = mul[30:8] + ((mul[7] & |mul[6:0]) || (mul[8] & mul[7]));
		nexp_1 = fexp - 14;
		end
		{16'h0000,4'b01XX,28'hXXXXXXX}: begin
		n_mul_1 = mul[29:7] + ((mul[6] & |mul[5:0]) || (mul[7] & mul[6]));
		nexp_1 = fexp - 15;
		end
		{16'h0000,4'b001X,28'hXXXXXXX}: begin
		n_mul_1 = mul[28:6] + ((mul[5] & |mul[4:0]) || (mul[6] & mul[5]));
		nexp_1 = fexp - 16;
		end
		{16'h0000,4'b0001,28'hXXXXXXX}: begin
		n_mul_1 = mul[27:5] + ((mul[4] & |mul[3:0]) || (mul[5] & mul[4]));
		nexp_1 = fexp - 17;
		end
		{20'h00000,4'b1XXX,24'hXXXXXX}: begin 
		n_mul_1 = mul[26:4] + ((mul[3] & |mul[2:0]) || (mul[4] & mul[3]));
		nexp_1 = fexp - 18;
		end
		{20'h00000,4'b01XX,24'hXXXXXX}: begin
		n_mul_1 = mul[25:3] + ((mul[2] & |mul[1:0]) || (mul[3] & mul[2]));
		nexp_1 = fexp - 19;
		end
		{20'h00000,4'b001X,24'hXXXXXX}: begin
		n_mul_1 = mul[24:2] + ((mul[1] & mul[0]) || (mul[2] & mul[1])); 
		nexp_1 = fexp - 20;
		end
		{20'h00000,4'b0001,24'hXXXXXX}: begin
		n_mul_1 = mul[23:1] + (mul[1] & mul[0]); // last rounding
		nexp_1 = fexp - 21;
		end
		{24'h000000,4'b1XXX,20'hXXXXX}: begin
		n_mul_1 = mul[22:0];
		nexp_1 = fexp - 22;
		end
		{24'h000000,4'b01XX,20'hXXXXX}: begin
		n_mul_1 = {mul[21:0],1'b0};
		nexp_1 = fexp - 23;
		end
		{24'h000000,4'b001X,20'hXXXXX}: begin
		n_mul_1 = {mul[20:0],2'b00};
		nexp_1 = fexp - 24;
		end
		{24'h000000,4'b0001,20'hXXXXX}: begin
		n_mul_1 = {mul[19:0],3'b000};
		nexp_1 = fexp - 25;
		end
		{28'h0000000,4'b1XXX,16'hXXXX}: begin
		n_mul_1 = {mul[18:0],4'b0000};
		nexp_1 = fexp - 26;
		end
		{28'h0000000,4'b01XX,16'hXXXX}: begin
		n_mul_1 = {mul[17:0],5'b00000};
		nexp_1 = fexp - 27;
		end
		{28'h0000000,4'b001X,16'hXXXX}: begin
		n_mul_1 = {mul[16:0],6'b000000};
		nexp_1 = fexp - 28;
		end
		{28'h0000000,4'b0001,16'hXXXX}: begin
		n_mul_1 = {mul[15:0],7'b0000000};
		nexp_1 = fexp - 29;
		end
		{32'h00000000,4'b1XXX,12'hXXX}: begin
		n_mul_1 = {mul[14:0],8'b00000000};
		nexp_1 = fexp - 30;
		end
		{32'h00000000,4'b01XX,12'hXXX}: begin
		n_mul_1 = {mul[13:0],9'b000000000};
		nexp_1 = fexp - 31;
		end
		{32'h00000000,4'b001X,12'hXXX}: begin
		n_mul_1 = {mul[12:0],10'b0000000000};
		nexp_1 = fexp - 32;
		end
		{32'h00000000,4'b0001,12'hXXX}: begin
		n_mul_1 = {mul[11:0],11'b00000000000};
		nexp_1 = fexp - 33;
		end
		{36'h000000000,4'b1XXX,8'hXX}: begin
		n_mul_1 = {mul[10:0],12'b000000000000};
		nexp_1 = fexp - 34;
		end
		{36'h000000000,4'b01XX,8'hXX}: begin
		n_mul_1 = {mul[9:0],13'b0000000000000};
		nexp_1 = fexp - 35;
		end
		{36'h000000000,4'b001X,8'hXX}: begin
		n_mul_1 = {mul[8:0],14'b00000000000000};
		nexp_1 = fexp - 36;
		end
		{36'h000000000,4'b0001,8'hXX}: begin
		n_mul_1 = {mul[7:0],15'b000000000000000};
		nexp_1 = fexp - 37;
		end
		{40'h0000000000,4'b1XXX,4'hX}: begin
		n_mul_1 = {mul[6:0],16'b000000000000000};
		nexp_1 = fexp - 38;
		end
		{40'h0000000000,4'b01XX,4'hX}: begin
		n_mul_1 = {mul[5:0],17'b0000000000000000};
		nexp_1 = fexp - 39;
		end
		{40'h0000000000,4'b001X,4'hX}: begin
		n_mul_1 = {mul[4:0],18'b00000000000000000};
		nexp_1 = fexp - 40;
		end
		{40'h0000000000,4'b0001,4'hX}: begin
		n_mul_1 = {mul[3:0],19'b000000000000000000};
		nexp_1 = fexp - 41;
		end
		{44'h00000000000,4'b1XXX}: begin 
		n_mul_1 = {mul[2:0],20'b0000000000000000000};
		nexp_1 = fexp - 42;
		end
		{44'h00000000000,4'b01XX}: begin
		n_mul_1 = {mul[1:0],21'b00000000000000000000};
		nexp_1 = fexp - 43;
		end
		{44'h00000000000,4'b001X}: begin
		n_mul_1 = {mul[0],22'b000000000000000000000};
		nexp_1 = fexp - 44;
		end
	default: begin
	n_mul_1 = 24'h000000; 
	nexp_1 = '0; // underflow
	end
	endcase
end

always_comb
	begin: reg_select_2
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[47:25] + ((a_mul[24] & (|a_mul[23:0])) || (a_mul[25] & a_mul[24]))};
		nexp_2 = 0;
		end		
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'b001X,44'hXXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'b0001,44'hXXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'b0001,44'hXXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'h0,4'b1XXX,40'hXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'h0,4'b01XX,40'hXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'h0,4'b001X,40'hXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{4'h0,4'b0001,40'hXXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{8'h00,4'b1XXX,36'hXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{8'h00,4'b01XX,36'hXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{8'h00,4'b001X,36'hXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{8'h00,4'b0001,36'hXXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{12'h000,4'b1XXX,32'hXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{12'h000,4'b01XX,32'hXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{12'h000,4'b001X,32'hXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{12'h000,4'b0001,32'hXXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{16'h0000,4'b1XXX,28'hXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{16'h0000,4'b01XX,28'hXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{16'h0000,4'b001X,28'hXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{16'h0000,4'b0001,28'hXXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{20'h00000,4'b1XXX,24'hXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{20'h00000,4'b01XX,24'hXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{20'h00000,4'b001X,24'hXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{20'h00000,4'b0001,24'hXXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{24'h000000,4'b1XXX,20'hXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{24'h000000,4'b01XX,20'hXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{24'h000000,4'b001X,20'hXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{24'h000000,4'b0001,20'hXXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{28'h0000000,4'b1XXX,16'hXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{28'h0000000,4'b01XX,16'hXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{28'h0000000,4'b001X,16'hXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{28'h0000000,4'b0001,16'hXXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{32'h00000000,4'b1XXX,12'hXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{32'h00000000,4'b01XX,12'hXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{32'h00000000,4'b001X,12'hXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{32'h00000000,4'b0001,12'hXXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{36'h00000000,4'b1XXX,8'hXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{36'h00000000,4'b01XX,8'hXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{36'h00000000,4'b001X,8'hXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{36'h00000000,4'b0001,8'hXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{40'h000000000,4'b1XXX,4'hX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{40'h000000000,4'b01XX,4'hX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{40'h000000000,4'b001X,4'hX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{40'h000000000,4'b0001,4'hX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{44'h0000000000,4'b1XXX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{44'h0000000000,4'b01XX}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{44'h0000000000,4'b001X}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
		{44'h0000000000,4'b0001}: begin
		a_mul = (mul) >> (exp_mag - 1); // Shift process
		n_mul_2 = {a_mul[46:24] + ((a_mul[23] & (|a_mul[22:0])) || (a_mul[24] & a_mul[23]))};
		nexp_2 = 0;
		end
	default: begin
	n_mul_2 = 24'h000000; 
	nexp_2 = '0; // underflow
	end
	endcase
end

always_comb
	begin: reg_select_3
	t_mul = (mul) << (s_dif + 2); // Left shift process
    n_mul_3 = {t_mul[47:25] + ((t_mul[24] & (|t_mul[23:0])) || (a_mul[25] & a_mul[24]))};
    nexp_3 = 0;
end

always_comb
	begin: reg_select_4
	casex (mul)
		{4'b1XXX,44'hXXXXXXXXXXX}: begin
		m_count = -2;
		end		
		{4'b01XX,44'hXXXXXXXXXXX}: begin
		m_count = -1;
		end
		{4'b001X,44'hXXXXXXXXXXX}: begin
		m_count = 0;
		end
		{4'b0001,44'hXXXXXXXXXXX}: begin
		m_count = 1;
		end
		{4'h0,4'b1XXX,40'hXXXXXXXXXX}: begin
		m_count = 2;
		end
		{4'h0,4'b01XX,40'hXXXXXXXXXX}: begin
		m_count = 3;
		end
		{4'h0,4'b001X,40'hXXXXXXXXXX}: begin
		m_count = 4;
		end
		{4'h0,4'b0001,40'hXXXXXXXXXX}: begin
		m_count = 5;
		end
		{8'h00,4'b1XXX,36'hXXXXXXXXX}: begin
		m_count = 6;
		end
		{8'h00,4'b01XX,36'hXXXXXXXXX}: begin
		m_count = 7;
		end
		{8'h00,4'b001X,36'hXXXXXXXXX}: begin
		m_count = 8;
		end
		{8'h00,4'b0001,36'hXXXXXXXXX}: begin
		m_count = 9;
		end
		{12'h000,4'b1XXX,32'hXXXXXXXX}: begin
		m_count = 10;
		end
		{12'h000,4'b01XX,32'hXXXXXXXX}: begin
		m_count = 11;
		end
		{12'h000,4'b001X,32'hXXXXXXXX}: begin
		m_count = 12;
		end
		{12'h000,4'b0001,32'hXXXXXXXX}: begin
		m_count = 13;
		end
		{16'h0000,4'b1XXX,28'hXXXXXXX}: begin
		m_count = 14;
		end
		{16'h0000,4'b01XX,28'hXXXXXXX}: begin
		m_count = 15;
		end
		{16'h0000,4'b001X,28'hXXXXXXX}: begin
		m_count = 16;
		end
		{16'h0000,4'b0001,28'hXXXXXXX}: begin
		m_count = 17;
		end
		{20'h00000,4'b1XXX,24'hXXXXXX}: begin
		m_count = 18;
		end
		{20'h00000,4'b01XX,24'hXXXXXX}: begin
		m_count = 19;
		end
		{20'h00000,4'b001X,24'hXXXXXX}: begin
		m_count = 20;
		end
		{20'h00000,4'b0001,24'hXXXXXX}: begin
		m_count = 21;
		end
		{24'h000000,4'b1XXX,20'hXXXXX}: begin
		m_count = 22;
		end
		{24'h000000,4'b01XX,20'hXXXXX}: begin
		m_count = 23;
		end
		{24'h000000,4'b001X,20'hXXXXX}: begin
		m_count = 24;
		end
		{24'h000000,4'b0001,20'hXXXXX}: begin
		m_count = 25;
		end
		{28'h0000000,4'b1XXX,16'hXXXX}: begin
		m_count = 26;
		end
		{28'h0000000,4'b01XX,16'hXXXX}: begin
		m_count = 27;
		end
		{28'h0000000,4'b001X,16'hXXXX}: begin
		m_count = 28;
		end
		{28'h0000000,4'b0001,16'hXXXX}: begin
		m_count = 29;
		end
		{32'h00000000,4'b1XXX,12'hXXX}: begin
		m_count = 30;
		end
		{32'h00000000,4'b01XX,12'hXXX}: begin
		m_count = 31;
		end
		{32'h00000000,4'b001X,12'hXXX}: begin
		m_count = 32;
		end
		{32'h00000000,4'b0001,12'hXXX}: begin
		m_count = 33;
		end
		{36'h00000000,4'b1XXX,8'hXX}: begin
		m_count = 34;
		end
		{36'h00000000,4'b01XX,8'hXX}: begin
		m_count = 35;
		end
		{36'h00000000,4'b001X,8'hXX}: begin
		m_count = 36;
		end
		{36'h00000000,4'b0001,8'hXX}: begin
		m_count = 37;
		end
		{40'h000000000,4'b1XXX,4'hX}: begin
		m_count = 38;
		end
		{40'h000000000,4'b01XX,4'hX}: begin
		m_count = 39;
		end
		{40'h000000000,4'b001X,4'hX}: begin
		m_count = 40;
		end
		{40'h000000000,4'b0001,4'hX}: begin
		m_count = 41;
		end
		{44'h0000000000,4'b1XXX}: begin
		m_count = 42;
		end
		{44'h0000000000,4'b01XX}: begin
		m_count = 43;
		end
		{44'h0000000000,4'b001X}: begin
		m_count = 44;
		end
		{44'h0000000000,4'b0001}: begin
		m_count = 45;
		end
	default: begin
	m_count = 46;
	end
	endcase
end
    
endmodule

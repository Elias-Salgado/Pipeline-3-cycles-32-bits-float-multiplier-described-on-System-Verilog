`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 03:50:27 PM
// Design Name: 
// Module Name: top_hierarchy
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


module top_hierarchy(
    input clk,
    input rst,
    input [31:0] f_a,
    input [31:0] f_b,
    output [31:0] f_c
    );

// Signals section
logic [31:0] fs_a;
logic [31:0] fs_b;
logic [31:0] fso_a;
logic [31:0] fso_b;

logic [31:0] fs_c;

logic [3:0] sel;

logic [47:0] mul;
logic [47:0] sn_mul;
logic signed [7:0] fexp;

logic [30:0] fn_c;
logic [30:0] fnn_c;
logic [30:0] fsn_c;
logic [30:0] fzn_c;

logic [30:0] fo_sn_c;
logic [30:0] fo_n_c;
logic [30:0] fo_nn_c;
logic [30:0] fo_zn_c;

logic [23:0] fi_a;
logic [23:0] fi_b;

logic [9:0] s_dif;

// Fisrt clock cycle section -----------------------------------------------------------------------

// Register section
reg_1 sreg_1(
.clk(clk),
.rst(rst),
.f_a(f_a),
.f_b(f_b),
.fs_a(fs_a),
.fs_b(fs_b));

// Multipliers section
assign fi_a = (|fs_a[30:23] == 0) ? {1'b0,fs_a[22:0]} : {1'b1,fs_a[22:0]};
assign fi_b = (|fs_b[30:23] == 0) ? {1'b0,fs_b[22:0]} : {1'b1,fs_b[22:0]};

assign mul = {1'b1,fs_a[22:0]} * {1'b1,fs_b[22:0]};
assign sn_mul = fi_a * fi_b;

assign s_dif = fs_a[30:23] + fs_b[30:23] - 127;

// In range multiplication
float_multiplier nm_1 (
.mul(mul),
.n_mul(fn_c[22:0]),
.fexp(fexp),
.nexp(fn_c[30:23]));
    
// Non-normalized multiplication
no_normalize nnm_1 (
.mul(mul),
.s_mul(fnn_c[22:0]),
.fexp(fexp),
.nexp(fnn_c[30:23]));

// Normalized multiplication
mod_normalizer mod_n (
.mul(sn_mul),
.n_mul(fsn_c[22:0]),
.fexp(fexp),
.nexp(fsn_c[30:23]),
.s_dif(s_dif));

// Zero multiplication
zero_norm z_norm (
.mul(mul),
.n_mul(fzn_c[22:0]),
.fexp(fexp),
.nexp(fzn_c[30:23]));

// Exponent management
es_mod es_m (
    .e_a(fs_a[30:23]),
    .e_b(fs_b[30:23]),
    .e_c(fexp)
    );

// second clock cycle section ----------------------------------------------------------------------

reg_2 sec_reg (
.clk(clk),
.rst(rst),
.fs_a(fs_a),
.fs_b(fs_b),
.fsn_c(fsn_c),
.fn_c(fn_c),
.fnn_c(fnn_c),
.fzn_c(fzn_c),
.fso_a(fso_a),
.fso_b(fso_b),
.fo_sn_c(fo_sn_c),
.fo_n_c(fo_n_c),
.fo_nn_c(fo_nn_c),
.fo_zn_c(fo_zn_c));

pattern_detector pat_d (
.ft_a(fso_a),
.ft_b(fso_b),
.fsn_c(fo_sn_c),
.fn_c(fo_n_c),
.fnn_c(fo_nn_c),
.fzn_c(fo_zn_c),
.sel(sel));

mux m_mux (
.sel(sel),
.fo_sn_c(fo_sn_c),
.fo_n_c(fo_n_c),
.fo_nn_c(fo_nn_c),
.fo_zn_c(fo_zn_c),
.fso_a(fso_a),
.fso_b(fso_b),
.f_c(fs_c));

// third clock cycle

reg_3 third_reg (
.clk(clk),
.rst(rst),
.fs_c(fs_c),
.f_c(f_c));

endmodule

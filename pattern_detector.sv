`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 02:34:54 PM
// Design Name: 
// Module Name: pattern_detector
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


module pattern_detector(
    input logic [31:0] ft_a,
    input logic [31:0] ft_b,
    input logic [30:0] fsn_c,
    input logic [30:0] fn_c,
    input logic [30:0] fnn_c,
    input logic [30:0] fzn_c,
    output logic [3:0] sel
    );

logic signed [9:0] dif;

assign dif = ft_a[30:23] + ft_b[30:23] -127;

always_comb begin
if (ft_a[30:23] == 255 & |ft_a[22:0] == 1'b1) begin // Nan*X = nan
sel = 4'b0110;
end else begin
if (ft_b[30:23] == 255 & |ft_b[22:0] == 1'b1) begin // X*Nan = nan
sel = 4'b0111;
end else begin
if ((ft_a[30:23] == 255 & |ft_a[22:0] == 1'b0) & (ft_b[30:23] == 0 & |ft_b[22:0] == 1'b0)) begin // Infinity*0 = nan
sel = 4'b1000;
end else begin
if ((ft_a[30:23] == 0 & |ft_a[22:0] == 1'b0) & (ft_b[30:23] == 255 & |ft_b[22:0] == 1'b0)) begin // 0*Infinity = nan
sel = 4'b1000;
end else begin
if ((ft_a[30:23] == 255 & |ft_a[22:0] == 1'b0)) begin // Infinity*C = infinity
sel = 4'b0100;
end else begin
if ((ft_b[30:23] == 255 & |ft_b[22:0] == 1'b0)) begin // C*Infinity = infinity
sel = 4'b0100;
end else begin
if ((ft_a[30:23] == 0 & |ft_a[22:0] == 1'b0)) begin // 0*C = 0
sel = 4'b0101;
end else begin
if ((ft_b[30:23] == 0 & |ft_b[22:0] == 1'b0)) begin // C*0 = 0
sel = 4'b0101;
end else begin
if (dif <= -25) begin  // Cero factor detection
sel = 4'b0101;
end else begin
if (ft_a[30:23] == 0 || ft_b[30:23] == 0) begin // Subnormal numbers = 0
sel = 4'b0000;
end else begin
if (dif >= 255) begin  // Overflow detection
sel = 4'b0100;
end else begin
if (dif == 0) begin // Subnormal outcome
sel = 4'b0011;
end else begin
if (dif < 0) begin  // Uderflow detection
sel = 4'b0010;
end else begin
if (fn_c[30:23] == 255) begin // Infinity outcome
sel = 4'b0100;
end else begin
sel = 4'b0001;
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
    
endmodule

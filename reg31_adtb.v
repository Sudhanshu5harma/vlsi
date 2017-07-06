module 32_adtb(
reg reset_n,write_en,clk
reg [3:0] add_line,
reg [31:0]data_in0,data_in1,data_in2,data_in3,data_in4,data_in5,data_in6,data_in7,data_in8,data_in9,data_in10,data_in11,data_in12,data_in13,data_in14,data_in15,
wire [31:0]data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8,data_out9,data_out10,data_out11,data_out12,data_out13,data_out14,data_out15
);

register dut ( .reset_n(rst),
 .write_en(w_en),
 .clk(clk_50),
 .add_line(add_l),
 ._l(load_l),
 .cnt_in(count_in),
 .enable_l(enable_l),
 .oe_l(oe_l)
 );

module arbitertb();
wire client3,client2,client1,client0;
reg     req3,req2,req1,req0;
reg    clk,n_rst;


arbiter dut (.n_rst(n_rst),
.clk(clk),
.client3(client3),
.client2(client2),
.client1(client1),
.client0(client0),
.req3(req3),
.req2(req2),
.req1(req1),
.req0(req0)
);


initial begin
clk=1'd0;
forever begin
#5 clk=~clk;
end
end

initial begin
n_rst = 1'd0;
#20 n_rst = 1'b1;

@(posedge clk)
req0=1'd1;
@(posedge clk)
req1=1'd1;
@(posedge clk)
req2=1'd1;
@(posedge clk)
req3=1'd1;

@(posedge clk)
$display("which is granted %b",client0,client1,client2,client3);
req0=1'd0;
# 15 $display("which is granted %b",client0,client1,client2,client3);
req1=1'd0;
# 20 $display("which is granted %b",client0,client1,client2,client3);
req2=1'd0;
# 25 $display("which is granted %b",client0,client1,client2,client3);
req3=1'd0;
# 30 $display("which is granted %b",client0,client1,client2,client3);

end
endmodule

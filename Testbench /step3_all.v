module reg32_ad_newtb();
reg reset_n,write_en,clk,read_en;
reg [3:0]write_line;
reg [3:0]read_line;
reg [31:0]data_in;
wire [31:0]data_out;
integer [3:0]i;

reg32_ad_new dut (.reset_n(reset_n),
.write_en(write_en),
.clk(clk),
.read_line(read_line),
.read_en(read_en),
.write_line(write_line),
.data_in(data_in),
.data_out(data_out)
);

initial begin
clk=1'd0;
forever begin
#5 clk=~clk;
end
end
initial begin
reset_n = 1'd0;
#20 reset_n = 1'b1;
for( i = 4'b0000; i <= 16; i++ ) begin
@(posedge clk)
write_en = 1'd1;
@(posedge clk)
write_line = i;
data_in = 32'hf0ff;
@(posedge clk)
write_en = 1'd0;
read_en =1'd1;
@(posedge clk)
read_line = i ;
@(posedge clk)
read_en =1'd0;
@(posedge clk)
if (data_out !== data_in)
begin
$display("test 1 failed register %b", i );
end
else
begin
$display("test 1 cleared");
$display("this is data in %b,this is data out %b",data_in,data_out);
end
end
end
endmodule

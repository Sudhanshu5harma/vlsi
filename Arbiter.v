module arbiter(
output  client3,
output  client2,
output  client1,
output  client0,
input req3,
input req2,
input req1,
input req0
input  clk,
input n_rst
);

reg[2:0]state,next_state;

parameter IDLE = 3'b000;
parameter GNT3=3'b001;
parameter GNT2=3'b010;
parameter GNT1=3'b011;
parameter GNT0=3'b100;



always@ (posedge clk or negedge n_rst)
begin
  if(!n_rst)
  begin
  state = IDLE;
  end
  else
  begin
  state=next_state;
  end
end

always@ (state,req3,req2,req1,req0)
begin
case (state)
IDLE:begin
         if(req0)
           next_state=GNT0;
         else if(req1)
           next_state=GNT1;
         else if(req2)
           next_state=GNT2;
         else if(req3)
           next_state=GNT3;
         else
           next_state=IDLE;
end
client0:begin

         if(req0)
           next_state=GNT0;
         else
           next_state=IDLE;
end

client1:begin
         if(req1)
           next_state=GNT1;
         else
           next_state=IDLE;
end

client2:begin
         if(req2)
           next_state=GNT2;
         else
           next_state=IDLE;
end

client3:begin
         if(req3)
           next_state=GNT3;
         else
           next_state=IDLE;
    end
default: next_state=3'd0;
endcase
end

assign client1=(state== GNT1);
assign client0=(state==GNT0);
assign client2=(state==GNT2);
assign client3=(state==GNT3);


endmodule

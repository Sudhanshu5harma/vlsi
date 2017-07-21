<<<<<<< HEAD
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
=======
module arbiter(gnt3,gnt2,gnt1,gnt0,req3,req2,req1,req0,clk,n_rst);

output reg gnt3,gnt2,gnt1,gnt0;
input      req3,req2,req1,req0;
input      clk,n_rst;
reg [2:0]  state,next_state;

always @ (posedge clk or negedge n_reset)
begin
  if(!n_rst)
  state=idle;
  else
  state=next_state;
end

always @ (state,req3,req2,req1,req0)
begin
next_state=0;
case (state)
idle:begin
>>>>>>> 801d180f1b9e515dd3ce91778b3a394d2ef20200
         if(req0)
           next_state=GNT0;
         else if(req1)
           next_state=GNT1;
         else if(req2)
           next_state=GNT2;
         else if(req3)
           next_state=GNT3;
         else
<<<<<<< HEAD
           next_state=IDLE;
end
client0:begin
=======
           next_state=idle;
end
GNT0:begin
>>>>>>> 801d180f1b9e515dd3ce91778b3a394d2ef20200

         if(req0)
           next_state=GNT0;
         else
<<<<<<< HEAD
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


=======
           next_state=idle;
end

GNT1:begin
         if(req1)
           next_state=GNT1;
         else
           next_state=idle;
end

GNT2:begin
         if(req2)
           next_state=GNT2;
         else
           next_state=idle;
end

GNT3:begin
         if(req3)
           next_state=GNT3;
         else
           next_state=idle;
end
endcase
end



always @ (state)
begin
     if(state==idle)
       begin
      gnt3=0;
      gnt2=0;
      gnt1=0;
      gnt0=0;
end
  else if(state==GNT0)
       begin
      gnt3=0;
      gnt2=0;
      gnt1=0;
      gnt0=1;
       end
 else if(state==GNT1)
       begin
      gnt3=0;
      gnt2=0;
      gnt1=1;
      gnt0=0;
       end
 else if(state==GNT2)
     begin
      gnt3=0;
      gnt2=1;
      gnt1=0;
      gnt0=0;
     end
 else if(state==GNT3)
       begin
      gnt3=1;
      gnt2=0;
      gnt1=0;
      gnt0=0;
       end
end
>>>>>>> 801d180f1b9e515dd3ce91778b3a394d2ef20200
endmodule

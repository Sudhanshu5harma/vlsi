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
         if(req0)
           next_state=GNT0;
         else if(req1)
           next_state=GNT1;
         else if(req2)
           next_state=GNT2;
         else if(req3)
           next_state=GNT3;
         else
           next_state=idle;
end
GNT0:begin

         if(req0)
           next_state=GNT0;
         else
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
endmodule

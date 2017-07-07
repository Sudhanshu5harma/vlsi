module reg32_1(reset_n,clk,data_in,data_out,load);
input reset_n;
input clk;
input wire load;
wire load0,load1,load2,load3,load4,load5,load6,load7,load8,load9,load10,load11,load12,load13,load14,load15;
input [31:0]data_in;
output reg[31:0]data_out;
reg reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15;



always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
  begin
    reg0<=32'b0;
  end
else
  begin
  if (load0)
      reg0<=data_in;
    end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
    begin
      reg1<=32'b0;
    end
else
 begin
    if (load1)
        reg1<=data_in;
      end
end


always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
    begin
      reg2<=32'b0;
    end
else
begin
    if (load2)
      reg2<=data_in;
     end
end


always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
     begin
      reg3<=32'b0;
     end
else
begin
     if (load3)
       reg3<=data_in;
      end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
      begin
        reg4<=32'b0;
      end
else
begin
    if (load4)
        reg4<=data_in;
       end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
       begin
         reg5<=32'b0;
       end
else
begin
   if (load5)
        reg5<=data_in;
      end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
      begin
        reg6<=32'b0;
      end
else
begin
  if (load6)
        reg6<=data_in;
     end
end


always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
   begin
     reg7<=32'b0;
   end
else
begin
   if (load7)
       reg7<=data_in;
      end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
        begin
          reg8<=32'b0;
        end
else
begin
      if (load8)
        reg8<=data_in;
       end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
     begin
         reg9<=32'b0;
     end
else
begin
     if (load9)
        reg9<=data_in;
     end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
     begin
       reg10<=32'b0;
    end
else
begin
  if (load10)
         reg10<=data_in;
       end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
     begin
       reg11<=32'b0;
     end
else
begin
  if (load11)
         reg11<=data_in;
       end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
       begin
         reg12<=32'b0;
       end
else
begin
   if (load12)
       reg12<=data_in;
      end
end

always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
      begin
       reg13<=32'b0;
      end
else
begin
    if (load13)
       reg13<=data_in;
      end
end


always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
      begin
        reg14<=32'b0;
      end
else
begin
      if (load14)
            reg14<=data_in;
          end
end


always@ (posedge clk or negedge reset_n)
begin
if (!reset_n)
      begin
       reg15<=32'b0;
      end
else
begin
    if (load15)
            reg15<=data_in;
          end
end

endmodule

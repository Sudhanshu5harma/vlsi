# Verilog Code for 16X32 bit register
### Step 1
![alt text](https://github.com/sudhanshu55/vlsi/blob/master/Readme%20content%20/Step1.jpg?raw=true)
In step one we just have a mux before D-flip flop which has its feed back coming back to mux.
Its just the basic idea how it works - When it loads data and when not.  As you can see when we have load line as zero(0) it doesn't load any data it just keep repeating previous data; and as soon as it goes one(1) it loads new data. We also have reset pin to reset the data out.
```verilog
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
```
In step 1 we have taken 16 different load lines along with 16 different register output so the logic have to be improve and get a single line to write the data in any register so here comes the step 2.
### Step 2
In which we have taken a single line to give the address and check the data and then load or perform any desire operation.
```verilog
assign sel0=(write_line == 4'b0000);
```
so here we are comparing the address given to our address line and the address of original register as here we are using 16 register so we have 4 bit address hence   
0th register - 0000   
1st register - 0001   
.   
.   
.   
and so on   
so here we have a seperate line to give address for writing the data onto the register. So the logic would be as - 
![alt text](https://github.com/sudhanshu55/vlsi/blob/master/Readme%20content%20/Step2.jpg?raw=true)
```verilog
always@ (posedge clk or negedge reset_n)
			begin
				if (!reset_n)
  					begin
    					data_out0<=32'b0;
  					end
				else
  					begin
    					if (write_en & sel0)
      						data_out0<=data_in0;
  					end
			end
```
So this time we have to check for the write enable and which line is selected. Before writing the data onto the register. Improving this and making as proper register of 16X32 register we need to think about output also, So here comes the step 3. 
### Step 3
For the data output thing we will have to mux the data and present it to one data out so that we can give the address to read out the data off particular register.
```verilog
assign data_out = (sel_r0 & read_en) ? data_out0 :
                      (sel_r1 & read_en) ? data_out1 :
                      (sel_r2 & read_en) ? data_out2 :
```
It goes on for all the registers and keep checking for all and for data out it gets the data and then show the desire data.
```verilog
always@ (posedge clk or negedge reset_n)
			begin
				if (!reset_n)
  					begin
    					data_out0<=32'b0;
  					end
				else
  					begin
    					if (write_en & sel0)
      						data_out0<=data_in;
  					end
			end
```
So it lay man language its like a mux before the output line and a demux before the input line. Hence the below given one is just a idea we will have 16 such register blocks. 
![alt text](https://github.com/sudhanshu55/vlsi/blob/master/Readme%20content%20/step3.png?raw=true)

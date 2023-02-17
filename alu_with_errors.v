module alu(
			  input [7:0] A,B,                  
			  input [3:0] ALU_Sel,
			  output [7:0] ALU_Out, 
			  output CarryOut // Carry Out Flag
	 );
	 reg [7:0] ALU_Result;           //Converted to reg
	 wire [8:0] tmp;
	 assign ALU_Out = ALU_Result;
	 assign tmp = {1'b0,A} + {1'b0,B};
	 assign CarryOut = tmp[8]; // Carryout flag
	 always @(*)
	 begin   
		  case(ALU_Sel)
		  4'b0000: 
			  ALU_Result = A + B ; 
		  4'b0001: 
			  ALU_Result = A - B ;
		  4'b0010:
			  ALU_Result = A * B;
		  4'b0011: 
			  ALU_Result = A/B;
		  4'b0100: 
			  ALU_Result = A<<1;
			4'b0101:
			  ALU_Result = A>>1;
			4'b0110: 
			  ALU_Result = {A[6:0],A[7]};
			4'b0111:
			  ALU_Result = {A[0],A[7:1]};
			 4'b1000:
			  ALU_Result = A & B;
			 4'b1001: 
			  ALU_Result = A | B;
			 4'b1010: 
			  ALU_Result = A ^ B;
			 4'b1011:
			  ALU_Result = ~(A | B);
			 4'b1100:
			  ALU_Result = ~(A & B);
			 4'b1101: 
			  ALU_Result = ~(A ^ B);
			 4'b1110: 
			  ALU_Result = (A>B)?8'd1:8'd0 ;
			 4'b1111: 
				ALU_Result = (A==B)?8'd1:8'd0 ;
			 default: ALU_Result = A + B ; 
		  endcase 
	 end     //Endcase here had to written to close case
endmodule

`timescale 1ns / 1ps  

module tb_alu;
 reg[7:0] A,B;    //Here B was exchanged with Carryout
 reg[3:0] ALU_Sel;

 wire[7:0] ALU_Out;
 wire Carryout;         //Here Carryout was exchanged with B
 integer i;
 alu test_uut(
				A,B,                   
				ALU_Sel,
				ALU_Out, 
				CarryOut // Carry Out Flag
	  );
	 initial begin
		  $dumpfile("alua.vcd");
		  $dumpvars(0,tb_alu);        //Here file was given the correct name tb_alu
		  A = 8'h0A;
		  B = 8'h02;
		  ALU_Sel = 4'h0;

		  
		  for (i=0;i<=15;i=i+1)    //Here k was not valid and we had to use the for loop in terms of i
		  begin
				ALU_Sel = ALU_Sel + 8'h01;
		  #10;
		  end;
		  
		  A = 8'hF6;
		  B = 8'h0A;
	 end        //Here the begin statement had to be given an end 
	 
endmodule
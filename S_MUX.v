               
`timescale 1 ns / 1 ns

module S_MUX(A,B,SEL,OUT);

parameter SIZE = 1;
input[SIZE-1:0] A,B;
output reg[SIZE-1:0] OUT;
input SEL;

always @*


OUT = SEL ? B : A; //if SEL is HIGH then OUT=B, ELSE OUT=A


endmodule

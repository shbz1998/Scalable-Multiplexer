`timescale 1 ns / 1 ns
`define MONITOR_STR_1 " MONITOR: %d: A6=%b, B6=%b, SEL=%b |OUT6=%b  OUT4=%b  OUT3=%b  OUT1=%b "

module S_MUX_TB();
//USING SIZES 1, 3, 4, 6

reg[5:0] A6, B6;
reg[3:0] A4, B4;
reg[2:0] A3, B3;
reg A1, B1;
reg SEL;

wire[5:0] OUT6;
wire[3:0] OUT4;
wire[2:0] OUT3;
wire OUT1;


//USING DEFPARAM FOR SIZE=6, MUX6
defparam MUX6.SIZE=6;
S_MUX MUX6(A6,B6, SEL, OUT6);

//USING MODULE INSTANCE FOR SIZE=4, MUX4
S_MUX #(4) MUX4(A4,B4,SEL,OUT4);

//USING NAMED PARAMTER FOR SIZE=3, MUX3
S_MUX #(.SIZE(3)) MUX3(A3, B3, SEL, OUT3);

//DEFAULT CASE I.E. SIZE=1, MUX1
S_MUX MUX1(A1,B1,SEL,OUT1);

initial begin
     $vcdpluson;
     $monitor(`MONITOR_STR_1 ,$time, A6, B6, SEL, OUT6, OUT4, OUT3, OUT1);
end

//"Use as many of the least significant bits of the A and B buses as needed to drive the smaller instances"

always @*
begin
A4=A6[3:0];
B4=B6[3:0];

A3=A6[2:0];
B3=B6[2:0];

A1=A6[0];
B1=B6[0];

end

initial
begin

//----CASE: A=!B-----//
$display("CASE #1, when A=!B");
//SEL=1, OUT=B
#320 B6=6'b101110; A6=~B6; SEL=1'b1;
//SEL=0, OUT=A
#320 SEL=1'b0;
//SEL=x, OUT=x
#320 SEL=1'bx;

//----CASE: A=B-----//
#320 $display("CASE #2, when A=B");
//SEL=x, OUT=A=B
#320 B6=6'b111011; A6=B6; SEL=1'bx;
//SEL=1, OUT=B
#320 SEL=1'b1;
//SEL=0, OUT=A;
#320 SEL=1'b0;

//----CASE: A is DIFFERENT than B---//
#320 $display("CASE #3, MISICILANEOUS");
//SEL=x
#320 B6=6'b111011; A6=6'b010001; SEL=1'bx; 
#320 SEL=1'b1;
#320 SEL=1'b0;

end



endmodule

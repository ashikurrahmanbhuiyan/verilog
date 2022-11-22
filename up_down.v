module up_down(u,q,clk,clear);
input u,clk,clear;
output[0:2]q;
	jk_flip_flop jk0(q[0],(~u&q[2]&q[1])+(u&~q[2]&~q[1]),(~u&q[2]&q[1])+(u&~q[2]&~q[1]),clear, clk);
    	jk_flip_flop jk1(q[1],u^q[2],u^q[2],clear, clk);
    	jk_flip_flop jk2(q[2],1,1,clear, clk);
endmodule

module jk_flip_flop(q, j, k, clear, clk);
	input j, k, clear, clk;
	output q;
	wire a, b, c, d, y, y_bar, c_bar,q_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(c, a, d);
	nand(d, c, clear, b);
	not(c_bar, clk);
	nand(y, c, c_bar);
	nand(y_bar, d, c_bar);
	nand(q, y, q_bar);
	nand(q_bar, q, clear, y_bar);
endmodule

module stimulus_up;
reg u,CLOCK, CLEAR;
wire [2:0] q;
initial
$monitor();
up_down c1(u,q, CLOCK, CLEAR);
initial
begin
u=1'b0;
CLEAR = 1'b0;
#0 CLEAR = 1'b1;
end
initial
begin
CLOCK = 1'b0;
forever #50 CLOCK = ~CLOCK;
end
endmodule

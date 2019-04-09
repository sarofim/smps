fs = 200e3;
ts = 1 / fs;
f_clk = 200e6;
t_clk = 1 / f_clk; 

%open loop 
%limited to 9 switches in open loop (2^9 options)
ol_duty = linspace(0,100, (2^8));
ol_ton = (ol_duty/100) .* ts; 
ol_ton_clk = ol_ton ./ t_clk;
ol_ton_clk_cycles = round(ol_ton_clk);

%closed loop
%going for .1% duty cycle increments
%limted by 200MHz clock (t_clk = 5ns which is 1/1000 Ts)
cl_duty = 0:0.1:100;
cl_ton = (cl_duty/100) .* ts; 
cl_ton_clk = cl_ton ./ t_clk;
cl_ton_clk_cycles = round(cl_ton_clk);
cl = [cl_duty; cl_ton_clk];

plot(ol_duty, ol_ton_clk_cycles);
A = [ol_duty; ol_ton_clk_cycles];
 

ind = 0:1:255;
D = transpose([ind; ol_ton_clk_cycles]);

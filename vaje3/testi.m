format long
B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = linspace(0,1,9);

d1b = bezierder(B,1,t);
d2b = bezierder(B,2,t);
d1b = bezierder(B,1,t)

[d1b,d1B] = bezierder2(B,1,t)
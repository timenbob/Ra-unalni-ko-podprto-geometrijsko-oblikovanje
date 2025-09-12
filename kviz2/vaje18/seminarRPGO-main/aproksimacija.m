function aproksimacija(a,stL,t,c)
%APROKSIMACIJA aproksimira kroznico s kotom a in parametrom stL, ki je doloca za katero aproksimacijo gre
% 1. enostranski Hermiteov interpolant
% 2. equioscillating error
% 3. Hermiteov interpolant z equioscillating error
% t je parameter med 0 in 1
% c je color

if stL == 1 || stL == 2
    L = 4/3*tan(a/4);
    e = 4/27 * (sin(a/4)^6/cos(a/4)^2);
    faktor = (2/(2+e))^(1/2);
end

if stL == 3
    K = 1/2 - (3-2*(2)^(1/2))^(1/3) - (3+2*(2)^(1/2))^(1/3);
    L = ((9-2*K)*sin(a)-(((9-2*K)*sin(a))^2 - 6*(2*K+3*cos(a))*(5-2*K)*(1-cos(a)))^(1/2)) / (3*(2*K+3*cos(a)));
end

B = [1, 0;
     1, L;
     cos(a) + L*sin(a), sin(a) - L*cos(a);
     cos(a), sin(a)];

%narisemo dobljeno
if stL == 2
    B = faktor .* B;
    plotbezier(B,t,c)
end
if stL == 1 || stL == 3
    plotbezier(B,t,c)
end

%narisemo se sredinsko tocko pri t=1/2
%sr = bezier(B,1/2);
%scatter(sr(1),sr(2),'red','filled')
end
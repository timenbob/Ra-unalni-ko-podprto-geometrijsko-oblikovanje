%%% 2 KVIZ %%%

%%% nal 1 %%%

% Rac B krivulja

% konstante: 

a = 142 / 101;

% kontrolne tocke in utezi: 

B = [0 a; 2, 0; -4 -3; 2 -4; 0 3];
w = [1 2 0.5 a 1];

% a

tocka = rdecasteljau(B, w, 0.3);
razdalja1 = sqrt( (1.015106315599329)^2 + (-0.351293072499280)^2);

% b

f1 = w(2) / (w(2) + w(2 + 1)) * B(2, :) + w(2 + 1) / (w(2) + w(2 + 1)) * B(2 + 1, :);

% zvisamo
[B1,w1] = rbezierelv(B,w');

f2 = w1(2) / (w1(2) + w1(2 + 1)) * B1(2, :) + w1(2 + 1) / (w1(2) + w1(2 + 1)) * B1(2 + 1, :);

razdalja2 = sqrt( (0.800000000000000 - 1.241379310344828)^2 + (-0.600000000000000 - -0.213383407306248)^2);

% c

% izpisemo
rdecasteljau(B, w, 0.3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% nal 2 %%%

% konstante : 

b = 156 / 101;

% a

Bx = [0 2 5 7; 1 0 0 9; 0 3 5 8];
By = [b 3 0 2; 5 0 0 6; 8 9 7 9];
Bz = [b 3 3 0; 0 0 0 5; 1 4 5 7];

[X, Y, Z] = coons(Bx, By, Bz);

t1 = [0 b b];
t2 = [X(2, 2) Y(2, 2) Z(2, 2)];

razdalja3 = sqrt( (t1(1) - t2(1))^2 + (t1(2) - t2(2))^2 + + (t1(3) - t2(3))^2)

% b

[X, Y, Z] = coons(Bx, By, Bz);

t3 = [0 b b];
t4 = [X(2,3) Y(2,3) Z(2,3)]

[x y z] = bezier2(X, Y, Z, 0.75, 0.5)
razdalja3 = sqrt( (x - t4(1))^2 + (y - t4(2))^2 + + (z - t4(3))^2)

% c

% [x1 x2 x3] = bezier2(X, Y, Z, 0.75, linspace(0, 1, 10))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% nal 3 %%%

% konstante :

c = 85 / 101;

% a 

T = [-1 -1; 3 0; 0 4];
P = [c 0];

pointbary(P, T);

rezultat1 = 0.454403335070349 * 0.431995831162064 * 0.113600833767587

% b

barry = pointbary(P, T);

Bx = [0 5 9; 4 6 NaN; 6 NaN NaN];
By = [1 -1 0; 5 4 NaN; 6 NaN NaN];
Bz = [ 4 -3 0; -1 5 NaN; 5 NaN NaN];
 
bezier3(Bx, By, Bz, barry);

rezultat2 = sqrt ((4.721883765129755)^ 2 + (0.800119264826842) ^ 2 + (0.100162902936299) ^ 2)

% c

odv = vectorbary([3/5 4/5], T);

bloss1 = blossom3(Bx, [odv; barry]);
bloss2 = blossom3(By, [odv; barry]);
bloss3 = blossom3(Bz, [odv; barry]);

rezultat3 = sqrt ((2 * bloss1) ^ 2 + (2 * bloss2) ^ 2 + (2 * bloss3) ^ 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% nal 4 %%% 

% konstante : 

d = 231 / 101;

tocke_mreze = [0 0; 0 1/3; 0 2/3; 0 1; 1/2 0; 1/2 1/3; 1/2 2/3; 1/2 1; 1 0; 1 1/3; 1 2/3; 1 1]


f = @(u,v) sin(d*u).*cos(3*v);
duf = @(u,v) d*cos(d*u).*cos(3*v);
dvf = @(u,v) -3*sin(d*u).*sin(3*v);
duuf = @(u,v) -d^2*sin(d*u).*cos(3*v);
duvf = @(u,v) -3*d*cos(d*u).*sin(3*v);
dvvf = @(u,v) -9*sin(d*u).*cos(3*v);

Df = @(u,v) [duf(u,v); dvf(u,v)];
Hf = @(u,v) [duuf(u,v) duvf(u,v); duvf(u,v) dvvf(u,v)];

%Bz = argyris(T,f,Df,Hf)
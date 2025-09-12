%kviz2

%Nal1
a=129/101;
B=[0 a;
    2 0;
    -2 -3;
    2 -4;
    0 3];
w=[1 3 0.5 a 1];

tocka=rbezier(B,w',0.3);
odg11=norm([0 0]-tocka);

f1 = w(2) / (w(2) + w(2 + 1)) * B(2, :) + w(2 + 1) / (w(2) + w(2 + 1)) * B(2 + 1, :);
[B1,w1] = rbezierelv(B,w');

f2 = w1(2) / (w1(2) + w1(2 + 1)) * B1(2, :) + w1(2 + 1) / (w1(2) + w1(2 + 1)) * B1(2 + 1, :);

odg12=norm(f1-f2);
%%%%
[b04,BS,W] = rdecasteljau(B,w',0.3);
w03 = W(1,4);
w13 = W(2,4);
w04 = W(1,5);

b13 = BS{2,4};
b03 = BS{1,4};

dbt = 4 * (w03*w13)/(w04^2)*(b13-b03);
odg13=norm(dbt);

%Nal2
b=175/101;
Bx = [0 2 5 7; 1 0 0 9; 0 3 5 8];
By = [b 3 0 2; 5 0 0 6; 8 9 8 9];
Bz = [b 3 3 0; 0 0 0 5; 1 4 5 7];

[X, Y, Z] = coons(Bx, By, Bz);

t1 = [0 b b];
t2 = [X(2, 2) Y(2, 2) Z(2, 2)];

odg21 = norm(t1-t2);


t3 = [0 b b];
t4 = [X(2,3) Y(2,3) Z(2,3)];

[x y z] = bezier2(X, Y, Z, 0.75, 0.5);
odg22 = sqrt( (x - t4(1))^2 + (y - t4(2))^2 + + (z - t4(3))^2);


%%%%%%%%%%%%%%%%%%%%%%%%
[n,m] = size(Bx);
n = n-1;
m = m-1;

kontrolne_x = zeros(m+1,1);
kontrolne_y = zeros(m+1,1);
kontrolne_z = zeros(m+1,1);

uu = 0.25;
for i = 0:n
    kontrolne_x(i+1) = bezier(X(:,i+1),uu);
    kontrolne_y(i+1) = bezier(Y(:,i+1),uu);
    kontrolne_z(i+1) = bezier(Z(:,i+1),uu);
end
kontrolne_z;
kontrolne_y;
kontrolne_x;
odg23=norm([2.687500000000000,4.595915841584159,3.095915841584159]-[X(2,2),Y(2,2),Z(2,2)]);



%Nal3
c=54/101;

T = [-1 -1; 3 0; 0 4];
P = [c 0];

pointbary(P, T);

odg31 = 0.519020323084940  * 0.351224596143825  * 0.129755080771235;

barry = pointbary(P, T);

Bx = [0 5 9; 4 8 NaN; 6 NaN NaN];
By = [1 1 0; 5 4 NaN; 6 NaN NaN];
Bz = [ 4 -3 0; -1 5 NaN; 5 NaN NaN];
 
bb=bezier3(Bx, By, Bz, barry);

odg32 = norm(bb);

odv = vectorbary([3/5 4/5], T);

bloss1 = blossom3(Bx, [odv; barry]);
bloss2 = blossom3(By, [odv; barry]);
bloss3 = blossom3(Bz, [odv; barry]);

odg33 = sqrt ((2 * bloss1) ^ 2 + (2 * bloss2) ^ 2 + (2 * bloss3) ^ 2);

%Nal4

d=253/101;

f = @(u,v) sin(d*u).*cos(3*v);
duf = @(u,v) d*cos(d*u).*cos(3*v);
dvf = @(u,v) -3*sin(d*u).*sin(3*v);
duuf = @(u,v) -d^2*sin(d*u).*cos(3*v);
duvf = @(u,v) -3*d*cos(d*u).*sin(3*v);
dvvf = @(u,v) -9*sin(d*u).*cos(3*v);

Df = @(u,v) [duf(u,v); dvf(u,v)];
Hf = @(u,v) [duuf(u,v) duvf(u,v); duvf(u,v) dvvf(u,v)];


[X, Y] = meshgrid(linspace(0, 1, 24), linspace(0, 1, 24));
vals = f(X,Y);

M = 3; % i = 0, 1, 2 3
N = 2; % j = 0, 1, 2
m = 4; % stopnja v u smer
n = 3; % stopnja v v smer

S = lsqbezier2spline(M, N, m, n, [X(:), Y(:), vals(:)]);


ustar = 14/23;
vstar = 19/23;

I = floor(ustar*M) + 1;
J = floor(vstar*N) + 1;
U = linspace(0,1,M+1);
V = linspace(0,1,N+1);
ulocal = (ustar - U(I))/(U(I+1) - U(I));
vlocal = (vstar - V(J))/(V(J+1) - V(J));

% Kaksna je vrednost Lf(u∗,v∗)? Odgovor

[bx,by,Lf_val] = bezier2HERO(0,0,S{J,I},ulocal,vlocal);
odg41=Lf_val;


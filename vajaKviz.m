% 1.naloga
a = 141/101;
B = [1 a; 2 -1; -2 -3; 0 -4; -3 0];
w = [1 2 0.5 a 1];

%1a -> Koliko je tocka b(0.3) oddaljena od tocke b0?
odg1 = norm(rdecasteljau(B,w,0.3)-B(1,:));
%1b -> Koliko je Farinova utezna tocka na daljici med kontrolnima tockama b1 in b2 oddaljena od tocke b21(0.4)
f1 = w(2) / (w(2) + w(2 + 1)) * B(2, :) + w(2 + 1) / (w(2) + w(2 + 1)) * B(2 + 1, :);
[B1,w1] = rbezierelv(B,w');
f2 = w1(2) / (w1(2) + w1(2 + 1)) * B1(2, :) + w1(2 + 1) / (w1(2) + w1(2 + 1)) * B1(2 + 1, :);
odg2 = norm(f1-f2);
%1c - 3x zvisamo originalno in izracunamo dolzino kontrolnega poligona
[B2,w2] = rbezierelv(B1,w1);
[B3,w3] = rbezierelv(B2,w2);
%dolzina kontrolnega poligona
odg3 = 0;
for i=1:7
    odg3 = odg3 + norm(B3(i+1,:)-B3(i,:));
end
odg3;

% 2.naloga
b = 198/101;
Bx = [0 2 5 7; 1 0 0 9; 0 3 5 8];
By = [b 3 0 2; 5 0 0 6; 8 9 7 9];
Bz = [b 3 3 0; 0 0 0 5; 1 4 5 7];

%2a -> razdalja b11 do b00
[X,Y,Z] = coons(Bx,By,Bz);
t1 = [0 b b]; %tocka b00
t2 = [X(2, 2) Y(2, 2) Z(2, 2)]; %tocka b11
razdalja1 = norm(t1-t2); %razdalja od tocke b11 in b00

%2b -> razdalja b(0.5,0.75) do b12
t3 = bezier2(Bx,By,Bz,0.5,0.75); %tocka na tenzorski b. ploskvi b(0.5,0.75)
t4 = [X(2,3),Y(2,3),Z(2,3)]; %tocka b12
razdalja2 = norm(t3-t4);

%2c ?? -> razdalja b12 do predzadnje kontrolne tocke pri b(0.5,t)
%predstavimo b(0.5,t) kot navadno B. krivuljio stopnje 3
[x,y,z] = bezier2(Bx,By,Bz,0.5,linspace(0,1,4)); 
razdalja3 = norm(t4-[x(3),y(3),z(3)]); 

% 3.naloga
c = 164/101;
T = [0 1; 4 0; 3 2];
P = [c 1];
Bx = [0 5 9; 4 6 NaN; 6 NaN NaN];
By = [1 -1 0; 5 4 NaN; 6 NaN NaN];
Bz = [ 4 -3 0; -1 5 NaN; 5 NaN NaN];

%3a -> (u0,v0,w0) baricentricne koordinate P glede na T, koliko je w0
p = pointbary(P, T); %baricentricne koordinate tocke P glede na trikotnik T
odg31 = p(3)

%3b -> razdalja (0,0,0) do b(u0,v0,w0)
odg32 = norm(bezier3(Bx,By,Bz,p))

%3c -> Kaksna je dolzina vektorja D(1,−1)b(u0,v0,w0)?
odv = vectorbary([-1 1], T);

bloss1 = blossom3(Bx, [odv; p]);
bloss2 = blossom3(By, [odv; p]);
bloss3 = blossom3(Bz, [odv; p]);
dolzina = sqrt ((2 * bloss1) ^ 2 + (2 * bloss2) ^ 2 + (2 * bloss3) ^ 2)

% 4.naloga ???
d = 287/101; 
f = @(u,v) sin(d*u).*cos(3*v);
duf = @(u,v) d*cos(d*u).*cos(3*v);
dvf = @(u,v) -3*sin(d*u).*sin(3*v);
duuf = @(u,v) -d^2*sin(d*u).*cos(3*v);
duvf = @(u,v) -3*d*cos(d*u).*sin(3*v);
dvvf = @(u,v) -9*sin(d*u).*cos(3*v);
Df = @(u,v) [duf(u,v); dvf(u,v)];
Hf = @(u,v) [duuf(u,v) duvf(u,v); duvf(u,v) dvvf(u,v)];

tocke_mreze = [0 0; 0 1/3; 0 2/3; 0 1; 1/2 0; 1/2 1/3; 1/2 2/3; 1/2 1; 1 0; 1 1/3; 1 2/3; 1 1]
%4a
TRI = delaunay(tocke_mreze(:,1),tocke_mreze(:,2))
tri = triangulation(TRI,tocke_mreze(:,1),tocke_mreze(:,2));
argyrisspline(tri,f,Df,Hf);
vr = f(1623,223);

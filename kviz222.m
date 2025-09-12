format long
% Naj bo a=141/101. Racionalna Bezierjeva krivulja {b(t);t∈[0,1]} je podana v standardni parametrizaciji. Tocke v ravnini
% b0=(1,a),b1=(2,−1),b2=(−2,−3),b3=(0,−4),b4=(−3,0)
% predstavljajo njene kontrolne tocke, vrednosti
% w0=1,w1=2,w2=0.5,w3=a,w4=1
% pa njene utezi.
a=141/101;
B=[1 a;
    2 -1;
    -2 -3;
    0 -4;
    -3 0];
w=[1 2 0.5 a 1];


% Koliko je tocka b(0.3) oddaljena od tocke b0? Odgovor
% 2.404492765996440

tocka=rbezier(B,w',0.3);
norm([1 a]-tocka);

% Koliko je Farinova utezna tocka na daljici med kontrolnima 
% tockama b1 in b2 oddaljena od tocke b21(0.4) (ta oznacuje 
% vmesno kontrolno tocko v drugem koraku racionalnega de Casteljaujevega 
% postopka pri parametru 0.4)? Odgovor
% 0.478596976287868

q = [];

for i=1:(length(w)-1)
    tmp = w(i)/(w(i)+w(i+1))*B(i,:)+ w(i+1)/(w(i)+w(i+1))*B(i+1,:);
    q = [q; tmp];
end

rbezier(B,w',0.4);
odg2=norm([1.200000000000000  -1.400000000000000]-[0.811244979919679 ,-1.971887550200803 ]);


%[b04,BS,W] = rdecasteljau(B,w,0.4);

% Naj bo b˜ (polinomska) Bezierjeva krivulja stopnje 7, ki je dolocena 
% s kontrolnimi tockami racionalne Bezierjeve krivulje stopnje 7, 
% dobljene s trikratnim visanjem stopnje krivulje b. Kaksna je 
% dolzina kontrolnega poligona b˜? Odgovor
Be=B;
We=w';
[Be,We] = rbezierelv(Be,We);
[Be,We] = rbezierelv(Be,We);
[Be,We] = rbezierelv(Be,We);

len = 0;
for i = 1:7
    len = len + (norm(Be(i+1,:)-Be(i,:)) );
end
odg3=len;
% 9.855638974739342
% Odgovorite na vse dele vprašanja.
% Vprašanje 2
% Ni zaključeno
% Točkovano od 3,75
% Vprašanje z zastavico


% Besedilo vprašanjaNaj bo b=198/101. Bezierjeva ploskev {b(u,v);(u,v)∈[0,1]×[0,1]} 
% je podana v standardni parametrizaciji z robnimi kontrolnimi tockami
% b0,0b0,1b0,2b0,3=(0,b,b),=(1,4,0),=(0,7,4),=(0,9,1),b1,0b1,3=(4,1,3),=(3,8,4),
% b2,0b2,1b2,2b2,3=(7,0,3),=(8,3,6),=(7,5,3),=(6,8,5).
b=198/101;
B = zeros(4, 4, 3); % Matrika za kontrolne točke (4x4, 3 dimenzije)
Bx = zeros(3,4);
By = zeros(3,4);
Bz = zeros(3,4);

% b_0,0 = (0,b,b)
Bx(1,1) = 0;
By(1,1) = b;
Bz(1,1) = b;

%b_0,1 = (1,4,0)
Bx(1,2) = 1;
By(1,2) = 4;
Bz(1,2) = 0;


% b_0,2 = (0, 7, 4)
Bx(1, 3) = 0;
By(1, 3) = 7;
Bz(1, 3) = 4;

% b_0,3 = (0, 9, 1)
Bx(1, 4) = 0;
By(1, 4) = 9;
Bz(1, 4) = 1;

% b_1,0 = (4, 1, 3)
Bx(2, 1) = 4;
By(2, 1) = 1;
Bz(2, 1) = 3;

% b_1,3 = (3, 8, 4)
Bx(2, 4) = 3;
By(2, 4) = 8;
Bz(2, 4) = 4;

% b_2,0 = (7, 0, 3)
Bx(3, 1) = 7;
By(3, 1) = 0;
Bz(3, 1) = 3;

% b_2,1 = (8, 3, 6)
Bx(3, 2) = 8;
By(3, 2) = 3;
Bz(3, 2) = 6;

% b_2,2 = (7, 5, 3)
Bx(3, 3) = 7;
By(3, 3) = 5;
Bz(3, 3) = 3;

% b_2,3 = (6, 8, 5)
Bx(3, 4) = 6;
By(3, 4) = 8;
Bz(3, 4) = 5;

[Bx,By,Bz] = coons(Bx,By,Bz);

% Kontrolni tocki b1,1 in b1,2 sta doloceni z zahtevo, da b ustreza Coonsovi ploskvi.
% 
% Koliko je kontrolna tocka b1,1 oddaljena od kontrole tocke b0,0? Odgovor
norm([Bx(1,1),By(1,1),Bz(1,1)]-[Bx(2,2),By(2,2),Bz(2,2)]);

% Koliko je tocka b(0.5,0.75) oddaljena od kontrolne tocke b1,2? Odgovor

%plotbezier2(Bx,By,Bz,linspace(0,1),linspace(0,1));
[bx,by,bz] = bezier2(Bx ,By ,Bz,0.5,0.75);
norm([Bx(2,3),By(2,3),Bz(2,3)]-[bx,by,bz]);

% Krivuljo {b(0.5,t);t∈[0,1]} predstavite v standardni Bezierjevi parametrizaciji stopnje 3.
% Koliko je predzadnja kontrolna tocka te Bezierjeve krivulje oddaljena od b1,2? Odgovor
[n,m] = size(Bx);
n = n-1;
m = m-1;

kontrolne_x = zeros(m+1,1);
kontrolne_y = zeros(m+1,1);
kontrolne_z = zeros(m+1,1);

uu = 0.5;
for i = 0:n
    kontrolne_x(i+1) = bezier(Bx(:,i+1),uu);
    kontrolne_y(i+1) = bezier(By(:,i+1),uu);
    kontrolne_z(i+1) = bezier(Bz(:,i+1),uu);
end

ans3=norm([kontrolne_x(end-1),kontrolne_y(end-1),kontrolne_z(end-1)]-[Bx(2,3),Bz(2,3),By(2,3)]);

% Vprašanje 3
% Ni zaključeno
% Točkovano od 3,75
% Vprašanje z zastavico

% Besedilo vprašanjaNaj bo c=164/101. Trikotna Bezierjeva ploskev {b(u,v,w);0≤u,v,w≤1, u+v+w=1}
% je podana s parametrizacijo
% b(u,v,w)=∑i+j+k=3bi,j,kB3i,j,k(u,v,w),
% ki jo dolocajo kontrolne tocke
% b0,0,3=(4,5,3),b1,0,2=(2,4,0),b0,1,2=(5,3,6),b2,0,1=(1,2,4),b1,1,1=(3,2,−2),
% b0,2,1=(7,3,2),b3,0,0=(0,0,−2),b2,1,0=(2,1,1),b1,2,0=(6,0,−2),b0,3,0=(8,−1,0)
% v prostoru. Bernsteinovi bazni polinomi B3i,j,k so definirani nad trikotnikom 
% T=(V1,V2,V3) z oglisci V1=(0,1), V2=(4,0), V3=(3,2).

c=164/101;
T=[0 1;4 0;3 2];

Bx = [0 2 6 8; 1 3 7 NaN; 2 5 NaN NaN; 4 NaN NaN NaN];
By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
Bz = [-2 1 -2 0; 4 -2 2 NaN; 0 6 NaN NaN; 3 NaN NaN NaN];


% Naj bodo z (u0,v0,w0) oznacene baricentricne koordinate tocke s kartezicnima 
% koordinatama (c,1) glede na trikotnik T. Kaksna je vrednost w0? Odgovor

p=pointbary([c,1],T);

% Na kaksni oddaljenosti od izhodisca (0,0,0) se nahaja tocka b(u0,v0,w0)? Odgovor

odg32 = norm(bezier3(Bx,By,Bz,p));

% Kaksna je dolzina vektorja D(1,−1)b(u0,v0,w0)? Odgovor
odv = vectorbary([1 -1], T);

bloss1 = blossom3(Bx, [odv; p]);
bloss2 = blossom3(By, [odv; p]);
bloss3 = blossom3(Bz, [odv; p]);
dolzina = 3*sqrt ((bloss1) ^ 2 + ( bloss2) ^ 2 + ( bloss3) ^ 2);

% Vprašanje 4
% Ni zaključeno
% Točkovano od 3,75
% Vprašanje z zastavico

% Besedilo vprašanjaNaj bo d=287/101. Tocke
% (i2,j3),i=0,1,2, j=0,1,2,3,
% dolocajo dve delitvi kvadrata [0,1]×[0,1]. Prva delitev je mnozica □, 
% sestavljena iz 6 pravokotnikov, ki so inducirani z mrezo tock.

% Druga je mnozica △, sestavljena iz 12 trikotnikov, ki so inducirani z mrezo 
% tock in s premicami 2x+3y=k, k=1,2,3,4 (to so premice, ki po diagonali prepolovijo 
% vsak pravokotnik delitve □). Funkcija f:[0,1]×[0,1]→R je podana s predpisom
% f(u,v)=sin(du)cos(3v).
% Njene vrednosti in vrednosti njenih odvodov prvega in drugega 
% reda lahko izracunamo s pomocjo naslednjih funkcij.

d=287/101;

f = @(u,v) sin(d*u).*cos(3*v);
duf = @(u,v) d*cos(d*u).*cos(3*v);
dvf = @(u,v) -3*sin(d*u).*sin(3*v);
duuf = @(u,v) -d^2*sin(d*u).*cos(3*v);
duvf = @(u,v) -3*d*cos(d*u).*sin(3*v);
dvvf = @(u,v) -9*sin(d*u).*cos(3*v);

Df = @(u,v) [duf(u,v); dvf(u,v)];
Hf = @(u,v) [duuf(u,v) duvf(u,v); duvf(u,v) dvvf(u,v)];

% Nad delitvijo □ jo aproksimiramo v smislu metode najmanjsih kvadratov z zlepkom Lf, 
% sestavljenim iz polinomov stopnje (4,3), na podlagi podatkov
% (uk,vl,f(uk,vl)),(uk,vl)=(k23,l23), (k,l)∈{0,1,…,23}×{0,1,…,23}.
% Nad delitvijo △ jo aproksimiramo z Argyrisovim zlepkom Af. Naj bo u∗=16/23 in v∗=2/23.

[X, Y] = meshgrid(linspace(0, 1, 24), linspace(0, 1, 24));
vals = f(X,Y);

M = 2; % i = 0, 1, 2
N = 3; % j = 0, 1, 2, 3
m = 4; % stopnja v u smer
n = 3; % stopnja v v smer

S = lsqbezier2spline(M, N, m, n, [X(:), Y(:), vals(:)]);


ustar = 16/23;
vstar = 2/23;

I = floor(ustar*M) + 1;
J = floor(vstar*N) + 1;
U = linspace(0,1,M+1);
V = linspace(0,1,N+1);
ulocal = (ustar - U(I))/(U(I+1) - U(I));
vlocal = (vstar - V(J))/(V(J+1) - V(J));

% Kaksna je vrednost Lf(u∗,v∗)? Odgovor
% a)
[bx,by,Lf_val] = bezier2HERO(0,0,S{J,I},ulocal,vlocal);
Lf_val

% Kaksna je vrednost Af(u∗,v∗)? Odgovor
[X1, Y1] = meshgrid(linspace(0,1,3), linspace(0,1,4));
X1 = X1';
Y1 = Y1';
points = [X1(:) Y1(:)];
T = [1 2 4;
     2 3 5;
     2 4 5;
     3 5 6;
     4 5 7;
     5 6 8;
     5 7 8;
     6 8 9;
     7 8 10;
     8 9 11;
     8 10 11;
     9 11 12];
tri = triangulation(T, points);
S_argyris = argyrisspline(tri,f,Df,Hf);

% Najdi trikotnik z (u*,v*)

[ti,bary] = pointLocation(tri,[ustar vstar]);
Af_val = safe_decasteljau3(S_argyris{ti},bary)

% Kaksna je vrednost max{|Lf(uk,vl)−Af(uk,vl)|;k,l=0,1,…,23}? Odgovor


% c)
diffs = zeros(24,24);
for i = 1:24
    for j = 1:24
        uk_pt = (i-1)/23;
        vl_pt = (j-1)/23;
        
        % Lf
        I = min(floor(uk_pt*M) + 1, M);
        J = min(floor(vl_pt*N) + 1, N);
        ulocal = (uk_pt - U(I))/(U(I+1) - U(I));
        vlocal = (vl_pt - V(J))/(V(J+1) - V(J));
        [~,~,Lf_pt] = bezier2HERO(0,0,S{J,I},ulocal,vlocal);
        
        % Af
        [ti,bary] = pointLocation(tri,[uk_pt vl_pt]);
        Af_pt = safe_decasteljau3(S_argyris{ti},bary);
        
        diffs(i,j) = abs(Lf_pt - Af_pt);
    end
end
max_diff = max(abs(diffs(:)))
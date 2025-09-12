%1.naloga

a = 131/101;

b = [0 a; 2 0; 1 -3; -2 -4; 0 3];
w = [1 3 0.5 a 1];

[b04,BS,W] = rdecasteljau(b,w,0.4);
norm(b(1,:)- b04,2)

%farinova tocka
q = [];

for i=1:(length(w)-1)
    tmp = w(i)/(w(i)+w(i+1))*b(i,:)+ w(i+1)/(w(i)+w(i+1))*b(i+1,:);
    q = [q; tmp];
end

q1 = q(2,:); %uporabimo le drugo
%razdalja farinove tocke 
norm(q1-BS{2,3})


%odvod
w03 = W(1,4);
w13 = W(2,4);
w04 = W(1,5);

b13 = BS{2,4};
b03 = BS{1,4};

dbt = 4 * (w03*w13)/(w04^2)*(b13-b03);
norm(dbt)

%4 krat dvignemo stopnjo
B1 = b;
W1 = w';
for i = 1:4
    [B1,W1] = rbezierelv (B1 , W1 );
end

%dolzina kontrolnega poligona
len = 0;
for i = 1:8
    len = len + (norm(B1(i+1,:)-B1(i,:)) );
end

%%%%%%%%%%%%%%%%%%%%%%%

b = 157/101;

Bx = [0 2 5 7;
    1 3 6 9;
    0 3 5 8];

By = [b 3 0 2;
    5 6 4 6;
    8 9 7 9];

Bz = [b 3 3 0;
    0 b 2 6;
    1 4 5 7];


b00 = [0 b b];

[sx,sy,sz] = bezier2(Bx,By,Bz,0.75,0.25);
s = [sx,sy,sz];
norm(b00-s)

bj = zeros(3,3);
for j=1:3
    bx = Bx(j,:);
    by = By(j,:);
    bz = Bz(j,:);
    tmpB = [bx' by' bz'];
    bj(j,:)=bezier(tmpB,0.25);
end

norm(bj(2,:)-b00)

%p bilinerani interpolant
vals = [];
b00 = [0 b b];
b30 = [7 2 0];
b02 = [0 8 1];
b32 = [8 9 7];

function val = interP(b00,b30,b02,b32,u,v)
val = (1-u)*(1-v)*b00+u*(1-v)*b30+(1-u)*v*b02+u*v*b32;

end

for k=0:10
    for l = 0:10
        [tx,ty,tz] = bezier2(Bx,By,Bz,l/10,k/10);
        tmp = [tx,ty,tz];
        p = interP(b00,b30,b02,b32,k/10,l/10);%samo klasicna interpolacija
        vals = [vals, norm(tmp-p)];
    end
end

max(vals)


U = [0 0 0 0.5 0.5 0.5 1 1 1];
V = [0 0.5 1 0 0.5 1 0 0.5 1];

P = zeros(9,3);

for i = 1:9
    [tx,ty,tz] = bezier2(Bx,By,Bz,V(i),U(i));
        tmp = [tx,ty,tz];
        P(i,:)=tmp;
end

[Qcx,Qcy,Qcz] = lsqbezier2 (1 ,1 ,P ,U ,V);%ubistu splin
b00 = [Qcx(1,1),Qcy(1,1),Qcz(1,1)];
b30 = [Qcx(1,2),Qcy(1,2),Qcz(1,2)];
b02 = [Qcx(2,1),Qcy(2,1),Qcz(2,1)];
b32 = [Qcx(2,2),Qcy(2,2),Qcz(2,2)];

vals = [];
for k=0:10
    for l = 0:10
        [tx,ty,tz] = bezier2(Bx,By,Bz,l/10,k/10);
        tmp = [tx,ty,tz];
        p = interP(b00,b30,b02,b32,k/10,l/10);
        vals = [vals, norm(tmp-p)];
    end
end
 max(vals)
max(vals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = 55/201;

Bx = [0 2 6 8;
    1 3 7 nan;
    2 5 nan nan;
    4 nan nan nan];

By = [0 1 0 -1;
    2 2 3 nan;
    4 3 nan nan;
    5 nan nan nan];

Bz = [-2 1 -2 0;
    4 -2 3 nan;
    0 5 nan nan;
    3 nan nan nan];

T = [0 0; 1 0; 0 1];

T0 = [0.25 c];

bar = pointbary(T0,T)

p0 = decasteljau3xyz(Bx,By,Bz,bar);
norm(p0)

%oddaljenosti
 odd = [];
 
 for i = 0:5
     for j=0:(5-i)
        tmpbar = [(5-i-j)/5, i/5, j/5]
        p = decasteljau3xyz(Bx,By,Bz,tmpbar);
        odd = [odd, norm(p-p0)];
     end
 end
 
sum(odd)/length(odd)

%dolzina vektorja 
 x = vectorbary([1 -1], T); 
 
 %odvod
 dp = dbezier3(Bx,By,Bz, 1, x,0,[], bar);
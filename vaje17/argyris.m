function B = argyris(T,f,Df,Hf)
% Opis:
%  argyris izracuna Bezierjeve ordinate polinoma dveh
%  spremenljivk stopnje 5, ki interpolira vrednosti, prve in
%  druge odvode podane funkcije f v ogliscih trikotnika ter
%  odvode funkcije f v srediscih stranic trikotnika v smeri,
%  pravokotni na stranico
%
% Definicija:
%  B = argyris(T,f,Df,Hf)
%
% Vhodni podatki:
%  T    tabela velikosti 3 x 2, v kateri vsaka vrstica
%       predstavlja oglisce trikonika, nad katerim je
%       definiran polinom,
%  f    funkcija, ki jo interpoliramo,
%  Df   gradient funkcije, ki jo interpoliramo,
%  Hf   Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
%  B    matrika velikosti 6 x 6, ki predstavlja koeficiente
%       polinoma dveh spremenljivk stopnje 5 v Bezierjevi
%       obliki


B = NaN(6,6);
V1 = T(1,:);
x1 = V1(1);
y1 = V1(2);
V2 = T(2,:);
x2 = V2(1);
y2 = V2(2);
V3 = T(3,:);
x3 = V3(1);
y3 = V3(2);


%v1
B(1,1) = f(x1,y1);
B(1,2) = f(x1,y1)+1/5*dot(Df(x1,y1),(V2-V1)');
B(2,1) = f(x1,y1)+1/5*dot(Df(x1,y1),(V3-V1)');

B(1,3) = f(x1,y1)+2/5*dot(Df(x1,y1),(V2-V1)')+1/20*dot((V2-V1)',Hf(x1,y1)*(V2-V1)');
B(2,2) = f(x1,y1)+1/5*dot(Df(x1,y1),(V2-V1)')+1/5*dot(Df(x1,y1),(V3-V1)')+1/20*dot((V3-V1)',Hf(x1,y1)*((V2-V1)'));
B(3,1) = f(x1,y1)+2/5*dot(Df(x1,y1),(V3-V1)')+1/20*dot((V3-V1)',Hf(x1,y1)*(V3-V1)');

%v2
B(1,6) = f(x2,y2);
B(2,5) = f(x2,y2)+1/5*dot(Df(x2,y2),(V3-V2)');
B(1,5) = f(x2,y2)+1/5*dot(Df(x2,y2),(V1-V2)');

B(1,4) = f(x2,y2)+2/5*dot(Df(x2,y2),(V1-V2)')+1/20*dot((V1-V2)',Hf(x2,y2)*(V1-V2)');
B(2,4) = f(x2,y2)+1/5*dot(Df(x2,y2),(V1-V2)')+1/5*dot(Df(x2,y2),(V3-V2)')+1/20*dot((V3-V2)',Hf(x2,y2)*((V1-V2)'));
B(3,4) = f(x2,y2)+2/5*dot(Df(x2,y2),(V3-V2)')+1/20*dot((V3-V2)',Hf(x2,y2)*(V3-V2)');
%3
B(6,1) = f(x3,y3);
B(5,2) = f(x3,y3)+1/5*dot(Df(x3,y3),(V2-V3)');
B(5,1) = f(x3,y3)+1/5*dot(Df(x3,y3),(V1-V3)');

B(4,1) = f(x3,y3)+2/5*dot(Df(x3,y3),(V1-V3)')+1/20*dot((V1-V3)',Hf(x3,y3)*(V1-V3)');
B(4,2) = f(x3,y3)+1/5*dot(Df(x3,y3),(V2-V3)')+1/5*dot(Df(x3,y3),(V1-V3)')+1/20*dot((V1-V3)',Hf(x3,y3)*((V2-V3)'));
B(4,3) = f(x3,y3)+2/5*dot(Df(x3,y3),(V2-V3)')+1/20*dot((V2-V3)',Hf(x3,y3)*(V2-V3)');

%sredina
n1 = [0 -1;1 0]*(V2-V1)'/norm(V2-V1);
theta1 = vectorbary([n1(1) n1(2)],T);
B(2,3) = 8/15*1/theta1(3)*dot(Df(1/2*x1 + 1/2*x2,1/2*y1+1/2*y2),n1)-1/6*(B(2,1)+4*B(2,2)+4*B(2,4)+B(2,5))+...
    -1/6*theta1(1)/theta1(3)*(B(1,1)+4*B(1,2)+6*B(1,3)+4*B(1,4)+B(1,5))+...
    -1/6*theta1(2)/theta1(3)*(B(1,6)+4*B(1,5)+6*B(1,4)+4*B(1,3)+B(1,2));

n2 = [0 -1;1 0]*(V3-V2)'/norm(V3-V2);
theta2 = vectorbary([n2(1) n2(2)],T);
B(3,3) = 8/15*1/theta2(1)*dot(Df(1/2*x2+1/2*x3,1/2*y2+1/2*y3),n2)-1/6*(B(1,5)+4*B(2,4)+4*B(4,2)+B(5,1))+...
    -1/6*theta2(2)/theta2(1)*(B(1,6)+4*B(2,5)+6*B(3,4)+4*B(4,3)+B(5,2))+...
    -1/6*theta2(3)/theta2(1)*(B(6,1)+4*B(5,2)+6*B(4,3)+4*B(3,4)+B(2,5));

n3 = [0 -1;1 0]*(V1-V3)'/norm(V1-V3);
theta3 = vectorbary([n3(1) n3(2)],T);
B(3,2) = 8/15*1/theta3(2)*dot(Df(1/2*x3+1/2*x1,1/2*y3+1/2*y1),n3)-1/6*(B(5,2)+4*B(4,2)+4*B(2,2)+B(1,2))+...
    -1/6*theta3(3)/theta3(2)*(B(6,1)+4*B(5,1)+6*B(4,1)+4*B(3,1)+B(2,1))+...
    -1/6*theta3(1)/theta3(2)*(B(1,1)+4*B(2,1)+6*B(3,1)+4*B(4,1)+B(5,1));


end
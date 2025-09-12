function u = pointbary(P,T)
% Opis:
% pointbary vrne baricentrične koordinate točke glede na dan trikotnik
%
% Definicija:
% u = pointbary(P,T)
%
% Vhodna podatka:
% P vrstica, ki predstavlja kartezične koordinate točke v ravnini,
% T matrika s tremi vrsticami, v kateri vsaka vrstica predstavlja
% kartezične koordinate oglišč trikotnika
%
% Izhodni podatek:
% u vrstica dolžine 3, ki predstavlja baricentrične koordinate
% točke, podane s P, glede na trikotnik, podan s T

T=[1 1 1; T'];

P=[1, P];

u1=T;
v1=T;
w1=T;

u1(:,1)=P;
v1(:,2)=P;
w1(:,3)=P;

d=det(T);

u=[det(u1),det(v1),det(w1)]/d;

end
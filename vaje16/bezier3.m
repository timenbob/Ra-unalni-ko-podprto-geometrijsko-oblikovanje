function b = bezier3 ( Bx , By , Bz , U )
% Opis :
% bezier3 izračuna točke na trikotni Bezierjevi ploskvi
%
% Definicija :
% b = bezier3 (Bx ,By ,Bz ,U)
%
% Vhodni podatki :
% Bx , By , Bz matrike velikosti n+1 x n+1 , ki določajo
% koordinate kontrolnih točk Bezierjeve krpe
% (element posamezne matrike na mestu (i,j),
% j <= n+2 -i, določa koordinato kontrolne
% točke z indeksom (n+2 -i-j, j -1 , i -1)),
% U matrika , v kateri vrstice predstavljajo
% baricentrične koordinate točk glede na
% domenski trikotnik , za katere računamo
% točke na Bezierjevi krpi
%
% Izhodni podatek :
% b matrika , v kateri vsaka vrstica predstavlja
% točko na Bezierjevi krpi pri istoležnih
% parametrih iz matrike U

m = size(U,1);
b = zeros(m,3);

for i = 1:m
    b(i,:)= decasteljau3(Bx,By,Bz, U(i,:));
end

end
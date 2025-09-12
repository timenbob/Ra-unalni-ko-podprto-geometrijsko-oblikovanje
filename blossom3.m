function b = blossom3 (B , U)
% Opis :
% blossom3 izračuna razcvet polinoma dveh spremenljivk
%
% Definicija :
% b = blossom3 (B,U)
%
% Vhodna podatka :
% B matrika velikosti n+1 x n+1 , ki predstavlja
% koeficiente polinoma dveh spremenljivk stopnje n v
% Bezierjevi obliki ( element matrike na mestu (i,j),
% j <= n+2 -i, določa koeficient polinoma z indeksom
% (n+2 -i-j, j -1 , i -1) ),
% U matrika velikosti n x 3 , v kateri vrstice
% predstavljavo baricentrične koordinate točk glede
% na domenski trikotnik , za katere izvajamo razcvet
% polinoma
%
% Izhodni podatek :
% b vrednost razcveta polinoma , določenega z matriko B,
% v točkah , določenih z matriko U

%stopnja
n = size(U,1);

%naredimo en razcvet

for r=1:n
u = U(r,1);
v = U(r,2);
w = U(r,3);

%cez vrstice
    for i = 1:((n+1)- r)
        %cez stolpce
        for j = 1:((n+1)- r)
            B(i,j) = u*B(i,j)+v*B(i,j+1)+w*B(i+1,j);
        end
    end
end 

b = B(1,1);
end
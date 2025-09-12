function b = blossom3(B,U)
% Opis:
% blossom3 izračuna razcvet polinoma dveh spremenljivk
%
% Definicija:
% b = blossom3(B,U)
%
% Vhodna podatka:
% B matrika velikosti n+1 x n+1, ki predstavlja koeficiente
% polinoma dveh spremenljivk stopnje n v Bezierjevi obliki
% (element matrike na mestu (i,j), j <= n+2-i, določa
% koeficient polinoma z indeksom (n+2-i-j, j-1, i-1)),
% U matrika velikosti n x 3, v kateri vrstice predstavljavo
% baricentrične koordinate točk glede na domenski trikotnik,
% za katere izvajamo razcvet polinoma
%
% Izhodni podatek:
% b vrednost razcveta polinoma, določenega z matriko B, v
% točkah, določenih z matriko U
n1 = length(B(1,:));
n = n1-1;
prejsna_tabela=B;
for stevec=1:n
    velikost_tabele = n1-stevec;
    temp_tabela = zeros(velikost_tabele);
    for i=1:velikost_tabele
        for j=1:(velikost_tabele+1-i)
            temp_tabela(i,j)=U(stevec,1)*prejsna_tabela(i,j)+U(stevec,2)*prejsna_tabela(i,j+1)+U(stevec,3)*prejsna_tabela(i+1,j);
        end
    end
    prejsna_tabela=temp_tabela;

end
b=prejsna_tabela(1,1);
end
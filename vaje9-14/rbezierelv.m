function [Be,we] = rbezierelv(B,w)
% Opis:
% rbezierelv izvede višanje stopnje racionalne Bezierjeve krivulje
%
% Definicija:
% [Be,we] = rbezierelv(B,w)
%
% Vhodna podatka:
% B matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
% d-dimenzionalno kontrolno točko racionalne Bezierjeve krivulje
% stopnje n,

% w seznam uteži racionalne Bezierjeve krivulje
%

% Izhodni podatek:
% Be matrika velikosti n+2 x d, v kateri vsaka vrstica predstavlja
% d-dimenzionalno kontrolno točko racionalne Bezierjeve krvulje
% stopnje n+1, ki ustreza dani racionalni Bezierjevi krivulji,
% we seznam dolžine n+2, v katerem vsak element predstavlja utež
% racionalne Bezierjeve krvulje stopnje n+1, ki ustreza dani
% racionalni Bezierjevi krivulji

n = size(B,1) -1;
d = size(B,2);

% generiranje n+1 x d tock, ki so w_i*b_i
Be = B;
for i=1:n+1
    Be(i,:) = w(i) * B(i,:);
end
%generiranje matrike A, ki je velikosti n+1xd+1, zadnji stolpec so prvotne
%utezi
 

A = [Be, w];
%navadno visanje bezierjeve krivulje za 1 in dobimo velikost matrike n+2xd+1
rez = bezierelv(A,1);
%koncne utezi so zadnji stolpec
we = rez(:,end);

%generiranje tock, ki so tocke deljene z zadnjim stolpcem, ki je velikosti
%n+2 x d, ker smo zvisali red za 1
for i=1:n+2
    Be(i,:) = rez(i,1:d) ./ we(i);
end

end
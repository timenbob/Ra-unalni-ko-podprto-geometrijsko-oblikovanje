function b = bezier(B,t)
% Opis:
% bezier vrne točke na Bezierjevi krivulji pri danih parametrih
%
% Definicija:
% b = bezier(B,t)
%
% Vhodna podatka:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bezierjeve krivulje
%
% Izhodni podatek:
% b matrika velikosti k x d, kjer i-ta vrstica predstavlja točko
% na Bezierjevi krivulji pri parametru iz t na i-tem mestu

nd = size(B);
n = nd(1)-1; % imamo n točk
d = nd(2);   % so v d-dimenzionalnem prostoru
b = zeros(d, length(t));

for i = 1:d
    for j = 1:length(t)
        d = decasteljau(B(:,i),t(j));
        b(i,j) = d(1,n+1);
    end
end
end

%B = [0 0; 1 2; 3 3; 4 -1; 0 2];
%t = linspace(0,1,10);
%bezieer(B,t)
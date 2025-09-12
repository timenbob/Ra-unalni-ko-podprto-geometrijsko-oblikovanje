function b = bezier(B,t)
    % Opis:
    %  bezier vrne točke na Bezierjevi krivulji pri danih parametrih
    %
    % Definicija:
    %  b = bezier(B,t)
    %
    % Vhodna podatka:
    % B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
    % Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
    % t seznam parametrov dolžine k, pri katerih računamo vrednost
    % Bezierjeve krivulje
    %
    % Izhodni podatek:
    %  b    matrika velikosti k x d, kjer i-ta vrstica predstavlja točko
    %  na Bezierjevi krivulji pri parametru iz t na i-tem mestu, torej
    %  vrstica1 = (x pri t(1), y pri t(1))

k = length(t);
d = length(B(1,:));

b = zeros(k,d);

for i=1:k
    for j=1:d
        v = decasteljau(B(:,j),t(i));
        b(i,j) = v(1,end);
    end
end

b;
end
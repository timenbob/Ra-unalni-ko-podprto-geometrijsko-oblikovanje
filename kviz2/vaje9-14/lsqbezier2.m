function B = lsqbezier2(m,n,P)
% Opis:
%  lsqbezier2 vrne koeficiente tenzorskega polinoma, ki po metodi
%  najmanjših kvadratov najbolje aproksimira dane podatke
%
% Definicija:
%  B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
% m,n           parametra, ki določata stopnjo polinoma, 
% P             matrika podatkov, ki v vsaki vrstici vsebuje parametra z
%               intervala [0,1] ter njima pripadajočo vrednost
%
%
% Izhodni podatek:
%  B        matrika velikosti n+1 x m+1 s koeficienti polinoma, ki po
%           metodi najmanjših kvadratov najbolje aproksimira podatke
u = P(:, 1);
v = P(:, 2);
f = P(:, 3);
K = size(P,1);
A = zeros(K,(n+1)*(m+1));

for k=1:K
    for j=0:n
        for i=0:m
            %izracunamo Bernsteinove polinome B_i_m(u) in B_j_n(v)
            B_u = nchoosek(m,i) .* (u(k)^i) .* (1-u(k))^(m-i);
            B_v = nchoosek(n,j) .* (v(k)^j) .* (1-v(k))^(n-j);
            A(k,j*(m+1)+i+1) = B_u * B_v; 
        end
    end
end

b_vektor = A\f;
B = reshape(b_vektor,m+1,n+1)';

end
function Be = bezierelv(B,k)
% Opis:
% bezierelv izvede višanje stopnje dane Bezierjeve krivulje
%
% Definicija:
% Be = bezierelv(B,k)
%
% Vhodna podatka:
% B matrika velikosti (n+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krivulje stopnje n,
% k število, ki določa, za koliko želimo zvišati stopnjo
% dane Bezierjeve krivulje
%
% Izhodni podatek:
% Be matrika velikosti (n+k+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krvulje stopnje n+k, ki ustreza dani Bezierjevi krivulji
[n,d] =size(B);
n = n - 1;

Be = zeros(n+2,d);


for j=1:d
    Be(1,j) = B(1,j);
    Be(n+2,j) = B(n+1,j);
    for i=2:n+1
        Be(i,j) = B(i-1,j).* ((i-1)/(n+1)) + B(i,j) .* (1-((i-1)/(n+1)));
    end
end

if k~=1
    Be = bezierelv(Be,k-1);
end
end

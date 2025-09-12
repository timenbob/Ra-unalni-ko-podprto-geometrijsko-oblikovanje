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
n = size(B,1)-1;
d = size(B,2);

Be=B;
for a =1:k
    dimN=size(Be,1)-1;

    B_novi=zeros(dimN+2,d);

    B_novi(1,:)=Be(1,:);
    B_novi(end,:)=Be(end,:);

    for i=1:dimN
        B_novi(i+1,:)=(1-i/(dimN+1))*Be(i+1,:)+(i/(dimN+1))*Be(i,:);
    end
    
    Be=B_novi;
end

end
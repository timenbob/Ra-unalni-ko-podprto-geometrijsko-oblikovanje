function [Bx,By,Bz] = coons(Bx,By,Bz)
  % Opis:
  %  coons vrne kontrolne točke Coonsove ploskve
  %
  % Definicija:
  %  [Bx,By,Bz] = coons(Bx,By,Bz)
  %
  % Vhodni podatki:
  %  Bx, By, Bz     matrike velikosti n+1 x m+1, ki določajo koordinate
  %                 robnih kontrolnih točk (v konstrukciji Coonsove
  %                 ploskve se upoštevajo kontrolne točke, ki jih določa
  %                 prva in zadnja vrstica ter prvi in zadnji stolpec
  %                 posamezne matrike)
  %
  %
  % Izhodni podatki:
  %  Bx, By, Bz   matrike velikosti n+1 x m+1, ki določajo koordinate
  %               kontrolnih točk Coonsove ploskve

n = size(Bx,1) - 1;
m = size(Bx,2) - 1;

B = zeros(n+1,m+1,3);
B1 = zeros(n+1,m+1,3);
B2 = zeros(n+1,m+1,3);
B3 = zeros(n+1,m+1,3);

% prva B. krivulja
for i=0:m
    for j=0:n
        B1(j+1,i+1,1) = (1-j/n).*Bx(1,i+1) + j/n .* Bx(end,i+1);
        B1(j+1,i+1,2) = (1-j/n).*By(1,i+1) + j/n .* By(end,i+1);
        B1(j+1,i+1,3) = (1-j/n).*Bz(1,i+1) + j/n .* Bz(end,i+1);
    end
end

% druga B. krivulja
for i=0:m
    for j=0:n
        B2(j+1,i+1,1) = (1-i/m).*Bx(j+1,1) + i/m .* Bx(j+1,end);
        B2(j+1,i+1,2) = (1-i/m).*By(j+1,1) + i/m .* By(j+1,end);
        B2(j+1,i+1,3) = (1-i/m).*Bz(j+1,1) + i/m .* Bz(j+1,end);
    end
end

% tretja B. krivulja
for i=0:m
    for j=0:n
        B3(j+1,i+1,1) = (1-i/m)*(1-j/n).*Bx(1,1) + (1-i/m)*(j/n).*Bx(end,1) + (i/m)*(1-j/n).* Bx(1,end) + (i*j/(m*n)).*Bx(end,end);
        B3(j+1,i+1,2) = (1-i/m)*(1-j/n).*By(1,1) + (1-i/m)*(j/n).*By(end,1) + (i/m)*(1-j/n).* By(1,end) + (i*j/(m*n)).*By(end,end);
        B3(j+1,i+1,3) = (1-i/m)*(1-j/n).*Bz(1,1) + (1-i/m)*(j/n).*Bz(end,1) + (i/m)*(1-j/n).* Bz(1,end) + (i*j/(m*n)).*Bz(end,end);
    end
end

% koncne tocke
B(:,:,1) = B1(:,:,1) + B2(:,:,1) - B3(:,:,1);
B(:,:,2) = B1(:,:,2) + B2(:,:,2) - B3(:,:,2);
B(:,:,3) = B1(:,:,3) + B2(:,:,3) - B3(:,:,3);

Bx = B(:,:,1);
By = B(:,:,2);
Bz = B(:,:,3);

end
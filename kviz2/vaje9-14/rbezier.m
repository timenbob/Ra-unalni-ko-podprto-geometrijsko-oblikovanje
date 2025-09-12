function b = rbezier(B,w,t)
% Opis:
% rbezier vrne točke na racionalni Bezierovi krivulji, izračunane z
% de Casteljaujevim postopkom za racionalne krivulje
%
% Definicija:
% b = rbezier(B,w,t)
%
% Vhod:
% B matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
% eno kontrolno točko racionalne Bezierjeve krivulje stopnje n
% v prostoru dimenzije d,


% w seznam uteži racionalne Bezierjeve krivulje,
%kok privacijo tocke

% t seznam parametrov dolžine N, za katere se računajo točke na
% racionalni Bezierjevi krivulji
%
% Izhod:
% b matrika velikosti N x d, v kateri i-ta vrstica predstavlja
% točko na racionalni Bezierjevi krivulji pri i-tem parametru
% iz seznama t
[n,m]=size(B);
lw=length(w);
b=NaN(length(t),m);

for i=1:length(t) % za vsak t
    for k=1:m % vsaka komponenta
        td=t(i);
        br=NaN(n,n);
        br(:,1)=B(:,k); %nastavimo prvi stolpec
        for r=2:n
            for j=1:n-1
                w(j,r)=(1-td)*w(j,r-1)+td*w(j+1,r-1);
                br(j,r)=(1-td)*w(j,r-1)*br(j,r-1)/w(j,r)+td*w(j+1,r-1)*br(j+1,r-1)/w(j,r);
            end
    
        end
        w;
        br;
     b(i,k)=br(1,end);
    end

end

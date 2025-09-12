function [db,dB] = bezierder2(B,r,t)
% poleg vrednosti odvoda v podanih t-jih vnre še točke kontrolnega poligona
% odvoda
% Opis :
% bezierder vrne tocke na krivulji , ki predstavlja odvod
% dane Bezierjeve krivulje
%
% Definicija :
% db = bezierder (B,r,t)
%
% Vhodni podatki :
% B matrika kontrolnih tock Bezierjeve krivulje , v
% kateri vsaka vrstica predstavlja eno kontrolno
% tocko ,
% r stopnja odvoda , ki ga racunamo ,
% t seznam parameterov , pri katerih racunamo odvod
%
% Izhodni podatek :
% db matrika , v kateri vsaka vrstica predstavlja tocko
% r- tega odvoda pri istoležnem parametru iz seznama t

nd = size(B);
n = nd(1)-1;
d = nd(2);
db = zeros(length(t),d);

for j = 1:length(t)
    for i = 1:d
        dC = decasteljau(B(:,i),t(j));
        dCr = dC(1:r+1, n-r+1);
        db(j,i) = factorial(n)/factorial(n-r) * diff(dCr,r);
    end
end

for i=r:-1:1
    % na vsakem koraku, če gre za prvi odvod pomnožim s stopnjo n,
    % če gre za drugi odvod pomnožim z 1 manj od stopnje n,
    % če gre za tretji odvod pomnožim z 2 manj od stopnje n itd.
    dB = diff(B) .* (n+1-i);
    B = dB;
end

db;
dB;

end
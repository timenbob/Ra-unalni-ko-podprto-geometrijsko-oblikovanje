function [bx,by,bz] = bezier2(Bx ,By ,Bz,u,v)
% Opis:
%   bezier2  vrne  toèke  na  Bezierjevi  ploskvi  iz  tenzorskega
%   produkta
%
% Definicija:
%   [bx ,by, bz] = bezier2(Bx,By ,Bz,u,v)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  doloèajo
%   koordinate  kontrolnih  toèk ,
%   u, v vrstici  dolžine M in N, ki  predstavljata
%    parametre v smereh u in v.
%
% Izhodni  podatki:
%   bx , by, bz    matrike  velikosti N x M, ki  predstavljajo
%           toèke  na  Bezierjevi  ploskvi:
%           [bx(J,I) by(J,I) bz(J,I)] je  toèka  pri
%           parametrih u(I) in v(J).

[n,m] = size(Bx);
n = n-1;
m = m-1;
M = length(u);
N = length(v);

bx = zeros(N,M);
by = zeros(N,M);
bz = zeros(N,M);

kontrolne_x = zeros(m+1,1);
kontrolne_y = zeros(m+1,1);
kontrolne_z = zeros(m+1,1);

for indeks_u  = 1:M
    for indeks_v = 1:N
        uu = u(indeks_u);
        vv = v(indeks_v);
        for i = 0:m
            kontrolne_x(i+1) = bezier(Bx(:,i+1),vv);
            kontrolne_y(i+1) = bezier(By(:,i+1),vv);
            kontrolne_z(i+1) = bezier(Bz(:,i+1),vv);
        end
        
        bx(indeks_v,indeks_u) = bezier(kontrolne_x,uu);
        by(indeks_v,indeks_u) = bezier(kontrolne_y,uu);
        bz(indeks_v,indeks_u) = bezier(kontrolne_z,uu);
       
    end
end


end
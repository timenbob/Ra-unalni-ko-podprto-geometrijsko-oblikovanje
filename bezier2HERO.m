function [bx,by,bz] = bezier2HERO(Bx,By,Bz,u,v)
% Opis:
% bezier2 vrne točke na Bezierjevi ploskvi iz tenzorskega produkta
%
% Definicija:
% [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
% Bx, By, Bz matrike velikosti n+1 x m+1, ki predstavljajo
% koordinate kontrolnih točk,
% u, v vrstici dolžine M in N, ki predstavljata parametre
% v smereh u in v
%
% Izhodni podatki:
% bx, by, bz matrike velikosti N x M, ki predstavljajo točke na
% Bezierjevi ploskvi: [bx(J,I) by(J,I) bz(J,I)] je
% točka pri parametrih u(I) in v(J)

% ???
%n = size(Bx,1)-1;
%m = size(By,2)-1;

%M = length(u);
%N = length(v);

%bx = zeros(N, M);
%by = zeros(N, M);
%bz = zeros(N, M);

bx = bezier(Bx, v);
by = bezier(By, v);
bz = bezier(Bz, v);

bx = bezier(bx', u)';
by = bezier(by', u)';
bz = bezier(bz', u)';

end
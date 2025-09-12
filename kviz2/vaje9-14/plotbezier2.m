function p = plotbezier2(Bx,By,Bz,u,v)
  % Opis:
  %  plotbezier nariše Bezierjevo ploskev iz tenzorskega produkta
  %
  % Definicija:
  %  p = plotbezier2(Bx,By,Bz,u,v)
  %
  % Vhodni podatki:
  %  Bx, By, Bz  matrike velikosti n+1 x m+1, ki predstavljajo
  %              koordinate kontrolnih točk,
  %  u, v        vrstici, ki predstavljata parametre v smereh u in v
  % 
  % Izhodni podatek:
  %  p    grafični objekt, ki določa ploskev

[bx,by,bz] = bezier2(Bx,By,Bz,u,v);


p = surf(bx,by,bz);
hold on;
n = size(Bx,1);
m = size(Bx,2);

for j=1:m
    plot3(Bx(:,j), By(:,j), Bz(:,j), 'k-');
end
for i=1:n
    plot3(Bx(i,:), By(i,:), Bz(i,:), 'k-');
end

end
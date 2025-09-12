function plotbezier (B , t, tr)
% Opis :
% plotbezier nariše Bezierjevo krivuljo za dane kontrolne
% to?ke in seznam parametrov
%
% Definicija :
% plotbezier (B,t)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dolžine k, pri katerih ra?unamo
% vrednost Bezierjeve krivulje

[~, d] = size(B);
b = bezier(B, t);

if nargin == 3
    B = B*tr;
    b = b*tr;
end

if d == 2
    hold on
    plot(B(:, 1), B(:, 2), 'k')
    plot(B(:, 1), B(:, 2), 'b.', 'MarkerSize', 20)
    plot(b(:, 1), b(:, 2), 'b')
    hold off
elseif d == 3
    hold on
    plot(B(:, 1), B(:, 2), B(:, 3), 'k')
    plot(B(:, 1), B(:, 2), B(:, 3), 'b.', 'MarkerSize', 20)
    plot3(b(:, 1), b(:, 2), b(:, 3), 'b')
    hold off
else
    sprintf('Preve? ali premalo dimenzij!')
end
end
    
    
    
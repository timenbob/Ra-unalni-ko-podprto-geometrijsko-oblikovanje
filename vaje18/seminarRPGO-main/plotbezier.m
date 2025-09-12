function p = plotbezier(B,t,c)
    % Opis:
    %  plotbezier nariše Bezierjevo krivuljo za dane kontrolne točke in
    %  seznam parametrov
    %
    % Definicija:
    %  p = plotbezier(B,t,c)
    %
    % Vhodni podatki:
    % B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
    % Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
    % t seznam parametrov dolžine k, pri katerih računamo vrednost
    % Bezierjeve krivulje,%
    % c opcijski parameter, ki določa barvo krivulje
    %
    % Izhodni podatek:
    % p  grafični objekt, ki določa krivuljo

if nargin < 3
    c = 'red';
end

b = bezier(B,t);

hold on
plot(B(:,1), B(:,2), 'ko-', 'MarkerFaceColor', c, 'MarkerSize', 3);

p = plot(b(:,1), b(:,2),c);

hold off
end

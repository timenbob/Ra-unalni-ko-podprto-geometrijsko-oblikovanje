function S = argyrisspline(tri,f,Df,Hf)
% Opis:
%  argyrisspline izracuna Bezierjeve predstavitve polinomov,
%  ki dolocajo Argyrisov zlepek nad triangulacijo
%
% Definicija:
%  S = argyrisspline(tri,f,Df,Hf)
%
% Vhodni podatki:
%  tri  objekt razreda triangulation, ki doloca
%       triangulacijo domene, nad katero aproksimiramo
%       funkcijo f,
%  f    funkcija, ki jo interpoliramo,
%  Df   gradient funkcije, ki jo interpoliramo,
%  Hf   Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
%  S    celica z dolzino, ki ustreza stevilu trikotnikov v
%       triangulaciji, v kateri vsak element vsebuje matriko
%       velikosti 6 x 6, ki predstavlja koeficiente
%       Argyrisovega polinoma v Bezierjevi obliki

n = length(tri.ConnectivityList); %število trikotnikov v triangulaciji

S=cell(n,1);

for i=1:n
    indeksi_trikotnika = tri.ConnectivityList(i,:);
    tocke_trikotnika =tri.Points(indeksi_trikotnika,:);
    S{i}=argyris(tocke_trikotnika,f,Df,Hf);
end

end
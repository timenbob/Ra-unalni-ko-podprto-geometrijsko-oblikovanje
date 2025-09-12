function BS = beziersub(B,t)
% Opis:
% beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija:
% BS = beziersub(B,t)
%
% Vhodni podatki:
% B matrika kontrolnih točk Bezierjeve krivulje, v kateri
% vsaka vrstica predstavlja eno kontrolno točko,
% t parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
% BS celica, ki vsebuje kontrolne točke dveh krivulj, ki jih
% dobimo s subdivizijo prvotne Bezierjeve krivulje
d = length(B(1,:));

BS_left = cell(1, d);
BS_right = cell(1, d);

for i=1:d
    %decasteljau za vsak stolpec
    deca = decasteljau(B(:,i),t);
    %prva vrstica = kontrolne tocke desnega dela
    %diagonala = kontrolne tocke levega dela
    BS_right{i} = deca(1,:)';
    BS_left{i} = diag(fliplr(deca));
end

% da zdruzimo oba dela v eno matriko
BS_left = cell2mat(BS_left);
BS_right = cell2mat(BS_right);


BS = {BS_right, BS_left};

end


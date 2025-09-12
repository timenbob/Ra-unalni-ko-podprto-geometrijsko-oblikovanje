function S = lsqbezier2spline(M,N,m,n,P)
% Opis:
%  lsqbezier2spline vrne kontrolne tocke tenzorskih
%  polinomov, ki dolocajo zvezno odvedljiv zlepek, ki v
%  smislu metode najmanjsih kvadratov najbolje aproksimira
%  dane podatke
%
% Definicija:
%  S = lsqbezier2spline(M,N,m,n,P)
%
% Vhodni podatki:
%  M,N      parametra, ki dolocata delitev domene,
%  m,n      parametra, ki dolocata stopnjo polinoma nad
%           pravokotnikom delitve,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje
%           parametra z intervala [0,1] ter njima
%           pripadajoco vrednost, ki jo aproksimiramo
%
% Izhodni podatek:
%  S        celica velikosti N+1 x M+1, v kateri vsak
%           element vsebuje matriko s koeficienti polinoma,
%           ki doloca zlepek nad pravokotnikom delitve
%           domene

S = cell(N+1,M+1);
U = linspace(0,1,M+1);
V = linspace(0,1,N+1);

% lokalna aproksimacija
for I = 1:M
    for J = 1:N
        P2 = P(P(:,1) >= U(I) & P(:,1) <= U(I+1) & P(:,2) >= V(J) & P(:,2) <= V(J+1),:);

        u_novi = (P2(:,1) - U(I))/(U(I+1) - U(I));
        v_novi = (P2(:,2) - V(J))/(V(J+1) - V(J));
        P_novi = P2;
        P_novi(:,1) = u_novi;
        P_novi(:,2) = v_novi;
        S{J,I} = lsqbezier2(m,n,P_novi);
    end
end

% glajenje
% 1
for I = 1:M
    for J = 2:N
        b_IJ = S{J,I};
        b_IJ_minus1 = S{J-1,I};
        for i = 0:m
            vrednost = 0.5 * b_IJ_minus1(n,i+1) + 0.5 * b_IJ(2,i+1);
            b_IJ(1,i+1) = vrednost;
            b_IJ_minus1(n+1,i+1) = vrednost;
        end
        S{J,I} = b_IJ;
        S{J-1,I} = b_IJ_minus1;
    end
end
% 2
for I = 2:M
    for J = 1:N
        b_IJ = S{J,I};
        b_I_minus1_J = S{J,I-1};
        for j = 0:n
            vrednost = 0.5 * b_I_minus1_J(j+1,m) + 0.5 * b_IJ(j+1,2);
            b_IJ(j+1,1) = vrednost;
            b_I_minus1_J(j+1,m+1) = vrednost;
        end
        S{J,I} = b_IJ;
        S{J,I-1} = b_I_minus1_J;
    end
end
% 3
for I = 2:M
    for J = 2:N
        b_IJ = S{J,I};
        b_I_minus1_J = S{J,I-1};
        b_I_minus1_J_minus1 = S{J-1,I-1};
        b_IJ_minus1 = S{J-1,I};
        
        vrednost = 0.25 * b_IJ(2,2) + 0.25 * b_I_minus1_J(2,m) + 0.25 *  b_I_minus1_J_minus1(n,m) + 0.25 * b_IJ_minus1(n,2);
        
        b_IJ(1,1) = vrednost;
        b_I_minus1_J(1,m+1) = vrednost;
        b_I_minus1_J_minus1(n+1,m+1) = vrednost;
        b_IJ_minus1(n+1,1) = vrednost;
        
        S{J,I} = b_IJ;
        S{J,I-1} = b_I_minus1_J;
        S{J-1,I-1} = b_I_minus1_J_minus1;
        S{J-1,I} = b_IJ_minus1;
    end
end

end
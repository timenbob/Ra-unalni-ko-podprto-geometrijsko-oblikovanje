function S = lsqbezier2splineHERO(M,N,m,n,P)
    % Opis:
    % lsqbezier2spline vrne kontrolne točke tenzorskih polinomov, ki
    % določajo zvezno odvedljiv zlepek, ki v smislu metode najmanjših
    % kvadratov najbolje aproksimira dane podatke
    %
    % Definicija:
    % S = lsqbezier2spline(M,N,m,n,P)
    %
    % Vhodni podatki:
    % M,N parametra, ki določata delitev domene parametrizacije,
    % m,n parametra, ki določata stopnjo polinoma nad pravokotnikom
    % delitve,
    % P matrika podatkov, ki v vsaki vrstici vsebuje parametra z
    % intervala [0,1] ter njima pripadajočo vrednost
    %
    % Izhodni podatek:
    % S celica velikosti N x M, v kateri vsak element vsebuje
    % matriko s koeficienti polinoma, ki določa zlepek nad
    % pravokotnikom delitve domene

    U = linspace(0,1,M+1); % nastavimo delitev intervala [0,1] po u-jih
    V = linspace(0,1,N+1); % nastavimo delitev intervala [0,1] po v-jih
    S = cell(N,M);

    % za vsak par (I,J) dolocimo kontrolne tocke za Bezierjeve krivuljo
    % po MNK za interval [U_I-1,U_I]x[V_J-1,V_J]

    % Najprej moramo za vsako vrstico matrike P ugotoviti, v kateri pravokotnik
    % spadajo ti podatki:

    for I = 1:M
        for J = 1:N
            prvi = find(P(:,1) >= U(I) & P(:,1) <= U(I+1));
            drugi = find(P(:,2) >= V(J) & P(:,2) <= V(J+1));
            vrstice = intersect(prvi,drugi);
            podatki = P(vrstice',:);
            % treba spremenit uk, vk da bodo na intervalu [0,1]

            podatki(:,1) = (podatki(:,1) - U(I)) ./ (U(I+1) - U(I));
            podatki(:,2) = (podatki(:,2) - V(J)) ./ (V(J+1) - V(J));

            % izracunamo kontrolne tocke po metodi najmanjsih kvadratov
            S{J,I} = lsqbezier2(m,n,podatki);
        end
    end

    % nastavimo še zveznosti, zgladimo
    for I = 1:M
        for J = 2:N
            b1 = S{J-1, I};
            b2 = S{J,I};
            b2(1,:) = 1/2*b1(n,:) + 1/2*b2(2,:);
            b1(n+1, :) = 1/2*b1(n,:) + 1/2*b2(2,:);
            S{J-1,I} = b1;
            S{J,I} = b2;
        end
    end

    for J = 1:N
        for I = 2:M
            b1 = S{J,I-1};
            b2 = S{J,I};
            b2(:,1) = 1/2*b1(:,m) + 1/2*b2(:,2);
            b1(:,m+1) = 1/2*b1(:,m) + 1/2*b2(:,2);
            S{J,I-1} = b1;
            S{J,I} = b2;
        end
    end

    for I = 2:M
        for J = 2:N
            b1 = S{J,I};
            b2 = S{J,I-1};
            b3 = S{J-1,I-1};
            b4 = S{J-1,I};
            izracun = 1/4*b1(2,2)+1/4*b2(2,m)+1/4*b3(n,m)+1/4*b4(n,2);
            b1(1,1) = izracun;
            b2(1,m+1) = izracun;
            b3(n+1,m+1) = izracun;
            b4(n+1,1) = izracun;
            S{J,I} = b1;
            S{J,I-1} = b2;
            S{J-1,I-1} = b3;
            S{J-1,I} = b4;
        end
    end

end
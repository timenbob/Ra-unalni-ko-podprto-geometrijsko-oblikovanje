format long
function b = power2bernstein(p)
% Opis:
% power2bernstein pretvori polinom, predstavljen s koeficienti v
% potenčni bazi, v polinom, predstavljen v Bernsteinovi bazi
%
% Definicija:
% b = power2bernstein(p)
%
% Vhodni podatek:
% p seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v potenčni bazi od x^n do 1
%
% Izhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v Bernsteinovi bazi od 0-tega do n-tega
% Bernsteinovega baznega polinoma

%binomski b = nchoosek(n,k)

 n = length(p) - 1; % Degree of the polynomial
    b = zeros(1, n + 1); % Initialize Bernstein coefficients

    for i = 0:n
        % Calculate the Bernstein coefficients using the formula
        for j = i:n
            b(n+1-i) = b(n+1-i) + nchoosek(j, i) / nchoosek(n, j) * p(j+1) ;
        end
    end
end


function p = bernstein2power(b)
% bernstein2power converts a polynomial represented in Bernstein basis
% to its power basis representation
n = length(b) - 1; % Degree of the polynomial
p = zeros(1, n + 1); % Initialize power coefficients

for i = 0:n
    % Calculate the power coefficients using the inverse formula
    for j = i:n
        p(i+1) = p(i+1) + (-1)^(i + j) * nchoosek(n, j) * nchoosek(j, i) * b(n+1-j);
    end
end
end



p = [4 7 2 8 9 1 4];
b = power2bernstein(p)
p1 = bernstein2power(b);
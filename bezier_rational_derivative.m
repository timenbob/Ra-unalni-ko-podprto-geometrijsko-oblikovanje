function R_derivative = bezier_rational_derivative(P, w, t)
    % P: matrika kontrolnih točk (vsaka vrstica je ena kontrolna točka)
    % w: vektor uteži
    % t: vrednost parametra, pri kateri želimo izračunati odvod
    
    n = size(P, 1) - 1; % stopnja Bézierjeve krivulje
    B = bernstein_basis(n, t); % Bernsteinovi polinomi pri t
    B_derivative = bernstein_derivative(n, t); % Odvod Bernsteinovih polinomov pri t
    
    % Izračun N(t) in D(t)
    N = sum((w .* P) .* B', 1); % Števec
    D = sum(w .* B);           % Imenovalec
    
    % Izračun N'(t) in D'(t)
    N_prime = sum((w .* P) .* B_derivative', 1); % Odvod števca
    D_prime = sum(w .* B_derivative);           % Odvod imenovalca
    
    % Odvod racionalne Bézierjeve krivulje
    R_derivative = (N_prime * D - N * D_prime) / D^2;
end

function B = bernstein_basis(n, t)
    % Izračuna Bernsteinove polinome stopnje n pri vrednosti t
    B = zeros(1, n + 1);
    for i = 0:n
        B(i + 1) = nchoosek(n, i) * t^i * (1 - t)^(n - i);
    end
end

function B_derivative = bernstein_derivative(n, t)
    % Izračuna odvod Bernsteinovih polinomov stopnje n pri vrednosti t
    B_derivative = zeros(1, n + 1);
    for i = 0:n
        if i > 0
            B_derivative(i + 1) = n * nchoosek(n - 1, i - 1) * t^(i - 1) * (1 - t)^(n - i);
        end
        if i < n
            B_derivative(i + 1) = B_derivative(i + 1) - n * nchoosek(n - 1, i) * t^i * (1 - t)^(n - i - 1);
        end
    end
end

function integral = simpsonWn(a_coeffs, a, b, N)
    % SIMPSONWN Oblicza całkę z wielomianu w_n(x) metodą Simpsona
    % 
    % Wejście:
    %   a_coeffs - współczynniki a_k
    %   a, b - przedział całkowania
    %   N - liczba podprzedziałów (musi być parzysta)
    % 
    % Wyjście:
    %   integral - całka policzona metodą Simpsona
    %
    % n - stopień wielomianu

    n = length(a_coeffs) - 1;
    H = (b - a) / N;

    x_nodes = linspace(a, b, N + 1);          
    x_midpoints = x_nodes(1:end-1) + H / 2;

    T_nodes = CzebyszewT(n, x_nodes);        
    U_nodes = CzebyszewU(n, x_nodes);       
    T_midpoints = CzebyszewT(n, x_midpoints);
    U_midpoints = CzebyszewU(n, x_midpoints);

    w_nodes = sum(a_coeffs' .* (T_nodes + U_nodes), 1);
    w_midpoints = sum(a_coeffs' .* (T_midpoints + U_midpoints), 1);

    integral = H * (w_nodes(1) + w_nodes(end) + 2 * sum(w_nodes(2:end-1)) + 4 * sum(w_midpoints)) / 6;
end


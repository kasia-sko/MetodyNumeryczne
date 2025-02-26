function T = CzebyszewT(n, x)
    % CZEBYSZEWT Oblicza wielomiany Czebyszewa T_n(x) w zadanych punktach x
    % 
    % Wejście:
    %   n - stopień wielomianu Czebyszewa (n >= 0)
    %   x - wektor punktów, w których mają zostać obliczone wartości wielomianów
    % 
    % Wyjście:
    %   T - macierz o wymiarach (n+1) x length(x), gdzie T(k, :) zawiera wartości 
    %       wielomianu Czebyszewa T_(k-1)(x) dla punktów x.
    %       - T(1, :) = T_0(x) = 1
    %       - T(2, :) = T_1(x) = x
    %       - T(k+1, :) = 2*x.*T(k, :) - T(k-1, :) dla k > 1

    T = zeros(n+1, length(x));  
    T(1, :) = 1;
    if n > 0
        T(2, :) = x;
    end
    for k = 2:n
        T(k+1, :) = 2*x.*T(k, :) - T(k-1, :);
    end
end
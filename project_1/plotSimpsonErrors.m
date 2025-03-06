function plotSimpsonErrors(param_type, a_coeffs_list, exact_values, N_max, a_values, b_values)
    % plotSimpsonErrors - Rysuje wykres błędu bezwzględnego i względnego metody Simpsona w zależności od liczby    
    % podprzedziałów dla podanych wielomianów.
    % 
    % Wejście:
    %   param_type     - Typ parametru ('degree', 'interval', 'coeffs'), 
    %    w zależności od tego co chcemy analizować, to
    %   będzie wyświetlać legenda
    %   a_coeffs_list  - Lista wektorów współczynników wielomianów
    %   exact_values   - Wektor dokładnych wartości całki
    %   N_max          - Maksymalna liczba podprzedziałów
    %   a_values       - Wektor początków przedziałów całkowania
    %   b_values       - Wektor końców przedziałów całkowania

    N_values = 1:100:N_max;
    num_cases = length(a_coeffs_list); 

    markers = {'-o', '-s', '-x', '-d', '-^', '-v', '-p', '-h'};
    num_markers = length(markers);

    abs_errors = zeros(num_cases, length(N_values));
    rel_errors = zeros(num_cases, length(N_values));

    for j = 1:num_cases
        a_coeffs = a_coeffs_list{j};
        exact_value = exact_values(j);
        a = a_values(j); 
        b = b_values(j); 
        for i = 1:length(N_values)
            N = N_values(i);
            integral = simpsonWn(a_coeffs, a, b, N);
            abs_errors(j, i) = abs(exact_value - integral);
            rel_errors(j, i) = abs_errors(j, i) / abs(exact_value);
        end
    end

    legend_labels = strings(1, num_cases); 
    for j = 1:num_cases
        switch param_type
            case 'degree'
                legend_labels(j) = sprintf('Stopień: %d', length(a_coeffs_list{j}) - 1);
            case 'interval'
                legend_labels(j) = sprintf('Przedział: [%g, %g]', a_values(j), b_values(j));
            case 'coeffs'
                legend_labels(j) = sprintf('Współczynniki: %s', mat2str(a_coeffs_list{j}(1:min(5, end))));
            otherwise
                error('Nieznany typ parametru: %s', param_type);
        end
    end


    figure;
    hold on;
    for j = 1:num_cases
        marker_style = markers{mod(j-1, num_markers) + 1};
        plot(N_values, abs_errors(j, :), marker_style, 'MarkerSize', 4, 'DisplayName', legend_labels(j));
    end
    xlabel('Liczba podprzedziałów N', 'FontSize',16);
    ylabel('Błąd bezwzględny całkowania', 'FontSize',16);
    title('Błąd bezwzględny metody Simpsona', 'FontSize', 16);
    set(gca, 'YScale', 'log');
    set(gca, 'FontSize', 16);
    legend show;
    legend('FontSize', 18);
    grid on;
    hold off;

    figure;
    hold on;
    for j = 1:num_cases
        marker_style = markers{mod(j-1, num_markers) + 1};
        plot(N_values, rel_errors(j, :), marker_style, 'MarkerSize', 4, 'DisplayName', legend_labels(j));
    end
    xlabel('Liczba podprzedziałów N', 'FontSize',16);
    ylabel('Błąd względny całkowania', 'FontSize',16);
    title('Błąd względny metody Simpsona', 'FontSize', 16);
    set(gca, 'YScale', 'log');
    set(gca, 'FontSize', 16);
    legend show;
    legend('FontSize', 18);
    grid on;
    hold off;

end
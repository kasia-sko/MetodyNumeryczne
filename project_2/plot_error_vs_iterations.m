function plot_error_vs_iterations(error)
    % PLOT ERROR_VS_iTERATIONS Rysuje wykres błędu od liczby iteracji
    %Wejście:
    %   - error - wektor błędów z funkcji Gaussa-Seidela dla każdej iteracji
    
    num_iterations = length(error);
    figure;
    plot(1:num_iterations, error, 'o-', 'LineWidth', 1.5);
    xlabel('Iteracja');
    ylabel('Błąd (norma Frobeniusa)');
    title('Błąd w zależności od liczby iteracji');
    grid on;
end


% SKRYPT TESTUJĄCY

% % PRZYPADEK 1 - MAŁY PROMIEŃ
% disp("PRZYPADEK 1")
% n_1 = 4;
% A_1 = 10*diag(ones(n_1, 1)) + 20*diag(ones(n_1-1, 1),1) + diag(-ones(n_1-1, 1), -1)
% B_1 = [1, 2; 
%         3, 4; 
%         5, 6; 
%         7, 8]
% 
% [X_1, counter_1,error_1] = gauss_seidel_AX(A_1, B_1);
% X_ref_1 = A_1\ B_1;
% num_iter = length(error_1);
% iter_idx = (1:num_iter)';
% resultTable = table(iter_idx, error_1, ...
%     'VariableNames', {'Iteration', 'Error'});
% disp(resultTable);
% disp(['Liczba iteracji: ', num2str(counter_1)]);
% disp(['Promień spektralny macierzy iteracji: ', num2str(spectral_r(A_1))]);
% condition_number = cond(A_1);
% disp(['Współczynnik uwarunkowania macierzy A: ', num2str(condition_number)]);
% error_r =  norm(X_1 - X_ref_1, 'fro');
% disp(['Błąd względny wyznaczonego przybliżenia X: ', num2str(error_r)]);
% plot_error_vs_iterations(error_1);



% %PRZYPADEK 2 DUZY PROMIEN SPEKTRALNY
% disp("PRZYPADEK 2")
% n = 4;
% %A = 10*diag(ones(n, 1)) + 15*diag(ones(n-1, 1),1) + diag(-ones(n-1, 1), -1)
% A_2 = diag(10*ones(5,1)) + 5*ones(5);
% B_2 = [1, 2; 
%         3, 4; 
%         5, 6; 
%         7, 8;
%         9,10];
% [X_2, counter_2, error_2] = gauss_seidel_AX(A_2, B_2)
% X_ref_2 = A_2 \ B_2;
% num_iter = length(error_2);
% iter_idx = (1:num_iter)';
% resultTable = table(iter_idx, error_2, ...
%     'VariableNames', {'Iteration', 'Error'});
% disp(resultTable);
% disp(['Liczba iteracji: ', num2str(counter_2)]);
% disp(['Promień spektralny macierzy iteracji: ', num2str(spectral_r(transpose(A_2)))]);
% condition_number = cond(A_2);
% disp(['Współczynnik uwarunkowania macierzy A: ', num2str(condition_number)]);
% error_r =  norm(X_2 - X_ref_2, 'fro');
% disp(['Błąd względny wyznaczonego przybliżenia X: ', num2str(error_r)]);
% plot_error_vs_iterations(error_2);

% Przykład różnych macierzy A z różnymi promieniami spektralnymi
% A1 = [4, 1; 1, 3];                   % Promień spektralny mały
% A2 = [10, -1, 20; -1, 10, -1; 2, -1, 10]; % Promień spektralny średni
% A3 = [10, -6, 1; 
%            -6, 12, -6; 
%             9, -6, 10]; % Promień spektralny duży
% B1 = [1; 2];       
% B2 = [1; 2; 3];    
% B3 = [1; 2; 3];   
% A_matrices = {A1, A2, A3};
% B_matrices = {B1, B2, B3};
% names = {'A1', 'A2', 'A3'};
% results = [];
% for i = 1:length(A_matrices)
%     A = A_matrices{i};
%     B = B_matrices{i};
%     r = spectral_r(A);
%     [X, iter_count, error] = gauss_seidel_AX(A, B);
%     blad = norm(X - A\B, 'fro');
%     X_ref = A \ B;
%     error_r = norm(X - X_ref, 'fro');
%     results = [results; {names{i}, r, iter_count, error_r}];
% end
% resultTable = cell2table(results, 'VariableNames', {'Macierz', 'PromienSpektralny', 'LiczbaIteracji', 'BladWzgledny'});
% disp(resultTable);


% % PRZYPADEK 3 PORÓWNANIE DLA MACIERZY O BRAKU DOMINACJI PRZEKĄTNEJ
% % Wartości do przetestowania nad przekątną
% values_above_diag = [2, 10, 30, 60, 100];
% num_cases = length(values_above_diag);
% Results = table('Size', [num_cases, 7], ...
%     'VariableTypes', {'double', 'double', 'double', 'double', 'double', 'double', 'logical'}, ...
%     'VariableNames', {'SumOnDiagonal', 'MaxSumOffDiagonal', 'Iterations', 'CondA', 'SpectralRadius', 'RelativeError', 'RowDominance'});
% n = 4; 
% B_XA = transpose([1, 2; 
%                   3, 4; 
%                   5, 6; 
%                   7, 8]);
% for i = 1:num_cases
%     value = values_above_diag(i);
%     A = 10 * diag(ones(n, 1)) + value * diag(ones(n-1, 1), 1) + diag(-ones(n-1, 1), -1);
%     d= diag(A);
%     sum_diag = d(1); 
%     sum_off_diag = sum(A(1, :)) - sum_diag; 
%     row_dominance = true;  
%     for row = 1:n
%         sum_row = sum(abs(A(row, :))) - abs(A(row, row));  
%         if abs(A(row, row)) <= sum_row  
%             row_dominance = false;
%             break;  
%         end
%     end
% 
%     [X_XA, counter_XA, error] = gauss_seidel_XA(A, B_XA);
%     X_ref = B_XA / A; 
%     error_r = norm(X_XA - X_ref, 'fro') / norm(X_ref, 'fro'); 
%     spectral_radius = spectral_r(A);
%     condition_number = cond(A);
% 
%     Results.SumOnDiagonal(i) = sum_diag;
%     Results.MaxSumOffDiagonal(i) = sum_off_diag;
%     Results.Iterations(i) = counter_XA;
%     Results.CondA(i) = condition_number;
%     Results.SpectralRadius(i) = spectral_radius;
%     Results.RelativeError(i) = error_r;
%     Results.RowDominance(i) = row_dominance;
% end
% disp('Tabela wyników dla różnych sum na diagonali i poza diagonalą:');
% disp(Results);


% % PRZYPADEK 4 - MACIERZE BLISKIE OSOBLIWYM
% A_cases = {
%     [1, 1, 1; 1, 1.11, 1; 1, 1, 1.2], ... 
%     [1, 1, 1; 1, 1.005, 1; 1, 1, 1.005], ... 
%     [1, 1, 1; 1, 1.001, 1; 1, 1, 1.001] ... 
% };
% B = [6; 12; 3];
% 
% results = cell(length(A_cases), 1);
% errors_all = cell(length(A_cases), 1);
% 
% for i = 1:length(A_cases)
%     A = A_cases{i};
%     det_A = det(A);
%     cond_A = cond(A);
%     try
%         X_ref = A \ B;
%     catch
%         X_ref = NaN(size(B));
%     end
%     [X, iter_count, error] = gauss_seidel_AX(A, B);
%     errors_all{i} = error;
%     if ~any(isnan(X_ref))
%         relative_error = norm(X - X_ref, 'fro') / norm(X_ref, 'fro');
%     else
%         relative_error = NaN;
%     end
%     spectral_radius = spectral_r(A);
%     results{i} = table(det_A, cond_A, spectral_radius, iter_count, relative_error, ...
%         'VariableNames', {'Determinant', 'ConditionNumber', 'SpectralRadius', 'Iterations', 'RelativeError'});
% end
% for i = 1:length(results)
%     disp(['Przypadek ', num2str(i), ':']);
%     disp(results{i});
% end
% 
% figure;
% hold on;
% for i = 1:length(errors_all)
%     plot(1:length(errors_all{i}), errors_all{i}, '-o', 'DisplayName', ['Przypadek ', num2str(i)]);
% end
% xlabel('Iteracja');
% ylabel('Błąd');
% title('Zbieżność metody Gaussa-Seidla');
% legend('show');
% grid on;


% % PRZYPADEK 5 - ROZNE B
% A_5 = [4, 1, 2; 
%      1, 3, -1; 
%      2, -1, 3]
% 
% % Różne przypadki B
% B_cases = {
%     [6; 12; 3], ... 
%     [60; 120; 30], ... 
%     [60000; 120000; 30000] ... 
% };
% disp(['Promień spektralny macierzy iteracji: ', num2str(spectral_r(A_5))])
% disp(['Współczynnik uwarunkowania macierzy A: ', num2str(cond(A_5))]);
% for i = 1:length(B_cases)
%     disp(' ');
%     disp(['Przypadek B_', num2str(i), ':']);
%     B = B_cases{i}
%     [X, iter_count, error] = gauss_seidel_AX(A_5, B);
%     disp(['Liczba iteracji: ', num2str(iter_count)]);
%     error_r = norm(X - A_5 \ B,"fro");
%     disp(['Błąd względny: ', num2str(error_r)]);
% end

% %PRZYPADEK 6
% % 1. Symetryczne i dodatnio określone
% A1 = [4, 1, 1; 1, 3, 1; 1, 1, 2];
% A2 = [6, -2, 0; -2, 5, -1; 0, -1, 4];
% A3 = [10, 2, 1; 2, 8, -1; 1, -1, 7];
% 
% % 2. Symetryczne, ale nie dodatnio określone
% A4 = [1, 2, 3; 2, -4, 1; 3, 1, 0];  
% A5 = [-2, 1, 0; 1, -1, 0; 0, 0, -3];
% A6 = [0, 1, -1; 1, 0, 1; -1, 1, 0]; 
% A_matrices = {A1, A2, A3, A4, A5, A6};
% names = {'A1', 'A2', 'A3', 'A4', 'A5', 'A6'};
% 
% B_matrices = {
%     [1; 2; 3],
%     [3; -1; 2],
%     [5; 4; 3],
%     [2; 1; -1],
%     [1; -3; 2],
%     [-1; 0; 1]
% };
% Results = table('Size', [length(A_matrices), 6], ...
%     'VariableTypes', {'string', 'logical', 'double', 'double', 'double', 'double'}, ...
%     'VariableNames', {'Matrix', 'PositiveDefinite', 'CondA', 'SpectralRadius', 'Iterations', 'RelativeError'});
% for i = 1:length(A_matrices)
%     A = A_matrices{i};
%     B = B_matrices{i};
%     try
%         chol(A); 
%         dodatnio_okreslona = true;
%     catch
%         dodatnio_okreslona = false;
%     end
%         [X, iter_count, error] = gauss_seidel_AX(A, B);
%     spectral_radius = spectral_r(A);
%     condition_number = cond(A);
%     X_ref = A \ B;  
%     relative_error = norm(X - X_ref, 'fro') / norm(X_ref, 'fro');
% 
%     Results.Matrix(i) = names{i};
%     Results.PositiveDefinite(i) = dodatnio_okreslona;
%     Results.CondA(i) = condition_number;
%     Results.SpectralRadius(i) = spectral_radius;
%     Results.Iterations(i) = iter_count;
%     Results.RelativeError(i) = relative_error;
% end
% 
% disp('PRZYPADEK 6:');
% disp(Results);
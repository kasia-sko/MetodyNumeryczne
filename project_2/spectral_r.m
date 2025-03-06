function r = spectral_r(A)
%SPECTRAL_R Oblicza promień spektralny macierzy iteracji dla metody Gaussa
%Seidela
%Wejście:
%   - A - kwadratowa macierz układu równań nxn
% Wyjście:
%    - r - promień spektralny macierzy iteracji B_GS = (D - L)^{-1} * U

    D = diag(diag(A));    
    L = tril(A, -1);    
    U = triu(A, 1);  
    B_GS = (D - L) \ U;
    r = max(abs(eig(B_GS)));
end
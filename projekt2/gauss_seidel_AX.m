function [X, counter, error] = gauss_seidel_AX(A, B)
%GAUSS_SEIDEL_AX Rozwiązuje równanie macierzowe AX=B metodą Gaussa-Seidela 
%Wejście:
%   - A - macierz kwadratowa wymiaru nxn
%   - B - macierz wymiaru nxm
%Wyjście:
%   - X - macierz rozwiązań wymiaru nxm
%   - counter - liczba wykonanych iteracji
%   - error - wektor błędu w każdej iteracji
%
% X - przybliżenie początkowe
% tol - tolerancja błedu, warunek zbieżności sprawdzany przy pomocy normy Frobeniusa

    [n, m] = size(B);
    X = zeros(n, m);
    tol = 1e-10;
    max_iter = 10000; 
    counter = 0;
    error = zeros(max_iter, 1);
    for iter = 1:max_iter     
        counter = iter;       
        X_old = X;            
        for i = 1:n
            sum1 = A(i, 1:i-1) * X(1:i-1, :); 
            sum2 = A(i, i+1:n) * X_old(i+1:n, :);
            X(i, :) = (B(i, :) - sum1 - sum2) / A(i, i);
        end
        error(iter) = norm(X - X_old, 'fro');
        if error(iter) < tol
            break;
        end
    end
    error = error(1:counter);
end
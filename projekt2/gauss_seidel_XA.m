function [X,counter,error] = gauss_seidel_XA(A, B)
%GAUSS_SEIDEL_XA Rozwiązuje równanie macierzowe XA=B metodą Gaussa-Seidela 
%Wejście:
%   - A - macierz kwadratowa wymiaru nxn
%   - B - macierz wymiaru mxn 
%Wyjście:
%   - X - macierz rozwiązań wymiaru mxn
%   - counter - liczba wykonanych iteracji
%   - error - wektor błędu w każdej iteracji

    [X,counter,error] = gauss_seidel_AX(transpose(A), transpose(B));
    X = transpose(X);
   
end

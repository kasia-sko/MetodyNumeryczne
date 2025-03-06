% Przykład uruchomienia programu
a = 0;         % Początek przedziału
b = 1;          % Koniec przedziału
N = 1000;         % Liczba podprzedziałów
a_coeffs = 1:101; % Wektor współczynników
integral = simpsonWn(a_coeffs, a, b, N);
% Wyświetlenie wyniku
fprintf('Całka wielomianu w_n(x) obliczana metodą Simpsona wynosi: %.15f\n', integral);

% wystarczy odkomentować linijkę wywołującą rysowanie danego wykresu

% TEST 1
% Pierwszy zestaw danych: różne stopnie wielomianów
a_coeffs_list1 = {1:11, 1:51, 1:101}; % Współczynniki
exact_values1 = [3427/315, ...
    4763272166298217732847/96845140757687397075, ...
    5531245264998083533600302387236275095577/57335834892855655562938987611276565425]; % Dokładne wartości całkowania policzone w Wolframie
N_max = 100000; % maksymalna liczba podpodziałów
a_values1 = [0, 0, 0]; % Początek przedziału
b_values1 = [1, 1, 1]; % Koniec przedziału
%plotSimpsonErrors('degree', a_coeffs_list1, exact_values1, N_max, a_values1, b_values1);

% TEST 1_1
a_coeffs_list1_1 = {ones(1,11), ones(1,51), ones(1,101)};
exact_values1_1 = [5623/1386, ...
    209378839973631924121/38738056303074958830, ...
    34999462715821020805039736616293773757173/5790919324178421211856837748738933107925]; 
N_max = 100000; 
a_values1_1 = [0, 0, 0]; 
b_values1_1 = [1, 1, 1]; 
%plotSimpsonErrors('degree', a_coeffs_list1_1, exact_values1_1, N_max, a_values1_1, b_values1_1);


% TEST 2
% Drugi zestaw danych: różne współczynniki
a_coeffs_list2 = {0.1 * ones(1, 101), 5 * ones(1, 101), 100 * ones(1, 101)};
exact_values2 = [34999462715821020805039736616293773757173 / 57909193241784212118568377487389331079250, ...
                34999462715821020805039736616293773757173/1158183864835684242371367549747786621585, ...
                139997850863284083220158946465175095028692 / 231636772967136848474273509949557324317];
N_max = 100000;
a_values2 = [0, 0, 0]; 
b_values2 = [1, 1, 1]; 
%plotSimpsonErrors('coeffs', a_coeffs_list2, exact_values2, N_max, a_values2, b_values2);

%TEST 2_1
% mniejsze stopnie wielomianow (5) + różne współczynniki
k = 1:6;
a_coeffs_list2_1 = {0.1 * ones(1, 6), (1 + 1/1000).^k};
exact_values2_1 = [109/300, ...
               21840044056046018803/6000000000000000000];
N_max = 100000;
a_values2_1 = [0, 0]; 
b_values2_1 = [1, 1]; 
%plotSimpsonErrors('coeffs', a_coeffs_list2_1, exact_values2_1, N_max, a_values2_1, b_values2_1);

%TEST 2_2
% mniejsze stopnie wielomianow + różne współczynniki
k = 1:3;
a_coeffs_list2_2 = {0.1 * ones(1, 3), (1 + 1/1000).^k};
exact_values2_2 = [7/20, ...
               7010003/2000000];
N_max = 1000;
a_values2_2 = [0, 0];
b_values2_2 = [1, 1]; 
%plotSimpsonErrors('coeffs', a_coeffs_list2_2, exact_values2_2, N_max, a_values2_2, b_values2_2);

%TEST 2_3
% mniejsze stopnie wielomianow + różne współczynniki: male i duze
k = 1:3;
a_coeffs_list2_3 = {0.1 * ones(1, 3), (10).^k};
exact_values2_3 = [7/20, ...
               170];
N_max = 1000;
a_values2_3 = [0, 0]; 
b_values2_3 = [1, 1]; 
%plotSimpsonErrors('coeffs', a_coeffs_list2_3, exact_values2_3, N_max, a_values2_3, b_values2_3);

%TEST 2_4
a_coeffs_list2_4 = {1:11, 11:-1:1};
exact_values2_4 = [3427/315, ...
               130993/3465];
N_max = 10000;
a_values2_4 = [0, 0];
b_values2_4 = [1, 1]; 
%plotSimpsonErrors('coeffs', a_coeffs_list2_4, exact_values2_4, N_max, a_values2_4, b_values2_4);


% TEST 3
% Trzeci zestaw danych: różne przedziały
k_3 = 1:11;
a_coeffs_list3 = {1 ./ k_3, 1 ./ k_3, 1 ./ k_3}; % Współczynniki dla trzech stopni wielomianów
exact_values3 = [177911213/64033200, ...
    280397653237/16008300, ...
    20439160573898615993027154845/160083];
N_max = 10000;
a_values3 = [0, 0, 0]; 
b_values3 = [1, 2, 100]; 
%plotSimpsonErrors('interval', a_coeffs_list3, exact_values3, N_max, a_values3, b_values3);

% TEST 3_1
a_coeffs_list3_1 = {1:11, 1:11, 1:11}; 
exact_values3_1 = [3427/315, ...
    612685844/315, ...
    9899930086025540/63];
N_max = 10000;
a_values3_1 = [0, 0, 0]; % Początek przedziałów
b_values3_1 = [1, 2, 10]; % Koniec przedziałów
%plotSimpsonErrors('interval', a_coeffs_list3_1, exact_values3_1, N_max, a_values3_1, b_values3_1);

% TEST 3_2
k_3 = 1:11;
a_coeffs_list3_2 = {1 ./ k_3, 1 ./ k_3, 1 ./ k_3}; 
exact_values3_2 = [0.0000000148802, ...
    280397653237/16008300, ...
    20321402938707556786347883745094170106099070167287357945720000/160083];
N_max = 10000;
a_values3_2 = [0, 0, 0]; 
b_values3_2 = [0.00000001, 2, 100000]; 
%plotSimpsonErrors('interval', a_coeffs_list3_2, exact_values3_2, N_max, a_values3_2, b_values3_2);

% TEST3_3_3
a_coeffs_list3_3 = {[1/1000,1/1000,1/1000,1/1000]}; 
exact_values3_3 = [300001999980000000];
N_max = 10000;
a_values3_3 = [0]; 
b_values3_3 = [100000]; 
%plotSimpsonErrors('interval', a_coeffs_list3_3, exact_values3_3, N_max, a_values3_3, b_values3_3);
%fprintf('Całka wielomianu w_n(x) obliczana metodą Simpsona wynosi: %.30f\n', simpsonWn([1/1000,1/1000,1/1000,1/1000],0,100000,10000));

% TEST4
% funkcja nieparzysta
a_coeffs_list4 = {[0,0,0,1],[0,0,0,1],[0,0,0,1]}; 
exact_values4 = [0,0,0];
N_max = 10000;
a_values4 = [-1,-10,-100]; 
b_values4 = [1,10,100]; 
%plotSimpsonErrors('interval', a_coeffs_list4, exact_values4, N_max, a_values4, b_values4);
%fprintf('Całka wielomianu w_n(x) obliczana metodą Simpsona wynosi: %.30f\n', simpsonWn([0,0,0,1],-10,10,100000000));
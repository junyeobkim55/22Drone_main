clc
clear

%% KRW
KRW=input('How much money do you want to exchange(KRW)? ');

%% USD

% USD Dollar Unit
% 1, 2, 5, 10, 20 ,50 ,100
% 4/18 USD Exchange Rate 1 USD = 1,234.30 KRW
% USDER : Exchange Rate in USD
USDER=1234.30;

USD=KRW/USDER;

%% EUR

% EUR Euro Unit
% 5, 10, 20, 50, 100, 200 ,500
% 4/18 EUR Exchange Rate 1 EUR = 1,331.90 EUR
% EURER : Exchange Rate in EUR
EURER=1331.90;

EUR=KRW/EURER;
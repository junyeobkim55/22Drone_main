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

% 화폐 종류 행렬은 화폐의 첫 문자로 하였다 %

D=[100 50 20 10 5 2 1];
nD=length(D);

for k=1:nD
    d(k)=mod(USD,D(k));
    D_count(k)=(USD-d(k))/D(k);
    USD=USD-D_count(k)*D(k);
end

D100=D_count(1);
D50=D_count(2);
D20=D_count(3);
D10=D_count(4);
D5=D_count(5);
D2=D_count(6);
D1=D_count(7);

%USD Total
USD_Total=D100+D50+D20+D10+D5+D2+D1;

fprintf(['Total number of USD dollars pieces is %f pieces.' ...
    '\nThe number of 100 dollars pieces is %f.' ...
    '\nThe number of 50 dollars pieces is %f.' ...
    '\nThe number of 20 dollars pieces is %f.' ...
    '\nThe number of 10 dollars pieces is %f.' ...
    '\nThe number of 5 dollars pieces is %f.' ...
    '\nThe number of 2 dollars pieces is %f.' ...
    '\nThe number of 1 dollars pieces is %f.'],USD_Total,D100,D50,D20,D10,D5,D2,D1);

%% EUR

% EUR Euro Unit
% 5, 10, 20, 50, 100, 200 ,500
% 4/18 EUR Exchange Rate 1 EUR = 1,331.90 EUR
% EURER : Exchange Rate in EUR
EURER=1331.90;

EUR=KRW/EURER;
%% JPY

% JPY Yen Unit
% 1000 2000 5000 10000
% 4/18 JPY Exchange Rate 1 JPY = 9.75 KRW
% JPYER : Exchange Rate in JPY
JPYER=9.75;

JPY=KRW/JPYER;

%% CNY

% CNY Yuan Unit
% 1 2 5 10 20 50 100
% 4/18 CNY Exchange Rate 1 CNY = 193.90 KRW
% CNYER : Exchange Rate in CNY

CNYER=193.90;

CNY=KRW/CNYER;
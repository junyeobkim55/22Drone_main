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

%100dollar
d1=mod(USD,100);
D100=(USD-d1)/100;
m1=USD-D100*100;
%50dollar
d2=mod(m1,50);
D50=(m1-d2)/50;
m2=m1-D50*50;
%20dollar
d3=mod(m2,20);
D20=(m2-d3)/20;
m3=m2-D20*20;
%10dollar
d4=mod(m3,10);
D10=(m3-d4)/10;
m4=m3-D10*10;
%5dollar
d5=mod(m4,5);
D5=(m4-d5)/5;
m5=m4-D5*5;
%2dollar
d6=mod(m5,2);
D2=(m5-d6)/2;
m6=m5-D2*2;
%1dollar
d7=mod(m6,1);
D1=m6-d7;
m7=m6-D1;
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
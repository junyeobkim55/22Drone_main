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

% Matrix D : Unit of Dollar
% D_count : The number of dollar pieces
% D100 : The number of 100 dollar pieces
% D50 : The number of 50 dollar pieces
% D20 : The number of 20 dollar pieces
% D10 : The number of 10 dollar pieces
% D5 : The number of 5 dollar pieces
% D2 : The number of 2 dollar pieces
% D1 : The number of 1 dollar pieces

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

%USD Total : Total number of dollar pieces
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

% JPY_new를 새로 지정한 이유는 sym에서 정수만 사용가능하기 때문에 소수점을 
% 제거하였다
JPY_new=JPY-mod(JPY,1);



% Matrix J : Unit of Yen
% J_count : The number of Yen pieces
% J10000 : The number of 10000 Yen pieces
% J5000 : The number of 5000 Yen pieces
% J2000 : The number of 2000 Yen pieces
% J1000 : The number of 1000 Yen pieces

J=[10000 5000 2000 1000];
nJ=length(J);

for k=1:nJ
    [Q,R]=quorem(sym(JPY_new),sym(J(k)));
    J_count(k)=Q;
    JPY_new=R;
end

J10000=J_count(1);
J5000=J_count(2);
J2000=J_count(3);
J1000=J_count(4);

%JPY Total : Total number of Yen pieces
JPY_Total=J10000+J5000+J2000+J1000;

fprintf(['Total number of JPY Yen pieces is %f pieces.' ...
    '\nThe number of 10000 Yen pieces is %f.' ...
    '\nThe number of 5000 Yen pieces is %f.' ...
    '\nThe number of 2000 Yen pieces is %f.' ...
    '\nThe number of 1000 Yen pieces is %f.'],JPY_Total,J10000,J5000,J2000,J1000);


%% CNY

% CNY Yuan Unit
% 1 2 5 10 20 50 100
% 4/18 CNY Exchange Rate 1 CNY = 193.90 KRW
% CNYER : Exchange Rate in CNY

CNYER=193.90;

CNY=KRW/CNYER;
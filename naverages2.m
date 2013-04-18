cd(dirn);

ale = zeros(1,2);
ti = zeros(1,2);

load data16;
hdi = di;
htm = tm;
%havinti = avinti;
ale(1) = size(hdi,2);
ti(1) = size(hdi,1);

% -------------------------------------------------------------------------
cd(path_current)
ma = length(avinti(1,:));
s = zeros(1,ma);

for j = 1:ma
s(j) = std(avinti(1:100,j));
end

novotoa = zeros(size(avinti(:,ma)));
ioi = zeros(size(avinti(:,ma)));

for i = 1: ma
[NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(tm(1:100, i), avinti(1:100, i), s(i));
ioi(:,i) = NewPar(1).*exp(NewPar(2).*tm(:,i));
havinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

load data18;
gdi = di;
gtm = tm;
gavinti = avinti;
ale(2) = size(gdi,2);
ti(2) = size(gdi,1);

% -------------------------------------------------------------------------
cd(path_current)
ma = length(avinti(1,:));
s = zeros(1,ma);

for j = 1:ma
s(j) = std(avinti(1:100,j));
end

novotoa = zeros(size(avinti(:,ma)));
ioi = zeros(size(avinti(:,ma)));

for i = 1: ma
[NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(tm(1:100, i), avinti(1:100, i), s(i));
ioi(:,i) = NewPar(1).*exp(NewPar(2).*tm(:,i));
gavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

a = min(ale);
b = min(ti);

ak(3) = a;
tk(3) = b;

gdi = gdi(1:b, 1:a);
gtm = gtm(1:b, 1:a);
gvinti = gavinti(1:b,1:a);

hdi = hdi(1:b, 1:a);
htm = htm(1:b, 1:a);
hvinti = havinti(1:b,1:a);

mdi = gdi + hdi;
mtm = gtm + htm;
mvinti = gvinti + hvinti;

mavdi = mdi/2;
mavtm = mtm/2;
mavinti = mvinti/2;

M = [mavdi, mavtm, mavinti];

cd('averages');

save('m.mat', 'mavdi', 'mavtm', 'mavinti' )

cd(path_current); % return home before calling others

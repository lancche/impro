cd(dirn);

ale = zeros(1,3);
ti = zeros(1,3);

load data1;
adi = di;
atm = tm;
% aavinti = avinti;
ale(1) = size(adi,2);
ti(1) = size(adi,1);

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
aavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------


load data4;
bdi = di;
btm = tm;
%bavinti = avinti;
ale(2) = size(bdi,2);
ti(2) = size(bdi,1);

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
bavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

load data7;
cdi = di;
ctm = tm;
%cavinti = avinti;
ale(3) = size(cdi,2);
ti(3) = size(cdi,1);

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
cavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

%..........................................

a = min(ale);
b = min(ti);

ak = zeros(1,4);
tk = zeros(1,4);

ak(1) = a;
tk(1) = b;

adi = adi(1:b,1:a);
atm = atm(1:b,1:a);
aavinti = aavinti(1:b,1:a);

bdi = bdi(1:b, 1:a);
btm = btm(1:b, 1:a);
bvinti = bavinti(1:b,1:a);

cdi = cdi(1:b, 1:a);
ctm = ctm(1:b, 1:a);
cvinti = cavinti(1:b,1:a);

kdi = adi+ bdi + cdi;
ktm = atm + btm + ctm;
kvinti = aavinti + bvinti + cvinti;

kavdi = kdi/3;
kavtm = ktm/3;
kavinti = kvinti/3;

K = [kavdi, kavtm, kavinti];

cd('averages');

save('k.mat', 'kavdi', 'kavtm', 'kavinti');

cd(path_current);

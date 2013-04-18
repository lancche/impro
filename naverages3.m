
cd(dirn);

ale = zeros(1,2);
ti = zeros(1,2);

load data15;
jdi = di;
jtm = tm;
%javinti = avinti;
ale(1) = size(jdi,2);
ti(1) = size(jdi,1);

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
javinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

load data2;
kdi = di;
ktm = tm;
%kavinti = avinti;
ale(2) = size(kdi,2);
ti(2) = size(kdi,1);

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
kavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

a = min(ale);
b = min(ti);

ak(4) = a;
tk(4) = b;

jdi = jdi(1:b, 1:a);
jtm = jtm(1:b, 1:a);
jvinti = javinti(1:b,1:a);

kdi = kdi(1:b, 1:a);
ktm = ktm(1:b, 1:a);
kvinti = kavinti(1:b,1:a);

mdi = jdi + kdi;
mtm = jtm + ktm;
mvinti = jvinti + kvinti;

mavdi = mdi/2;
mavtm = mtm/2;
mavinti = mvinti/2;

M = [mavdi, mavtm, mavinti];

cd('averages');

save('m.mat', 'mavdi', 'mavtm', 'mavinti' )

tao = [1:length(aavinti(:,1))];

figure(111);
plot(tao, aavinti(:,30), 'r');
hold on;
plot(tao, bvinti(:,30), 'y');
hold on; 
plot(tao, cvinti(:,30), 'g');
hold on; 
plot(tao, dvinti(:,30), 'b');
hold on;
plot(tao, evinti(:,30), 'c');
hold on; 
plot(tao, fvinti(:,30), 'm');
hold on;
plot(tao, hvinti(:,30), 'k');
hold on;
plot(tao, gvinti(:,30), 'r.');
hold on;
plot(tao, jvinti(:,30), 'y.');
hold on;
plot(tao, kvinti(:,30), 'g.');
hold off;

cd(path_current); % return home before calling others


cd(dirn);

ale = zeros(1,3);
ti = zeros(1,3);

load data9;
ddi = di;
dtm = tm;
davinti = avinti;
ale(1) = size(ddi,2);
ti(1) = size(ddi,1);


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
davinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
end

cd(dirn)
% -------------------------------------------------------------------------

% load data14;
% edi = di;
% etm = tm;
% % eavinti = avinti;
% ale(2) = size(edi,2);
% ti(2) = size(edi,1);
% 
% % -------------------------------------------------------------------------
% cd(path_current)
% ma = length(avinti(1,:));
% s = zeros(1,ma);
% 
% for j = 1:ma
% s(j) = std(avinti(1:100,j));
% end
% 
% novotoa = zeros(size(avinti(:,ma)));
% ioi = zeros(size(avinti(:,ma)));
% 
% for i = 1: ma
% [NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(tm(1:100, i), avinti(1:100, i), s(i));
% ioi(:,i) = NewPar(1).*exp(NewPar(2).*tm(:,i));
% eavinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
% end
% 
% cd(dirn)
% % -------------------------------------------------------------------------
% 
% load data13;
% fdi = di;
% ftm = tm;
% %favinti = avinti;
% ale(3) = size(fdi,2);
% ti(3) = size(fdi,1);
% 
% % -------------------------------------------------------------------------
% cd(path_current)
% ma = length(avinti(1,:));
% s = zeros(1,ma);
% 
% for j = 1:ma
% s(j) = std(avinti(1:100,j));
% end
% 
% novotoa = zeros(size(avinti(:,ma)));
% ioi = zeros(size(avinti(:,ma)));
% 
% for i = 1: ma
% [NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(tm(1:100, i), avinti(1:100, i), s(i));
% ioi(:,i) = NewPar(1).*exp(NewPar(2).*tm(:,i));
% favinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
% end
% 
% cd(dirn)
% -------------------------------------------------------------------------


%..................................................

% fixing matrix dimensions:
a = min(ale);
b = min(ti);

ak(2) = a;
tk(2) = b;

ddi = ddi(1:b, 1:a);
dtm = dtm(1:b, 1:a);
dvinti = davinti(1:b,1:a);

edi = edi(1:b, 1:a);
etm = etm(1:b, 1:a);
evinti = eavinti(1:b,1:a);

fdi = fdi(1:b, 1:a);
ftm = ftm(1:b, 1:a);
fvinti = favinti(1:b,1:a);

ldi = ddi+ edi + fdi;
ltm = dtm + etm + ftm;
lvinti = dvinti + evinti + fvinti;

lavdi = ldi/3;
lavtm = ltm/3;
lavinti = lvinti/3;

L = [lavdi, lavtm, lavinti];

cd('averages');

save('l.mat', 'lavdi', 'lavtm', 'lavinti');

cd(path_current); % return home before calling others



cd(dirn);
cd('averages');

ale = zeros(1,3);
ti = zeros(1,3);

load k
ale(1) = size(kavdi,2);
ti(1) = size(kavdi,1);


load l
ale(2) = size(lavdi,2);
ti(2) = size(lavdi,1);


load m
ale(3) = size(mavdi,2);
ti(3) = size(mavdi,1);


a = min(ale);
b = min(ti);

kavdi = kavdi(1:b, 1:a);
kavtm = kavtm(1:b, 1:a);
kavinti = kavinti(1:b,1:a);

lavdi = lavdi(1:b, 1:a);
lavtm = lavtm(1:b, 1:a);
lavinti = lavinti(1:b,1:a);

mavdi = mavdi(1:b, 1:a);
mavtm = mavtm(1:b, 1:a);
mavinti = mavinti(1:b,1:a);

tdi = kavdi + lavdi + mavdi;
ttm = kavtm + lavtm + mavtm;
tavinti = kavinti + lavinti + mavinti;

todi = tdi/3;
totm = ttm/3;
toavinti = tavinti/3;

figure(25);
mesh(todi, totm, toavinti)
colormap hsv
xlabel('Distance from Center of Bleach')
ylabel('Time')
zlabel('Fluorescence Intensity')

st = length(todi(1,:));

totm2 = totm(:,20);
toavinti1 = toavinti(:,1);
toavinti2 = toavinti(:,10);
toavinti3 = toavinti(:,20);
toavinti4 = toavinti(:,30);
toavinti5 = toavinti(:,40);
toavinti6 = toavinti(:,50);
toavinti7 = toavinti(:,60);
toavinti8 = toavinti(:,70);

cd(path_current); % return home before calling others

% shorten all to equal ring lenght:

a = min(ak);
b = min(tk);

aavinti = aavinti(1:b,1:a);
bvinti = bavinti(1:b,1:a);
cvinti = cavinti(1:b,1:a);
dvinti = davinti(1:b,1:a);
evinti = eavinti(1:b,1:a);
fvinti = favinti(1:b,1:a);
gvinti = gavinti(1:b,1:a);
hvinti = havinti(1:b,1:a);
jvinti = javinti(1:b,1:a);
kvinti = kavinti(1:b,1:a);

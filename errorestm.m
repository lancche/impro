

load data1;
adi = di;
atm = tm;
aavinti = avinti;

load data2;
bdi = di;
btm = tm;
bavinti = avinti;

load data3;
cdi = di;
ctm = tm;
cavinti = avinti;

load data4;
ddi = di;
dtm = tm;
davinti = avinti;

load data5;
edi = di;
etm = tm;
eavinti = avinti;

load data6;
fdi = di;
ftm = tm;
favinti = avinti;

load data7;
hdi = di;
htm = tm;
havinti = avinti;

load data8;
gdi = di;
gtm = tm;
gavinti = avinti;

load data9;
jdi = di;
jtm = tm;
javinti = avinti;

load data10;
kdi = di;
ktm = tm;
kavinti = avinti;

load data11;
ldi = di;
ltm = tm;
lavinti = avinti;

load data12;
mdi = di;
mtm = tm;
mavinti = avinti;

load data13;
ndi = di;
ntm = tm;
navinti = avinti;

load data14;
odi = di;
otm = tm;
oavinti = avinti;

load data15;
pdi = di;
ptm = tm;
pavinti = avinti;

load data16;
rdi = di;
rtm = tm;
ravinti = avinti;

load data17;
sdi = di;
stm = tm;
savinti = avinti;

aavinti5 = aavinti(:,50);

bavinti5 = bavinti(:,50);

cavinti5 = cavinti(:,50);

davinti5  = davinti(:,50);

eavinti5 = eavinti(:,50);

favinti5 = favinti(:,50);

havinti5 = havinti(:,50);

gavinti5 = gavinti(:,50);

javinti5 = javinti(:,50);

kavinti5 = kavinti(:,50);

lavinti5 = lavinti(:,50);

mavinti5 = mavinti(:,50);

navinti5 = navinti(:,50);

oavinti5 = oavinti(:,50);

pavinti5 = pavinti(:,50);

ravinti5 = ravinti(:,50);

savinti5 = savinti(:,50);


A11 = [aavinti5, bavinti5, cavinti5, davinti5, eavinti5, favinti5, havinti5, ...
    gavinti5, javinti5, kavinti5, lavinti5, mavinti5, navinti5, oavinti5, pavinti5... 
    ravinti5, savinti5];

save('erores.dat', 'A11', '-ascii');


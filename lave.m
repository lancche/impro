% averages for laser:

path_current = pwd; % displays current directory

set(0,'DefaultFigureWindowStyle','docked');

dirn = uigetdir('/export/home1/lgm/bosanac/PROJEKTI/PTEFb/data/lascal/', 'Choose directory to process');

cd(dirn); % enters chosen directory

ale = zeros(1,9);
ble = zeros(1,9);

load data1;
yla = yl;
xla = xl;
laxa = lax;
laya = lay;
ale(1) = size(yla,1);
ble(1) = size(xla,1);

figure(1);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data2;
ylb = yl;
xlb = xl;
laxb = lax;
layb = lay;
ale(2) = size(ylb,1);
ble(2) = size(xlb,1);
figure(2);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data3;
ylc = yl;
xlc = xl;
laxc = lax;
layc = lay;
ale(3) = size(ylc,1);
ble(3) = size(xlc,1);
figure(3);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data6;
yld = yl;
xld = xl;
laxd = lax;
layd = lay;
ale(4) = size(yld,1);
ble(4) = size(xld,1);
figure(4);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data5;
yle = yl;
xle = xl;
laxe = lax;
laye = lay;
ale(5) = size(yle,1);
ble(5) = size(xle,1);
figure(5);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data6;
ylf = yl;
xlf = xl;
laxf = lax;
layf = lay;
ale(6) = size(ylf,1);
ble(6) = size(xlf,1);
figure(6);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data7;
ylg = yl;
xlg = xl;
laxg = lax;
layg = lay;
ale(7) = size(ylg,1);
ble(7) = size(xlg,1);
figure(7);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

load data9;
ylh = yl;
xlh = xl;
laxh = lax;
layh = lay;
ale(8) = size(ylh,1);
ble(8) = size(xlh,1);
figure(8);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

% load data9;
% yli = yl;
% xli = xl;
% laxi = lax;
% layi = lay;
% ale(9) = size(yli,1);

load data10;
ylj = yl;
xlj = xl;
laxj = lax;
layj = lay;
ale(9) = size(ylj,1);
ble(9) = size(xlj,1);
figure(9);
plot(xl,lay, 'g*')
hold on;
plot(yl, lax, 'b*')
legend('x-profile of laser', 'y-profile of laser')

% resizing according to minimum:
a = min(ale);
b = min(ble);

yla = yla(1:a);
xla = xla(1:b);
laxa = laxa(1:a);
laya = laya(1:b);

ylb = ylb(1:a);
xlb = xlb(1:b);
laxb = laxb(1:a);
layb = layb(1:b);

ylc = ylc(1:a);
xlc = xlc(1:b);
laxc = laxc(1:a);
layc = layc(1:b);

yld = yld(1:a);
xld = xld(1:b);
laxd = laxd(1:a);
layd = layd(1:b);

yle = yle(1:a);
xle = xle(1:b);
laxe = laxe(1:a);
laye = laye(1:b);

ylf = ylf(1:a);
xlf = xlf(1:b);
laxf = laxf(1:a);
layf = layf(1:b);

ylg = ylg(1:a);
xlg = xlg(1:b);
laxg = laxg(1:a);
layg = layg(1:b);

ylh = ylh(1:a);
xlh = xlh(1:b);
laxh = laxh(1:a);
layh = layh(1:b);

% yli = yli(1:a);
% xli = xli(1:a);
% laxi = laxi(1:a);
% layi = layi(1:a);

ylj = ylj(1:a);
xlj = xlj(1:b);
laxj = laxj(1:a);
layj = layj(1:b);

tyl = yla + ylb + ylc + yld + yle + ylf + ylg + ylh + ylj;
tyli = tyl./9;

txl = xla + xlb + xlc + xld + xle + xlf + xlg + xlh + xlj;
txli = txl./9;

tlax = laxa + laxb + laxc + laxd + laxe + laxf + laxg + laxh + laxj;
tlaxi = tlax./9;

tlay = laya + layb + layc + layd + laye + layf + layg + layh + layj;
tlayi = tlay./9;

figure;
plot(tyli, tlaxi, 'r*')
hold on;
plot(txli, tlayi, 'b*')
legend('x-profile laser', 'y-profile laser')

cd(pwd);

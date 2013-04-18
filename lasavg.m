% average for laser profile:

path_current = pwd; % displays current directory

[file path] = uigetfile('*.txt','Select Data Files','/export/home1/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile','MultiSelect','on');  % set browser path and select files

cd(path);

a = load('data1.txt');
b = load('data2.txt');
c = load('data4.txt'); 
d = load('data4.txt');
f = load('data5.txt');
g = load('data6.txt');
h = load('data7.txt');
i = load('data8.txt');
j = load('data9.txt');
k = load('data10.txt');
l = load('data11.txt');
m = load('data12.txt');
n = load('data13.txt');
o = load('data14.txt');
p = load('data15.txt');
r = load('data16.txt');
s = load('data17.txt');
t = load('data18.txt');
% u = load('data19.txt');
% v = load('data20.txt');


figure(1); 
plot(a, 'k');
hold on; 
plot(b, 'r');
plot(c, 'b*');
plot(d, 'bo-');
plot(f, 'b');
plot(g, 'y');
plot(h, 'c');
plot(i, 'm*'); % mozda i ne
plot(j, '-*');
plot(k, '-');
plot(l, 'g');
plot(m, 'm');
plot(n, '--bo');
plot(o, '--yo');
plot(p, '--go');
plot(r, '--mo');
plot(s, 'c.');
plot(t, '-'); % mozda i ne
% plot(u, '--ro');
% plot(v, 'k-');

ale = zeros(1,17);

ale(1) = length(a);
ale(2) = length(b);
ale(3) = length(c);
ale(4) = length(f);
ale(5) = length(g);
ale(6) = length(h);
ale(7) = length(i);
ale(8) = length(j);
ale(9) = length(k);
ale(10) = length(l);
ale(11) = length(m);
ale(12) = length(n);
ale(13) = length(o);
ale(14) = length(p);
ale(15) = length(r);
ale(16) = length(s);
ale(17) = length(t);
%ale(18) = length(u);
%ale(19) = length(v);

bo = min(ale);

a = a(1:bo);
b = b(1:bo);
c = c(1:bo);
d = d(1:bo);
f = f(1:bo);
g = g(1:bo);
h = h(1:bo);
i = i(1:bo);
j = j(1:bo);
k = k(1:bo);
l = l(1:bo);
m = m(1:bo);
n = n(1:bo);
o = o(1:bo);
p = p(1:bo);
r = r(1:bo);
s = s(1:bo);
t = t(1:bo);
%u = u(1:bo);
%v = v(1:bo);

a = a./max(a);
b = b./max(b);
c = c./max(c);
d = d./max(d);
f = f./max(f);
g = g./max(g);
h = h./max(h);
i = i./max(i);
j = j./max(j);
k = k./max(k);
l = l./max(l);
m = m./max(m);
n = n./max(n);
o = o./max(o);
p = p./max(p);
r = r./max(r);
s = s./max(s);
t = t./max(t);
%u = u./max(u);
%v = v./max(v);

figure(2); 
%plot(a, 'k');
hold on; 
plot(b, 'r');
%plot(c, 'b*');
%plot(d, 'bo-')
plot(f, 'b');
%plot(g, 'y');
%plot(h, 'c');
%plot(i, 'm*'); % mozda i ne
plot(j, '-*');
plot(k, '-');
%plot(l, 'g');
%plot(m, 'm');
plot(n, '--bo');
%plot(o, '--yo');
%plot(p, '--go');
plot(r, '--mo');
plot(s, 'c.');
plot(t, '-.'); % mozda i ne
%plot(u, '--ro');
%plot(v, 'k-*');
ylabel('Normalized Intensity');
xlabel('Pixels');

su = b +j+k+n+r+s+t ;
avsu = su./7;

x = [160:160:length(su)*160];

figure; 
plot(x, avsu, '--mo');

save('-ascii', '/users/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile/lasavg.txt', 'x','avsu');

cd(path_current); % returns to "home" directory, before calling other script


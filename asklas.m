path_current = pwd; % displays current directory

dirn = uigetdir('/users/fit/bosanac/PROJEKTI/PTEFb/data/', 'Choose folder with data files');

cd(dirn); % enters chosen directory

mkdir('averages1');

files  = dir;  % loads list of filenames in "files"

npic = numel(files); % returns number of files

cd(path_current); % return home before calling others

figure(101);
ht  = uicontrol('Style','text', ...
    'Position',[left2+0.25 bot_title wid1 1.5*height], ...
    'String', num2str(npic),...
    'BackgroundColor', roza);

ht  = uicontrol('Style','text', ...
    'Position',[left2+0.4 bot_title wid1 1.5*height], ...
    'String', 'data files present',...
    'BackgroundColor', roza);


cd(dirn);

ale = zeros(1,10);
ti = zeros(1,10);

load data1;
adi = avin;
ale(1) = size(adi,2);
ti(1) = size(adi,1);

load data1;
bdi = avin;
ale(2) = size(bdi,2);
ti(2) = size(bdi,1);

load data3;
cdi = avin;
ale(3) = size(cdi,2);
ti(3) = size(cdi,1);

load data4;
ddi = avin;
ale(4) = size(ddi,2);
ti(4) = size(ddi,1);

load data5;
edi = avin;
ale(5) = size(edi,2);
ti(5) = size(edi,1);

load data6;
fdi = avin;
ale(6) = size(fdi,2);
ti(6) = size(fdi,1);


load data6;
gdi = avin;
ale(7) = size(gdi,2);
ti(7) = size(gdi,1);

load data8;
hdi = avin;
ale(8) = size(hdi,2);
ti(8) = size(hdi,1);

load data9;
idi = avin;
ale(9) = size(idi,2);
ti(9) = size(idi,1);

load data10;
jdi = avin;
ale(10) = size(jdi,2);
ti(10) = size(jdi,1);

%..........................................

a = min(ale);

adi = adi(1:a)./max(adi);
bdi = bdi(1:a)./max(bdi);
cdi = cdi(1:a)./max(cdi);
ddi = ddi(1:a)./max(ddi);
edi = edi(1:a)./max(edi);
fdi = fdi(1:a)./max(fdi);
gdi = gdi(1:a)./max(gdi);
hdi = hdi(1:a)./max(hdi);
idi = idi(1:a)./max(idi);
jdi = jdi(1:a)./max(jdi);

kdi = adi+ bdi + cdi + ddi + edi + fdi + gdi + hdi + idi + jdi;

kavdi = kdi/10;

kavdi = kavdi./max(kavdi);

afd = (kavdi-1);
io = find(afd==0);
afd(io) = 0.01;
afd = afd - 1;
od = afd/max(afd);
od = od-1;

figure; 
plot(od, '*-m')

cd('averages1');

save('k.dat', 'od');

cd(path_current);

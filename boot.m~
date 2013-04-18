
% script for finding 95% confidence intervals by bootstrap for P-TEFb data
% November 2009

% Bootstrap 95% confidence interval yields us with the information about the range of values that the majority of correlation coefficients rely. 

% save with upper and lower intervals, able to be plotted as error bars
% subsequently. 

path_current = pwd; % displays current directory

[filename, path] = uigetfile('*.dat','Select Data File','/export/home1/lgm/bosanac/PROJEKTI/PTEFb/data/collection');  % set browser path and select files

cd(path);

file = load(filename);

tm = file(:,1); % time 
d2 = file(:,2); % distances below.
d3 = file(:,3);
d4 = file(:,4);
d5 = file(:,5);
d6 = file(:,6);
d7 = file(:,7);
d8 = file(:,8);
d9 = file(:,9);
d10 = file(:,10);

ind = find(d2>0);

nd2 = d2(ind);
ntd2 = tm(ind);


d2s1000 = bootstrp(1000, 'corr', ntd2, nd2);

figure(1);
hist(d2s1000,30)
set(get(gca,'Children'),'FaceColor',[.8 .8 1])

ci = bootci(1000, @corr, ntd2, nd2);

for i = 1: length(d2)
ci(i) = bootci(1000, @corr, ntd2(i), nd2(i)); 
end

cd(pwd);

err = ones(size(d2));
erro = (abs(ci(1) - ci(2))./2)*err;

figure(2);
errorbar(d2,erro);
hold on;
plot(tm, d2, 'y.'); 




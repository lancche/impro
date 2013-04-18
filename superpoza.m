
path_current = pwd; % displays current directory

[filename, pathname] = uigetfile('*.*','Choose file containing traces', '/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/');  %Open file dialog box

cd(pathname);

file = load(filename);

cd(path_current); % returns to "home" directory

tmb = file(:,1);
d2b = file(:,2);
d3b = file(:,3);
d4b = file(:,4);
d5b = file(:,5);
d6b = file(:,6);
d7b = file(:,7);
d8b = file(:,8);
d9b = file(:,9);
d10b = file(:,10);

t = tmi; %./tma;
d2n = d2b./d2;
d3n = d3b./d3;
d4n = d4b./d4;
d5n = d5b./d5;
d6n = d6b./d6;
d7n = d7b./d7;
d8n = d8b./d8;
d9n = d9b./d9;
d10n = d10b./d10;

figure(330);
ho = axes('Fontsize',15);
set(ho);
% 
% h = axes('Color',[.9 .9 .9],...
%        'GridLineStyle','--',...
%        'ZTickLabel','-1|Z = 0 Plane|+1',...
%        'FontName','times',...
%        'FontAngle','italic',...
%        'FontSize',14,...
%        'XColor',[0 0 .7],...
%        'YColor',[0 0 .7],...
%        'ZColor',[0 0 .7]);

hold on;
plot(t, d3n, 'o','MarkerEdgeColor', 'r',...
                'MarkerFaceColor', 'r', 'MarkerSize', 5); 
plot(t, d6n, 'o','MarkerEdgeColor',lila,...
                'MarkerFaceColor',lila, 'MarkerSize', 5);
plot(t, d8n, 'o','MarkerEdgeColor','g',...
                'MarkerFaceColor','g', 'MarkerSize', 5);
plot(t, d10n, 'o', 'MarkerEdgeColor','b',...
                'MarkerFaceColor','b','MarkerSize', 5); 

axis([0 600 0 1.1]);

A3 =[t, d2n, d3n, d4n, d5n, d6n, d7n, d8n, d9n, d10n];

save('/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/comparizon.dat', 'A3', '-ascii');

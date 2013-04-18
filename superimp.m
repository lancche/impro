

path_current = pwd; % displays current directory

[filename, pathname] = uigetfile('*.*','Choose file containing traces','/users/fit/bosanac/PROJEKTI/PTEFb/data/RNAi/');  %Open file dialog box

cd(pathname);

file = load(filename);

cd(path_current); % returns to "home" directory


figure(33);
%set(h, 'fontsize', 15);
%ho = axes('Fontsize',15);
%set(ho);

hold on;
plot(tm, file(:,5), '.','MarkerEdgeColor', 'r',...
                'MarkerFaceColor', 'r', 'MarkerSize', 10); 
plot(tm, file(:,30), '.','MarkerEdgeColor',lila,...
                'MarkerFaceColor',lila, 'MarkerSize', 10);
plot(tm, file(:,50), '.','MarkerEdgeColor','g',...
                'MarkerFaceColor','g', 'MarkerSize', 10);
plot(tm, file(:,70), '.', 'MarkerEdgeColor','b',...
               'MarkerFaceColor','b','MarkerSize', 10); 

%axis([0 600 0 1.1]);
grid on;
             
h = legend('0.8\mum', '4.8\mum', '8.0\mum', '11.2\mum');

% %h = legend('CycT1', 'RNAi Luciferase', 'RNAi 7SK', 'CycT1 + DRB');
% set(h, 'fontsize', 15);
% 
% title(picnam,'fontsize',30,'fontweight','b' )
% xlabel('Time [s]','fontsize',30,'fontweight','b');
% ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')
% %hold off;

superposition;

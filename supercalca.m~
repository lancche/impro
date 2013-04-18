

path_current = pwd; % displays current directory

[filename, pathname] = uigetfile('*.*','Choose file containing traces','/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/');  %Open file dialog box

cd(pathname);

file = load(filename);

cd(path_current); % returns to "home" directory
 
tma = file(:,1);
d2a = file(:,2);
d3a = file(:,3);
d4a = file(:,4);
d5a = file(:,5);
d6a = file(:,6);
d7a = file(:,7);
d8a = file(:,8);
d9a = file(:,9);
d10a = file(:,10);


t = tmi; %./tma;
d2 = d2i./d2a;
d3 = d3i./d3a;
d4 = d4i./d4a;
d5 = d5i./d5a;
d6 = d6i./d6a;
d7 = d7i./d7a;
d8 = d8i./d8a;
d9 = d9i./d9a;
d10 = d10i./d10a;


figure(33);
%set(h, 'fontsize', 15);
%ho = axes('Fontsize',15);
%set(ho);

hold on;
plot(t, d3, 'o','MarkerEdgeColor', 'r',...
                'MarkerFaceColor', 'r', 'MarkerSize', 5); 
plot(t, d6, 'o','MarkerEdgeColor',lila,...
                'MarkerFaceColor',lila, 'MarkerSize', 5);
plot(t, d8, 'o','MarkerEdgeColor','g',...
                'MarkerFaceColor','g', 'MarkerSize', 5);
plot(t, d10, 'o', 'MarkerEdgeColor','b',...
               'MarkerFaceColor','b','MarkerSize', 5); 

%axis([0 600 0 1.1]);
grid on;
             
h = legend('0.8\mum', '4.8\mum', '8.0\mum', '11.2\mum');

%h = legend('CycT1', 'RNAi Luciferase', 'RNAi 7SK', 'CycT1 + DRB');
set(h, 'fontsize', 15);

% title(picnam,'fontsize',30,'fontweight','b' )
% xlabel('Time [s]','fontsize',30,'fontweight','b');
% ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')
%hold off;

figure(102); hold on;
hload  = uicontrol('Style','Pushbutton', ...
    'Position',[left1+0.25*wid1 bot5 0.75*(wid1+wid1) 2*height], ...
    'String','Load multiplier',...
    'BackgroundColor','w',...
    'Callback','superpoza');



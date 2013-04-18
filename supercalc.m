% grey = [0.75 0.75 0.75];

path_current = pwd; % displays current directory

[filename, pathname] = uigetfile('*.*','Choose file containing traces', '/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/');  %Open file dialog box

cd(pathname);

file = load(filename);

cd(path_current); % returns to "home" directory

tmi = file(:,1);
d2i = file(:,2);
d3i = file(:,3);
d4i = file(:,4);
d5i = file(:,5);
d6i = file(:,6);
d7i = file(:,7);
d8i = file(:,8);
d9i = file(:,9);
d10i = file(:,10);

akva = [0.49 1 0.83]; %svjetloplavo
red = [1 0 0];
siva = [0.4667 0.5333 0.6000];
nebo = [0 0.7490 1];
lila = [0.5176 0.4392 1];
menta = [0.4627 0.9333 0.7765];
sminka = [1 0.2510 0.2510];
soft = [0.9412 0.5020 0.5020];
roza = [1 0.0784 0.5765];
naranca = [1 0.2706 0];
barbika = [1 0.2431 0.5882];
cigla = [0.5569 0.1373 0.1373];
kricavo = [1.0000 0.2706 0];
zensko = [1 0.1882 0.1882];
sonce = [1 0.7255 0.0588];
sloboda = [0.7529 0 0];



figure(33);


ho = axes('Fontsize',15);
set(ho);

% h = axes('Color',[.9 .9 .9],...
%        'GridLineStyle','--',...
%        'ZTickLabel','-1|Z = 0 Plane|+1',...
%        'FontName','times',...
%        'FontAngle','italic',...
%        'FontSize',14,...
%        'XColor',[0 0 .7],...
%        'YColor',[0 0 .7],...
%        'ZColor',[0 0 .7]);

% hold on;
% plot(tm, d3, 'o','MarkerEdgeColor', 'r',...
%                 'MarkerFaceColor', grey, 'MarkerSize', 5); 
% plot(tm, d6, 'o','MarkerEdgeColor',lila,...
%                 'MarkerFaceColor',grey, 'MarkerSize', 5);
% plot(tm, d8, 'o','MarkerEdgeColor','g',...
%                 'MarkerFaceColor',grey, 'MarkerSize', 5);
% plot(tm, d10, 'o', 'MarkerEdgeColor','b',...
%                 'MarkerFaceColor',grey,'MarkerSize', 5); 
% 
% axis([0 600 0 1.1]);


%legend('0.8\mum', '4.8\mum', '8.0\mum');%, '11.2\mum');

             
%legend('0.8\mum', '4.8\mum', '8.0\mum');%, '11.2\mum');

% picnam = '7SK RNAi CycT1 mobility'
% 
% title(picnam,'fontsize',30,'fontweight','b' )
% xlabel('Time [s]','fontsize',30,'fontweight','b');
% ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')

figure(102); hold on;
hconload  = uicontrol('Style','Pushbutton', ...
    'Position',[left1+0.25*wid1 bot3 wid1+wid1 2*height], ...
    'String','Load divider',...
    'BackgroundColor','w',...
    'Callback','supercalca');
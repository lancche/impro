roza = [1 0.0784 0.5765];
naranca = [1 0.2706 0];
barbika = [1 0.2431 0.5882];
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



% interface ---------------------------------------------------------------
screensize = get(0,'ScreenSize');
 figure(102); clf; hold on;
 lef = 250; bot = 200; wid = screensize(3)-600; hei = screensize(4)-420;
 set(gcf,'Position',[lef bot wid hei],'BackingStore','off','MenuBar','figure',...
     'NumberTitle','off','Name','FLIP Superpositions','Color',zensko);
 set(gcf,'DefaultUicontrolUnits','normalized','DefaultUicontrolFontUnits','normalized',...
     'DefaultUicontrolFontSize',0.45,'DefaultUicontrolFontWeight','bold')
 set(gca,'visible','off');
 set(0,'DefaultFigurePosition', [0.2*screensize(3) bot screensize(3)*0.6 hei],'DefaultAxesPosition', [0.15  0.25  0.8  0.65]);

dge        =   0.03;
wid1        =   (1.2)*((1-9*dge)/4);
wid2        =   (0.8)*((1-9*dge)/4);
left1       =   2*dge;
left2       =   3*dge+wid1;
left3       =   6*dge+wid1+wid2;
left4       =   7*dge+2*wid1+wid2;
titlefs     =   0.5;
bot_title   =   0.8;

for i = 1 : 14, 
    eval(['bot' num2str(i) '= bot_title - 0.01 - i * 0.06;']); 
end;

for i = 1 : 16, 
    eval(['bbot' num2str(i) '= bot_title - 0.01 - i * 0.05;']); 
end;

height      =   0.045;
color       =   [0.7 0.7 0.7]; % 
color1      =   [0.6 0.6 0.9]; %
color2     =   [0.6 0.1 0.8]; % violet
color3     =   [0.2 0.7 0.3]; %
akva = [0.49 1 0.83]; %svjetloplavo

hload  = uicontrol('Style','Pushbutton', ...
    'Position',[left1+0.25*wid1 bot_title 0.75*(wid1+wid1) 2*height], ...
    'String','Load nominator',...
    'BackgroundColor','w',...
    'Callback','supercalc');


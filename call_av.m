% for interface

figure(101);

nam = char('exper'); 
ht  = uicontrol('Style','text', ...
    'Position',[left1 bot4-0.2*bot14 wid1 1.5*height], ...
    'String','Name data file',...
    'BackgroundColor', roza);

hnam = uicontrol('Style','edit', ...
    'Position',[left2 bbot4-0.2*bbot16 wid2+0.2 1.5*height], ...
    'String','*.dat',...
    'BackgroundColor','w',...
    'Callback','nam = get(hnam,''String'');');

nam1 = char('filename'); 
ht  = uicontrol('Style','text', ...
    'Position',[left1-0.1 bot5-0.2*bot14 wid1+wid2 1.5*height], ...
    'String','Name figure file',...
    'BackgroundColor', roza);

hnam1 = uicontrol('Style','edit', ...
    'Position',[left2 bbot5+1.5*bbot16 wid2+0.2 1.5*height], ...
    'String','*.jpg',...
    'BackgroundColor','w',...
    'Callback','nam1 = get(hnam1,''String'');');

picnam = char('filename'); 
ht  = uicontrol('Style','text', ...
    'Position',[left1-0.1 bot6-0.2*bot14 wid1+wid2 1.5*height], ...
    'String','Insert Figure title',...
    'BackgroundColor', roza);

hpicnam = uicontrol('Style','edit', ...
    'Position',[left2 bbot6+2*bbot16 wid2+0.2 1.5*height], ...
    'String','*',...
    'BackgroundColor','w',...
    'Callback','picnam = get(hpicnam,''String'');');


hanalize  = uicontrol('Style','Pushbutton', ...
    'Position',[left3 bot7-0.02*bot14 0.75*(wid1+wid2) 2*height], ...
    'String','execute',...
    'BackgroundColor','w',...
    'Callback','fin');

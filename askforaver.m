
path_current = pwd; % displays current directory

dirn = uigetdir('/Users/bosanacl/Desktop/E-projekt/IMAGING/Live/2012/IV/', 'Choose folder with data files');

cd(dirn); % enters chosen directory

mkdir('averages');

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


naverages;
naverages1;
naverages2;
naverages3;
tonaverages;

call_av;

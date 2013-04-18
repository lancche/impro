
path_current = pwd; % displays current directory

dirnf = uigetdir('/Users/bosanacl/Desktop/E-projekt/IMAGING/Live/2012/III/21/XPC-GFPc1/FLIP/', 'Choose directory to save');

cd(dirnf)
mkdir('analyzed')
cd('analyzed')
mkdir('slika')
mkdir('data')

cd(dirnf)
cd ..
din = pwd;

dirn = uigetdir(dirnf, 'Choose directory to process');

cd(dirn); % enters chosen directory

delete '.DS_Store'

files  = dir;  % loads list of filenames in "files"

npic = numel(files) - 2; % returns number of pictures

% mkdir('renamed'); 
% 
% for i = 3 : npic
%  
%  x = isletter(files(i).name);
%  ax = find(x==0);
%  
%  jen = length(ax) - 1; % index for the numbers in the name
% 
%  dva = length(ax) - 2; % decimal`
%  tri = length(ax) - 3; % centimal
%  
%  if ((ax(jen) - ax(dva)) > 1) % onda je jednocifreni broj, insert 2nule
%      fi = files(i).name(1:(length(files(i).name)-6));
%      n1 = files(i).name(ax(jen):end); % the actual time number
%      iles(i).name = strcat(fi, '0', '0', num2str(n1));
%  elseif ((ax(jen) - ax(dva)) == 1) && ((ax(dva) - ax(tri)) > 1) % u slucaju dvocifrenih brojeva
%      fi = files(i).name(1:(length(files(i).name)-6));
%      n1 = files(i).name(ax(dva):end); % the actual time number
%      iles(i).name = strcat(fi, '0', num2str(n1));
%  else
%      iles(i).name = files(i).name; % u slucaju trocifrenih brojeva
%  end
% 
% % movefile(num2str(files(i).name), num2str(iles(i).name)); %%%%%%%%%%%%%%%%%% nece li nece
%  replace('num2str(files(i).name)','num2str(iles(i).name)');
%  
% end

nam = {files.name}';

J = imread(nam{4});

% Preallocation:
sequence = zeros([size(J) npic], class(J));
sequence(:, :, 1) = J;
newseq = zeros([size(J) npic], class(J)); 
count = 0;
 
tic;



% Creating image sequence array:
 for i = 1:npic
     count = count + 1;
     sequence(:,:,i) = imread(nam{i+2});
     %newseq(:,:,i) = imadjust(sequence(:,:,i)); % scales contrast as optimal according to first picture taken (for laserpos)
     disp([num2str((count/npic)*100) ' %']);
 end

toc;

cd(path_current); % returns to "home" directory, before calling other scripts

figure(11);

 naio = 25; % number of images before bleach   
 ht  = uicontrol('Style','text', ...
     'Position',[left1 bot3-0.5*bot14 wid1 1.5*height], ...
     'String','no. pre-bleach images',...
     'BackgroundColor', akva);
 hnaio = uicontrol('Style','edit', ...
     'Position',[left2 bbot3-0.5*bbot16 wid2 1.5*height], ...
     'String',num2str(naio),...
     'BackgroundColor','w',...
     'Callback','naio = str2num(get(hnaio,''String''));');

 
noio = 5;   % width of strip under analysis
ht  = uicontrol('Style','text', ...
    'Position',[left1 bot5-0.5*bot14 wid1 1.5*height], ...
    'String','no.post-bleach img 4averag',...
    'BackgroundColor', akva);
hnoio = uicontrol('Style','edit', ...
    'Position',[left2 bbot5-0.5*bbot16 wid2 1.5*height], ...
    'String',num2str(noio),...
    'BackgroundColor','w',...
    'Callback','strip = str2num(get(hnoio,''String''));'); 
 
 strip = 148;   % width of strip under analysis
ht  = uicontrol('Style','text', ...
    'Position',[left1 bot7-0.5*bot14 wid1 1.5*height], ...
    'String','Width of radial strips [nm]',...
    'BackgroundColor', akva);
hstrip = uicontrol('Style','edit', ...
    'Position',[left2 bbot7-0.5*bbot16 wid2 1.5*height], ...
    'String',num2str(strip),...
    'BackgroundColor','w',...
    'Callback','strip = str2num(get(hstrip,''String''));');
 
select;

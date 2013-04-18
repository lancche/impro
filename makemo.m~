% Picking up values for bleached, control and background through all time
% points:

novsek = zeros([size(J) npic], class(J)); 
anoseq = zeros([size(J) npic], class(J));

for i = 1:npic % #######################

% control:=============================================================
if isempty(find(co)) == 1; 
   C = [];
else
R = immultiply(sequence(:,:,i), co);
[yc, xc, con] = find(R);
cpic = ones(size(con))*i;
C = [cpic, xc, yc, con];
end

% background:==========================================================
Q = immultiply(sequence(:,:,i), ba);
Bas = find(Q); % gets indices at which Q is not zero
bpic = ones(size(Bas))*i; % sets up time line
bkg = Q(Bas); % gives all intensity values
avebackg(i) = mean(bkg); % gives value for substraction
Ba = [bpic, bkg]; % for saving
%avecontrol(i) = mean(con) - avebackg(i);

if i == 1;
averintb = avebackg;
end
    
% bleached:============================================================
% [uioy, uiox] = find(sequence(:,:,i) == 0); 
% op(i) = length(uioy);
% sequence(uioy,uiox,i) = 1;

P = immultiply(sequence(:,:,i), bl);
[yble, xble, ble] = find(P);

picnu = ones(size(ble))*i; % array for picture number
xs(i) = length(ble);
das = sqrt((xble - xla).^2 + (yble - yla).^2)*strip; % distance in [nm]%%%%%%%%%%%%%%!!!!
B = [picnu, xble, yble, ble, das];
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    if i == 1
     datatog = B;
     datacon = C;
     databkg = Ba;
   %  Hu = Nuc;
    else
        % full final arrays of respectively: bleached, control, background
     datatog = cat(1, datatog, B); 
      if isempty(find(co)) == 1; 
         load datacon;
      else
         datacon = cat(1, datacon, C);
     end
     databkg = cat(1, databkg, Ba);
    end
    
%     % corrected movie:
    count = count + 1;
    anoseq(:,:,i) = sequence(:,:,i);
    ima = im2uint8(anoseq(:,:,i)); 
    iaf = imadjust(ima, stretchlim(ima));
    
    f(i) = im2frame(iaf, jet(256)); 
    disp([num2str((count/npic)*100) ' %']);
  
end


tamnoplava =  [0.0627 0.3059 0.5451];

% scrsz = get(0,'ScreenSize');
% figure('Position',[1 scrsz(4)/3 scrsz(3)/3 scrsz(4)/3], 'Name', 'False Color Movie', 'NumberTitle', 'off', 'Color', tamnoplava);
% [h, w, p] = size(J);  % use 1st frame to get dimensions
% he = gcf;
% set(he, 'position', [150 150 w+200 h+200]);
% loc = [10 10 10 10];
% movie(he,f,1,30,loc);

% cd(dirnf);
% movie2avi(f, 'cytorad23bflip.avi');

cd(path_current);
catimjma;

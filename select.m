% Script for selection of regions for analysis

% reset: 
count = 0;

%naio = 10; %no.images before bleach

posb = naio + 1; %postbleach picture

% averaging over first naio pictures for selection interface
for j = 1 : naio 
    if j == 1
        ia = sequence(:,:,j)/naio;
    else
        ia = imadd(ia,sequence(:,:,j)/naio);
    end
end

% averaging over next 10 postbleach pictures for selection interface
posb10 = posb + noio;
for j = posb : posb10
    if j == 1
        ip = sequence(:,:,j)/posb10;
    else
        ip = imadd(ia,sequence(:,:,j)/posb10);
    end
end

%getting rid of saturation points:
iaf = imadjust(ia, stretchlim(J));
iaf1 = iaf;
%india = find(iaf > 65500);
%iaf(india) = 0;
%iaf = ia;


% selection interface:
figure(111);
set(gcf, 'Name', 'Select the Area of Interest');
 set(gcf,'Position',[lef bot wid hei],'BackingStore','off','MenuBar','figure',...
     'NumberTitle','off','Name','Selections of ROI','Color',[1 0.5 0.25]);
 set(gcf,'DefaultUicontrolUnits','normalized','DefaultUicontrolFontUnits','normalized',...
     'DefaultUicontrolFontSize',0.45,'DefaultUicontrolFontWeight','bold') 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(iaf);
title('Select the laserized cell')
impixelinfo;
bl = roipoly; % bl gives binary mask of selected cell
Po = immultiply(ia, bl);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(iaf);
title('Select the control cell')
impixelinfo;
co = roipoly; % co gives binary mask of selected cell
R = immultiply(ia, co);
if isempty(find(co)) == 1; 
clear R;
end
%S = imadd(P,R);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(iaf);
title('Select a typical area of the background')
impixelinfo;
ba = roipoly;
Q = immultiply(ia, ba);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Getting the laser position:
%ip = sequence(:,:,posb);
dfia = imabsdiff(ia, ip);
dfias = imadjust(dfia, stretchlim(dfia));
imshow(dfias);
title('absolute difference between pre-bleach and first bleach picture - select laserpos')
impixelinfo;
fa = roipoly; % co gives binary mask of selected cell
FR = immultiply(dfias, fa);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(dfias); 
title('Select background area')
bar = roipoly;
bkgr = immultiply(dfias, bar);

close;

% laser search/tracking:===========================================
FR = immultiply(dfias, fa);
[yl, xl, LA] = find(FR); 
%rpic = ones(size(LA))*i;

bkgre = mean(bkgr);
avebackgr = mean(bkgre); % gives value for substraction
%popravi ovo, LA je samo indeks tih intenziteta. 
LA = double(LA); %/65535;
lab = LA - avebackgr; 
lan = lab - min(lab);
lan = lan./max(lan);

xla = sum(xl.*lan)./sum(lan); 
yla = sum(yl.*lan)./sum(lan);

makemo;

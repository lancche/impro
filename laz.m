
% fixing contrast to make visible:
pref = imadjust(pre, stretchlim(pre));
posf = imadjust(post, stretchlim(post));
dfia = imabsdiff(pre, post); % absolute difference between pre and post. 
dfias = imadjust(dfia, stretchlim(dfia)); % fixing contrast

figure(1);
set(gcf, 'Name', 'Select the Area of Interest');
 set(gcf,'Position',[lef bot wid hei],'BackingStore','off','MenuBar','figure',...
     'NumberTitle','off','Name','Selections of ROI','Color', barbika);
 set(gcf,'DefaultUicontrolUnits','normalized','DefaultUicontrolFontUnits','normalized',...
     'DefaultUicontrolFontSize',0.45,'DefaultUicontrolFontWeight','bold')

% showing for selection for bleach corr:--------------------------
hold on; 
imshow(dfias);
title('pick a trivial area within cell')
bie = roipoly; % cijela okolina lazera binary
B = immultiply(pre, bie); % whole cell before laser
Bp = immultiply(post, bie); % whole cell before laser
Ib = find(B); % indices for before laser 
Ibp = find(Bp);

Bl = B(Ib); % intensities for before laser
Blp = Bp(Ibp);

% showing for selection for laser spot:---------------------------
figure(1); 
imshow(dfias);
title('pick the laser spot and outskirts')
cie = roipoly; % cijela okolina lazera binary
C = immultiply(pre, cie); % whole cell before laser
Cp = immultiply(post,cie); % whole cell after laser
[y, x, Ic] = find(C); % nadji cifre za intenzitet prije lazera
[yp, xp, Icp] = find(Cp); % poslje lazera

Ic = find(C);
Icp = find(Cp);

Lao = C(Ic);
Lapo = Cp(Icp);

% showing for selection of background:---------------------------
figure(1); 
imshow(dfias);
title('pick the background for substraction')
kie = roipoly; % cijela okolina lazera binary
Cpb = immultiply(post,kie); % whole cell after laser
Cb = immultiply(pre,kie);
Icpb = find(Cpb); % poslje lazera
Icb = find(Cb);

bakpre = Cb(Icb);
bakpost = Cpb(Icpb);

bakprem = mean(bakpre);
bakpostm = mean(bakpost);

looj;


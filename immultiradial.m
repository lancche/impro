% loads the multiple files

% Ascribing variables:
nr = datatog(:,1); 
t = datatog(:,2); %time
dis = datatog(:,3); %distance from center of bleach spot
int = datatog(:,4); %intensity at the pixel of coordinates (x,y)

%nrbkg = databkg(:,1); 
tbkg = databkg(:,2); %time
inbkg = databkg(:,3);

mint = mean(inbkg);
mina = max(inbkg);

figure;
plot(t); 
title('Control if files are in right order')

face1;

% continuation of laz

La = double(Lao); % intenzitet prije lasera
Lap = double(Lapo); % intenzitet poslje lasera

%bkg correction:
Blp = Blp - bakpostm;
Bl = Bl - bakprem;
Lap = Lap - bakpostm; % background corrected
La = La - bakprem;
%bleach correction:
rb = mean(Blp)./mean(Bl); % factor correcting for bleach
Lap = Lap./rb; % bleach corrected post bleach

I = Lap./La;

figure(2); 
plot(smooth(La, 50), 'b.'); 
hold on; 
plot(smooth(Lap, 50), 'g.'); 
legend('pre','post')
hold off; 

figure(3);
plot(smooth(I,50), 'r.'); 
legend('pre/post ratio');

las = Lap; % doing profile measurement on the hole. 

% taking into account values above 0 only:
inu = find(las >= 0);
las = las(inu);
x = x(inu);
y = y(inu);

%finding the center of mass:
xc = sum(x.*las)./sum(las); 
yc = sum(y.*las)./sum(las);
xc = floor(xc);
yc = floor(yc);

das = sqrt((x - xc).^2 + (y - yc).^2); % distance in pixels

[diss,ind] = sort(das,'ascend'); % returns sorted matrix diss with the correspond.indices of dis
ints = las(ind); % returns intensity sorted according to distance index
st = floor((max(das) - min(das))); % number of strips

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j = 1 : st %counting the rings outwards
        
        indxe = find((diss>(j-1))&(diss<=j)); % j=1first ring, j=2second,etc.
        intensi(indxe,j) = ints(indxe);
        
        xe(indxe,j) = x(indxe);
        ye(indxe,j) = y(indxe);
        
        si = find(intensi(:,j));
        
        avin(j) = sum(intensi(:,j))./length(si);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%save('-ascii', '/users/fit/bosanac/PROJEKTI/PTEFb/data/FRAP/bleach_PROFILE/CycT1-GFP/25/2a/data5.txt', 'avin');

figure(10);
imshow(posf);
hold on;
plot(xc,yc, 'r*');
impixelinfo;

figure(11);
plot(avin, '--mo')
title('laser profile')
%saveas(gcf,'/users/fit/bosanac/PROJEKTI/PTEFb/data/FRAP/bleach_PROFILE/CycT1-GFP/25/2a/5.jpg', 'jpeg')

%dfig;

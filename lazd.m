% continuation of laz

Ic = double(Ic); % intenzitet prije lasera
Icp = double(Icp); % intenzitet poslje lasera

rb = mean(Ibp)./mean(Ib); % factor correcting for bleach
Icp = Icp./rb; % bleach corrected post bleach

%%%%%%%%%%%%%%%%%%%%%%%%%sminka%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% whole cell:
Cpp = imdivide(post, rb);
Cpo = imsubtract(Cpp, pre);
Cpos = imadjust(Cpo, stretchlim(Cpo));
figure(5); 
imshow(Cpos);
colormap(jet);

% laser and surroundings: 
Cppo = imdivide(Cp, rb);
Cposo = imabsdiff(Cppo, C);
Cs = double(Cposo);
csmo1 = zeros(size(Cs));
csmo = zeros(size(Cs));
% smoothing:
for o = 1: 512
csmo1(:,o) = smooth(Cs(:,o), 5);
csmo(o,:) = smooth(csmo1(o,:), 5);
end

figure; 
surf(csmo,'FaceColor','interp', 'EdgeColor','none', 'FaceLighting','phong')
axis([min(x) max(x) min(y) max(y)]);
view(-50,30)
camlight left
axis off;
%figure; mesh(csmo);
saveas(gcf,'/users/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile/3d_1.jpg', 'jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% reset to zero:
%Ic = Ic-min(Ic);
%Icp = Icp - min(Icp);

% normaliziranje:
%Ic = Ic./max(Ic);
%Icp = Icp./max(Icp);

% avoiding division by zero:
in = find(Ic == 0);
Ic(in) = [];
Icp(in) = [];
x(in) = []; 
y(in) = [];

I = Icp./Ic;

lasi = I - min(I);
zer = find(lasi == 0);
lasi(zer) = [];
las = lasi./max(lasi);

figure(2); 
plot(Ic, 'b.'); 
hold on; 
plot(Icp, 'g.'); 
hold on; 
plot(I, 'r.'); 
legend('pre/post ratio','pre','post');

% taking into account values above 0 only:
inu = find(las >= 0);
las = las(inu);
x = x(inu);
y = y(inu);

xc = sum(x.*las)./sum(las); 
yc = sum(y.*las)./sum(las);

xc = floor(xc);
yc = floor(yc);

das = sqrt((x - xc).^2 + (y - yc).^2)*160; % distance in [nm]

[diss,ind] = sort(das,'ascend'); % returns sorted matrix diss with the correspond.indices of dis
diss = diss - min(diss);
ints = las(ind); % returns intensity sorted according to distance index
st = floor((max(das) - min(das))/160); % number of strips

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j = 1 : st %counting the rings outwards
        
        indxe = find((diss>160*(j-1))&(diss<=160*j)); % j=1first ring, j=2second,etc.
        intensi(indxe,j) = las(indxe);
        
        xe(indxe,j) = x(indxe);
        ye(indxe,j) = y(indxe);
        
        avin(j) = mean(intensi(:,j));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


save('-ascii', '/users/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile/data20.txt', 'avin');

figure(10);
imshow(posf);
hold on;
plot(xc,yc, 'r*');
impixelinfo;

figure(11);
plot(avin, 'm*')
title('laser profile')
saveas(gcf,'/users/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile/20.jpg', 'jpeg')

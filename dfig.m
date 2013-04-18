
%%%%%%%%%%%%%%%%%%%%%%%%%sminka%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% whole cell:
Cpp = imdivide(post, rb);
Cpo = imabsdiff(post, pre);
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
for o = 1: 100
csmo1(:,o) = smooth(Cs(:,o), 5);
csmo(o,:) = smooth(csmo1(o,:), 5);
end

for o = 1: 100
csmo1(:,o) = smooth(Cs(:,o), 5);
csmo(o,:) = smooth(csmo1(o,:), 5);
end

figure(6); 
surf(csmo,'FaceColor','interp', 'EdgeColor','none', 'FaceLighting','phong')
axis([min(x) max(x) min(y) max(y)]);
view(-50,30)
camlight left
axis off;
%figure; mesh(csmo);
saveas(gcf,'/users/lgm/bosanac/PROJEKTI/PTEFb/data/laserprofile/3d_a.jpg', 'jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

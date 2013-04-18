
%prvo ucitas sliku u matlab, izaberes kako hoces da ti se zovu varijable, u ovo primeru A i ukucas kako ti se zove slika

A = imread('un.tif');


figure(1);
imagesc(A)   %ovo ukucas da vidis image u 2D grafu, dok tabela A ima 3 funkcije (x,y, intenzitet)
hold on;
plot(100, 24, 'w+', 'Markersize', 10);
colormap(hsv)

saveas(gcf,'/users/lgm/bosanac/PROGRAMI/impro/au.tif', 'tiff')

U = imread('au.tif');

save A



figure(6);
imshow(A);
hold on;
plot(100, 24, 'w+', 'Markersize', 10);

%sada imas sliku ucitanu u matlab, ukucaj sada komandu da vidis varijable
figure(2); 
hold on;
contour3(A, 40)
%plot3(100, 50, 300, 'r*')
colormap(cool);


B = double(A);

%figure(2);
%mesh(B(:,1),B(:,2),B(:,3));
%figure(3)
%surf(A);


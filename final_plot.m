
cd(dirn);
cd('averages');

load(nam);

cd(path_current);

whos('-ascii', nam);


figure(9951);
axis([0 600 0 1.1])
hold on;
plot(totm, novotoa(:,5), 'o','MarkerEdgeColor','r',...
                'MarkerFaceColor','r', 'MarkerSize', 5); 
plot(totm, novotoa(:,15), 'o','MarkerEdgeColor','b',...
                'MarkerFaceColor','b', 'MarkerSize', 5);
plot(totm, novotoa(:,25), 'o','MarkerEdgeColor','g',...
                'MarkerFaceColor','g', 'MarkerSize', 5);
plot(totm, novotoa(:,55), 'o', 'MarkerEdgeColor','m',...
                'MarkerFaceColor','y','MarkerSize', 5);              
legend('0.8\mum', '2.4\mum', '4.0\mum', '8.8\mum');

title(picnam,'fontsize',30,'fontweight','b' )
xlabel('Time [s]','fontsize',30,'fontweight','b');
ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')
hold off;

cd(dirn);
cd('averages');

saveas(gcf, nam1, 'jpg');

figure; 
mesh(totm, todi, toavinti)
xlabel('time [s]')
ylabel('distance [nm]')
zlabel('Normalized Intensity')
title(nam1)
saveas(gcf, '3d', 'fig');

cd(path_current);

figure(101);
hsbload  = uicontrol('Style','Pushbutton', ...
    'Position',[left1+0.25*wid1 bot9 0.75*(wid1+wid1) 2*height], ...
    'String','Superimpose',...
    'BackgroundColor','w',...
    'Callback','superposition');

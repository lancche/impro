% program for publish-ready plots: 

path_current = pwd; % displays current directory

[filename, pathname] = uigetfile('*.*','Choose file containing traces','/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/');  %Open file dialog box

cd(pathname);

file = load(filename);

cd(path_current); % returns to "home" directory


tm = file(:,1);
d2 = file(:,2);
d3 = file(:,3);
d4 = file(:,4);
d5 = file(:,5);
d6 = file(:,6);
d7 = file(:,7);
d8 = file(:,8);
d9 = file(:,9);
d10 = file(:,10);


grey = [0.75 0.75 0.75];
akva = [0.49 1 0.83]; %svjetloplavo
red = [1 0 0];
siva = [0.4667 0.5333 0.6000];
nebo = [0 0.7490 1];
lila = [0.5176 0.4392 1];
menta = [0.4627 0.9333 0.7765];
sminka = [1 0.2510 0.2510];
soft = [0.9412 0.5020 0.5020];
roza = [1 0.0784 0.5765];
naranca = [1 0.2706 0];
barbika = [1 0.2431 0.5882];
cigla = [0.5569 0.1373 0.1373];
kricavo = [1.0000 0.2706 0];
zensko = [1 0.1882 0.1882];
sonce = [1 0.7255 0.0588];
sloboda = [0.7529 0 0];

scrsz = get(0,'ScreenSize');
figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);
%figure(9951);
axis([0 600 0 1.1])
hold on;
grid on;
plot(tm, d3, 'o','MarkerEdgeColor', 'r',...
                'MarkerFaceColor', 'r','MarkerSize', 5); 
plot(tm, d6, 'o','MarkerEdgeColor', lila,...
                'MarkerFaceColor', lila, 'MarkerSize', 5);
plot(tm, d8, 'o','MarkerEdgeColor', 'g',...
                'MarkerFaceColor', 'g', 'MarkerSize', 5);
plot(tm, d10, 'o', 'MarkerEdgeColor', 'b',...
                'MarkerFaceColor', 'b','MarkerSize', 5);  
                       

             
h = legend('0.8\mum', '4.8\mum', '8.0\mum', '11.2\mum');
set(h, 'fontsize', 15);

namm = '/alpha - amanitin treated CycT1';

title(namm, 'fontsize',30,'fontweight','b' )
xlabel('Time [s]','fontsize',30,'fontweight','b');
ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')
hold off;

saveas(gcf,'/users/lgm/bosanac/PROJEKTI/PTEFb/data/collection/alphaman.jpg', 'jpeg')



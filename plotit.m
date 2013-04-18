
load cyct1vivo.mat

figure; 
mesh(todi, totm, toavinti)

% todi: distance
% totm: time
% toavinti: intensity. 

load cyct1vivo2d.dat;

tm = cyct1vivo2d(:,1);
d2 = cyct1vivo2d(:,2);
d3 = cyct1vivo2d(:,3);
d4 = cyct1vivo2d(:,4);
d5 = cyct1vivo2d(:,5);
d6 = cyct1vivo2d(:,6);
d7 = cyct1vivo2d(:,7);
d8 = cyct1vivo2d(:,8);
d9 = rednodrb2d(:,9);
d10 = rednodrb2d(:,10);

grey = [0.75 0.75 0.75];


figure(9951);
hold on;
plot(tm, d3, 'o','MarkerEdgeColor','r',...
                'MarkerFaceColor','r', 'MarkerSize', 5); 
plot(tm, d6, 'o','MarkerEdgeColor','b',...
                'MarkerFaceColor','b', 'MarkerSize', 5);
plot(tm, d8, 'o','MarkerEdgeColor','g',...
                'MarkerFaceColor','g', 'MarkerSize', 5);
plot(tm, d10, 'o', 'MarkerEdgeColor','m',...
                'MarkerFaceColor','y','MarkerSize', 5); 

             
legend('0.8\mum', '4.8\mum', '8.0\mum');%, '11.2\mum');

title('CycT1 untreated','fontsize',30,'fontweight','b' )
xlabel('Time [s]','fontsize',30,'fontweight','b');
ylabel('Normalized Intensity', 'fontsize',30,'fontweight','b')
hold off;
%analysis through all time steps
%nota bene: does not include artifacts of cell movement

%clearing parametres from "analize"
clear avint k intt

%nuclins;

% number of iterations
mt = max(t)-1;

def = [1:mt];

for i = 1 : mt %iterating for each time point 
   
        % ESTIMATION OF BACKGROUND FOR SUBTRACTION 
        inb = find(gpic == i);
        intebkg = mean(inbkg(inb)); % the mean of the background intensity for the time step specified
        
        % ESTIMATE OF BLEACH OF ENTIRE PICTURES - as bkg maneovre
        intds = find(tcon == i); 
        intcaci = mean(con(intds));
        intcac = (intcaci - intebkg)/(confac-intebkg); % normalized bleach factor
        intcaunt(i) = intcac;
        
        % EXCLUDING PROBLEMATIC AREAS FROM ANALYSIS: see 'analize.m'
        pinx = find(t == i); % pulling out indices corresponding to the time of i
        diso = dis(pinx);
        intaz = int(pinx);
        tjoj = t(pinx);
        xblez = xble(pinx);
        yblez = yble(pinx);
        
        [disjoj,ind] = sort(diso,'ascend'); %returns sorted matrix diss with the correspond.indices of dis
        intat = intaz(ind); % returns intensity sorted according to distance index
        xblet = xblez(ind);
        yblet = yblez(ind);
        
%         insat = find(intat > 6500); % indices of intensity sorted acc.to distance
%         inbak = find(intat < bakl); % indices of intensity sorted acc.to distance
% 
%         %excind = cat(1, inuc, insat, inbak); % exclusion indexes for future 600
%         exceind = cat(1, insat, inbak);
%         excind = sort(exceind, 'ascend');

        disjoj(excind) = [];% (next 3lines) excludes outside of cell borders, estimated from first picture
        intat(excind) = [];
        tjoj(excind) = [];
        xblet(excind) = [];
        yblet(excind) = [];
         
        % ANALYSIS OF BLEACHED CELL
        %corrected:
        inta = intat - intebkg; % background corrected
        intaat = inta.*intcac; % bleach corrected
        diss = disjoj - min(disjoj);
         
        st = floor((max(diss)-min(diss))/strip); % number of rings

    for j = 1 : st %counting the rings outwards
        
        indx = find((diss>strip*(j-1))&(diss<strip*j)); % j=1first ring, j=2second,etc.
        intensi = intaat(indx);
        
        xbleaj = xblet(indx);
        ybleaj = yblet(indx);
        
        xcor(indx,j) = xbleaj;
        ycor(indx,j) = ybleaj;
        
        si = mean(intensi); 
        preals = ones(size(intensi));
        smea = si.*preals; % creating the mean intensity for strip matrix
        intensi = double(intensi);
        x(indx,j) = intensi./smea; % the weighing matrix of minimizing nucleoli effect for each strip
        
        weighted = intensi.*x(indx,j);   % nb from now this is relative value
         
        avint(j) = mean(weighted);
        avnonw(j) = mean(intensi);   
        
    end 

        jm = [1:(size(avint,2))]';
        mi = ones(size(avint,2),1);
        d = [1:strip:(size(avint,2))*strip]; % create distance vector in strip jumps
        
% Normalizing over first 100 time points
       if i <= 100
           nfaca(jm,i) = avint.^(-1); % normalizing
       end
        nfac = mean(nfaca,2); % makes mean by adding then dividing along each row
        avinti(i,jm) = nfac.*avint';         

        jma = [1:(size(avnonw,1))];
        avnonwi(i,jma)= avnonw;
        
        di(i,jm) = d;
        def = double(def);
        tm(i,jm) = def(i).*mi;
        
        disp(['Iteration ' num2str(t(np*def(i))) ' looped!']);
        disp(' '); 
end

% figure(6);
% mesh(di,tm,avnonwi) % x,y,z
% colormap autumn
% xlabel('distance from center of bleach')
% ylabel('time')
% zlabel('nonweighted intensity')
% title('Unweighed Cell Bleaching Profile')

% figure(7);plot(tm, avinti(:,10), '.g')
% hold on;
% plot(tm, avinti(:,20), '.y')
% plot(tm, avinti(:,30), '.c')

figure(8);
mesh(di,tm,avinti) % x,y,z
colormap hsv
xlabel('distance from center of bleach')
ylabel('time')
zlabel('weighted intensity')
grid on;
if exist('nfac')
    title('Normalized Cell Bleaching profile')
else
    title('Weighed Cell Bleaching Profile')
end

figure(91);
%plot(tm, avinti(:, 3), '-.k');
%hold on;
plot(tm, avinti(:,10), 'g.');
hold on;
plot(tm, avinti(:,20), 'y.');
hold on;
plot(tm, avinti(:,30), 'c.');
hold on;
plot(tm, avinti(:,40), 'm.');
hold on;
plot(tm, avinti(:,50), 'r.');
hold on;
plot(tm, avinti(:, 60), 'k.');
hold on;
plot(tm, avinti(:,70), 'b.')
hold on;
% plot(tm, avinti(:,80), '-w')
% hold on;
% plot(tm, avinti(:,90), '-.c')
%hold on;
%plot(tm, avinti(:,100), '-.m')
%hold on;
%plot(tm, avinti(:,110), '-.r')


%hold off;
title('Space dependance portrayed in 2D graph')
%legend('1u', '10u', '20u', '30u', '40u', '50u')
saveas(gcf,'/users/lgm/bosanac/PROGRAMI/impro/alphamdrb/figures/alphamdrb3.jpg', 'jpeg')
% Create matrix to be saved in ascii format in current directory:
 M = [di, tm, avinti];
 %save('/export/home1/lgm/bosanac/PROGRAMI/analize/radial/data1.dat', 'M');

save('/users/lgm/bosanac/PROGRAMI/impro/alphamdrb/data/data4.mat', 'di', 'tm', 'avinti', 'intcaunt');

% figure;
% plot(xblez, yblez, 'b*');
% hold on;
% plot(xblet, yblet, 'r*');
% title('red: kept coordinates')
figure(4); 
hold on; 
plot(xblet, yblet, 'r*'); 
plot(xcor(:,50), ycor(:,50), 'b*');
plot(xcor(:,70), ycor(:,70), 'y*'); 
plot(xcor(:,1), ycor(:,1), 'g*');
plot(xla,yla, 'mo');


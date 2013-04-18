%analysis through all time steps
%nota bene: does not include artifacts of cell movement

%clearing parametres from "analize"
clear avint k intt

%nuclins;

% number of iterations
mt = max(t)-1;

def = [1:mt];

for i = 1 : naio %iterating for each time point 
   
        % ESTIMATION OF BACKGROUND FOR SUBTRACTION 
        inb = find(gpic == i);
        intebkg = mean(inbkg(inb)); % the mean of the background intensity for the time step specified
        if i == 1
            ulbk = intebkg;
        end
        
%        bkgc = mean(inttol);
        
        intebkgo(i) = intebkg;
        
        % ESTIMATE OF BLEACH OF ENTIRE PICTURES - as bkg maneovre
        intds = find(tcon == i); 
        intcaci = mean(con(intds));
        intcac = (intcaci-intebkg)/(confac-ulbk); % normalized bleach factor
        intcaunt = intcac;
        intcaunto(i) = intcac(1);
        
        % EXCLUDING PROBLEMATIC AREAS FROM ANALYSIS: see 'analize.m'
        pinx = find(t == i); % pulling out indices corresponding to the time of i
        diso = dis(pinx);
        intaz = int(pinx);
        tjoj = t(pinx);
        xblez = xble(pinx);
        yblez = yble(pinx);
        
           %%%%%WWTTTTTFFFFFFFFFFFFFFFFFFFFFFFF
        if size(pinx) < max(excind)
              dd = max(excind) - size(pinx);
        excind(end-dd:end) = [];
        end
        
        [disjoj, ind] = sort(diso,'ascend'); %returns sorted matrix diss with the correspond.indices of dis
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
       
        intam(i) = mean(inta);
        
        nare(i) = length(inta);
        
        %inta = intat - bkgc;
        
        %intaat = inta.*intcac; % bleach corrected
        intaat = inta./intcac;
        
        diss = disjoj - min(disjoj);
        st = floor((max(diss)-min(diss))/strip); % number of rings

    for j = 1 : st %counting the rings outwards
        
        indx = find((diss>strip*(j-1))&(diss<strip*j)); % j=1first ring, j=2second,etc.
        intensi = intaat(indx);
        
        xbleaj = xblet(indx);
        ybleaj = yblet(indx);
        
        xcor(indx,j) = xbleaj;
        ycor(indx,j) = ybleaj;
        
        si = sum(intensi)./length(intensi); 
        preals = ones(size(intensi));
        smea = si.*preals; % creating the mean intensity for strip matrix
        intensi = double(intensi);
        x(indx,j) = intensi./smea; % the weighing matrix of minimizing nucleoli effect for each strip
        
        weighted = intensi.*x(indx,j);   % nb from now this is relative value
         
        si = length(weighted);
     
        
        avint(j) = sum(weighted)./si;
       
    end 

        jm = [1:(size(avint,2))]';
        mi = ones(size(avint,2),1);
        d = [1:strip:(size(avint,2))*strip]; % create distance vector in strip jumps
     

if i <= naio
      nfaca(jm,i) = avint.^(-1); % additional normalizing 
end


     nfac = mean(nfaca,2);
end


loopnorm;

ma = size(avinti,2);
novotoa = zeros(size(avinti(:,ma)));
ioi = zeros(size(avinti(:,ma)));



 for j = 1:ma
    s(j) = std(avinti(1:naio,j));
 end

    % additional correction for bleach by fitting first 100 points to exponential 
    for i = 1: ma
    [NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(tm(1:naio, i), avinti(1:naio, i), s(i));
    ioi(:,i) = NewPar(1).*exp(NewPar(2).*tm(:,i));
    
    avinti(:,i) = (ioi(:,i).^(-1)).*avinti(:,i);
   
    end
    
% 
% figure(6);
% mesh(di,tm,avnonwi) % x,y,z
% colormap autumn
% xlabel('distance from center of bleach')
% ylabel('time')
% zlabel('nonweighted intensity')
% title('Unweighed Cell Bleaching Profile')

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

%figure(91);
%plot(tm, avinti(:, 3), '-.k');
%hold on;
% plot(tm, avinti(:,st/30), 'g.');
% hold on;
% plot(tm, avinti(:,st/20), 'y.');
% hold on;
% plot(tm, avinti(:,st/10), 'c.');
% hold on;
% plot(tm, avinti(:,st/5), 'm.');
% hold on;
% plot(tm, avinti(:,st/3), 'r.');
% hold on;
% plot(tm, avinti(:, st/2), 'k.');
% hold on;
% plot(tm, avinti(:, st-5), 'b.');
% hold off;
% %legend('1u', '10u', '20u', '30u', '40u', '50u')
% title('Space dependance portrayed in 2D graph')
%plot(tm, avinti(:, 3), '-.k');
%hold on;
figure(91);
plot(tm, avinti(:,10), 'r.');
hold on;
plot(tm, avinti(:,20), 'Color', naranca, 'Linestyle', '.');
hold on;
plot(tm, avinti(:,30), 'Color', barbika, 'Linestyle', '.');
hold on;
plot(tm, avinti(:,40), 'Color', color2, 'Linestyle', '.');
hold on;
plot(tm, avinti(:,50), 'Color', kricavo, 'Linestyle', '.');
hold on;
plot(tm, avinti(:,60), 'r.');
hold on;
plot(tm, avinti(:,70), 'y.');


legend('10', '20', '30', '40')
grid on;
%hold on;
%plot(tm, avinti(:,50), 'Color', soft, 'Linestyle', '.');
% hold on;
% plot(tm, avinti(:,50), 'r.');%cytoplasm starts
% hold on;
% plot(tm, avinti(:,70), 'r.'); 
% hold on;
% plot(tm, avinti(:,90), 'k.');
% hold on;
% plot(tm, avinti(:, 150), 'k.');
% hold on;
% plot(tm, avinti(:, 200), 'k.');
hold off;
%legend('3u', '10u', '30u', '50u', '70u', '90u', '150u', '200u')
title('Space dependance portrayed in 2D graph')
axis([0 500 0 1.05])

a1 = char(dirn);
a = a1(end);
xin = a1(end-1);

if find(str2num(xin)) == 1; % double digit
    nam = char(['data', a1(end-1), a]); 
    nam1 = char(['cell', a1(end-1), a]);
else
nam = char(['data', a]); 
nam1 = char(['cell', a]);
end
% 
% nam = 'data3'; 
% nam1 = 'cell3';
% 


cd(dirnf);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('analyzed');
cd('slika');
saveas(gcf, nam, 'jpeg') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd(dirnf);
% Create matrix to be saved in ascii format in current directory:
M = [di, tm, avinti];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('analyzed');
cd('data');
save(nam, 'di', 'tm', 'avinti', 'intcaunt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd(dirnf);
% saving additional data for each picture: intensity of background,
% intensity of control cell, intensity of bleached cell and the number of
% pixels (used for calculation of area) of the bleached cell, and
% approximative estimation of the measure of the drb effect. 

%draff = sum(avinti(:,58) - avinti(:,5)) % measure of drb effect
%draff = draff*ones(size(intebkgo));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%save('fulldata/fulldata2a.mat', 'intebkgo', 'intcacio', 'intam', 'nare', 'draff');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%save('fulldata/notnormal1a.mat', 'di', 'tm', 'avnonwi');

%area = (length(xblet)*160^2)/10^6; % area in micrometers squared

figure(54);
plot(xblez, yblez, 'b*');
hold on;
plot(xblet, yblet, 'r*');
title('red: kept coordinates')
%legend(num2str(area));% num2str(round(ra)));
%text(300,300, num2str(area),'FontSize',18)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('analyzed');
cd('slika');

saveas(gcf, nam1, 'jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd(path_current);

% figure(4); 
% imshow(iaf);
% hold on; 
% plot(xblet, yblet, 'y*'); 
% plot(xcor(:,5), ycor(:,5), 'b*');
% plot(xcor(:,20), ycor(:,20), 'y*'); 
% plot(xcor(:,50), ycor(:,50), 'g*');
% plot(xla,yla, 'mo');

figure(4); 
imshow(iaf1);
hold on; 
%plot(xblet, yblet, 'y*'); 
plot(xcor(:,10), ycor(:,10), 'r*');
plot(xcor(:,20), ycor(:,20), 'Color', naranca, 'Linestyle', '*'); 
plot(xcor(:,30), ycor(:,30), 'Color', barbika, 'Linestyle', '*');
plot(xcor(:,40), ycor(:,40), 'Color', color2, 'Linestyle', '*');
plot(xcor(:,50), ycor(:,50), 'Color', kricavo, 'Linestyle', '*');
plot(xcor(:,60), ycor(:,60), 'r*');
plot(xcor(:,70), ycor(:,70), 'y*');
plot(xla,yla, 'mo');

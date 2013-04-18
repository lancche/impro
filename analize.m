% starts the analysis
%nota bene: does not include artifacts of
%-cell movement

%np = length(int)/npic; % number of pixels of laserized selection per picture
%!!! there is different number of pixels for various time points???!!!
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% excluding nucleolis, saturation, background:

disto = dis(1:np); % taking data from first picture only (t=1)
intto = int(1:np); % taking data from first picture only (t=1)

t = double(t);
maxt =  max(t);

%inttol = int(npa*(maxt-1):npa*maxt); % last picture intensity

[dist, indes] = sort(disto, 'ascend');
intt = intto(indes); % first picture intensities sorted according to distance
%inttol = inttol(indes); % last picture intensities 

bakl = bfa*mint; % background level 

%inuc = find(intt < nuint);
%intt(inuc) = []; % getting rid of dark nucleoli
%dist(inuc) = [];
%%%%%%%%%%%%%%%%%%%insert interface choice for dark or light nucleoli
insat = find(intt > 65535); % indices of intensity sorted acc.to distance
intt(insat) = []; % getting rid of saturated points
dist(insat) = [];
inbak = find(intt < bakl); % indices of intensity sorted acc.to distance
intt(inbak) = [];
dist(inbak) = [];

%excind = cat(1, inuc, insat, inbak); % exclusion indexes for future 600
exceind = cat(1, insat, inbak);
excind = sort(exceind, 'ascend');

%inttol(excind) = [];

dist = double(dist);
mina = double(mina);
disto = double(disto);

distt = dist - min(disto);
distoo = disto - min(disto);

% drawing background border versus selection:
linja = bakl*ones(size(1:max(disto)));

figure(2); 
plot(distoo, intto, 'r*')
hold on;
plot(distt, intt, 'g*')
hold on;
plot(linja, 'b')
hold off;
title('exclusion of background')
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for radial distances analysis:
[diss,ind] = sort(distt,'ascend'); % returns sorted matrix diss with the correspond.indices of dis
ints = intt(ind); % returns intensity sorted according to distance index
st = floor((max(distt) - min(distt))/strip); % number of strips

% create distance vector in strip jumps:
d = [1:strip:(st*strip)]'; % distance per strip in [nm]
avint = zeros(st,1);
avnonw = zeros(st,1);

% contrasts the data in order to obtain lower significance of low intensity
% pixels for final average of whole strip.
 
for j = 1:st
        indx = find((distt>=strip*(j-1))&(distt<=strip*j)); % finding indices of distt present in 1 strip
        intens = intt(indx); % finding the corresponding intensities of the pixels
       
        cou(j) = length(indx);
        
        intensi = intens;
        si = mean(intensi); 
        preals = ones(size(intensi));
        smea = si.*preals; % creating the mean intensity for strip matrix
        intensi = double(intensi);
        x(indx,j) = intensi./smea; % the weighing matrix of minimizing nucleoli effect for each strip
        
        weighted = intensi.*x(indx,j);   % nb from now this is relative value
         
        avint(j) = mean(weighted);
        avnonw(j) = mean(intensi);   
end

% figure(9);
% plot(cou, '*')
% xlabel('strip')
% ylabel('pixels')
% 
% cous = sqrt(cou)./cou;
% 
% figure(95);
% plot(cous, 'mo', 'MarkerSize', 10)
% title('error wrt. distance from center')
% 
% figure(10);
% plot(avint, 'r')
% hold on;
% plot(avnonw)
% 
% figure;
% plot(d, avint, 'r*');
% hold on;
% plot(d, avnonw, 'g*')
% title('Intensity profile of first picture over whole cell');
% xlabel('Distance from center');
% ylabel('Intensity');
% legend('weighed','non-weighed');

face;

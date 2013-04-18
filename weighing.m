% reads dropdown choice of user
if k == 1;
figure(5);
plot(d,avnonw, 'g*')
hold on;
plot(d,avint, 'm*')
title('Intensity profile of the cell before bleaching')
ylabel('Intensity')
xlabel('Distance from bleaching spot[nm]')
legend('nonweighted', 'weighted');
grid on;
hold off;

elseif k == 2;
%    noav = avintiz.*(avintiz.^(-1)); % setting all intensity at time 1, equal to 1
%    nfac = avintiz.^(-1);
   
anfac = 1;

elseif k == 3;
    cd(direce);
    datanuc = load('tn.txt');
    cd(path_current) % returns to "home" directory, before calling other scripts

    % Ascribing variables:
    nrnuc = databkg(:,1); 
    tbnuc = databkg(:,2); %time
    intnuc = databkg(:,3); %distance from center of bleach spot

    % analyzing the first time step only
    npn = max(nrnuc);
    indexnuc = find(tbnuc == tbnuc(npn));
    inennuc = intnuc(indexnuc);
    nuclin = mean(inennuc); % weighing factor for bleach, to be multiplied for each time step
        
end

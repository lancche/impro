% Redoing the normalizing to 1 on averages:


path_current = pwd; % displays current directory

[file path] = uigetfile('*.mat','Select Data File','/users/lgm/bosanac/');  % set browser path and select files

cd(path);

load(file);

cd(path_current);

% % Ascribing variables:
% %moje
% di = todi;
% ti = totm;
% avi = toavinti;

mt = length(todi(:,1));
jm = [1:(size(toavinti,2))]';

for i = 1 : mt
if i <= naio
     nfaca(jm,i) = toavinti(i).^(-1); % normalizing 

     % cheap fix for two-photon:
     if isnan(nfaca) == 1
         nfaca = nfaca(jm,1);
     end
     
end
end

 nfac = mean(nfaca,2); % makes mean by adding then dividing along each row

 for i = 1 : mt

 ctoavinti(i,jm) = nfac'.*toavinti; 
   
 end

 figure;
 mesh(todi, totm, ctoavinti)
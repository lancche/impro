% % contencates new imageJ code to the matlab code
% 
% % N.B. im.m cuts the upper intensities by imadjust!
% 

%clear sequence newseq f nam novseq anoseq
 
% finding factor for normalizing: analyzing the first time step only
tcon = datacon(:,1); % time
intd = find(tcon == 1); % finds indices
nc = max(intd);
con = datacon(:,4); % intensity

intcac = con(intd); % finds values of intensity of the control cell bleach during time t = 1s
confac = mean(intcac); % weighing factor for bleach, to be multiplied for each time step

% asigning variables for bleached cell: 
t = datatog(:,1); %time
inted = find(t == 1);
np = max(inted);
int = datatog(:,4); %intensity at the pixel of coordinates (x,y)
dis = datatog(:,5); %distance from center of bleach spot
xble = datatog(:,2);
yble = datatog(:,3);

% asigning variables for background:
gpic = databkg(:,1);
nb = max(find(gpic == 1));
inbkg = databkg(:,2); 

mint = mean(inbkg);
mina = max(inbkg);

% asiging for nucleoli:
%intnuc = Hu(:,4);

%nuint = mean(intnuc);

input_par;

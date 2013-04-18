
clear post; 
cd(dirn); 
files = dir; 

for i = 4 : length(files); 
    
cd(dirn)
post = load(files(i).name); 

B = immultiply(pre, bie); % whole cell before laser
Bp = immultiply(post(i), bie); % whole cell before laser
Ib = find(B); % indices for before laser 
Ibp = find(Bp);

Bl = B(Ib); % intensities for before laser
Blp = Bp(Ibp);

% showing for selection for laser spot:---------------------------
C = immultiply(pre, cie); % whole cell before laser
Cp = immultiply(post(i),cie); % whole cell after laser
[y, x, Ic] = find(C); % nadji cifre za intenzitet prije lazera
[yp, xp, Icp] = find(Cp); % poslje lazera

Ic = find(C);
Icp = find(Cp);

Lao = C(Ic);
Lapo = Cp(Icp);

Cpb = immultiply(post(i),kie); % whole cell after laser
Cb = immultiply(pre,kie);
Icpb = find(Cpb); % poslje lazera
Icb = find(Cb);

bakpre = Cb(Icb);
bakpost(i) = Cpb(Icpb);

bakprem = mean(bakpre);
bakpost(i) = mean(bakpost(i));

looj2;

end
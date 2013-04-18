


% areas of the cells: 
DRB = [511.5648, 529.792, 616.4992, 464.0768, 502.9376, 541.0304, 437.2224, ...
                       456.2432, 420.3008, 388.7104, 446.9504];
% decay ratios: corresponding...
dr = [0.01287, 0.01254, 0.01075, 0.01565, 0.01367, 0.01132, 0.01323, 0.01243, ...
                                                     0.01413, 0.01577, 0.01267];

[drb, j] = sort(DRB);

dr = dr(j);

d = sum(drb);
m = mean(dr);

meann = sum(dr.*drb)./d;


figure; plot(drb,dr)



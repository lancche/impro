% areas of the cells: 
DRB = [274, 227, 272, 296, 322, 312, 293, 255, 285];
%sum(60-5thring) 
dr = [70, 67,74, 62, 74, 72, 73, 53, 63, 59];

[drb, j] = sort(DRB);

dr = dr(j);

d = sum(drb);
m = mean(dr);

meann = sum(dr.*drb)./d;


figure; plot(drb,dr, '*')



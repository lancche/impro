



% areas of the cells: 
VIVO = [399.36, 354.3296, 447.3088, 338.2272, 465.8432, 463.1552, 440.1664, 404.7104, 346.8288, 415.1552];


% decay ratios: corresponding...
dr = [0.01403, 0.01368, 0.01361, 0.01439, 0.01286, 0.01387, 0.01253, 0.01386, 0.01472, 0.01306];

[vivo, j] = sort(VIVO);

dr = dr(j);

d = sum(vivo);
m = mean(dr);

meann = sum(dr.*vivo)./d;


figure; plot(vivo,dr)



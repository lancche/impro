% gaussian:

x = [0:1:16];

a = 1;
b = 0.1;
c = 1;
k = 1;
w = 1;

y = -a*exp(-((x-b)/c).^2);

y1 = exp(-k*exp(-2*(x.^2)/w^2));

figure; 
plot(x, y, 'r-o');

figure;
plot(x,y1, 'g-o');
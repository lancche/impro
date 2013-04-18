% saves data file of averages for plotting

ma = length(toavinti(1,:));
s = zeros(1,ma);

for j = 1:ma
s(j) = std(toavinti(1:naio,j));
end

novotoa = zeros(size(toavinti(:,ma)));
ioi = zeros(size(toavinti(:,ma)));


% fits the radii separately to exponentials and corrects additionaly for
% faulty normalization 
for i = 1: ma
[NewPar, NewPar_Err, Cov, Chi2, Freedom, residu] = fitexpo(totm(1:naio, i),toavinti(1:naio, i), s(i));
a(i) = NewPar(1);
b(i) = NewPar(1);
ioi(:,i) = NewPar(1).*exp(NewPar(2).*atm(:,i));
novotoa(:,i) = (ioi(:,i).^(-1)).*toavinti(:,i);
end


figure(92);
plot(totm(:,5), toavinti(:,5), 'g*',... 
    totm(:,10), toavinti(:,10), 'y*', ...
    totm(:,20), toavinti(:,20), 'c*', ...
   totm(:,30), toavinti(:,30), 'm*', ...
   totm(:,40), toavinti(:,40), 'r*', ...
    totm(:,50), toavinti(:,50), 'k*', ...
    totm(:,60), toavinti(:,60), 'b*');
hold off;
legend('5r', '10r', '20r', '30r', '40r', '50r', '60r')
title('Before normalizing: Space dependance portrayed in 2D graph')


figure(91);
plot(totm(:,5), novotoa(:,5), 'g.',... 
    totm(:,10), novotoa(:,10), 'y.', ...
    totm(:,20), novotoa(:,20), 'c.', ...
   totm(:,30), novotoa(:,30), 'm.', ...
   totm(:,40), novotoa(:,40), 'r.', ...
    totm(:,50), novotoa(:,50), 'k.', ...
    totm(:,60), novotoa(:,60), 'b.');
hold off;
legend('5r', '10r', '20r', '30r', '40r', '50r', '60r')
title('Space dependance portrayed in 2D graph')

bootav;

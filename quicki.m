

avinti = avinti(100:end, :);
avinti = avinti(:,1:105);
u = isnan(avinti);
avinti(u) = 0;

a = sum(avinti,2)/length(avinti(1,:));

figure; plot(a)
cftool;

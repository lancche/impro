
tm = [1:600];
sind = zeros(1,10);

aavintia5 = aavinti(:,5);
%aavinti3 = aavinti(:,30);
%aavinti5 = aavinti(:,50);
%aavinti7 = aavinti(:,70);
ind = find(aavintia5>0);
aavintia5 = aavintia5(ind);
tma = tm(ind);
sind(1) = length(tma); 

bavintia5 = bvinti(:,5);
%bavinti3 = bvinti(:,30);
%bavinti5 = bvinti(:,50);
%bavinti7 = bvinti(:,70);
ind = find(bavintia5>0);
bavintia5 = bavintia5(ind);
tmb = tm(ind);
sind(2) = length(tmb); 

cavintia5 = cvinti(:,5);
%cavinti3 = cvinti(:,30);
%cavinti5 = cvinti(:,50);
%cavinti7 = cvinti(:,70);
ind = find(cavintia5>0);
cavintia5 = cavintia5(ind);
tmc = tm(ind);
sind(3) = length(tmc); 

davintia5 = dvinti(:,5);
%davinti3 = dvinti(:,30);
%davinti5  = dvinti(:,50);
%davinti7 = dvinti(:,70);
ind = find(davintia5>0);
davintia5 = davintia5(ind);
tmd = tm(ind);
sind(4) = length(tmd); 

eavintia5 = evinti(:,5);
%eavinti3 = evinti(:,30);
%eavinti5 = evinti(:,50);
%eavinti7 = evinti(:,70);
ind = find(eavintia5>0);
eavintia5 = eavintia5(ind);
tme = tm(ind);
sind(5) = length(tme); 

favintia5 = fvinti(:,5);
%favinti3 = fvinti(:,30);
%favinti5 = fvinti(:,50);
%favinti7 = fvinti(:,70);
ind = find(favintia5>0);
favintia5 = favintia5(ind);
tmf = tm(ind);
sind(6) = length(tmf); 

havintia5 = hvinti(:,5);
%havinti3 = hvinti(:,30);
%havinti5 = hvinti(:,50);
%havinti7 = hvinti(:,70);
ind = find(havintia5>0);
havintia5 = havintia5(ind);
tmh = tm(ind);
sind(7) = length(tmh); 

gavintia5 = gvinti(:,5);
%gavinti3 = gvinti(:,30);
%gavinti5 = gvinti(:,50);
%gavinti7 = gvinti(:,70);
ind = find(gavintia5>0);
gavintia5 = gavintia5(ind);
tmg = tm(ind);
sind(8) = length(tmg); 

javintia5 = jvinti(:,5);
%javinti3 = jvinti(:,30);
%javinti5 = jvinti(:,50);
%javinti7 = jvinti(:,70);
ind = find(javintia5>0);
javintia5 = javintia5(ind);
tmj = tm(ind);
sind(9) = length(tmj); 

kavintia5 = kvinti(:,5);
%kavinti3 = kvinti(:,30);
%kavinti5 = kvinti(:,50);
%kavinti7 = kvinti(:,70);
ind = find(kavintia5>0);
kavintia5 = kavintia5(ind);
tmk = tm(ind);
sind(10) = length(tmk); 


b = min(sind);
aavintia5 = aavintia5(1:b);
bavintia5 = bavintia5(1:b);
cavintia5 = cavintia5(1:b);
davintia5 = davintia5(1:b);
eavintia5 = eavintia5(1:b);
favintia5 = favintia5(1:b);
havintia5 = havintia5(1:b);
gavintia5 = gavintia5(1:b);
javintia5 = javintia5(1:b);
kavintia5 = kavintia5(1:b);

ta5 = [aavintia5'; bavintia5'; cavintia5'; davintia5'; eavintia5'; favintia5'; havintia5'; gavintia5'; javintia5'; kavintia5'];
tm = [1:598]';
tma = tm; tmb = tm; tmc= tm; tmd = tm; tme = tm; tmf = tm; tmh = tm; tmg = tm; tmj = tm; tmk = tm;
tmo = [tma'; tmb';tmc'; tmd'; tme'; tmf'; tmh'; tmg'; tmj'; tmk'];

% for j = 1:10;
%     cur = ta5(j,:);
%     curt = tmo(j,:);
% 
%     ind = find(cur > 0);
% 
%     ta5(j,:) = cur(ind);
%     tmo(j,:) = curt(ind);
% 
%     sind(1) = length(tmo(:,j)); 
%end

% for i = 1: length(ta5(:,1))
% d5s1000(i) = bootstrp(1000, 'corr', tmo(:,i), ta5(:,i));
% ci(i) = bootci(1000, @corr, tmo(:,i), ta5(:,i)); 
% end

% 10x10 different combinations of correlation between the traces:
corr(ta5');

d5s1000 = bootstrp(1000, 'corr', ta5');
%ci = bootci(1000, @corr, ta5(1)); 

figure(1);
hist(d5s1000,30)
%set(get(gca,'Children')),'FaceColor',[.8 .8 1])
title('Variation in Correlation Coefficients')



%0.975 0.025


%d5s1000(1,:)
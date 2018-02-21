x = [randn(100,1); 4+randn(50,1)];
[hts,ctrs] = hist(x);
bar(ctrs,hts,'hist');
area = sum(hts) * (ctrs(2)-ctrs(1));
xx = linspace(-3,7);
hold on; 
plot(xx,area*normpdf(xx,mean(x),std(x)),'r-');
f = ksdensity(x,xx);
plot(xx,area*f,'g-')
hold off
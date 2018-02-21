load examgrades
x = grades(:,1);
y = grades(:,2);


[h,p] = ttest2(x,y,'Vartype','unequal')

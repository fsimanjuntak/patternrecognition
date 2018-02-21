mu_1 = 5;
mu_2 = 7;
var = 4;

x_star = 10;

false_alarm = 1 - normcdf(10, mu_1, sqrt(var));
fprintf('Probability of false alarm = %f\n', false_alarm);

hit = 1 - normcdf(10, mu_2, sqrt(var));
fprintf('Probability of hit = %f\n', hit);

%discriminability 
d1 = (7 - 5)/sqrt(4);
fprintf('Discriminability = %f\n', d1);

d2 = (9 - 5)/sqrt(4);
fprintf('Discriminability = %f\n', d2);

d3 = 3;
m3_2 = (d3*sqrt(var))+5;
fprintf('x given d=3 = %f\n', m3_2);


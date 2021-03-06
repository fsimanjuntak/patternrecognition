% Given constants
g1_mu = [3 5];
g1_cov = [1 0; 0 4];
g1_w = 0.3;
g2_mu = [2 1];
g2_cov = [2 0; 0 1];
g2_w = 0.7;


g1 = @(x,y) -0.5 * x.^2 -0.125 * y.^2 + 0*x*y + 3*x + 1.25*y - 11.36;
g2 = @(x,y) -0.25 * x.^2 -0.5 * y.^2 + 0*x*y + 1*x + 1*y - 5.0411;

f_bounds = @(x,y) (x.^2 * -0.25) + (y.^2 * -0.375) + 0*x*y + (2*x) + (0.25*y) - 6.3189;

fimplicit(f_bounds, [-10 20 -10 20]);
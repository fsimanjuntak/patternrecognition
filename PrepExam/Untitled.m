% s1 = [3 3;4 1; 4 3;5 3;4 5];
% s2 = [2 7; 4 6; 6 7;4 8;4 7];
% 
% mu_s1 = mean(s1);
% mu_s2 = mean(s2);
% 
% cov_s1 = cov(s1);
% cov_s2 = cov(s1);
% 
% inv_s1 = inv(cov_s1);
% inv_s2 = inv(cov_s2);
% 
% det_s1 = det(cov_s1);
% det_s2 = det(cov_s2);
% 
% prob_w = 0.5;
% 
% log_w = log(prob_w);
% log_phi = -1/2*log(2*pi);
% log_det_1 = -1/2*log(det_s1);
% log_det_2 = -1/2*log(det_s2);

s1 = [1 5;2 4; 3 5;2 6];
s2 = [1 7; 3 6; 5 7;3 8];
points = [-2;-1;0;1;2];

circle(3,3,2)
hold on;
circle(4,2,1)
hold on;
circle(5,5,3)

function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
hold off
end
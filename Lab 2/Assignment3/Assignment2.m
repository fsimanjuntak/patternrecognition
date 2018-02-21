%Given mu and covariance matrix

%1. Plot of the two-dimensional Gaussian pdf
mu = [3 4];
cov_matrix = [1 0; 0 2];
x1 = -10:0.5:10; x2 = -10:0.5:10;
[X,Y] = meshgrid(x1,x2);
F = mvnpdf([X(:) Y(:)],mu,cov_matrix);
F = reshape(F,length(x2),length(x1));
mesh(X,Y,F)
xlabel('X'); ylabel('Y'); zlabel('Probability Density');
title('Probability Density Function of 2 variables using mesh plot')

%2. Calculate the Mahalanobis distance from the mean to the poin [10 10]
X_mvn = mvnrnd(mu,cov_matrix,100000); 
d1 = sqrt(mahal([10 10],X_mvn))
d2 = sqrt(mahal([0 0],X_mvn))
d3 = sqrt(mahal([3 4],X_mvn))
d4 = sqrt(mahal([6 8],X_mvn))
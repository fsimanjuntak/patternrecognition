X = load('data_lvq_A(1).mat');    
Y = load('data_lvq_B(1).mat');

mu = [ mean(Y.matB(:,1)) mean(Y.matB(:,2))];
Sigma = [std(Y.matB(:,1)) std(Y.matB(:,2))];
x1 = Y.matB(:,1); x2 = Y.matB(:,2);
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
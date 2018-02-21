feature_vectors = [4 5 6; 6 3 9; 8 7 3; 7 4 8; 4 6 5];

%Mean of features
mean_feature = mean(feature_vectors);

%Question 1
mean_feature_1 = mean_feature(1,1);
%Question 2
mean_feature_2 = mean_feature(1,2);
%Question 3
mean_feature_3 = mean_feature(1,3);
%Covariance matrix for question 4 -12
covmatrix_feature_vectors = cov(feature_vectors)*4/5;
display(covmatrix_feature_vectors)
%Question 4
covmatrix_1_1 = covmatrix_feature_vectors(1,1);
%Question 5
covmatrix_1_2 = covmatrix_feature_vectors(1,2);
%Question 6
covmatrix_1_3 = covmatrix_feature_vectors(1,3);
%Question 7
covmatrix_2_1 = covmatrix_feature_vectors(2,1);
%Question 8
covmatrix_2_2 = covmatrix_feature_vectors(2,2);
%Question 9
covmatrix_2_3 = covmatrix_feature_vectors(2,3);
%Question 10
covmatrix_3_1 = covmatrix_feature_vectors(3,1);
%Question 11
covmatrix_3_2 = covmatrix_feature_vectors(3,2);
%Question 12
covmatrix_3_3 = covmatrix_feature_vectors(3,3);
%Question 14
X1 = [5 5 6];
prob_density_X1 = mvnpdf(X1, mean_feature,covmatrix_feature_vectors)
fprintf('Probability density function [5 5 6] = %f\n', prob_density_X1)

%Question 15
X2 = [3 5 7];
prob_density_X2 = mvnpdf(X2, mean_feature,covmatrix_feature_vectors)
fprintf('Probability density function [3 5 7] = %f\n', prob_density_X2)

%Question 16
X3 = [4 6.5 1];
prob_density_X3 = mvnpdf(X3, mean_feature,covmatrix_feature_vectors)
fprintf('Probability density function [4 6.5 1] = %f\n', prob_density_X3)

%test_cov = ((4-5.8)*(4-5.8)+(6-5.8)*(6-5.8)+(8-5.8)*(8-5.8)+(7-5.8)*(7-5.8)+(4-5.8)*(4-5.8))/5;
%test_cov1 = ((4-5.8)*(5-5)+(6-5.8)*(3-5)+(8-5.8)*(7-5)+(7-5.8)*(4-5)+(4-5.8)*(6-5))/5;
%fprintf('manual covariant  = %f\n', test_cov1)

%constant_k= 5;
%feature_vectors2 = [4*constant_k 5*constant_k 6*constant_k; 6*constant_k 3*constant_k 9*constant_k; 8*constant_k 7*constant_k 3*constant_k; 7*constant_k 4*constant_k 8*constant_k; 4*constant_k 6*constant_k 5*constant_k];
%cov(feature_vectors)
%cov(feature_vectors2)









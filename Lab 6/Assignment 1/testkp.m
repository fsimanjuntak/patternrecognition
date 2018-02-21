data = load('kmeans1.mat');
X = data.kmeans1;

[L,C] = kp(X,8)
%[centroids, class] = kmeanplusplus(X,8)


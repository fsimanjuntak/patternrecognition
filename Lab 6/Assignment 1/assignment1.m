clear

K = 4;
dim = 2;
variance = 1;
sdev = sqrt(variance);

cluster1 = sdev*randn(200,dim) + kron(ones(200,1),[0,0]);
cluster2 = sdev*randn(300,dim) + kron(ones(300,1),[0,0]);
cluster3 = sdev*randn(100,dim) + kron(ones(100,1),[0,6]);
cluster4 = sdev*randn(500,dim) + kron(ones(500,1),[6,0]);

% Build data matrix
X = [cluster1 ; cluster2 ; cluster3; cluster4];

% Now apply the K-means algorithm
% Note that order of results may vary
maxerr = 0;
[proto Nproto membership] = simple_kmeans(X,K,maxerr);
disp(proto)
disp(Nproto)



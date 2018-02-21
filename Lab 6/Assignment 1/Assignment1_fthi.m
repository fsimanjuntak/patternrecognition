data = load('checkerboard.mat');
X = data.checkerboard;
% Apply the k-means and k-means++ algorithms to this data set using k=100 and compute the value of the quantization error achieved by each algorithm at convergence. 
% Repeat this procedure 20 times, each time using a different initialization, and compute the minimum quantization error over the 20 runs for each algorithm.
K=100;
Kmax =10;
for m=1:Kmax
    for avg=1:20
        [ic, centroids, Cluster] = Kmeans(X,K);
        Temporal(avg,:) = Quntization(X,m, centroids, Cluster);
    end
    Jk(m,:) = mean(Temporal(:,1))
end

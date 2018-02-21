data = load('checkerboard.mat');
X = data.checkerboard;
% Apply the k-means and k-means++ algorithms to this data set using k=100 and compute the value of the quantization error achieved by each algorithm at convergence. 
% Repeat this procedure 20 times, each time using a different initialization, and compute the minimum quantization error over the 20 runs for each algorithm.
K=100;
Kmax =10;
for m=1:Kmax
    for avg=1:20
        [centroids, Cluster] = Kmeans(X,K);
        [Ndata D] = size(X);
          for Cetr=1:K
              counter = 1;
             for l=1:Ndata
                 if (Cluster(l,:) == Cetr)
                      x = X(l,:) - centroids(Cetr,:); 
                      tempdata(counter,:) = x*x';
%                     tempdata(counter,:) = pdist2(X(l,:),centroids(Cetr,:));
                    counter = counter+1;
                 end 
             end
             Quanta(Cetr,:) = sum(tempdata);
          end
        Temporal(avg,:) = 1/2 * sum(Quanta);
    end
    Jk(m,:) = min(Temporal(:,1))
end

% Kmeans quantization error
% 25.8452   43.4767   47.3555   48.1974   49.2429   72.9598   74.2582   78.0639   81.0333   84.0944
% Kmeans++ quantization error
% 24.8287   23.2098   25.5890   24.1051   23.3882   24.6405   27.9154   29.0688   26.3700   29.1966
% mean 25.8312
% sd = 2.2297
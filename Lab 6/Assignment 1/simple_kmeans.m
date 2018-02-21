function [means,Nmeans,membership] = simple_kmeans(X,K,maxerr)

% function [medias,Nmedias] = simple_kmedias(X,K,maxerr)
%   Finds K prototypes representing the samples in data matrix X,
%   where each row of X represents a sample. 
%   Iterates until maximum norm difference between
%   prototypes found in successive iterations is < maxerr
%   
%   This script uses square Euclidean distance, 
%   but can be easily modified to use other metrics
%
% Output arguments
%   means: matrix with each row a cluster prototype
%   Nmeans: Number of samples in each cluster
%   membership: Assigned class for each sample
%
% Example:
%   X = [randn(100,1) ;  2+randn(100,1)];
%   K = 2;
%   [means Nmeans] = simple_kmeans(X,K,0)
%
%   Mauricio Martinez-Garcia, 2003, 2007, 2016

[Ndata, dims] = size(X);
dist = zeros(1,K);
means = zeros(K,dims);
if (nargout > 2)
    membership = zeros(Ndata,1);
end

% Initial prototype assignment (arbitrary)
% for i=1:K-1
%    means(i,:) = X(i,:);
% end
% means(K,:) = mean(X(K:Ndata,:));

    % Choose one point at random from the set of all data points and let this point be the first prototype
    randomindex = randi([1 length(X)],1,1);
    means(1,:) = X(randomindex,:);
    
    % If K is greater than 1 then computes the prototypes for K=2 ... n
    if (K>1)
     for i=2:K
       normalized_distances  =  zeros(Ndata,1);
        % In the beginning, there is only one prototype but later other
        % prototypes are being added.
       for j=1:Ndata
           % For each data point x, compute D(x), the distance between x and the nearest prototype
           for k=1:(i-1)
               diff = X(j,:) - means(k,:);
               distance(k,:) = diff(:,1).^2+diff(:,2).^2;
           end

           % Find value of minimum distance
            [min_distance_val,index_min] = min(distance);
            distances(j,:) = min_distance_val;
       end

       %Compute normalized distances
       for j=1:length(distances)
           normalized_distances(j,:) = distances(j,:)/sum(distances);
       end

       random_uniform_distribution = rand();
       cumsum_prob_distances = cumsum(normalized_distances);

       % Assign new prototype
       for j=1:length(cumsum_prob_distances)
            if (cumsum_prob_distances(j,:) >= random_uniform_distribution)
                means(i,:) = X(j,:);
                break;
            end
       end
     end 
    end

%K-means clustering
cmp = 1 + maxerr;
while (cmp > maxerr)
   % Sums (class) and data counters (Nclass) initialization
   class = zeros(K,dims);
   Nclass = zeros(K,1);

   % Groups each elements to the nearest prototype
   for i=1:Ndata
      for j=1:K
         % Euclidean distance from data to each prototype
         dist(j) = norm(X(i,:)-means(j,:))^2;
      end
      % Find indices of minimum distance
      index_min = find(~(dist-min(dist)));
      % If there are multiple min distances, decide randomly
      index_min = index_min(ceil(length(index_min)*rand));
      if (nargout > 2)
          membership(i) = index_min;
      end
      class(index_min,:) = class(index_min,:) + X(i,:);
      Nclass(index_min) = Nclass(index_min) + 1;
   end
   for i=1:K
      class(i,:) = class(i,:) / Nclass(i);
   end

   % Compare results with previous iteration
   cmp = 0;
   for i=1:K
      cmp = norm(class(i,:)-means(i,:)); 
   end

   % Prototype update
   means = class;
end

Nmeans = Nclass;
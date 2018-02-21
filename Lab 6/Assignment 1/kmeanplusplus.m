function [centroids,class] = kmeanplusplus(data,K)
    % Declare variables
    [Ndata, dims] = size(data);
    centroids = zeros(K,dims);
    stop_iter = 0;
    maxiter = 100;
    iter = 1;
    counter_history_centroid=1;

    % ====== Initial prototype assignment using K-Mean++ approach ========
    
    % Choose one point at random from the set of all data points and let this point be the first prototype
    randomindex = randi([1 length(data)],1,1);
    centroids(1,:) = data(randomindex,:);
    % Keep the history of centroids
    historycentroids(counter_history_centroid,:) = [centroids(1,:),iter];
    counter_history_centroid = counter_history_centroid+1;
    
    % If K is greater than 1 then computes the prototypes for K=2 ... n
    if (K>1)
     for i=2:K
       normalized_distances  =  zeros(Ndata,1);
        % In the beginning, there is only one prototype but later other
        % prototypes are being added.
       for j=1:Ndata
           % For each data point x, compute D(x), the distance between x and the nearest prototype
           for k=1:(i-1)
               diff = data(j,:) - centroids(k,:);
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
                centroids(i,:) = data(j,:);
                % Keep the history of centroids
                historycentroids(counter_history_centroid,:) = [centroids(i,:),iter];
                counter_history_centroid = counter_history_centroid+1;
                break;
            end
       end
     end 
    end
 
 % ============== Perform K-Means algorithm =======================
 % Perform K-Means clustering
 % Perform K-Means clustering
  while stop_iter == 0
        mean_converge = 0;
        class = zeros(Ndata,1);
        tempclass = zeros(K,dims);
        Nclass = zeros(K,1);
    
         % Groups each elements to the nearest prototype
         for i=1:Ndata
            %Get the euclidian distance to each prototype
            for j=1:K
               distance(j) = pdist([data(i,:);centroids(j,:)],'euclidean');
            end

            % Find indices of minimum distance
            [min_val,index_min] = min(distance);

            % Assign data point to the class that has minimum distance
            class(i,:) = index_min;
            tempclass(index_min,:) = tempclass(index_min,:) + data(i,:);
            Nclass(index_min) = Nclass(index_min) + 1;
         end
         oldcentroids = centroids;
         
         % Recompute the centroids
         for i=1:K
            % Compute mean of corresponding class
            tempclass(i,:) = tempclass(i,:) / Nclass(i);
            
            if isnan(tempclass(i,:))
               tempclass(i,:) = [0 0];
            end
            % Keep the history of centroids
            historycentroids(counter_history_centroid,:) = [tempclass(i,:),iter+1];
            counter_history_centroid = counter_history_centroid+1;
         end
         % Assign new centroids
         centroids = tempclass;
         
         % Count how many centroids haven't changed anymore
         for i=1:K
            if (centroids(i,:) - oldcentroids(i,:) == 0)
                mean_converge = mean_converge + 1 ;      
            end
         end 
         
        % Stopping criteria:
        % 1. Check if all centroids haven't changed anymore
        % 2. Check the iteration whether it has reached max iteration or not. 
        %    In this case the difference between current centroids and old
        %    centroids only small, therefore introducing max iteration will help to avoid looping forever.
        if (mean_converge == dims || iter == maxiter)
            stop_iter = 1 ; 
        end
      iter = iter+1;
  end
    
  return
end
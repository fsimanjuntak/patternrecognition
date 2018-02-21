function [centroids,class] = Kmeans(data,K)
    % Declare variables
    [Ndata, dims] = size(data);
    centroids = zeros(K,dims);
    stop_iter = 0;
    maxiter = 40;
    iter = 1;
    counter_history_centroid=1;
    dist = zeros(1,K);

    % Initial prototype assignment (arbitrary centroids)
    for i=1:K
       % Pick random points
       randomindex = randi([1 length(data)],1,1);
       centroids(i,:) = data(randomindex,:);
       % Keep the history of centroids
       historycentroids(counter_history_centroid,:) = [centroids(i,:),iter];
       counter_history_centroid = counter_history_centroid+1;
    end
    
    
    
%     ============================
    
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
               diffV = data(i,:) - centroids(j,:);
               distance(j) = diffV(:,1).^2+diffV(:,2).^2;
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
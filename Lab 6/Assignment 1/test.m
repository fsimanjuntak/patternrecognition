%Define variables
data = load('kmeans1.mat');
X = data.kmeans1;
K = 2;
kmeans_clusters = [2,4,8];

%Plot K-Means clusters
colors = ["red" "blue", "green", "black", "magenta", "cyan","yellow","white"];
markers = ['o','+','*','x','s','d','v','>'];

for i=1:length(kmeans_clusters)
   %Call K-Means function
%    [centroids, class] = Kmeans(X,kmeans_clusters(:,i)); 
[centroids, class] = kmeanplusplus(X,kmeans_clusters(:,i));
   % Plot each classfied point based on each prototype 
   subplot(2,2,i)
   arrlegend = strings(kmeans_clusters(:,i),1);
   for j=1:kmeans_clusters(:,i)
     [classifieddatapoints] = getclassifieddatapoints(X,class,j); 
     if (~isempty(classifieddatapoints))
          scatter(classifieddatapoints(:,1),classifieddatapoints(:,2),[],markers(j));
          str_title = sprintf('K=%d', kmeans_clusters(:,i));
          arrlegend(j,:) = sprintf('Class %d', j);
          title(str_title)
          xlabel('X');
          ylabel('Y');
          hold on; 
     end

     for k=0:length(centroids)/kmeans_clusters(:,i)-1
         idx = k*kmeans_clusters(:,i)+j;
         if(idx == length(centroids)-(kmeans_clusters(:,i)-j))
            scatter(centroids(idx,1),centroids(idx,2),100,"black",'o');
         else
             if (k == 0)
                scatter(centroids(idx,1),centroids(idx,2),100,"black",'d');
             end
             plot_arrow(centroids(idx,1),centroids(idx,2),centroids(idx+kmeans_clusters(:,i),1),centroids(idx+kmeans_clusters(:,i),2),'linewidth',2,'color',[0.5 1 0.5],'facecolor',[0 0 0] );
         end
         
     end
   end
%      legend(arrlegend);
%      hold on;
end

% Function that returns classified datapoints based on label
function [groupeddatapoints] = getclassifieddatapoints(datapoints,classifieddatapoints,label)
    counter = 1;
    groupeddatapoints=[];
    for i=1:length(classifieddatapoints)
        if(classifieddatapoints(i,:) == label)
            groupeddatapoints(counter,:) = datapoints(i,:);
            counter = counter+1;
        end
    end
 return
end


clear;
data = load('cluster_data.mat');
X = data.cluster_data;
eucD = pdist(X,'euclidean');
Z = linkage(eucD,'complete');
[h,nodes] = dendrogram(Z,0);
figure;
c = cluster(Z,'maxclust',4);
scatter(X(:,1),X(:,2),50,c)
centroid = zeros(4,2)
for cls=1:4
    count =0;
for i=1:length(c)
    if cls == c(i)
       centroid(cls,:) = centroid(cls,:) + X(i,:); 
       count = count + 1;
    end
end
centroid(cls,:) = centroid(cls,:)/count;
end
hold on;
scatter(centroid(:,1),centroid(:,2),100,'black','filled');
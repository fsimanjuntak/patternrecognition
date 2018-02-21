data = load('kmeans1.mat');
X = data.kmeans1;
[Ndata D] = size(X);


Kmax =10;
for k=1:Kmax
    for avg=1:20
        [centroids, Cluster] = Kmeans(X,k);
        Temporal(avg,:) = QuntizationFunc(X,k, centroids, Cluster);
    end
    Jk(k,:) = mean(Temporal(:,1));
    Rk(k,:) = Jk(1)*(k^(-2/D));
    Dk(k,:) = Rk(k,:)/Jk(k,:);
end
 [val ind] = max(Dk)

figure(1);
plot(Dk);
hold on;
plot(ind, Dk(ind),'black');
hold off;

figure(2);
plot(Jk);
hold on;
plot(Rk);
plot([ind ind], [0 12000]);
hold off;


function Je = QuntizationFunc(X,k,centroids, Cluster)
[Ndata D] = size(X);
          for Cetr=1:k
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
          Je = 1/2 * sum(Quanta);
return
end

clear;
X = [ 0 0; 2 3; 1 4; 4 2; 3 0];
Cluster = [2 2 1 2 1];
Cluster = Cluster';
K =2;

c1 = mean([;X(3,:); X(5,:)]);
c2 =  mean([X(1,:);X(2,:); X(4,:)]);
centroids = [c1;c2]
Je = Quntization(X,K,centroids,Cluster)

function Je = Quntization(X,K,centroids, Cluster)
[Ndata D] = size(X)
          for Cetr=1:K
              counter = 1;
             for l=1:Ndata
                 if (Cluster(l,:) == Cetr)
                      x = X(l,:) - centroids(Cetr,:);                       
                      tempdata(counter,:) = x*x';
                    counter = counter+1;
                 end 
             end
             Quanta(Cetr,:) = sum(tempdata);
             tempdata = [];
          end
          Je = sum(Quanta);
return
end
function Je = Quntization(X,k,centroids, Cluster)
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
K = 100;
data = load('checkerboard');
data = data.checkerboard;
epoches = [20,100,200,500];

% Plot data points
for i=1:length(epoches)
   epoch = epoches(:,i);
   [lastPrototypes] = batchNG(data,K,epoches(:,i),1,1);
   subplot(2,2,i)
   plot(data(:,1),data(:,2),'bo','markersize',3)
   hold on;
   plot(lastPrototypes(:,1),lastPrototypes(:,2),'r.','markersize',10,'linewidth',3)  
   voronoi(lastPrototypes(:, 1), lastPrototypes(:, 2));
   xlabel('X');
   ylabel('Y');
   tt = sprintf('Batch Neural Gas clustering, %d epochs', epoch);
   title(tt);
   hold on;
end

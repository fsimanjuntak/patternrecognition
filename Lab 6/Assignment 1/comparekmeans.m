K = 100;
% epochs = 100;
data = load('checkerboard');
data = data.checkerboard;

% Plot for k-means
figure(1);
[prototypesHistory,lastPrototypes, class] = Kmeans(data, K);
plot(data(:,1),data(:,2),'bo','markersize',3)
hold on
plot(lastPrototypes(:,1),lastPrototypes(:,2),'r.','markersize',10,'linewidth',3)  
voronoi(lastPrototypes(:, 1), lastPrototypes(:, 2));
xlabel('X');
ylabel('Y');
tt = sprintf('%d-Means clustering', K);
title(tt);
hold off;
pause;

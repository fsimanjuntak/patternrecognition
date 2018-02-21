rawdata = load('cluster_data.mat');
data = rawdata.cluster_data;
arr_threshold=[0.05, 0.1, 0.15, 0.2, 0.25];

% Cluster all data points based on given thresholds
% clusterAll(data, arr_threshold);

% Cluster best
best_threshold = 0.18;
clusterBestThreshold(data, best_threshold);

function clusterAll(data, arr_threshold)
    for k=1:length(arr_threshold)
        subplot(3,2,k);
        str_title = sprintf('Threshold=%.2f', arr_threshold(:,k));
        scatter(data(:,1),data(:,2));
        title(str_title)
        xlabel('x axis');
        ylabel('y axis');
        hold on;

        for i=1:length(data)
            %calculate the distance
            for j=i+1:length(data)
                %compute the distance
                diffV = data(i,:) - data(j,:);
                distance = sqrt(diffV(:,1).^2+diffV(:,2).^2);
                %create an edge if the distance is smaller than given threshold
                if(distance < arr_threshold(:,k))
                   line([data(i,1) data(j,1)],[data(i,2) data(j,2)])
                end
            end
        end
      hold on; 
    end
end

function clusterBestThreshold(data, best_threshold)
    colors = ["red" "blue", "green", "magenta", "cyan","yellow","white"];
    str_title = sprintf('Threshold=%.2f', best_threshold);
    scatter(data(:,1),data(:,2));
    title(str_title)
    xlabel('x axis');
    ylabel('y axis');
    hold on;

    for i=1:length(data)
        %calculate the distance
        for j=i+1:length(data)
            %compute the distance
            diffV = data(i,:) - data(j,:);
            distance = sqrt(diffV(:,1).^2+diffV(:,2).^2);
            %create an edge if the distance is smaller than given threshold
            if(distance < best_threshold)
               line([data(i,1) data(j,1)],[data(i,2) data(j,2)])
            end
        end
    end
end


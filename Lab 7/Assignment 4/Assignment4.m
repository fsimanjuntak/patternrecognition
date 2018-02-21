data = load('provinces.mat');
provinces = data.provinces;

% Compute the mean of each feature
mean_population = mean(provinces(:,1));
mean_area = mean(provinces(:,2));
mean_density = mean(provinces(:,3));
mean_gdp = mean(provinces(:,4));
mean_gdppercap = mean(provinces(:,5));

% Compute the standard deviation of each feature
sd_population = std(provinces(:,1));
sd_area = std(provinces(:,2));
sd_density = std(provinces(:,3));
sd_gdp = std(provinces(:,4));
sd_gdppercap = std(provinces(:,5));

% Compute Z scores
for i=1:length(provinces)
   zscore_population = (provinces(i,1)-mean_population)/sd_population;
   zscore_area = (provinces(i,2)-mean_area)/sd_area;
   zscore_density = (provinces(i,3)-mean_density)/sd_density;
   zscore_gdp = (provinces(i,4)-mean_gdp )/sd_gdp ;
   zscore_gdppercap = (provinces(i,5)-mean_gdppercap)/sd_gdppercap;
   
   zscore(i,:) = [zscore_population zscore_area zscore_density zscore_gdp zscore_gdppercap];
   
end

% Compute dissimilarities matrix
distancematrix = pdist(zscore);
dissmatrix = squareform(distancematrix);

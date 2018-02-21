% ================ 1. Correlation coefficient pairs =========================== %
%a. height vs height c(1,1)%
corrcoef(lab1_1(:,1),lab1_1(:,1)); %1.0%
%b. age vs height c(1,2)%
corrcoef(lab1_1(:,1),lab1_1(:,2)); %-0.0615%
%c. weight vs height c(1,2)%
corrcoef(lab1_1(:,1),lab1_1(:,3)); %0.7156%
%d. height vs age c(2,1)%
corrcoef(lab1_1(:,2),lab1_1(:,1)); %-0.0615%
%e. age vs age c(2,2)%
corrcoef(lab1_1(:,2),lab1_1(:,2)); %1.0%
%f. weight vs age c(2,3)%
corrcoef(lab1_1(:,2),lab1_1(:,3)); %0.5142%
%g. height vs weight c(3,1)%
corrcoef(lab1_1(:,3),lab1_1(:,1)); %0.7156%
%h. age vs weight c(3,2)%
corrcoef(lab1_1(:,3),lab1_1(:,2)); %0.5142%
%i. weight vs weight c(3,3)%
corrcoef(lab1_1(:,3),lab1_1(:,3)); %1.0%

% ================ 2. 2D Scatter plots  =========================== %
%a. The two features for which the correlation coefficient is largest%
scatterplotA = scatter(lab1_1(:,1),lab1_1(:,3));
scatterplotA.MarkerEdgeColor = 'r';
title('Largest');
xlabel('feature 1: height in centimeters');
ylabel('feature 3: weight in kilograms');

%b. The two features for which the correlation coefficient is the second largest%
scatterplotB = scatter(lab1_1(:,2),lab1_1(:,3));
scatterplotB.MarkerEdgeColor = 'r';
title('Second largest');
xlabel('feature 2: age in years');
ylabel('feature 3: weight in kilograms');

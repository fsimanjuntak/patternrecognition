%---------------------------------------------------- Assignment 1 -------------------------

% Load the matrix
 X = importdata('data_lvq_A(1).mat');
 Y = importdata('data_lvq_B(1).mat');
 A = zeros(length(X(:,1)),1);
 B = ones(length(Y(:,1)),1);
 Data = [X A; Y B];
 W1 = [ mean(X(:,1)) mean(X(:,2))];
 W3 = [ mean(Y(:,1)) mean(Y(:,2))];
 W2 = W1;
 
 W = [W1 ; W2; W3];
 cluster = [0 0 1];
% Intialize the KFold parameters
 kFold =10;
 ksize = length(Data(:,1))/kFold;
 
% The following for loop does the actual 10-fold cross validation
% The are only 20 data points for each fold
 for crossV =1 : kFold
  % Compute the starting and finishing index for the Kfold
         finish = crossV*ksize;
         start = finish - (ksize-1);
  % We evenly split the dataset into training and test dataset
     TestData = Data(start:finish, :);
     TrainData = [Data(1:start-1, :); Data(finish+1:length(Data(:,1)), :)];
  %  fprintf('[%f - %f] \n', start, finish);
  % We train the LVQ classifier and get the new position of the prototypes
  % Here we use the Training dataset
      [WNew Error] = ObtainTrainingError(TrainData,W, cluster);
  %   We test the the LVQ classifier using the test dataset
  % Additionally we collect the classification error for each of the KFold
  % cross validations
      [WFinal ErrorNew] = ObtainTrainingError(TestData,WNew, cluster);
      FinalError(crossV,:) = mean(ErrorNew);
 end

% The following plots the bar graph for each KFold cross validation
% It also adds the percentage of classification error to each of the bar graphs
    figure(3);
    barFontSize = 15;
    for b = 1 : 10
        BarPlot(b) = bar(b, FinalError(b), 'BarWidth', 0.9); % actual plot
        set(BarPlot(b), 'FaceColor', 'blue'); %Apply color
        barTopper = sprintf('%.1f%s', FinalError(b)*100,'%'); % Place text on top
        text(b-0.5, FinalError(b)+0.01, barTopper, 'FontSize', barFontSize); % position the text
        hold on;
    end

% The following is to plot the test error line which is the average
% classification error from all the KFold cross validations
      for i=1:10
         TestError(i,:) = [i mean(FinalError)]; 
      end
      TestError = [0 mean(FinalError);TestError; 11 mean(FinalError)];
      plot(TestError(:,1), TestError(:,2),'red');
      barTopper = sprintf('%.1f%s', mean(FinalError)*100,'%'); % Place text on top
      text(0.5, mean(FinalError)+0.01, barTopper, 'FontSize', barFontSize); % position the text
      
      
 % Function to obtain training error rate based on given prototype
function [W ErrorRate] = ObtainTrainingError(Data, W, cluster)
    % Intializing parameters
    Examples = length(Data(:,1));
    count = 0;
    Epoches = 20; 
    learnrate = 0.01;
    previous_error = 0;
    constant_error_rate_counter = 0;
    
    % Loop epoches
    for epoch=1:Epoches
      % Iterate over the datapoints
      for idx=1:Examples
        Instance = Data(idx,1:2);
        class  = Data(idx,3);
        % Ecludean distance and prototype comparision
        for m=1:length(W(:,1))
            x(m,:) = Instance - W(m,:); 
            dist(m) = sqrt(x(m,:)*x(m,:)');
        end
        % The index and distance value of the nearest prototype   
        % Update the prototype based on the class label similarity
        [val ind] = min(dist);
        if class == cluster(ind)
            W(ind,:) = W(ind,:) + learnrate*(x(ind,:));
        else
            W(ind,:) = W(ind,:) - learnrate*(x(ind,:));
            % Increment the misclassified data points
            count = count +1;
        end
      end
      %Calculating the error
      current_error = count/Examples;
      ErrorRate(epoch,:) = current_error;
      
      %If previous error equals to current error
      if (previous_error == current_error)
          constant_error_rate_counter = constant_error_rate_counter+1;
      else
          previous_error = current_error;
          constant_error_rate_counter = 0;
      end
      
      % If the last three error rates are equal, stop the epoch
      if (constant_error_rate_counter == 3)
          break
      end
      count = 0; 
    end
 return
end

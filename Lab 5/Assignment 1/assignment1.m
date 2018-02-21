%---------------------------------------------------- Assignment 1 -------------------------
% First investigate this data set by making a scatter plot of the two classes, where the classes are distinguishable (for example, by color). Upload a plot of the 2D feature space together with the data points.
plotClassesOnScatterPlot();

% For your choice of the number of prototypes per each class (presented with an argument in a previous question), run the learning algorithm and plot the training error curve against the number of epochs.
chosen_prototypes = [2 1];
error_rate_chosen_prototype = ObtainTrainingError(chosen_prototypes);
plot(error_rate_chosen_prototype);
title('Training Error Curve');
xlabel('Epoches');
ylabel('Error Rate');

arr_prototypes = [1 1;1 2; 2 1; 2 2];
% Create a plot with 4 training error curves corresponding to the LVQ1 training with the following combinations of numbers of prototypes per class: 1-1, 1-2, 2-1, 2-2. 
for i=1:4
   error_rate_prototype = ObtainTrainingError(arr_prototypes(i,:));
   plot(error_rate_prototype);
   hold on; 
end
title('Training Error Curve');
xlabel('Epoches');
ylabel('Error Rate');
legend('1 1','1 2', '2 1', '2 2') ;

% Create a figure with 4 plots (side by side in a 2x2 matrix arrangement) of the feature space with the data and the prototypes for each of the four cases (1-1, 1-2, 2-1, 2-2), after the training that you ran in the previous question. For each plot, color each datapoint  according to the class of the nearest prototype after the end of the training
color = ["red" "blue", "green", "yellow"];
for i=1:4
   % Classify points based on prototypes
   prototypes = arr_prototypes(i,:);
   classifiedpoints = getClassifiedPointsBasedOnPrototype(prototypes);
   
   % Break down classified points based on each prototype 
   row_prototype = arr_prototypes(i,:);
   lengthofprototype = row_prototype(1)+row_prototype(2); 
   arrlegend = strings(lengthofprototype,1);
   
   for j=1:lengthofprototype
      maxprototypeclassA = row_prototype(1);
      if (j<=maxprototypeclassA)
          arrlegend(j,:) = sprintf('Class A prototype %d', j);
      else
          arrlegend(j,:) = sprintf('Class B prototype %d', (j-maxprototypeclassA));
      end
       
      % Plot each classfied point based on each prototype 
      singleprototype = getClassfiedPoints(classifiedpoints,j);
      subplot(2,2,i);
      scatter(singleprototype(:,1),singleprototype(:,2),[],color(j));
      str_title = sprintf('%d - %d', prototypes(1), prototypes(2));
      title(str_title)
      xlabel('X');
      ylabel('Y');
      
      hold on; 
   end
    legend(arrlegend);
    hold on;
end

%Function to make a simple scatter plot of class A and class B
function plotClassesOnScatterPlot()
    % Load the matrix from the file "data_lvg_A(1).mat"
    A = load('data_lvq_A(1).mat');
    % Load the matrix from the file "data_lvg_B(1).mat"
    B = load('data_lvq_B(1).mat');
    % Investigate this data set by making a scatter plot of the two classes, where the classes are distinguishable (for example, by color). Upload a plot of the 2D feature space together with the data points.
    scatter(A.matA(:,1),A.matA(:,2),[],"blue");
    axis on, axis normal, hold on;
    scatter(B.matB(:,1),B.matB(:,2),[],"red");
    title('Scatter plot of Class A and Class B');
    xlabel('X');
    ylabel('Y');
    legend('Class A','Class B') ;
end

% Function to obtain training error rate based on given prototype
function ErrorRate = ObtainTrainingError(prototypes)
    %Load matrix
     X = importdata('data_lvq_A(1).mat');
     Y = importdata('data_lvq_B(1).mat');
     A = zeros(length(X(:,1)),1);
     B = ones(length(Y(:,1)),1);
     Data = [X A; Y B];
     W = [];
     cluster = [];
     counterweight=1;
     previous_error = 0;

     % Create random prototypes based on given cases
     if (prototypes(1) == 1)
         W(counterweight,:) = [ mean(X(:,1)) mean(X(:,2))];
         cluster(counterweight,:) = 0;
         counterweight = counterweight+1;
     else
         W(counterweight,:) = [ mean(X(:,1)) mean(X(:,2))];
         W(counterweight+1,:) = [ mean(X(:,1)) mean(X(:,2))];
         cluster(counterweight,:) = 0;
         cluster(counterweight+1,:) = 0;
         counterweight = counterweight+2;
     end

     if (prototypes(2) == 1)
         W(counterweight,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         cluster(counterweight,:) = 1;
     else
         W(counterweight,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         W(counterweight+1,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         cluster(counterweight,:) = 1;
         cluster(counterweight+1,:) = 1;
     end

    % Intializing parameters
    Examples = length(Data(:,1));
    count = 0;
    Epoches = 20; 
    learnrate = 0.01;
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

%Function to obtain classified point based on prototype
function results = getClassifiedPointsBasedOnPrototype(prototypes)
    %Load matrix
     X = importdata('data_lvq_A(1).mat');
     Y = importdata('data_lvq_B(1).mat');
     A = zeros(length(X(:,1)),1);
     B = ones(length(Y(:,1)),1);
     Data = [X A; Y B];
     W = [];
     cluster = [];
     counterweight=1;
     results=[];

    % Create random prototypes based on given cases
     if (prototypes(1) == 1)
         W(counterweight,:) = [ mean(X(:,1)) mean(X(:,2))];
         cluster(counterweight,:) = 0;
         counterweight = counterweight+1;
     else
         W(counterweight,:) = [ mean(X(:,1)) mean(X(:,2))];
         W(counterweight+1,:) = [ mean(X(:,1)) mean(X(:,2))];
         cluster(counterweight,:) = 0;
         cluster(counterweight+1,:) = 0;
         counterweight = counterweight+2;
     end

     if (prototypes(2) == 1)
         W(counterweight,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         cluster(counterweight,:) = 1;
     else
         W(counterweight,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         W(counterweight+1,:) = [ mean(Y(:,1)) mean(Y(:,2))];
         cluster(counterweight,:) = 1;
         cluster(counterweight+1,:) = 1;
     end

    % Intializing parameters
    Examples = length(Data(:,1));
    count = 0;
    Epoches = 20; 
    learnrate = 0.01;
    idxcounterresult=1;

    % loop epoches
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
        
       %For the last epoc, plot each data point based on predicted label
       if (epoch ==12)
            results(idxcounterresult,:)=[Instance(1),Instance(2),ind];
            idxcounterresult = idxcounterresult+1;
       end
      end
      count = 0;
    end
end

%function get classified point based on prototype
function arrclassifiedpointsbasedonprototype = getClassfiedPoints(arr,idxprototype)
    arrclassifiedpointsbasedonprototype = [];
    idx = 1;
    for k=1:length(arr)
       row =  arr(k,:);
       if (row(3) == idxprototype)
           arrclassifiedpointsbasedonprototype(idx,:) = row;
           idx = idx+1;
       end
    end
   return 
end
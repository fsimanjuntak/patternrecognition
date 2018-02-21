function [W, Error] = LVQ(Data, W, cluster)


% intializing parameters
Examples = length(Data(:,1));
MisclassifiedCount = 0;
Epoches = 20; 
learnrate = 0.01;
previous_error = 0;
constant_error_rate_counter = 0;
% loop epoches
for epoch=1:Epoches
    MisclassifiedCount = 0;
%     iterate over the datapoints
  for idx=1:Examples
    Instance = Data(idx,1:2);
    class  = Data(idx,3);
%     Ecludean distance and prototype comparision
    for m=1:length(W(:,1))
        x(m,:) = Instance - W(m,:); 
        dist(m) = sqrt(x(m,:)*x(m,:)');
    end
%  The index and distance value of the nearest prototype   
% Update the prototype based on the class label similarity
 [val ind] = min(dist);
    if class == cluster(ind)
        W(ind,:) = W(ind,:) + learnrate*(x(ind,:));
    else
        W(ind,:) = W(ind,:) - learnrate*(x(ind,:));
%         increment the misclassified data points
        MisclassifiedCount = MisclassifiedCount +1;
    end  

  end
  
  %Calculating the error
      current_error = MisclassifiedCount/Examples;
      Error(epoch,:) = current_error;
      
      %If previous error equals to current error
      if (previous_error == current_error)
          constant_error_rate_counter = constant_error_rate_counter+1;
      else
          previous_error = current_error;
          constant_error_rate_counter = 0;
      end
        
end
% scatter(W(:,1), W(:,2),[ ], 'green');
% hold off;
% figure;
% subplot(2,2,4);
% plot(Error);
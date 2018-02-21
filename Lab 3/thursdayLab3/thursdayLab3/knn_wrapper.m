clear all;
load lab3_2.mat;

K=5;
samples=64;
data = lab3_2;
nr_of_classes = 2;

% Class labels
class_labels = floor( (0:length(data)-1) * nr_of_classes / length(data) );

% Sample the parameter space
result=zeros(samples);
for i=1:samples
  X=(i-1/2)/samples;
  for j=1:samples
    Y=(j-1/2)/samples;
    result(j,i) = KNN([X Y] ,K,data,class_labels);
  end;
end;

% Show the results in a figure
imshow(result,[0 nr_of_classes-1],'InitialMagnification','fit')
hold on;
title([int2str(K) '-NN, ' int2str(nr_of_classes) ' classes']);

% this is only correct for the first question
scaled_data=samples*data;
% plot(scaled_data(  1:100,1),scaled_data(  1:100,2),'go');
% plot(scaled_data(101:200,1),scaled_data(101:200,2),'r+');
% 

count =0;
for k=1:27
    
   if mod(k,2) == 1
       count = count +1;
       model = fitcknn(data,class_labels,'NumNeighbors',k ); 
        % Calculate misclassification error
        cvmodel = crossval(model, 'LeaveOut', 'on');
        cvError = kfoldLoss(cvmodel, 'lossfun', 'classiferror');
        val(count,:) = [k cvError];
        
   end
end

plot(val(:,1), val(:,2))
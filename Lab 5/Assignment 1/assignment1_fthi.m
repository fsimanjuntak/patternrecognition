 X = importdata('data_lvq_A(1).mat');
 Y = importdata('data_lvq_B(1).mat');
 A = zeros(length(X(:,1)),1);
 B = ones(length(Y(:,1)),1);
 Data = [X A; Y B];

 N = 2; 
 W1 = [ mean(X(:,1)) mean(X(:,2))];
 W3 = [ mean(Y(:,1)) mean(Y(:,2))];
 W2 = W3;
 W4 = W3;
 
 W = [W1 ; W3];
 cluster = [0 1];
% W = [W1 ; W3];
% cluster = [0 1];

%  scatter(X(:,1), X(:,2),[ ], 'red');
%  hold on;
%   scatter(Y(:,1), Y(:,2),[ ], 'blue');
  

% intializing parameters
Examples = length(Data(:,1));
count = 0;
Epoches = 20; 
learnrate = 0.01;
% loop epoches
for epoch=1:Epoches
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
        count = count +1;
    end  

    end
   %     Calculating the error 
        Error(epoch,:) = count/Examples;
        count = 0;
end
% scatter(W(:,1), W(:,2),[ ], 'green');
% hold off;
% figure;
% subplot(2,2,4);
plot(Error);
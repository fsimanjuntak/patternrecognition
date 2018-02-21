clear all;
load lab3_2.mat;

K=1;
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
    %fprintf('something = %f\n', X);
   % result(j,i) = KNN([X Y],K,data,class_labels);
  end;
end;


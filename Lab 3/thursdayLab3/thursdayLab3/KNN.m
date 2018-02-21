function [Label] = algorithm( sample, K , data, labels)
for m=1: 30
    x(m,:) = sample - data(m,:); 
    dist(m) = sqrt(x(m,:)*x(m,:)');
end
 [val ind] = mink(dist,K);
 for i=1:K
    LabelSmall(i) = labels(ind(i));  
 end
Label = mode(LabelSmall);
return
   
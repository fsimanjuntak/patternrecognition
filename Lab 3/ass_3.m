

cat1 = load('lab3_3_cat1.mat');
cat1 = cat1.x_w1;

cat2 = load('lab3_3_cat2.mat');
cat2 = cat2.x_w2;

cat3 = load('lab3_3_cat3.mat');
cat3 = cat3.x_w3;

h=2;

GivenX = [0.5 1.0 0; 0.31 1.51 -0.50; -1.7 -1.7 -1.7];

for datapoint=1:3
        Prop = phiFunc2(GivenX(datapoint, 1:end), cat1,h);
         fprintf('Data point %f =  probability for category1 is %f \n', datapoint, Prop);
         Pro1(datapoint,:) = Prop;
end


for datapoint=1:3
        Prop = phiFunc2(GivenX(datapoint, 1:end), cat2,h);
        fprintf('Data point %f =  probabltiy for catagory2 is %f \n', datapoint, Prop);
        Pro2(datapoint,:) = Prop;
end

for datapoint=1:3
        Prop = phiFunc2(GivenX(datapoint, 1:end), cat3,h);
        fprintf('Data point %f =  probabltiy for category3 is %f \n', datapoint, Prop);
        Pro3(datapoint,:) = Prop;
end

prior =0.333;
index_datapoint = 3;
posterior = (Pro3(index_datapoint)*prior)/((Pro1(index_datapoint)*prior)+(Pro2(index_datapoint)*prior)+(Pro3(index_datapoint)*prior));
% fprintf('Posterior probability of class point u %f \n', posterior);


K = 5;
for i=1:3
    result = KNN(GivenX(i,:) ,K,data,class_labels)
end


function [result] = phiFunc2(givenX, DatapJ,h)
    n = 10;
    for m=1:n
         x = givenX - DatapJ(m,:);
         nemn = sum(x*x');
         denm = 2*h*h;
         fun(m,:) = exp(-nemn/denm);
    end

     volum = (h*(sqrt(2*pi)))^3;
     den = volum * n;
     result = sum(fun)/den;
return

end

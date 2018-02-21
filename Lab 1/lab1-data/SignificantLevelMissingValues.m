%Load irish of observed values
testperson = load('testperson.mat');
testirish = testperson.iriscode;
testrowirish = testirish(1,:);
newiriscodeoftestperson = zeros(1,20);
counter1 = 1;

for i=1: 30
  iris_value = testrowirish(i);
   if (iris_value == 0 || iris_value == 1)
        newiriscodeoftestperson(counter1) = iris_value;
        counter1 =counter1+1;
   end
end

%Load content of the file
person = load("person05.mat");
SetHammingDistanceBetweenTestandGivenPerson = zeros(1,1000);

%Loop until 1000 to get the mean of the hamming distance between the
%test person and all given persons
for j=1 : 1000
   %random row 
   randomrow = randi([1 20]);
   allrowsofiriscode = person.iriscode;
   iriscodeofrandomrow = allrowsofiriscode(randomrow,:);
   %define new array by ignoring the missing codes
   newiriscodeofrandomrow = zeros(1,20);
   counter2 = 1;

   for k=1:30
      if (k == 1 || k == 3 || k == 5 || k ==6 || k ==7 || k == 8 || k ==9 || k ==10 || k == 12 || k == 14 || k == 15 || k == 17 || k == 19 || k ==20 || k == 21 || k == 23 || k == 24 || k == 27 || k == 28 || k == 30)
        newiriscodeofrandomrow(counter2) = iriscodeofrandomrow(k);
        counter2 = counter2 +1;
      end
   end
   %Obtain the hamming distance between test and given person
   SetHammingDistanceBetweenTestandGivenPerson(j) = pdist2(newiriscodeofrandomrow,newiriscodeoftestperson,'hamming');
end

MT = mean2(SetHammingDistanceBetweenTestandGivenPerson);
VT = var(SetHammingDistanceBetweenTestandGivenPerson);

%Plot its normal distribution
r_d = normrnd(MT,VT,1000,1);
histfit(r_d,20)

%Significant level
significant_level = normcdf(0.0262,MT,sqrt(VT));
fprintf('Significant Level = %f\n', significant_level)


%if (k ~= 2 || k ~= 4 || k ~= 11 || k ~= 13 || k ~= 16 || k ~= 18 || k ~= 22 || k ~= 25 || k ~= 26 || k ~= 29)


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

%Obtain the hamming distance between the testperson and all given persons
AverageHammingDistanceEveryone = zeros(1,20);

for i=1 : 20
    %Construct the appropriate naming of the file
   formatSpec = 'person%d%d.mat';
   if i <=9
       A1 = 0;
       A2 = i;
   elseif i >=11 && i< 20
       A1 = 1;
       A2 = mod(i,10);
   else
       A1 = i/10;
       A2 = 0;   
   end
   filename= sprintf(formatSpec,A1,A2);
   
   %Load content of the file
   person = load(filename);
   SetHammingDistanceBetweenTestandGivenPerson = zeros(1,1000);
   
   %Loop until 1000 to get the mean of the hamming distance between the
   %test person and all given persons
   for j=1 : 20
       %load iris code 
       allrowsofiriscode = person.iriscode;
       iriscodeofcorrespondingrow = allrowsofiriscode(j,:);
       %define new array by ignoring the missing codes
       newiriscodecorrespondingrow = zeros(1,20);
       counter2 = 1;
       
       for k=1:30
          if (k == 1 || k == 3 || k == 5 || k ==6 || k ==7 || k == 8 || k ==9 || k ==10 || k == 12 || k == 14 || k == 15 || k == 17 || k == 19 || k ==20 || k == 21 || k == 23 || k == 24 || k == 27 || k == 28 || k == 30)
            newiriscodecorrespondingrow(counter2) = iriscodeofcorrespondingrow(k);
            counter2 = counter2 +1;
          end
       end
       %Obtain the hamming distance between test and given person
       SetHammingDistanceBetweenTestandGivenPerson(j) = pdist2(newiriscodecorrespondingrow,newiriscodeoftestperson,'hamming');
   end
   %Compute the mean of hamming distance
   AverageHammingDistanceEveryone(i) = mean2(SetHammingDistanceBetweenTestandGivenPerson);
end

%Display the hamming distance
Display(AverageHammingDistanceEveryone);

%Obtain the minimum value of the mean hamming distance
Min_mean_HDistance = min(AverageHammingDistanceEveryone);
fprintf('Minimum Value = %f\n', Min_mean_HDistance)

%Obtain the mean and standard deviation hamming distance of everyone
Mean_HDistance = mean2(AverageHammingDistanceEveryone);
SD_HDistance = std(AverageHammingDistanceEveryone);

%Compute significant level
Significant_level = normcdf(Min_mean_HDistance,Mean_HDistance,SD_HDistance);
fprintf('Significant level = %f\n', Significant_level)

%Load irish of test person
testperson = load('testperson.mat');
testirish = testperson.iriscode;
testrowirish = testirish(1,:);
newiriscodeoftestperson = zeros(1,20);
counter1 = 1;

%Store the bits in a new array and ignore the bits with value 2
for i=1: 30
  iris_value = testrowirish(i);
   
   if (iris_value == 0 || iris_value == 1)
        newiriscodeoftestperson(counter1) = iris_value;
        counter1 =counter1+1;
   end
end

%Define an array that holds the average distance between testperson and
%person01 ... person20
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
   
   %Load content of the corresponding file
   person = load(filename);
   SetHammingDistanceBetweenTestandGivenPerson = zeros(1,1000);
   
   %Loop all rows in the corresponding file and obtain the hamming distance
   %between each row and the row of test person
   for j=1 : 20
       %load iris code 
       allrowsofiriscode = person.iriscode;
       iriscodeofcorrespondingrow = allrowsofiriscode(j,:);
       newiriscodecorrespondingrow = zeros(1,20);
       counter2 = 1;
      
       %Loop all rows in file
       for k=1:30
           %Store the existing bits of corresponding file in a new array.
           %Ignore the bits in which the values are missing in test person
          if (k == 1 || k == 3 || k == 5 || k ==6 || k ==7 || k == 8 || k ==9 || k ==10 || k == 12 || k == 14 || k == 15 || k == 17 || k == 19 || k ==20 || k == 21 || k == 23 || k == 24 || k == 27 || k == 28 || k == 30)
            newiriscodecorrespondingrow(counter2) = iriscodeofcorrespondingrow(k);
            counter2 = counter2 +1;
          end
       end
       %Obtain the hamming distance between test person and corresponding
       %row
       SetHammingDistanceBetweenTestandGivenPerson(j) = pdist2(newiriscodecorrespondingrow,newiriscodeoftestperson,'hamming');
   end
   %Compute the mean of hamming distance between test person and
   %corresponding row and store the results in array AverageHammingDistanceEveryone
   AverageHammingDistanceEveryone(i) = mean2(SetHammingDistanceBetweenTestandGivenPerson);
end

%Display the hamming distance
display(AverageHammingDistanceEveryone);

%Obtain the minimum value of the mean hamming distance which indicates the
%test person belong to the lowest hamming distance
Min_mean_HDistance = min(AverageHammingDistanceEveryone);
fprintf('Minimum Value = %f\n', Min_mean_HDistance)

%Obtain the mean and standard deviation hamming distance of everyone
Mean_HDistance = mean2(AverageHammingDistanceEveryone);
SD_HDistance = std(AverageHammingDistanceEveryone);

%Compute the significant level
Significant_level = normcdf(Min_mean_HDistance,Mean_HDistance,SD_HDistance);
fprintf('Significant level = %f\n', Significant_level)

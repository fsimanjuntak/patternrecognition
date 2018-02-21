% Set S, random index is used to read a file and rows inside the file
filename = "person01.mat";
for j=1 : 1000
   rowi = randi([1 20]);
   rowj = randi([1 20]);
   if rowi == rowj
       rowj = randi([1 20]);
   end
   randfile = randi([1 20]);
   person = load(filename);
   iriscode1 = person.iriscode;
   %ignore the missing codes
   newiriscode = zeros(20,1);
   counter = 1;
   
   for k=1:30
      if (k ~= 2 || k ~= 4 || k ~= 11 || k ~= 13 || k ~= 16 || k ~= 18 || k ~= 22 || k ~= 25 || k ~= 26 || k ~= 29)
          iriscode1(rowi,:)
          newiriscode(counter) = iriscode1(rowi,:);
          
          counter = counter +1;
      end 
   end
   
   
       
   SetIndividual(j,:) = pdist2(iriscode1(rowi,:),iriscode1(rowj,:),'hamming');
end
figure(1);
clear min

MS = mean2(SetIndividual);
VS = var(SetIndividual);

display(MS)
display(VS)
histogram(SetIndividual,5);

% Put up legend.
legend1 = sprintf('mu = %.3f', MS);
legend({legend1});


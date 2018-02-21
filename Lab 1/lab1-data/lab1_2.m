% Organizing the filenames
for i=1 : 20
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
   str= sprintf(formatSpec,A1,A2);
   Filenames(i,:) = str;
end

% Set S, random index is used to read a file and rows inside the file
for j=1 : 1000
   rowi = randi([1 20]);
   rowj = randi([1 20]);
   if rowi == rowj
       rowj = randi([1 20]);
   end
   randfile = randi([1 20]);
   person = load(Filenames(randfile,:));
   iriscode1 = person.iriscode;
   SetS(j,:) = pdist2(iriscode1(rowi,:),iriscode1(rowj,:),'hamming');
end
figure(1);
histogram(SetS,6);
hold on;

% Set D, for simplicity the index of the filename is used to select the row
% number as well (it is still random and different)
for j=1 : 1000
   rowi = randi([1 20]);
   rowj = randi([1 20]);
   if rowi == rowj
       rowj = randi([1 20]);
   end
   person1 = load(Filenames(rowi,:));
   person2 = load(Filenames(rowj,:));
   iriscode1 = person1.iriscode;
   iriscode2 = person2.iriscode;
   SetD(j,:) = pdist2(iriscode1(rowj,:),iriscode2(rowi,:),'hamming');
end
histogram(SetD,15);
hold on;

MS = mean(SetS);
MD = mean(SetD);

VS = var(SetS);
VD = var(SetD);

%Number of degree of freedom from two different persons. df = MD(1-MD)/VD = 24.9740 = 25
df = MD*(1-MD)/VD;

%Fit gaussian distribution



%http://www.matlab-cookbook.com/recipes/0050_Plotting/0025_Distributions/0014_overlayGausHist.html

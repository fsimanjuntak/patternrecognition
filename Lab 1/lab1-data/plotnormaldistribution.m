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

%Obtain mean and variance of each set
MS = mean(SetS);
MD = mean(SetD);

VS = var(SetS);
VD = var(SetD);

%Set histogram for setS and setD
numberofbins = 20;
[nSetS, xSetS] = hist(SetS,numberofbins);
[nSetD, xSetD]=hist(SetD,numberofbins);

%Plot histogram SetS
histogramSetS = bar(xSetS,nSetS,'hist');
set(histogramSetS , 'facecolor' , 'm') ;
hold on;

%Plot histogram SetD
histogramSetD = bar(xSetD,nSetD,'hist');
set(histogramSetD , 'facecolor' , 'g') ;
hold on;

%Set title, xlabel, and ylabel
title('Histogram of normal distributions normalized hamming distance SetS and SetD ')
xlabel('Normalized Hamming Distance')
ylabel('Frequency')

%Generate normal distribution SetS and SetD
norms = normpdf([0:0.00001:1] , MS , std(SetS));
normd = normpdf([0:0.00001:1] , MD, std(SetD));

%Plot normal distirbution setS and setD onto histogram
plot([0:0.00001:1],norms*1000*(x(nbins) - x(1))*3/nbins);
plot([0:0.00001:1],normd*1000*(x2(nbins) - x2(1))/nbins);

%Set the legend 
legend('Set S','Set D','Normal distribution for set S', 'Normal Distribution  for set D')
hold off;
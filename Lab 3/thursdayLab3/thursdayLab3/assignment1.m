

inp = load('lab3_1.mat');
inp = inp.outcomes;
count =0;
for i=1:200
    if inp(i,1) ==1
        if inp(i,2) == 1
            count = count +1 ;
        end
    end
    
    
end

hit = count/200;

count =0;
for i=1:200
    if inp(i,1) ==0
        if inp(i,2) == 1
            count = count +1 ;
        end
    end
    
    
end
xV = [0 0.1800 0.4800 0.5800 0.6200 0.8000 0.8800 0.9200 0.9600 0.9800 1.0000];
yV = xV;
fa = count/200;
%plot(OPTROCPT(1),OPTROCPT(2),'ro')
%axis([0 1 0 1])
%hold on;
%plot(0.5,0.5, 'r');
%hold off;
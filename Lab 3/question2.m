load lab3_1.mat


hits =0 
false_alarm = 0
for index = 1:200
    
   outcome = outcomes(index, :)
   
   if (outcome(1) == 1 && outcome(2) == 1)
       hits = hits+1;
   end  
   
   if (outcome(1) == 0 && outcome(2) == 1)
       false_alarm = false_alarm+1;
   end  
   
   %hits = hits + isequal([1,1], outcome)
   %false_alarm = false_alarm + isequal([0,1], outcome)
end

hit_rate = hits / 200
false_alarm = false_alarm/200
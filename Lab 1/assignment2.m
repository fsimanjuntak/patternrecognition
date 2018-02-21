%============== Assignment 2 =========================
%a. Hamming distance for set S
for i = 1:10000
    %Load one random file
    idx_randomfile = randi([1 20],1,1);
    random_file_name = sprintf('person%02d.mat',idx_random_file);
    file_struct = load(random_file_name);
    iris_matrix = file_struct.iriscode;
    
    %Load two random rows from the corresponding random file
    idx_randomrows = randi([1 20],1,2);
    %Load random row1 and random row2
    random_row1 =  iris_matrix(idx_randomrows(1),:);
    random_row2 =  iris_matrix(idx_randomrows(2),:);
    
    %Compute Hamming Distance (HD) between random_row1 and random_row2
    temp_hd = 0;
    for j=1:30
       if (random_row1(j) ~= random_row2(j))
           temp_hd = temp_hd + 1 ;
       end
    end
    
    %Hamming Distance with built in matlab function
    hamming_distance_with_matlabfunction = pdist2(random_row1,random_row2,'hamming');
    
    display(hamming_distance_with_matlabfunction)
    display(temp_hd/30);
end

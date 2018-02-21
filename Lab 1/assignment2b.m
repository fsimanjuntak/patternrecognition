%============== Assignment 2 =========================
%a. Hamming distance for set D

for i = 1:10000
    %Load two random files
    arr_idx_random_files = getRandomFilesForDifferentPerson();
    random_file_name_1 = sprintf('person%02d.mat',arr_idx_random_files(1));
    random_file_name_2 = sprintf('person%02d.mat',arr_idx_random_files(2));
    file1_struct = load(random_file_name_1);
    iris1_matrix = file_struct.iriscode;
    file2_struct = load(random_file_name_2);
    iris2_matrix = file2_struct.iriscode;
    
    %Load a random rows from file 1
    idx_randomrow_file1 = randi([1 20],1,2);
    random_row_file1 =  iris1_matrix(idx_randomrow_file1(1),:);
    %Load a random rows from file 1
    idx_randomrow_file2 = randi([1 20],1,2);
    random_row_file2 =  iris_matrix(idx_randomrow_file2(1),:);
    
    %Compute Hamming Distance (HD) between random_row1 and random_row2
    temp_hd = 0;
    for j=1:30
       if (random_row_file1(j) ~= random_row_file2(j))
           temp_hd = temp_hd + 1 ;
       end
    end
    
    %Hamming Distance with built in matlab function
    hamming_distance_with_matlabfunction = pdist2(random_row_file1,random_row_file2,'hamming');
    
    display(hamming_distance_with_matlabfunction)
    display(temp_hd/30);
end


function rf = getRandomFilesForDifferentPerson()
    while true
        idx_randomfile_1 = randi([1 20],1,1);
        idx_randomfile_2 = randi([1 20],1,1);
        
        %if the value of randomfile1 is not equal with randomfile1, stop
        %the looping and return the value
        if (idx_randomfile_1 ~= idx_randomfile_2)
            rf = [idx_randomfile_1 idx_randomfile_2];
            break;
        end
    end 
end


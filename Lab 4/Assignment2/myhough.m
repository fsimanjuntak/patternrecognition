function accarray = myhough(edgemap)
%Define theta from -90 to 89 degrees
theta = -90: 1 : 89;

%Find the foreground pixels of the edge map
[y, x] = find(edgemap);

%Calculate all values of p rounding to the nearest integer less or equal
p = ceil ([x,y]*[cosd(theta) ; sind(theta)]) ;

%Initialize a two-dimensional accumulator array
accarray = zeros ((max(p(:))*2)+1, length(theta)) ;

%Step through all values of rho updating the accumulator array as you go.
idx = 1;
for i=-max(p(:)):max(p(:))
    for j=1: length(theta)
      acc_counter = 0;
      for k = 1: length(p(:,j))
         if (p(k,j) == i) 
             acc_counter = acc_counter + 1;
         end
      end
      accarray(idx, j) = acc_counter;
    end
   idx = idx+1;
end
return ;
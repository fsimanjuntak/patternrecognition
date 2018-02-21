%Read the image 'HeadTool10002.bmp' and convert it to double precision.
img_chess = imread('HeadTool0002.bmp');
I2_chess = im2double(img_chess);

%Apply the contrast-limited adaptive histogram equalization method to enhance the contrast of the image.
adapthostequ_I2_chess = adapthisteq(I2_chess);

figure
subplot(1,2,1)
imshow(adapthostequ_I2_chess)
subplot(1,2,2)
imshow(I2_chess)

%Find at least 6 circles, if two circles belong to the same screw, keep only one of them.
[centers, radii, metric] = imfindcircles(adapthostequ_I2_chess,[20 40], 'Sensitivity' , 0.96);

N = size(centers);
deleteIndexList = [];
for i=1:N
   for j=i+1:N
       x1 = centers(i, 1);
       y1 = centers(i, 2);
       r1 = radii(i);
       
       x2 = centers(j, 1);
       y2 = centers(j, 2);
       r2 = radii(j);
      
    if (pdist([x1 y1; x2 y2]) - r1 - r2 <= 0)
        deleteIndexList = [deleteIndexList,j];
    end
   end
end

deleteIndexList = unique(deleteIndexList) ;
centers(deleteIndexList,:)=[ ];
radii(deleteIndexList)=[ ];

%Show the enhanced image from question 2 with the circles found in question 3.
imshow(adapthostequ_I2_chess);
viscircles(centers(1:9,:),radii(1:9,:));

%Show the enhanced image from question 2 with the two strongest circles found in question 3. 
strongest2CircleCenters = centers(1:2,:);
strongest2CircleRadii = radii(1:2,:);
imshow(adapthostequ_I2_chess);
viscircles(strongest2CircleCenters,strongest2CircleRadii);

%Read the image 'cameraman.tif'. This image is supplied by MATLAB. (show your code)
img_cameraman = imread('Cameraman.tiff');

%Compute the edge map of the image using the Canny algorithm with the MATLAB default parameters. (show your code)
BW_Canny = edge(img_cameraman,'canny');
figure;
imshow(BW_Canny)
title('Edge map using Canny algorithm');

%Compute the Hough transform accumulator of the edge map
[H,theta,rho] = hough(BW_Canny);
title('Cameraman.tiff');
imshow(imadjust(mat2gray(H)),'XData',theta,'YData',rho,...
      'InitialMagnification','fit');
title('Hough transform of Cameraman.tiff');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);

% Threshold the values in the accumulator array so that only the values that are equal to or larger than 99.9% of the strongest response remain unchanged; all smaller values should be set to zero. (show your code)
 P1 = houghpeaks(H,5,'Threshold',ceil(0.999*max(H(:))));

% Find the local maxima in the thresholded accumulator array. [show your code]
maxima = P1(1,:);

% Upload an image of the (unthresholded) accumulator array with the five strongest local maxima points marked on it.
P2 = houghpeaks(H,5);
axis on, axis normal, hold on;
plot(theta(P2(:,2)),rho(P2(:,1)),'s','color','black');

%Show the original image, cameraman.tif, overlaid with the strongest line by calling a function myhoughline
 myhoughline(img_cameraman , rho(maxima(1)), theta(maxima(2)));

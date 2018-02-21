%Read the image 'cameraman.tif'. This image is supplied by MATLAB. (show your code)
img_cameraman = imread('Cameraman.tiff');
%Compute the edge map of the image using the Canny algorithm with the MATLAB default parameters. (show your code)
bw_edge = edge(img_cameraman,'canny');

%Write a MATLAB script that compares your function myhough to the built-in MATLAB function hough by producing the accumulator array of the edge map of image 'cameraman.tif' (a MATLAB demo image), and plot side-by-side the two resulting accumulator arrays (using MATLAB's function subplot).   (show your code)
%1. Call MATLAB function hough
[matlab_hough,matlab_theta,matlab_rho] = hough(bw_edge);

%2. Call function myhough 
myhough_accarr = myhough(bw_edge);
myhough_theta_range = -90: 1 : 89;
rho_size = (size(myhough_accarr(:,1))-1);
myhough_rho_range = -(rho_size/2):1:(rho_size/2);

%Write a MATLAB script that compares your function myhough to the built-in MATLAB function hough by producing the accumulator array 
%of the edge map of image 'cameraman.tif' (a MATLAB demo image), and plot side-by-side the two resulting accumulator arrays (using MATLAB's function subplot)

subplot(1,2,1);
imshow(imadjust(mat2gray(myhough_accarr)),'XData',myhough_theta_range,'YData',myhough_rho_range,...
      'InitialMagnification','fit');
title('Accumulator array myhough');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);
subplot(1,2,2);
imshow(imadjust(mat2gray(matlab_hough)),'XData',matlab_theta,'YData',matlab_rho,...
      'InitialMagnification','fit');
title('Accumulator array matlab hough');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,hot);
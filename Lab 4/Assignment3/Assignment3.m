%Read the image 'chess.jpg'. This image is supplied by MATLAB. (show your code)
img_chess = imread('chess.jpg');
grayImg = rgb2gray(img_chess);
%Compute the edge map of the image using the Canny algorithm with the MATLAB default parameters. (show your code)
bw = edge(grayImg,'canny');
%Apply hough transform
[H,theta,rho] = hough(bw);
%Find the maxima in the Hough space 
P = houghpeaks(H,15,'Threshold',ceil(0.5*max(H(:))));
imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
title('Accumulator array with the 15 strongest points on chess.jpg');
axis on, axis normal, hold on;
plot(theta(P(:,2)),rho(P(:,1)),'s','color','white');

%Find lines
lines = houghlines(grayImg,theta,rho,P,'FillGap',5,'MinLength',7); 

%Display original image with lines superimposed
 figure, imshow(grayImg), hold on
 max_len = 0;
 for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 end 
title("Fifteen strongest lines detected on chess.jpg")
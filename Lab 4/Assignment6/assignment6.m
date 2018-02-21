

% Read and resize the image for further filters
I = imread('dogGrayRipples.png');
figure;
imshow(I);
I = imresize(I, [256 256]);
[m,n] = size(I);
[X,Y]=meshgrid(1:256,1:256); % it is a meshgrid for circle mask

% Filter the image using the notch filter for every pixel of the image
filter=ones(m,n);
for i=1:m-1
  for j=1:n-1
  threshold = (i-130)^2 + (j-130)^2 <= 32^2 && (i-130)^2 + (j-130)^2 >=20^2; 
      if threshold
         filter(i,j)=0;
     else
         filter(i,j)=1;
     end
   end
end

% We use the fourier transform for a 2D image
% fftshift is used to move the zero-frequency components to the center
% We reverse transform the image to the original domain using ifft2 and
% resize it to its orginal form
f = fftshift(fft2(I));
%timon
% f(121,167)=0;
% f(181,167)=0;
% G = abs(ifft2(fftshift(f)));
% G = imresize(G, [300 332]);
% figure,imshow(G,[]);
% 

%fthi
G = abs(ifft2(f.*filter));
G = imresize(G, [300 332]);
figure,imshow(G,[]);








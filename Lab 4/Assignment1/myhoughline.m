function myhoughline(image,rho, theta)
    x = -500:500;
    y = (rho - x* cosd(theta) )/ sind(theta);
    imshow(image)
    title("Houghline on Original picture")
    hold on;
    plot(x,y,'r')
return

syms x y
g1=(-1*((x-3)^2)/2-(((y-5)^2)/8)+log(0.3)-(0.5*log(4))-log(2*pi)) ;
g2=(-1*((x-2)^2)/4)-(((y-1)^2)/2)+log(0.7)-(0.5*log(2))-log(2*pi) ;

%solve the quadratic equation system
%[x1,x2] = solve([g1-g2==0], [x1,x2]) ;
%x1=real(x1)
%disp(x2)


%Plot the decision boundary
ezplot(((0.75*x)^2-10*x+(0.75*y)^2-12.5*y+34.75), [-10,20])
title('Decision Boundary')

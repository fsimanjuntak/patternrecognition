function [result] = phiFunc(givenX, DatapJ,h)

n = 10;
for m=1:n
    x = givenX - DatapJ(m,:); 
    nemn = sum(x*x');
    denm = 2*h*h;
    fun(m,:) = exp(-nemn/denm);
end

volum = (h*(sqrt(2*pi)))^3;
den = volum * n;
result = sum(fun)/den;
return
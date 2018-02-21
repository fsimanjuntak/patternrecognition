x1 = [0 0];
x2 = [2 3];
x3 = [1 4];
x4 = [4 2];
x5 = [3 0];

error1 = sum([
    sumOfSquaredError([x3;x5])...
    sumOfSquaredError([x1;x2;x4])
])

function [error] = sumOfSquaredError(points)
    mu = mean(points);
    
    error = sum((points-mu).^2);
end
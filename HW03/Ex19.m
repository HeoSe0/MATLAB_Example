n = 1;

while abs((exp(1)^ - 1) - ((1 - 1 / n)^n)) > .0001
    n = n + 1;
end

fprintf('The value of e^-1 is %f\n', exp(1)^ - 1);
fprintf('The value of (1 - 1 / n)^n for n = %d is %f\n', n, (1 - 1 / n)^n);
fprintf('The required value of n is %d\n', n);

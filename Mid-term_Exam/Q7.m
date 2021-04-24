n = 1;

gr = (1 + sqrt(5)) / 2;

while abs(gr - fibo_1(n) / fibo_1(n - 1)) > (.001 * gr)
    n = n + 1;
end

fprintf('The requried number n is %d\n', n);

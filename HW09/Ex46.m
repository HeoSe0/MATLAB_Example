n = 1; sum = 0;

while (sum < 1000)
    sum = 0;

    for i = 1:n
        sum = sum + sqrt(i^3);
    end

    n = n + 1;
end

fprintf('The largest value n is %d and the value of sum is %d\n', n - 1, sum - sqrt(n^3));

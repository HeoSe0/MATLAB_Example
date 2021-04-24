function y = fibo_1(n)

    if n == 0 || n == 1
        y = 1;
    else
        y = fibo_1(n - 1) + fibo_1(n - 2);
    end

end

function result = Ex47_3(arg)
    [n, m] = size(arg);
    result = zeros(m, n);

    for i = 1:n

        for j = 1:m
            result(j, i) = arg(i, j);
        end

    end

end

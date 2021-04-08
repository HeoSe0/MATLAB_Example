function output = Ex31(input)
    [r, c] = size(input);

    for i = 1:r

        for j = 1:c
            input(i, j) = input(i, j) * 2;
        end

    end

    output = input;

end

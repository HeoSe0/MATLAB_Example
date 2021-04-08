function Ex67()
    a = input('Enter the sides of length a, b, and c: ');
    b = input('');
    c = input('');
    s = (a + b + c) / 2;
    ar_sq = s * (s - a) * (s - b) * (s - c);

    if (ar_sq >= 0)
        fprintf('The area of triangle with sides of length a, b, and c is %f\n', sqrt(ar_sq));
    else
        disp('Error : input error');
    end

end

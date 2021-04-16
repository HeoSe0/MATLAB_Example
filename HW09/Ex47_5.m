s = 0; n = 1;
sol = zeros(1, 3);
chk = ones(1, 3);

while sum(chk)
    r = rand;
    s = s + r;

    if s > 10
        sol(1) = n; chk(1) = 0;
    end

    if .8 < r && r < .85
        sol(2) = n; chk(2) = 0;
    end

    if .01 < (s / n) && (s / n) < .5 && sol(3) == 0
        sol(3) = n; chk(3) = 0;
    end

    n = n + 1;
end

q1 = 'The number of random number it takes to add up to 10 is ';
q2 = 'The number of random number it takes before a number between 0.8 and 0.85 occures is ';
q3 = 'The number of random number it takes before the mean of those numbers is within 0.01 and 0.5 is ';
fprintf('%s%d\n%s%d\n%s%d\n', q1, sol(1), q2, sol(2), q3, sol(3));

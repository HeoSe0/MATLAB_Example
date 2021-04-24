approx_pi = 0; n = 1;

while (pi - sqrt(approx_pi * 16 + 8)) > 1e-12
    approx_pi = approx_pi + 1 / ((2 * n - 1)^2 * (2 * n + 1)^2);
    n = n + 1;
end

fprintf('The required number of terms is %d\n', n - 1);

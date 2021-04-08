[X, Y] = meshgrid(linspace(-.01, .01, 100), linspace(-.25, .25, 100));
Z = (X .* (Y.^2)) ./ (X.^2 + Y.^4);
surf(X, Y, Z);
title('f(x, y) = (x * y^2) / (x^2 * y^4)');

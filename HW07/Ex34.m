[X, Y] = meshgrid(linspace(-2, 2, 100), linspace(-2, 2, 100));
Z = X .* Y .* (exp(-X.^2 -Y.^2));
Zmax = max(Z, [], 'all');
Zmin = min(Z, [], 'all');
maximaIndex = find(Z == Zmax);
minimaIndex = find(Z == Zmin);
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('x * y * exp(-x^2 - y^2)');
hold on;
maxima = scatter3(X(maximaIndex), Y(maximaIndex), Z(maximaIndex), 'filled');
minima = scatter3(X(minimaIndex), Y(minimaIndex), Z(minimaIndex), 'filled');
text(X(maximaIndex), Y(maximaIndex), Z(maximaIndex) + .05, ...
    strcat('Z = ', num2str(Zmax), ' X = ', num2str(X(maximaIndex)), ' Y = ', num2str(Y(maximaIndex))));
text(X(minimaIndex), Y(minimaIndex), Z(minimaIndex) - .05, ...
    strcat('Z = ', num2str(Zmin), ' X = ', num2str(X(minimaIndex)), ' Y = ', num2str(Y(minimaIndex))));
legend([maxima, minima], {'Maxima', 'Minima'});
hold off;

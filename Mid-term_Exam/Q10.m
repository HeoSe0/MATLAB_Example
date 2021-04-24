[X, Y] = meshgrid(linspace(-3, 3, 100), linspace(-3, 3, 100));
Z = peaks(X, Y);
Zmax = max(Z, [], 'all');
Zmin = min(Z, [], 'all');
maximaIndex = find(Z == Zmax);
minimaIndex = find(Z == Zmin);
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('peaks(x, y)');
hold on;
maxima = scatter3(X(maximaIndex), Y(maximaIndex), Z(maximaIndex), 'filled');
minima = scatter3(X(minimaIndex), Y(minimaIndex), Z(minimaIndex), 'filled');
text(X(maximaIndex), Y(maximaIndex), Z(maximaIndex) + .05, ...
    strcat('Z = ', num2str(Zmax), ' X = ', num2str(X(maximaIndex)), ' Y = ', num2str(Y(maximaIndex))));
text(X(minimaIndex), Y(minimaIndex), Z(minimaIndex) - .05, ...
    strcat('Z = ', num2str(Zmin), ' X = ', num2str(X(minimaIndex)), ' Y = ', num2str(Y(minimaIndex))));
legend([maxima, minima], {'Maxima', 'Minima'});
hold off;

[X, Y] = meshgrid(linspace(-3, 3, 100), linspace(-3, 3, 100));
Z = peaks(X, Y);
maximaIndex = find(imregionalmax(Z) == 1);
minimaIndex = find(imregionalmin(Z) == 1);
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('peaks(x, y)');
hold on;
maxima = scatter3(X(maximaIndex), Y(maximaIndex), Z(maximaIndex), 'filled');
minima = scatter3(X(minimaIndex), Y(minimaIndex), Z(minimaIndex), 'filled');
text(X(maximaIndex), Y(maximaIndex), Z(maximaIndex) + .05, ...
    strcat('Z = ', num2str(Z(maximaIndex)), ' X = ', num2str(X(maximaIndex)), ' Y = ', num2str(Y(maximaIndex))));
text(X(minimaIndex), Y(minimaIndex), Z(minimaIndex) - .05, ...
    strcat('Z = ', num2str(Z(minimaIndex)), ' X = ', num2str(X(minimaIndex)), ' Y = ', num2str(Y(minimaIndex))));
legend([maxima, minima], {'Maxima', 'Minima'});
hold off;

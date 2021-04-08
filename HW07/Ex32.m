[t, s] = meshgrid(linspace(0, 2 * pi, 100), linspace(0, 2 * pi, 100));
X = cos(t) .* cos(s);
Y = cos(t) .* sin(s);
Z = sin(t);
surf(X, Y, Z);
axis equal;
shading interp;

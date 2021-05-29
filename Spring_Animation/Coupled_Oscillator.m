m = 1; k1 = 1; k2 = 3; k3 = 1;
epoch = 500; steps = epoch * 30;
tRange = linspace(0, epoch, steps);
x10 = 0; x20 = 2;
A = [(k1 + k2) / m, -k2 / m; -k2 / m, (k3 + k2) / m];
[V, D] = eig(A);
Init = V * [x10; x20];
X10 = Init(1); X20 = Init(2);
Omega1 = sqrt(D(1, 1)); Omega2 = sqrt(D(2, 2));
X1 = X10 * cos(Omega1 * tRange);
X2 = X20 * cos(Omega2 * tRange);
x1 = X1 * V(1, 1) + X2 * V(2, 1);
x2 = X1 * V(1, 2) + X2 * V(2, 2);

bounds = [min([x1, x2]) max([x1, x2]) min([x1, x2]) max([x1, x2])];
springY = .5 * sin(16 * pi * linspace(0, 1, steps));

f = figure;
subplot(5, 2, 1:2);
h1 = plot(x1(1), 0, "marker", ".", 'MarkerSize', 50); hold on;
h2 = plot(x2(1), 0, "marker", ".", 'MarkerSize', 50);
s1 = plot(linspace(min([x1, x2]), x1(1), steps), springY);
s2 = plot(linspace(x1(1), x2(1), steps), springY);
s3 = plot(linspace(x2(1), max([x1, x2]), steps), springY);
title('Simulation of coupled oscillator');
xlabel('Position');
axis(bounds); yticks([]);
subplot(5, 2, [5, 7, 9]);
p1 = plot(0, 0);
title('Configuration space(x_1,x_2)');
xlabel('x_1'); ylabel('x_2');
axis('equal'); axis(bounds);
subplot(5, 2, [6, 8, 10]);
p2 = plot(0, 0);
title('Configuration space(Q_1,Q_2)');
xlabel('Q_1'); ylabel('Q_2');
axis('equal'); axis(bounds);
shg;
pause(1);

for i_ = 1:steps
    set(h1, 'XData', x1(i_));
    set(h2, 'XData', x2(i_));
    set(s1, 'XData', linspace(min([x1, x2]), x1(i_), steps));
    set(s2, 'XData', linspace(x1(i_), x2(i_), steps));
    set(s3, 'XData', linspace(x2(i_), max([x1, x2]), steps));
    set(p1, 'XData', x1(1:i_), 'YData', x2(1:i_));
    set(p2, 'XData', X1(1:i_), 'YData', X2(1:i_));
    pause(0.01)
end

hold off;

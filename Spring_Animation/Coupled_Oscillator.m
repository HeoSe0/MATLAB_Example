m = 1; k1 = 1; k2 = 3; k3 = 1;
epoch = 50; steps = epoch * 30;
tRange = linspace(0, epoch, steps);
x10 = 1; x20 = 2;

A = [(k1 + k2) / m, -k2 / m; -k2 / m, (k3 + k2) / m];
[V, D] = eig(A);
Init = V * [x10; x20];
X10 = Init(1); X20 = Init(2);
Omega1 = sqrt(D(1, 1)); Omega2 = sqrt(D(2, 2));
X1 = X10 * cos(Omega1 * tRange);
X2 = X20 * cos(Omega2 * tRange);
x1 = X1 * V(1, 1) + X2 * V(2, 1);
x2 = X1 * V(1, 2) + X2 * V(2, 2);

leftGaps = 2; rightGaps = 2; midleGaps = 6;

bounds1 = [min([x1, x2]) - leftGaps, max([x1, x2]) + midleGaps + rightGaps, -1, 1];
bounds2 = [min([x1, x2]), max([x1, x2]), min([x1, x2]), max([x1, x2])];
bounds3 = [min([X1, X2]), max([X1, X2]), min([X1, X2]), max([X1, X2])];
springY = .5 * sin(16 * pi * linspace(0, 1, steps));

f = figure;
subplot(5, 2, 1:2);
h1 = plot(x1(1), 0, 'Marker', '.', 'MarkerSize', 50); hold on;
h2 = plot(x2(1) + midleGaps, 0, 'Marker', '.', 'MarkerSize', 50);
s1 = plot(linspace(min([x1, x2]) - leftGaps, x1(1), steps), springY);
s2 = plot(linspace(x1(1), x2(1) + midleGaps, steps), springY);
s3 = plot(linspace(x2(1) + midleGaps, max([x1, x2]) + midleGaps + rightGaps, steps), springY);
title('Simulation of coupled oscillator');
axis(bounds1); yticks([]);
xticks([-2, 0, 2, (midleGaps - 2), midleGaps, (midleGaps + 2)]);
xticklabels({'x_1=-2', 'x_1=0', 'x_1=2', 'x_2=-2', 'x_2=0', 'x_2=2'});

subplot(5, 2, [5, 7, 9]);
p1 = plot(x10, x20);
title('Configuration space(x_1,x_2)');
xlabel('x_1'); ylabel('x_2');
axis('equal'); axis(bounds2);

subplot(5, 2, [6, 8, 10]);
p2 = plot(X10, X20);
title('Configuration space(Q_1,Q_2)');
xlabel('Q_1'); ylabel('Q_2');
axis('equal'); axis(bounds3);

shg; pause(1);

for i_ = 1:steps
    set(h1, 'XData', x1(i_));
    set(h2, 'XData', x2(i_) + midleGaps);
    set(s1, 'XData', linspace(min([x1, x2]) - leftGaps, x1(i_), steps));
    set(s2, 'XData', linspace(x1(i_), x2(i_) + midleGaps, steps));
    set(s3, 'XData', linspace(x2(i_) + midleGaps, max([x1, x2]) + midleGaps + rightGaps, steps));
    set(p1, 'XData', x1(1:i_), 'YData', x2(1:i_));
    set(p2, 'XData', X1(1:i_), 'YData', X2(1:i_));
    pause(0.01)
end

hold off;

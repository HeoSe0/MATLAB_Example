% The Simulation of 3-Mass Coupled Oscillator in MATLAB

function [] = Q2()
    epoch = 20; steps = epoch * 30;
    tRange = linspace(0, epoch, steps);

    m1 = 1; m2 = 1; m3 = 1;
    k1 = 1; k2 = 1; k3 = 1; k4 = 1;

    x10 = 1; x20 = -1; x30 = 2;

    A = [(k1 + k2) / m1, -k2 / m1, 0;
        -k2 / m2, (k1 + k2) / m2, -k3 / m2;
        0, -k3 / m3, (k3 + k4) / m3];
    [V, D] = eig(A);
    Init = V * [x10; x20; x30];
    X10 = Init(1); X20 = Init(2); X30 = Init(3);
    W1 = sqrt(D(1, 1)); W2 = sqrt(D(2, 2)); W3 = sqrt(D(3, 3));
    X1 = X10 * cos(W1 * tRange);
    X2 = X20 * cos(W2 * tRange);
    X3 = X30 * cos(W3 * tRange);
    x1 = X1 * V(1, 1) + X2 * V(2, 1) + X3 * V(3, 1);
    x2 = X1 * V(1, 2) + X2 * V(2, 2) + X3 * V(3, 2);
    x3 = X1 * V(1, 3) + X2 * V(2, 3) + X3 * V(3, 3);

    leftGaps = 2; rightGaps = 2; midleGaps = 6;

    bounds1 = [
            min([x1, x2, x3]) - leftGaps, ...
                max([x1, x2, x3]) + 2 * midleGaps + rightGaps, -1, 1
            ];
    bounds2 = [
            min([x1, x2, x3]), max([x1, x2, x3]), min([x1, x2, x3]), ...
                max([x1, x2, x3]), min([x1, x2, x3]), max([x1, x2, x3])
            ];
    springY = .33 * sin(16 * pi * linspace(0, 1, steps));

    figure(1);
    plot(tRange, x1);
    title('x_1(t) in t = [0, 20]');
    xlabel('Time'); ylabel('Position');

    shg;

    figure(2);
    subplot(5, 2, 1:2);
    h1 = plot(x1(1), 0, 'Marker', '.', 'MarkerSize', 50); hold on;
    h2 = plot(x2(1) + midleGaps, 0, 'Marker', '.', 'MarkerSize', 50);
    h3 = plot(x3(1) + 2 * midleGaps, 0, 'Marker', '.', 'MarkerSize', 50);
    s1 = plot(linspace(min([x1, x2, x3]) - leftGaps, x1(1), steps), springY);
    s2 = plot(linspace(x1(1), x2(1) + midleGaps, steps), springY);
    s3 = plot(linspace(x2(1) + midleGaps, x3(1) + 2 * midleGaps, steps), ...
        springY);
    s4 = plot(linspace(x3(1) + 2 * midleGaps, ...
        max([x1, x2, x3]) + 2 * midleGaps + rightGaps, steps), springY);
    hold off;
    title('Simulation of 3-Mass Coupled Oscillator');
    axis(bounds1); yticks([]);
    xticks([
        -2, 0, 2, (midleGaps - 2), midleGaps, ...
            (midleGaps + 2), (2 * midleGaps -2), ...
            (2 * midleGaps), (2 * midleGaps + 2)
        ]);
    xticklabels({
            'x_1=-2', 'x_1=0', 'x_1=2', ...
                'x_2=-2', 'x_2=0', 'x_2=2', ...
                'x_3=-2', 'x_3=0', 'x_3=2'
            });

    subplot(5, 2, [5, 7, 9]);
    p1 = plot3(0, 0, 0);
    title('Configuration Space(x_1,x_2,x_3)');
    xlabel('x_1'); ylabel('x_2'); zlabel('x_3');
    axis('equal'); axis(bounds2);
    view(60, 30);

    subplot(5, 2, [6, 8, 10]);
    p2 = plot3(0, 0, 0);
    title('Configuration Sspace(Q_1,Q_2,Q_3)');
    xlabel('Q_1'); ylabel('Q_2'); zlabel('Q_3');
    axis('equal'); axis(bounds2);
    view(60, 30);

    shg;

    pause(1);

    try

        for i_ = 1:steps
            set(h1, 'XData', x1(i_));
            set(h2, 'XData', x2(i_) + midleGaps);
            set(h3, 'XData', x3(i_) + 2 * midleGaps);
            set(s1, 'XData', ...
                linspace(min([x1, x2, x3]) - leftGaps, x1(i_), steps));
            set(s2, 'XData', ...
                linspace(x1(i_), x2(i_) + midleGaps, steps));
            set(s3, 'XData', ...
                linspace(x2(i_) + midleGaps, x3(i_) + 2 * midleGaps, steps));
            set(s4, 'XData', ...
                linspace(x3(i_) + 2 * midleGaps, ...
                max([x1, x2, x3]) + 2 * midleGaps + rightGaps, steps));
            set(p1, 'XData', x1(1:i_), 'YData', x2(1:i_), 'ZData', x3(1:i_));
            set(p2, 'XData', X1(1:i_), 'YData', X2(1:i_), 'ZData', X3(1:i_));
            pause(0.01)
        end

    catch
        return;
    end

end

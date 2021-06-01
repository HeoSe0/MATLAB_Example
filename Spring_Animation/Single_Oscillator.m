m = 1; k = 1;
epoch = 50; steps = epoch * 30;
tRange = linspace(0, epoch, steps);
x = sin(tRange);

leftGaps = 1; rightGaps = 1;

bounds = [min(x) - leftGaps, max(x) + rightGaps, -1, 1];
springY = .25 * sin(8 * pi * linspace(0, 1, steps));

f = figure;
h = plot(x(1), 0, 'Marker', '.', 'MarkerSize', 50); hold on;
s = plot(linspace(min(x) - leftGaps, x(1), steps), springY);
axis('equal'); axis(bounds);
yticks([]); xticks([-1, 0, 1]);
xticklabels({'x=-1', 'x=0', 'x=1'});
shg; pause(1);

for i_ = 1:steps
    set(h, 'XData', x(i_));
    set(s, 'XData', linspace(min(x) - leftGaps, x(i_), steps));
    pause(.01);
end

hold off;

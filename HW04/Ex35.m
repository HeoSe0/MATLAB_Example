function Ex35()
    v0 = input('Enter the initial velocity: ');
    t0 = input('Enter the start time: ');
    t = input('Enter the end time: ');
    theta0 = input('Enter the angle of departure(dgree): ');
    theta0 = theta0 * pi / 180;
    x = v0 * cos(theta0) * linspace(t0, t, 100);
    y = v0 * sin(theta0) * linspace(t0, t, 100) - .5 * 9.81 * linspace(t0, t, 100).^2;
    plot(x, y);
    xlabel('x');
    ylabel('y');
end

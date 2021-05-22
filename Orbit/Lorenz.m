epoch = 1000; steps = 1000;
tRange = linspace(0, 60, steps);
x = zeros(steps, epoch); y = zeros(steps, epoch); z = zeros(steps, epoch);

for i = 1:epoch
    randY0 = [(-1)^randi(2) * rand * 3, (-1)^randi(2) * rand * 3, (-1)^randi(2) * rand * 3];
    [tSol, YSol] = ode45(@lorenz, tRange, randY0);
    x(:, i) = YSol(:, 1); y(:, i) = YSol(:, 2); z(:, i) = YSol(:, 3);
end

figure(1)

for i = 1:epoch
    plot(x(:, i), y(:, i));
    hold on;
end

xlabel('x-position');
ylabel('y-position');
hold off;

figure(2)
subplot(1, 3, 1);

for i = 1:epoch
    plot(tSol, x(:, i));
    hold on;
end

xlabel('time');
ylabel('x-position');
hold off;
subplot(1, 3, 2);

for i = 1:epoch
    plot(tSol, y(:, i));
    hold on;
end

xlabel('time');
ylabel('y-position');
hold off;
subplot(1, 3, 3);

for i = 1:epoch
    plot(tSol, z(:, i));
    hold on;
end

xlabel('time');
ylabel('z-position');
hold off;

function dYdt = lorenz(t, Y)
    x = Y(1); y = Y(2); z = Y(3);
    sigma = 10; beta = 8/3; rho = 1.2;
    dxdt = sigma * (y - x);
    dydt = x * (rho - z) - y;
    dzdt = x * y - beta * z;
    dYdt = [dxdt; dydt; dzdt];
end

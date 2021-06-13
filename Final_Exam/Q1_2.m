a = .26; b = -.01; c = -1; d = .01;

tRange = linspace(0, 30, 200);
Y0 = [100; 25];
odeFun = @(t, Y) [a * Y(1) + b * Y(1) * Y(2); c * Y(2) + d * Y(1) * Y(2)];
[tSol, YSol] = ode45(odeFun, tRange, Y0);
x = YSol(:, 1);
y = YSol(:, 2);
plot(tSol, x); hold on;
plot(tSol, y); hold off;
xlabel('t'); legend('x', 'y')
shg;

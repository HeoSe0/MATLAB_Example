tRange = linspace(0, 30, 200);
Y0 = [1; 0];
odeFun = @(t, Y) [Y(2); -(1 - 2 * cos(2 * t)) * Y(1)];
[tSol, YSol] = ode45(odeFun, tRange, Y0);
plot(tSol, YSol);
xlabel('t'); ylabel('y');
legend('y(t)', 'y`(t)');
shg;

tRange = [0, 50];
Y0 = [1; 0; 0; .8];
[tSol, YSol] = ode45(@odeFun, tRange, Y0);
x = YSol(:, 1);
y = YSol(:, 3);
plot(x, y);
grid on;
axis equal;
title('The orbit of sun-earth system');
xlabel('x-position(magnification of a)');
ylabel('y-position(magnification of a)');

function dYdt = odeFun(t, Y)
    x = Y(1); u = Y(2);
    y = Y(3); v = Y(4);
    r = sqrt(x^2 + y^2);
    dxdt = u; dudt = -x / r^3;
    dydt = v; dvdt = -y / r^3;
    dYdt = [dxdt; dudt; dydt; dvdt];
end

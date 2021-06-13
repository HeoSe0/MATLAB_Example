% The Simulation of Earth-Moon-Sun System in MATLAB

function [] = Q3()
    w_P = 13; % Weight of Period
    w_S = 200; % Weight of Step
    r_EM = 1/389; % Distance of Earth to Moon [AU]

    epoch_E = 4 * pi;
    epoch_M = epoch_E * w_P;
    steps_E = epoch_E * w_S;
    steps_M = epoch_M * w_S;
    tRange_E = linspace(0, epoch_E, steps_E);
    tRange_M = linspace(0, epoch_M, steps_M);

    x_E0 = 1; y_E0 = 0; u_E0 = 0; v_E0 = .95;
    x_M0 = 1; y_M0 = 0; u_M0 = 0; v_M0 = 1;

    [~, Y_E] = ode23(@odeFun, tRange_E, [x_E0, u_E0, y_E0, v_E0]);
    [~, Y_M] = ode23(@odeFun, tRange_M, [x_M0, u_M0, y_M0, v_M0]);

    x_E = Y_E(:, 1);
    y_E = Y_E(:, 3);
    x_M = Y_M(:, 1) * r_EM;
    y_M = Y_M(:, 3) * r_EM;

    f = figure;

    set(f, 'Position', [300, 200, 800, 400]);

    subplot(1, 2, 1);

    plot(0, 0, 'Marker', '.', 'MarkerSize', 50); hold on;
    text(0, -.1, 'Sun', 'FontSize', 12, 'HorizontalAlignment', 'Center');

    p1 = plot(x_E(1), y_E(1), 'Marker', '.', 'MarkerSize', 40);
    p2 = plot(x_M(1) + x_E(1), y_M(1) + y_E(1), 'Marker', '.', 'MarkerSize', 20);
    p3 = plot(x_E(1), y_E(1));
    p4 = plot(x_E(1) + Y_M(1, 1) * r_EM, y_E(1) + Y_M(1, 3) * r_EM); hold off;

    t1 = text(x_E(1), y_E(1) - .1, ...
        'Earth-Moon', 'FontSize', 12, 'HorizontalAlignment', 'Center');

    title({'Earth-Moon-Sun System Simulation'; ''}, 'FontSize', 14);

    xlabel('x-Position(AU)'); ylabel('y-Position(AU)');

    axis equal;
    axis([min(x_E) - .1, max(x_E) + .1, min(y_E) - .1, max(y_E) + .1]);

    subplot(1, 2, 2);

    plot(0, 0, 'Marker', '.', 'MarkerSize', 50); hold on;

    p5 = plot(x_E(1), y_E(1), 'Marker', '.', 'MarkerSize', 40);
    p6 = plot(x_M(1) + x_E(1), y_M(1) + y_E(1), 'Marker', '.', 'MarkerSize', 20);
    p7 = plot(x_E(1), y_E(1));
    p8 = plot(x_E(1) + Y_M(1, 1) * r_EM, y_E(1) + Y_M(1, 3) * r_EM); hold off;

    t2 = text(x_E(1), y_E(1) - .1 * r_EM, ...
        'Earth', 'FontSize', 12, 'HorizontalAlignment', 'Center');
    t3 = text(x_M(1) + x_E(1), y_M(1) + y_E(1) - .1 * r_EM, ...
        'Moon', 'FontSize', 12, 'HorizontalAlignment', 'Center');

    title({'Magnified Earth-Moon System', ''}, 'FontSize', 14);

    xlabel('x-Position(AU)'); ylabel('y-Position(AU)');

    axis equal;
    axis([x_E(1) - 1.1 * r_EM, x_E(1) + 1.1 * r_EM, ...
            y_E(1) - 1.1 * r_EM, y_E(1) + 1.1 * r_EM])

    shg;

    pause(1);

    try

        for i_ = 1:steps_E
            set(f, 'Position', [300, 200, 800, 400]);
            set([p1, p5], 'XData', x_E(i_), 'YData', y_E(i_));
            set([p2, p6], 'XData', x_M(i_ * w_P) + x_E(i_), ...
                'YData', y_M(i_ * w_P) + y_E(i_));
            set([p3, p7], 'XData', x_E(1:i_), 'YData', y_E(1:i_));
            set([p4, p8], 'XData', x_E(i_) + Y_M(1:i_ * w_P, 1) * r_EM, ...
                'YData', y_E(i_) + Y_M(1:i_ * w_P, 3) * r_EM);
            subplot(1, 2, 1);
            delete(t1);
            t1 = text(x_E(i_), y_E(i_) - .1, ...
                'Earth-Moon', 'FontSize', 12, 'HorizontalAlignment', 'Center');
            subplot(1, 2, 2);
            delete(t2);
            t2 = text(x_E(i_), y_E(i_) - .1 * r_EM, ...
                'Earth', 'FontSize', 12, 'HorizontalAlignment', 'Center');
            delete(t3);
            t3 = text(x_M(i_ * w_P) + x_E(i_), ...
                y_M(i_ * w_P) + y_E(i_) - .1 * r_EM, ...
                'Moon', 'FontSize', 12, 'HorizontalAlignment', 'Center');
            axis([x_E(i_) - 1.1 * r_EM, x_E(i_) + 1.1 * r_EM, ...
                    y_E(i_) - 1.1 * r_EM, y_E(i_) + 1.1 * r_EM]);
            pause(.01);
        end

    catch
        return;
    end

end

function dYdt = odeFun(~, Y)
    x = Y(1); u = Y(2); y = Y(3); v = Y(4);

    r = sqrt(x^2 + y^2);

    dxdt = u; dudt = -x / r^3;
    dydt = v; dvdt = -y / r^3;

    dYdt = [dxdt; dudt; dydt; dvdt];
end

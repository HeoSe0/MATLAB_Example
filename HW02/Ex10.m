x = linspace(-2 * pi, 2 * pi, 50);
y = cos(x);
color = input('Enter the color of plot(r, b, k): ', 's');

switch color
    case 'r'
        plot(x, y, 'r')
    case 'b'
        plot(x, y, 'b')
    case 'k'
        plot(x, y, 'k')
end

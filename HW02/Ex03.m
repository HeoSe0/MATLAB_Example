% Calculates and prints the speed of sound given a
% temperature entered by the user

C = input('Enter a temp in the range 0 to 50: ');

if C >= 0 && C <= 50
    speed = 331 + .6 * C;
    fprintf('For a temperature of %.1f, the spped is %.1f \n', C, speed)
else
    disp('Error in temperature')
end

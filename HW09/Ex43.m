integer = input('Enter the integer : ');

if (rem(integer, 2) == 0 && rem(integer, 3) == 0)
    disp('The integer is divisible by both 2 and 3');
elseif (rem(integer, 2) == 0 && rem(integer, 3) ~= 0)
    disp('The integer is divisible by 2 and not 3');
elseif (rem(integer, 2) ~= 0 && rem(integer, 3) == 0)
    disp('The integer is divisible by 3 and not 2');
else
    disp('The integer is not divisible by both 2 and 3');
end

function [A, B, C] = sides(a, b, c)

    if a < 0 || b < 0 || c < 0
        error('Input error : the length is must be positive value');
    elseif a < (b + c) && b < (c + a) && c < (a + b)
        A = acos((b^2 + c^2 - a^2) / (2 * b * c));
        B = acos((c^2 + a^2 - b^2) / (2 * c * a));
        C = acos((a^2 + b^2 - c^2) / (2 * a * b));
    else
        error('Input error : does not satisfy the condition of triangle');
    end

end

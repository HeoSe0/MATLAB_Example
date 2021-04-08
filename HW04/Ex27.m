function result = Ex27(arg)
    global per;

    if (isempty(per))
        per = arg;
    else
        per = per + arg;
    end

    result = per;
end

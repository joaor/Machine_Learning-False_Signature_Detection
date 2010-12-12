function data = get_first_sets(data, number)
    try
        data = data(1:number*54, 2:end);
    catch exception
        exception.message
    end
end
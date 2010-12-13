function data = get_first_sets(data, number)
    try
        data = data(1:number*54, 2:size(data)-1);
    catch exception
        exception.message
    end
end
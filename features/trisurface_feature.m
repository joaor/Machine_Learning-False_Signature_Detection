function result = trisurface_feature(image)
    width = round(size(image,2)/3);
    result = zeros(1,3);
    for i = 0 : 2
        aux = width*i;
        if i ==2
           image_part = image(:, (aux + 1) : size(image,2));
        else
           image_part = image(:, (aux + 1) : width + aux);
        end
        
        result(i+1) = get_area(image_part);
    end
end
function result = trisurface_feature(image)
    width = round(size(image,2)/3);

    for i = 0 : 2
        aux = width*i;
        image_crop = image(:, (aux + 1):width+(aux));
        total_area = size(image_crop,1) * size(image_crop,2);
        
        foreground_area = bwarea(image_crop);
        result(i+1) = foreground_area/total_area
        
end
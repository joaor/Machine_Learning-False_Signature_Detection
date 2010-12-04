function crop_image = crop_vertical(image, from, to)
    crop_index = to
    step = -1;
    if from < to
        step = 1;
        
    for col = from : step : to
        if find( image(:,col), 1 )
            break
        end
        crop_index = col;
    end
    
    if from<to
        crop_image = image(:,crop_index+1:to)
    else
        crop_image = image(:,from:crop_index)
    end
end
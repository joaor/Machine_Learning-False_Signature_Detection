function crop_image = crop_horizontal(image, from, to)
    crop_index = to
    step = -1;
    if from < to
        step = 1;
        
    for line = from : step : to
        if find( image(line,:), 1 )
            break
        end
        crop_index = line;
    end
    
    if from<to
        crop_image = image(crop_index+1:to,:)
    else
        crop_image = image(from:crop_index,:)
    end
end

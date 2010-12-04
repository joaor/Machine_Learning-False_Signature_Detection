function surface = surface_image(image, line_col, direction)
    surface = image;
    for line_col = 1:2
        for direction = 0:1
            surface = crop_image(surface,line_col,direction);
        end
    end
end
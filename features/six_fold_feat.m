function result = six_fold_feat(img)
    width = floor(size(img,2)/3);
    result = zeros(1,6);
    pos = 1;
    
    for i = 0 : 2
        aux = width*i;
        if i ==2
           image_part = img(:, (aux + 1) : size(img,2)); 
        else
           image_part = img(:, (aux + 1) : width + aux);
        end   
        
        [x,y] = centroid(image_part);
        
        image_above = image_part(1 : floor(x), : );
        image_below = image_part(floor(x) + 1 : size(image_part,1), : );
        
        result(pos) = get_area(image_above);
        result(pos+1) = get_area(image_below);
        pos = pos + 2;
    end
    
end

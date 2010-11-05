function result = six_fold_feat(img)
    width = round(size(img,2)/3);
    pos = 1;
    for i = 0 : 2
        aux = width*i;
        if i ==2
           image_part = img(:, (aux + 1):size(img,2)); 
        else
           image_part = img(:, (aux + 1):width+(aux));
        end   
        
        [x,y] = centroid(image_part);
        
        image_above = image_part(1:round(x),:);
        total_area = size(image_above,1) * size(image_above,2);      
        foreground_area = bwarea(image_above);
        result(pos) = foreground_area/total_area;
       
        image_below = image_part(round(x)+1:size(image_part,1),:);
        total_area = size(image_below,1) * size(image_below,2);      
        foreground_area = bwarea(image_below);
        result(pos+1) = foreground_area/total_area;
        
        pos = pos + 2;
    end
end
function crop = crop_image(image, line_col, direction)
    %direction = 0:(normal) || 1:(invert) & line_col = 1:(line) || 2:(col)
    
    s = size(image, line_col)
    dir = ((s-1)*direction);
    crop = image;

    for i = 1+dir : 1-(2*direction) : s-dir
        if eq(line_col, 1)  %check lines
           if find( image(i,:), 1 )  %find foreground pixel
               
               if ~direction    %if normal direction
                   crop = image(i:s,:);
               else
                   crop = image(1:i,:);
               end
               break
           end
           
        else    %check col
           if find( image(:,i), 1 )
               if ~direction
                    crop = image(:,i:s);
               else
                    crop = image(:,1:i);
               end
               break
           end
        end
    end
end
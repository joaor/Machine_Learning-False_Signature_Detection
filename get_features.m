function len = get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    %centroid_features = centroid_feat(crop_image);
    %trisurface_feat = trisurface_feature(crop_image);
    %sixfold_surface_feature = six_fold_feat(crop_image);
    %thinned = thinning_process(crop_image);
    %[lt,dt] = modified_direction_feature(thinned);
    
    figure(1);
    imshow(crop_image)
    figure(2);
    hold on 
    columns = size(crop_image,2);
    for j = 1:2
        if j==1
            image = crop_image;
        else
            image = crop_image(size(crop_image,1):-1:1,:);
        end
        contour = zeros(1,columns);
        for i = 1 : columns
            try
                foregrounds = find(image(:,i) == 1 );
                contour(i) = foregrounds(1);
            catch exception
                continue;
            end
        end

        [minX,minY] = find_peaks(contour);
        [maxX,maxY] = find_peaks(contour*(-1));
        maxX = maxX * (-1);
        
        if j == 2
            maxX = size(image,1) - maxX;
        end
        
        m = get_scope([minY,maxY],[minX,maxX])
        b = mean([minX,maxX]) - (m * mean([minY,maxY]))
        
        x = 1:columns;
        y = m * x + b;
        plot(x,y)
    end
    
    hold off
    len = calc_length(crop_image);
    pause
end

function scope = get_scope(x,y)
    len = length(x)+length(y);
    scope = (sum_sets(x,y) - fmean(x, y, len)) / (sum_square(x) - sum(x)^2/len);
end

function result = sum_sets(x,y)
    result = 0;
    for i = 1:length(x)
        result = result + x(i)*y(i);
    end
end

function result = fmean(x, y, len)
    result = (sum(x)*sum(y)) / len;
end

function result = sum_square(line)
    result = 0;
    for i = 1:length(line)
        result = result + line(i)^2;
    end
end


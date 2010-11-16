function len = get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    %centroid_features = centroid_feat(crop_image);
    %trisurface_feat = trisurface_feature(crop_image);
    %sixfold_surface_feature = six_fold_feat(crop_image);
    %thinned = thinning_process(crop_image);
    %[lt,dt] = modified_direction_feature(thinned);
    
    top_contour = zeros(1,size(crop_image,2));
    for i = 1 : size(crop_image,2)
        foregrounds = find(crop_image(:,i) == 1 );
        top_contour(i) = foregrounds(1);
    end
    [minX,minY] = findpeaks(top_contour)
    [maxX,maxY] = findpeaks(top_contour*(-1))
    maxX = maxX * (-1);
    
    imshow(crop_image);
    crop_image
    len = calc_length(crop_image);
    pause
end


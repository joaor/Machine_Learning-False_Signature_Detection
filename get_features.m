function vector = get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    
    crop_image = surface_image(image);
    centroid_feature = centroid_feat(crop_image);
    best_fit_feature = best_fit(crop_image);
    len = calc_length(crop_image);
        
    thinned = thinning_process(crop_image);
    [lt,dt] = modified_direction_feature(thinned);
    
    filled_image = imfill(crop_image, 'holes');
    trisurface_feat = trisurface_feature(filled_image);
    sixfold_surface_feature = six_fold_feat(filled_image);
    
    vector = [len, centroid_feature, best_fit_feature, trisurface_feat, sixfold_surface_feature];
    vector = push_struct(vector, lt);
    vector = push_struct(vector, dt);

    %size(vector)
    %pause
end


function vector = push_struct(vector, feature)
    keys = fieldnames(feature);
    for i = 1: numel(keys)
        value = feature.(char(keys(i)));
        value = reshape(value, 1, numel(value));
        
        vector = [vector, value];
    end
end

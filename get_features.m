function len = get_features(img)
    %TODO CORRIGIR BUG DO TRI E SIX SURFACE
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    %centroid_features = centroid_feat(crop_image);
    %trisurface_feat = trisurface_feature(crop_image);
    %sixfold_surface_feature = six_fold_feat(crop_image);
    %thinned = thinning_process(crop_image);
    %[lt,dt] = modified_direction_feature(thinned);
    best_fit_feature = best_fit(crop_image)
    len = calc_length(crop_image);
    pause
end


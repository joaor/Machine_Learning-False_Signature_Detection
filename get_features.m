function feat = get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    centroid_features = centroid_feat(crop_image);
    trisurface_feat = trisurface_feature(crop_image);
    length_feature = length_feat(crop_image);
    sixfold_surface_feature = six_fold_feat(crop_image)
end
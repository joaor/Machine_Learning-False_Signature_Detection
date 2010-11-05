function get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    centroid_feature = centroid_feat(crop_image)
    trisurface_feat = trisurface_feature(crop_image)
end


function get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    crop_image = surface_image(image);
    figure(1)
    imshow(image)
    figure(2)
    imshow(crop_image)
    
    centroid_feature = centroid_feat(crop_image)
    trisurface_feat = trisurface_feature(crop_image)
end


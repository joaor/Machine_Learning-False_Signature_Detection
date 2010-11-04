function get_features(img)
    im = imread(img);
    image = invert_image(im2bw(im));
    centroid_feature = centroid_feat(image)
end

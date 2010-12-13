function feat = centroid_feat(img)
    s = size(img, 2);
    hs = floor( s/2 );
    [y1, x1] = centroid( img(:, 1 : hs) );
    [y2, x2] = centroid( img(:, hs + 1 : s) );

    op = y1 - y2;
    adj = x1 - x2; % (+hs+1)

    alfa = atan( op/adj );
    feat = alfa/pi + 0.5;
end


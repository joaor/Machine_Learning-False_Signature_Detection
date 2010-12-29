function feat = centroid_feat(img)
    s = size(img, 2);
    hs = floor( s/2 );
    [l1, c1] = centroid( img(:, 1 : hs) );
    [l2, c2] = centroid( img(:, hs + 1 : s) );

    op = l1 - l2;
    adj = c1 - c2; %+hs;

    alfa = atan( op/adj );
    feat = alfa/pi + 0.5;
end


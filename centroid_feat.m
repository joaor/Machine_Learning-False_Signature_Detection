function feat = centroid_feat(img)
    s = size(img,2);
    hs = round(s/2);
    [x1,y1] = centroid(img(:,1:hs));
    [x2,y2] = centroid(img(:,hs+1:s));

    op = y1 - y2;
    adj = x1 - x2;

    alfa = atan(op/adj);
    feat = alfa/pi + 0.5;
end

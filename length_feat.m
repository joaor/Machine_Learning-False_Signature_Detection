function feat = length_feat(img)
    heigth = size(img,1);
    width = size(img,2);
    new_heigth = 1000;
    new_width = (new_heigth * width) / heigth;
    feat = width / new_width;
end
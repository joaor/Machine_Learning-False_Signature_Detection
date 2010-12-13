function area = get_area(img)
    total_area = size(img,1) * size(img,2);
    foreground_area = length( find(img == 1) );
    area = foreground_area/total_area;
end
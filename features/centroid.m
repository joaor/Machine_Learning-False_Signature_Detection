function [c1,c2] = centroid(pic)
    [x y] = find( pic == 1 );
    c1 = floor(mean(x));
    c2 = floor(mean(y));
end

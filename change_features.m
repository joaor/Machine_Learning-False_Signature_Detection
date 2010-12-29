function data = change_features(f1, f2, str)
    data=[];
    for i = 0 : size(f1,1) / 54 -1
        aux = i * 54;

        exchange = part_exchange(f1(aux+1:aux+54,:), f2(aux+1:aux+54,:), str);
        data = [data; exchange];
    end
end

function feat1 = part_exchange(feat1, feat2, str)
    if all( str == 'cnt')
        feat1(:, 3) = feat2(:, 122);
    elseif all( str == 'six')
        feat1(:, 10:15) = feat2(:, 127:132);
    elseif all( str == 'tri')
        feat1(:, 7:9) = feat2(:, 123:125);
    elseif all( str == 'bst')
        feat1(:, 4:6) = feat2(:, 133:135);
    elseif all( str == 'len')
        feat1(:, 2) = feat2(:, 126);
    elseif all( str == 'mdf')
        feat1(:, 16:135) = feat2(:, 2:121);
    end
end
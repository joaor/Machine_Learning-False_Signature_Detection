function compare(feat1, feat2, str)
    feat1 = feat1(1:54,:);
    feat2 = feat2(1:54,:);
    
    if all( str == 'cnt')
        a = feat1(:, 3);
        b = feat2(:, 122);
    elseif all( str == 'six')
        a = feat1(:, 10:15);
        b = feat2(:, 127:132);
    elseif all( str == 'tri')
        a = feat1(:, 7:9);
        b = feat2(:, 123:125);
    elseif all( str == 'bst')
        a = feat1(:, 4:6);
        b = feat2(:, 133:135);
    elseif all( str == 'len')
        a = feat1(:, 2);
        b = feat2(:, 126);
    elseif all( str == 'mdf')
        a = feat1(:, 16:135);
        b = feat2(:, 2:121);
    end
    
    a - b
end
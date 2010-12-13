function kk(data, r)
    result = [];
    for i = 1: size(data,1)
        if find( data(i,:) > 1)
            result = [result, ceil(i/54)];
        end
    end
    result



%     lines = size(data, 1);
%     for i = 1 : length(r)
%         floor(r(i) / lines) + 1
%     end
end
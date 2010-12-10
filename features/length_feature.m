function data = length_feature(data)
    max_len = max(data);
    min_len = min(data);
    new_max = max_len - min_len;

    data = update_length(data, min_len, new_max);
end

function feature = update_length(feature, min_len, new_max)
    for pos = 1:size(feature,1)
        new_curr = feature(pos, 1) - min_len;
        feature(pos, 1) = new_curr/new_max;
    end
end
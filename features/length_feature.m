function data = length_feature(data)
    max_len = max(data);
    min_len = min(data);
    new_max = max_len - min_len;

    data = update_length(data, min_len, new_max);
end

function feature = update_length(feature, min_len, new_max)
    for pos = 1:length(feature)
        new_curr = feature(pos) - min_len;
        feature(pos) = new_curr/new_max;
    end
end
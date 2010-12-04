function [genuine, forged] = length_feature(genuine, forged)
    lens = [genuine; forged]

    max_len = max(lens);
    min_len = min(lens);
    new_max = max_len - min_len;

    genuine = update_length(genuine, min_len, new_max);
    forged = update_length(forged, min_len, new_max);
end

function feature = update_length(feature, min_len, new_max)
    for pos = 1:size(feature,1)
        new_curr = feature(pos, 1) - min_len;
        feature(pos, 1) = new_curr/new_max;
    end
end
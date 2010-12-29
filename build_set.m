function set = build_set(data, indexes)
    selection = data( cell2mat(indexes), :);
    set = build_struct( selection' );
end

function xtruct = build_struct(feat)
    xtruct = struct('X', feat(1:size(feat,1)-1,:), 'y', feat(size(feat,1),:), 'num_data', size(feat,2), 'dim', size(feat,1)-1);
end


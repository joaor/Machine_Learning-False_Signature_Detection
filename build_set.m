function set = build_set(data, indexes)
    selection = data( cell2mat(indexes), :);
    set = build_struct( selection' );
end

function xtruct = build_struct(feat)
    xtruct = struct('X', feat(1:end-1,:), 'y', feat(end,:), 'num_data', size(feat,2), 'dim', size(feat,1)-1);
end


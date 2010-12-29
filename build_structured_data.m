function xdata = build_structured_data(data)
    xdata = [];
    for i = 1 : size(data, 1);
        xdata = [xdata; single_build(data(i,:))];
    end
end

function xtruct = single_build(data)
    xtruct.centroid = data(:,122);
    xtruct.sixfold = data(:,127:132);
    xtruct.trisurface = data(:,123:125);
    xtruct.bestfit = data(:,133:135);
    xtruct.length = data(:,126);
    xtruct.mdf = data(:,2:121);
    xtruct.class = data(:, 136);
    xtruct.signature = data(:, 1);
end


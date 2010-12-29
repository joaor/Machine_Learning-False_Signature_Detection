function newd = change_order(data, flag)
    %new = zeros(size(data,1), size(data,2));
    newd = [];
    for i = 0:size(data,1)/54 -1
        aux = i*54;
        if flag
            data(aux+1:aux+54,:) = mix_set( data(aux+1:aux+54,:) );
            newd = data;
        else
            newd = [newd; order_set( data(aux+1:aux+54,:) )];
        end
    end
end


function newd = mix_set(data)
    newd(1:2:47,:) = data(1:24,:);
    newd(2:2:46,:) = data(25:25+22,:);
    newd(48:54, :) = data(25+23:54, :);
end

function newd = order_set(data)
    newd = data(1:2:47,:);
    newd = [newd; data(2:2:46,:)];
    newd = [newd; data(48:54,:)];
end
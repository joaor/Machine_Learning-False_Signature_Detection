function all_data = correction_script(all_data)    
    for i = 1 :  54 : size(all_data,1)-54
        fprintf('from %g to %g\n', i, i+54-1)
        all_data(i : i+54-1) = modify( all_data(i : i+54-1) );
    end
end

function data = modify(data)
    for i = 1: 2 : 48
        for j = 0 : 1
            data(i+j, :).class = j+1;
        end
    end
    for i = 49 : 54
        data(i, :).class = 2;
    end

%     for i = 1 : size(data,1)
%         fprintf('%g :: %g\n', i, data(i).class);
%     end
end
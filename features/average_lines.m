function r = average_lines( matrix, ratio )
    lines = size(matrix,1);
    r=[];
    for i = 1:ratio:lines-ratio+1; 
        if i+ratio > lines-ratio+1
            m = mean(matrix(i:lines,:)); 
        else
            m = mean(matrix(i:i+ratio-1,:));
        end      
        r = [r;m];
    end
end





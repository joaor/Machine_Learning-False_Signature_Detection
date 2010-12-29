function r = average_lines( matrix, dim )
    len = size(matrix,1); 
    ratio = floor(len/dim);
    
    r=[];
    for i = 0 : dim-1
        from = i*ratio +1;
        to = i*ratio +ratio;
        
        if i == dim-1
            m = mean( matrix(from:len,:) );
        else
            if ratio == 1
                m = matrix(from:to,:);
            else
                m = mean( matrix(from:to,:) );
            end
        end

        r = [r; m];
    end
end



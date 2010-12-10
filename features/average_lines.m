function r = average_lines( matrix, dim )
    len = size(matrix,1); 
    rat = floor(len/dim);
    rest = mod(len,dim);
    
    r=[];
    for i = 1 : dim
        if rest
            ratio = rat + 1;
            rest = rest - 1;
        else
            ratio = rat;
        end
        
        if ratio == 1
            m = matrix(i,:);
        else
            m = mean( matrix(i:i+ratio-1,:) );
        end  

        i = i + ratio;
        r = [r;m];
    end
end



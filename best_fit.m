function best_fit(img)
    figure(1);
    imshow(img)
    figure(2);
    hold on 
    columns = size(img,2);
    for j = 1:2
        if j==1
            image = img;
        else
            image = img(size(img,1):-1:1,:);
        end
        contour = zeros(1,columns);
        for i = 1 : columns
            try
                foregrounds = find(image(:,i) == 1 );
                contour(i) = foregrounds(1);
            catch exception
                continue;
            end
        end

        [minX,minY] = find_peaks(contour);
        [maxX,maxY] = find_peaks(contour*(-1));
        maxX = maxX * (-1);
        
        if j == 2
            maxX = size(image,1) - maxX;
        end
        
        m = get_scope([minY,maxY],[minX,maxX])
        b = mean([minX,maxX]) - (m * mean([minY,maxY]))
        
        x = 1:columns;
        y = m * x + b;
        plot(x,y)
    end
    
    hold off
    pause
end

function scope = get_scope(x,y)
    len = length(x)+length(y);
    scope = (sum_sets(x,y) - fmean(x, y, len)) / (sum_square(x) - sum(x)^2/len);
end

function result = sum_sets(x,y)
    result = 0;
    for i = 1:length(x)
        result = result + x(i)*y(i);
    end
end

function result = fmean(x, y, len)
    result = (sum(x)*sum(y)) / len;
end

function result = sum_square(line)
    result = 0;
    for i = 1:length(line)
        result = result + line(i)^2;
    end
end


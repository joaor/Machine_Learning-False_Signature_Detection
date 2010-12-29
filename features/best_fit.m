function result = best_fit(img)
    columns = size(img, 2);
    rows = size(img, 1);
    
    result = zeros(1, 3);
    area = zeros(1, 2);
    
    for j = 1:2 
        image = img;
%         if j==1
%             image = img;
%         else
%             image = img( size(img,1): -1 : 1, : );
%         end
        
        contour = zeros(1,columns);
        for i = 1 : columns
            try
                if j==1
                    contour(i) = rows+1 - find(image(:,i) == 1, 1);
                else
                    contour(i) = rows+1 - find(image(:,i) == 1, 1, 'last');
                end
            catch exception
                continue;
            end
        end

%         [minX,minY] = find_peaks(contour);
%         [maxX,maxY] = find_peaks(contour * (-1));
%         maxX = maxX * (-1);
%         
%         if j == 2
%             maxX = size(image,1) - maxX;
%         end

        X = 1:columns;
        scope = get_scope(X,contour);
        b = mean(contour) - (scope * mean(X));

        result(j) = atan(scope) / pi + 0.5 ;
        
        f = [num2str(scope), '*x+', num2str(b)];
        area(j) = quad(f, 0, columns);
    end
    
    result(3) = abs(area(1) - area(2)) / (rows*columns);
end


function scope = get_scope(x, y)
     %n = length(X);
     %scope = (sum(X .* Y) - (sum(X) * sum(Y)) / n) / ( sum(X .* X) - (sum(X) ^ 2) / n );
     %b = (sum(Y) - scope * sum(X)) / n;

     len = length(x);
     scope = (sum_sets(x, y) - fmean(x, y, len)) / (sum_square(x) - sum(x)^2 / len);
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


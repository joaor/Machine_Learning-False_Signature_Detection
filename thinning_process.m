function thinned = thinning_process(matrix)
    thinned = bwmorph(matrix,'skel',10);
    thinned = int16(thinned);
    
%     count = 1;
%     first_condition = 0;
%     thinned = matrix;
%     
%     while count > 0
%         count = 0;
%         first_condition = mod(first_condition+1,2);
%         boundaries = zeros(size(thinned));
% 
%         for line = 1:size(thinned,1)
%             for col = 1:size(thinned,2)
% 
%                 if thinned(line,col) == 1
%                     if main_thinning_condition(thinned, line, col)
%                         if first_condition
%                             boundaries(line,col) = first_subcondition(thinned, line, col);
%                             count = count + 1;
%                         else
%                             boundaries(line,col) = second_subcondition(thinned, line, col);
%                             count = count + 1;
%                         end
%                     end
%                 end
% 
%             end
%         end
%         thinned = thinned - boundaries;
%     end
end


function bool = main_thinning_condition(matrix, line, col)
    neighbours = number_of_neighbours(matrix, line, col);
    bool = neighbours >= 2 && neighbours <=6 && pattern_recognition(matrix, line, col)==1;       
end


function count = pattern_recognition(matrix, line, col)
    count = 0;
    neighbours = [-1 0; -1 1; 0 1; 1 1; 1 0];
    for i = 1:-2:-1
        for j = 1:size(neighbours,1)-1
            x1 = i*neighbours(j,1);    y1 = i*neighbours(j,2);
            x2 = i*neighbours(j+1,1);  y2 = i*neighbours(j+1,2);
            try
                if matrix(line+x1, col+y1) == 0 && matrix(line+x2, col+y2)==1
                    count = count + 1;
                end
            catch exception
            end
        end
    end
end


function count = number_of_neighbours(matrix, line, col)
    count = 0;
    for i = -1:1
        for j = -1:1
            if i == 0 && j == 0
                continue
            end
                    
            try
                if matrix(line+i, col+j) == 1
                    count = count + 1;
                end
            catch exception
                continue
            end
            
        end
    end
end


function bool = first_subcondition(matrix, line, col)
    bool = check_southeast(matrix, line, col);
end


function bool = check_southeast(matrix, line, col)
    south = 0; southeast = 0; east = 0;
    try
        southeast = matrix(line,col+1) * matrix(line+1, col);
        south = southeast * matrix(line, col-1);
        east = southeast * matrix(line-1,col);
    catch exception
    end
    bool = east==0 && south==0;
end


function bool = second_subcondition(matrix, line, col)
    bool = check_northwest(matrix, line, col);
end


function bool = check_northwest(matrix, line, col)
    northwest = 0; north = 0; west = 0;
    try
        northwest = matrix(line-1,col) * matrix(line, col-1);
        north = northwest * matrix(line,col+1);
        west = northwest * matrix(line+1, col);
    catch exception
    end
    bool = north==0 && west==0;
end


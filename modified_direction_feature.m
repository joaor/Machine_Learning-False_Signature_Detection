% vertical -> 2
% horizontal -> 4
% right diagonal -> 3
% left diagonal -> 5


function modified_direction_feature(matrix)
    start_point = get_starting_point(matrix);
    matrix( start_point(1), start_point(2) ) = -1;
    
    matrix = set_label(matrix, start_point, start_point, init_direction(),[])

end


function [Locations, Directions] = analyze_matrix_transitions(matrix)
    Locations = init_transition_matrix();
    Directions = init_transition_matrix();
    for i = 1:size(matrix,1)
        row = matrix(i,:);
        
        [lt1,lt2,dt1,dt2] = analyze_lines(row);
        Locations.left_to_right = [Locations.left_to_right;lt1];
        Locations.right_to_left = [Locations.right_to_left;lt2];
        Directions.left_to_right = [Directions.left_to_right;dt1];
        Directions.right_to_left = [Directions.right_to_left;dt2];
    end 
    for i = 1:size(matrix,2)
        col = matrix(:,i); 
        
        [lt1,lt2,dt1,dt2] = analyze_lines(row);
        Locations.up_to_down = [Locations.up_to_down;lt1];
        Locations.down_to_up = [Locations.down_to_up;lt2];
        Directions.up_to_down = [Directions.up_to_down;dt1];
        Directions.down_to_up = [Directions.down_to_up;dt2];
    end
end


function m = init_transition_matrix()
    m.left_to_right = [];
    m.right_to_left = [];
    m.up_to_down = [];
    m.down_to_up = [];
end


%line == row || column
function [lt1,lt2,dt1,dt2] = analyze_lines(line)
    len = length(line);

    %left-to-right || up-to-down
    p1 = get_transition_points( line );
    lt1 = get_location_transitions(p1, len);
    lt2 = get_direction_transitions(p1);
    
    %right-to-left || down-to-up
    p2 = get_transition_points( line(len:-1:1) );
    dt1 = get_location_transitions(p2, len);
    dt2 = get_direction_transitions(p2);
end


%transitions -> Nx2 [index, value in matrix]
function transitions = get_transition_points(line)
    transitions = zeros(3,2);
    count=1; i=1;
    
    while count <=3 && i < length(line)
        if line(i)==0 && line(i+1)>0
            transitions(count,1) = i + 1;
			transitions(count,2) = line(i + 1);
            count = count+1;
        end
        i = i+1;
    end
end


function lt = get_location_transitions(transitions, line_length)
    lt = zeros(1,3)
    for i = 1:min(size(transitions,1),3)
        lt(i) = 1 - (transitions(i,1) / line_length);
    end
end


function dt = get_direction_transitions(transitions)
    dt = zeros(1,3)
    for i = 1:min(size(transitions,1),3)
        dt(i) = transitions(i,2) / 10;
    end
end


function matrix = set_label(matrix, point, prev_point, prev_dir, segment)
    matrix
    pause;
    segment = [segment;point];
        
    neighbours = get_neighbours(matrix, point, prev_point);
    n_neighbours = size(neighbours,1);
    for i = 1:n_neighbours
       matrix(neighbours(i,1), neighbours(i,2)) = -1; 
    end
        
    segment_change = false;
    for i = 1:n_neighbours
        next_point = [neighbours(i,1) neighbours(i,2)];
        
        next_dir = init_direction();
        next_dir.direction = get_direction(point, next_point);
        
        if n_neighbours > 1
            if is_new_segment(point, prev_dir, next_dir) || segment_change
                matrix = normalize(matrix, segment);
                matrix = set_label(matrix, next_point, next_point, init_direction(),[]);
                continue;
            else
                segment_change = true;
            end
        end
        
        matrix( next_point(1), next_point(2) ) = next_dir.direction;
        matrix = set_label(matrix, next_point, point, update_previous_direction(prev_dir, next_dir), segment);
    end
    
    if n_neighbours==0
        matrix = normalize(matrix, segment);
    end
end


function matrix = normalize(matrix, segment)
    m = zeros(1,4);
    max = 1;
    
    for i = 2:size(segment,1)
        ind = matrix(segment(i,1),segment(i,2)) -1;
        m(ind) = m(ind)+1;
        
        if m(ind) > m(max)
            max = ind;
        end
    end
    
    if size(segment,1) == 1
       matrix(segment(1,1),segment(1,2)) = 0;
    else
        matrix(segment(1,1),segment(1,2)) = max+1;
    end
end


function dir = get_direction(point, next)
    dif_y = point(2)-next(2);
    dif = abs(point(1)-next(1) + dif_y);

    dir = dif +3;
    if dif == 1 && dif_y == 0
        dir = 2;
    end
end


function dir = init_direction()
    dir.direction = 1; %no direction
    dir.number = 0;
    dir.length = 0;
end 


function point = get_starting_point(matrix)
    for i = size(matrix,1):-1:1
        for j = 1:size(matrix,2)
            
            if matrix(i,j)
                point = [i j];
                return
            end
        end
    end
end


function neighbours = get_neighbours(matrix, point, prev_point)
    indexes = [-1 0; -1 1; 0 1; 1 1];
    neighbours = [];
  
    for i = 1:-2:-1
        for j = 1:size(indexes,1)
            line = point(1) + (i*indexes(j,1));
            col = point(2) + (i*indexes(j,2));
        
            try
                if matrix(line, col) == 1 &&( line ~= prev_point(1) || col ~=prev_point(2))
                        neighbours = [neighbours; line, col];
                end
            catch exception
                continue
            end     
        end
    end
end


function is_new = is_new_segment(point, prev_dir, next_dir)
    is_new = first_condition(prev_dir, point, next_dir) || second_condition(prev_dir, point, next_dir);
    is_new = is_new || third_condition(prev_dir) || fourth_condition(prev_dir);
end


function bool = first_condition(previous_dir, point, next_dir)
    prev = previous_dir.direction == 3; % down-left and up-right
    next = next_dir.direction == 5; % down-right and up-left
    bool = prev && next;
end


function bool = second_condition(previous_dir, point, next_dir)
    next = next_dir.direction == 3;
    prev = previous_dir.direction == 5;
    bool = prev && next;
end


function bool = third_condition(previous_dir)
    bool = previous_dir.number > 3;
end


function bool = fourth_condition(previous_dir)
    bool = previous_dir.length > 3;
end


function prev_dir = update_previous_direction(prev_dir, next_dir)
    if prev_dir.direction == next_dir.direction
        prev_dir.length = prev_dir.length +1;
    else
        prev_dir.direction = next_dir.direction;
        prev_dir.number = prev_dir.number +1;
        prev_dir.length = 0;
    end
end


function label_line_segment(segment, matrix)
    matrix( segment(1,1), segment(1,2) ) = 9;
    
    for i = 2:size(segment,2)
       %TODO percorrer segment e atribuir valores 
    end
end

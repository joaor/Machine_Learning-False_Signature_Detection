% vertical -> 2
% horizontal -> 4
% right diagonal -> 3
% left diagonal -> 5


function [l,d] = modified_direction_feature(matrix)
    matrix = set_label(matrix);

    [l,d] = analyze_matrix_transitions(matrix);

    keys = fieldnames(l);
    for i = 1: numel(keys)
        field = char(keys(i));
        l.(field) = average_lines( l.(field), 5);
        d.(field) = average_lines( d.(field), 5);
    end      
end


function [Locations, Directions] = analyze_matrix_transitions(matrix)
    Locations = init_transition_matrix();
    Directions = init_transition_matrix();
    for i = 1:size(matrix,1)
        row = matrix(i,:);
        
        [lt1,lt2,dt1,dt2] = analyze_lines(row);
        Locations.left_to_right = [Locations.left_to_right; lt1];
        Locations.right_to_left = [Locations.right_to_left; lt2];
        Directions.left_to_right = [Directions.left_to_right; dt1];
        Directions.right_to_left = [Directions.right_to_left; dt2];
    end 
    for i = 1:size(matrix,2)
        col = matrix(:,i); 
        
        [lt1,lt2,dt1,dt2] = analyze_lines(col);
        Locations.up_to_down = [Locations.up_to_down; lt1];
        Locations.down_to_up = [Locations.down_to_up; lt2];
        Directions.up_to_down = [Directions.up_to_down; dt1];
        Directions.down_to_up = [Directions.down_to_up; dt2];
    end
end


%line == row || column
function [lt1,lt2,dt1,dt2] = analyze_lines(line)
    len = length(line);

    %left-to-right || up-to-down
    p1 = get_transition_points( line );
    lt1 = get_location_transitions(p1, len);
    dt1 = get_direction_transitions(p1);
    
    %right-to-left || down-to-up
    p2 = get_transition_points( line(len:-1:1) );
    lt2 = get_location_transitions(p2, len);
    dt2 = get_direction_transitions(p2);
end


function matrix = set_label(matrix)  
    start_point = get_starting_point(matrix);
    matrix(start_point.row, start_point.column) = -1;
	
    segments = [struct('segment', [start_point])];
   	queue = [start_point];
	
	while length(queue)
		point = queue(1);
		queue(1) = [];
		
		neighbours = get_neighbours(matrix, point);
		for i = 1 : length(neighbours)
			matrix( neighbours(i).row, neighbours(i).column ) = 9;
		end
        
		if length(neighbours) == 1 
			neighbours(1).previous_dir = update_direction( point.previous_dir, get_direction(point, neighbours(1)));
			matrix( neighbours(1).row, neighbours(1).column ) = neighbours(1).previous_dir.direction;
	
			queue = [neighbours(1), queue];
			segments = update_segments(segments, neighbours(1));
            
		elseif length(neighbours) > 1
			change = false;
			for i = 1 : length(neighbours)
                
                neighbours(i).previous_dir.direction = get_direction(point, neighbours(i));
                
				if is_new_segment(point, neighbours(i)) || change
					matrix = normalize(matrix, segments(neighbours(i).segment).segment);
					matrix( neighbours(i).row, neighbours(i).column ) = -1;
                    
					segments = [segments, struct('segment', [neighbours(i)])];
					neighbours(i).segment = length(segments);
					queue = [queue, neighbours(i)];
                    
				else
					change = true;
                    
                    %neighbours(i).previous_dir = update_direction( point.previous_dir, get_direction(point, neighbours(i)));
					neighbours(i).previous_dir = update_direction( point.previous_dir, neighbours(i).previous_dir.direction);
                    matrix( neighbours(i).row, neighbours(i).column ) = neighbours(i).previous_dir.direction;
					
                    queue = [neighbours(i), queue];
                    segments = update_segments(segments, neighbours(i));
				end
			end
        else
			if length(segments(point.segment).segment) ~= 0
				matrix = normalize(matrix, segments(point.segment).segment);
			end
        end
	end
end


function segments = update_segments(segments, point)
    this_segment = segments(point.segment).segment;
    this_segment = [this_segment, point];
    segments(point.segment).segment = this_segment;
end


function matrix = normalize(matrix, segment)
    m = zeros(1,4);
    max = 1;

    for i = 2:length(segment)
        ind = matrix(segment(i).row, segment(i).column) -1;
        %segment(i)
        %matrix(segment(i).row, segment(i).column)
        m(ind) = m(ind)+1;

        if m(ind) > m(max)
            max = ind;
        end
    end
    if length(segment) == 1
        matrix(segment(1).row,segment(1).column) = 9;
    else
        matrix(segment(1).row,segment(1).column) = max+1;
    end
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
    lt = zeros(1,3);
    for i = 1:min(size(transitions,1),3)
        lt(i) = 1 - (transitions(i,1) / line_length);
    end
end


function dt = get_direction_transitions(transitions)
    dt = zeros(1,3);
    for i = 1:min(size(transitions,1),3)
        dt(i) = transitions(i,2) / 10;
    end
end


function point = get_starting_point(matrix)
    for i = size(matrix,1):-1:1
        for j = 1:size(matrix,2)
            
            if matrix(i,j)
                point = init_point(i, j, 1);
                return
            end
        end
    end
end


function neighbours = get_neighbours(matrix, point)
    indexes = [-1 0; -1 1; 0 1; 1 1];
    neighbours = [];
  
    for i = 1:-2:-1
        for j = 1:size(indexes,1)
            line = point.row + (i*indexes(j,1));
            col = point.column + (i*indexes(j,2));
        
            try
                if matrix(line, col) == 1
                        neighbour = init_point(line, col, point.segment);
                        neighbours = [neighbours; neighbour];
                end
            catch exception
                continue
            end     
        end
    end
end


function dir = get_direction(point, next)
    dif_y = point.column - next.column;
    dif = abs(point.row - next.row + dif_y);

    dir = dif +3;
    if dif == 1 && dif_y == 0
        dir = 2;
    end
end


function prev_dir = update_direction(prev_dir, next_dir)
    if prev_dir.direction == next_dir
        prev_dir.length = prev_dir.length +1;
    else
        prev_dir.direction = next_dir;
        prev_dir.number = prev_dir.number +1;
        prev_dir.length = 0;
    end
end


function point = init_point(row, col, seg)
    point = struct('row', row, 'column', col, 'segment', seg, 'previous_dir', struct('direction',1,'number',0,'length',0));
end


function m = init_transition_matrix()
    m.left_to_right = [];
    m.right_to_left = [];
    m.up_to_down = [];
    m.down_to_up = [];
end


function is_new = is_new_segment(point, next_point)
    is_new = first_condition(point.previous_dir, next_point.previous_dir) || second_condition(point.previous_dir, next_point.previous_dir);
    is_new = is_new || third_condition(point.previous_dir) || fourth_condition(point.previous_dir);
end


function bool = first_condition(previous_dir, next_dir)
    prev = previous_dir.direction == 3; % down-left and up-right
    next = next_dir.direction == 5; % down-right and up-left
    bool = prev && next;
end


function bool = second_condition(previous_dir, next_dir)
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


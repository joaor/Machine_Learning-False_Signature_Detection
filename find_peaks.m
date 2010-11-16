function [peakX,peakY] = find_peaks(vector)
    peakX = [];
    peakY = [];
    j = 1;
    possible_peak = false;
    for i = 1 : size(vector,2)
        curr = vector(i);
        if (i == 1)
            if curr > vector(i+1)
                peakX(j) = curr;
                peakY(j) = i;
                j = j + 1;
            end
            continue;
        end
        if (i == size(vector,2))
            if curr > vector(i-1)  
                peakX(j) = curr;
                peakY(j) = i;
                j = j + 1;
            end
            continue;
        end
        prev = vector(i-1);
        next = vector(i+1);
        if curr > prev && curr > next
            peakX(j) = curr;
            peakY(j) = i;
            j = j + 1;
        elseif curr > prev && curr == next
            possible_peak = true;
        elseif curr == prev && curr == next && possible_peak==true
            continue;
        elseif curr == prev && curr < next
            possible_peak = false;
        elseif curr > next && curr == prev && possible_peak==true
            peakX(j) = curr;
            peakY(j) = i;
            j = j + 1;
            possible_peak = false;
        else
            possible_peak = false;
        end 
    end
end
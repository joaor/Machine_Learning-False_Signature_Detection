function binary_image = invert_image(binary_image)

for i = 1:size(binary_image,1)
    for j = 1:size(binary_image,2)
        if binary_image(i,j) == 0
            binary_image(i,j) = 1;
        else
            binary_image(i,j) = 0;
        end
    end
end

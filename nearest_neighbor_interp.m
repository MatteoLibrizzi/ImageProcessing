function output_img = nearest_neighbor_interp(input_img, scale_factor)
    [rows, cols] = size(input_img);
    output_img = zeros(rows * scale_factor, cols * scale_factor);
    for r = 1:rows
        for c = 1:cols
            output_img((r-1)*scale_factor + 1, (c-1)*scale_factor + 1) = input_img(r, c);
        end
    end
end
function output_img = bilinear_interp(input_img, scale_factor)
    [rows, cols] = size(input_img);
    new_rows = round(rows * scale_factor);
    new_cols = round(cols * scale_factor);
    output_img = zeros(new_rows, new_cols);
    for i = 1:new_rows
        x = i/scale_factor + 0.5 * (1- 1/scale_factor);
        for j = 1:new_cols
            y = j/scale_factor + 0.5 * (1- 1/scale_factor);
            %x = (i-1)/scale_factor + 1;
            %y = (j-1)/scale_factor + 1;
            x1 = floor(x);
            x2 = ceil(x);
            y1 = floor(y);
            y2 = ceil(y);
            if x1 < 1
                x1 = 1;
            end
            if x2 > rows
                x2 = rows;
            end
            if y1 < 1
                y1 = 1;
            end
            if y2 > cols
                y2 = cols;
            end

            p00 = input_img(x1, y1);
            p01 = input_img(x1, y2);
            p10 = input_img(x2, y1);
            p11 = input_img(x2, y2);

            w00 = (x2-x)*(y2-y);
            w01 = (x2-x)*(y-y1);
            w10 = (x-x1)*(y2-y);
            w11 = (x-x1)*(y-y1);
            output_img(i, j) = round(w00*p00 + w01*p01 + w10*p10 + w11*p11);
        end
    end
end


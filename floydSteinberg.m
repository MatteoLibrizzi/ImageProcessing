function out = floydSteinberg(img)
    % Load an image
    img = rgb2gray(img);
    img = double(img)/255; % Convert to double precision and normalize to [0,1]
    
    % Define the error matrix and initialize it to zeros
    error_matrix = zeros(size(img));
    
    % Define the quantization matrix for converting to black and white
    q_matrix = [0.5, 0.5; 0.5, 0.5];% quantizzazione al volo
    
    % Loop through each row and column of the image
    for row = 1:size(img,1)
        for col = 1:size(img,2)
            % Compute the error
            error = img(row,col) - 0.5;
            
            % Propagate the error to the right and down neighbors
            if col+1 <= size(img,2)
                error_matrix(row,col+1) = error_matrix(row,col+1) + error * 7/16;
            end
            if row+1 <= size(img,1)
                error_matrix(row+1,col) = error_matrix(row+1,col) + error * 5/16;
            end
            if row+1 <= size(img,1) && col-1 >= 1
                error_matrix(row+1,col-1) = error_matrix(row+1,col-1) + error * 3/16;
            end
            if row+1 <= size(img,1) && col+1 <= size(img,2)
                error_matrix(row+1,col+1) = error_matrix(row+1,col+1) + error * 1/16;
            end
        end
    end
    
    % Add the error matrix to the original image
    img = img + error_matrix;
    img(img > 1) = 1;
    img(img < 0) = 0;
    
    % Binarize the image using the quantization matrix
    img = round(img/0.5);
    img(img == 0) = 0;
    img(img == 1) = 255;
    img = uint8(img);

    out = img;

end
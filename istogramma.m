
img = imread('./img/bnw.tiff','tiff');
his=imhist(img,256);%imageHist(img);
bar(his);

function hist = imageHist(image)
    % Convert the image to grayscale if it's not already
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    
    % Calculate the number of pixels in the image
    [rows, cols] = size(image);
    numPixels = rows * cols;
    
    % Create an array to store the histogram
    hist = zeros(256, 1);
    
    % Iterate through each pixel in the image
    for i = 1:rows
        for j = 1:cols
            % Increment the appropriate bin in the histogram
            intensity = image(i, j) + 1;
            hist(intensity) = hist(intensity) + 1;
        end
    end
    
    % Normalize the histogram
    hist = hist / numPixels;
end
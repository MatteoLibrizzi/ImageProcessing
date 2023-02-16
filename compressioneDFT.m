I = imread('./img/image.tiff','tiff'); % Load an image
F = fft2(I); % Compute the DFT of the image
F_magnitude = abs(F); % Compute the magnitude of the DFT coefficients
F_magnitude = log(1 + F_magnitude); % Apply a log transformation to make the display more visually appealing
display(F_magnitude);
imshow(F_magnitude, []); % Display the magnitude of the DFT coefficients
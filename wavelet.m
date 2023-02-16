I = imread('./img/image.tiff','tiff');

% Perform the 2D wavelet decomposition using the db4 wavelet
[C,S] = wavedec2(I,8,'db4');

% Visualize the approximation and detail coefficients
A = appcoef2(C,S,'db4',2);
[H2,V2,D2] = detcoef2('all',C,S,2);

subplot(2,2,1), imshow(A,[]), title('Approximation Coefficients');
subplot(2,2,2), imshow(H1,[]), title('Horizontal Detail Coefficients');
subplot(2,2,3), imshow(V1,[]), title('Vertical Detail Coefficients');
subplot(2,2,4), imshow(D1,[]), title('Diagonal Detail Coefficients');

pause('on')
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255]);

k = ones(3)*-1;
k(2,2) = 8;
disp(k);
alto = conv2(single(img),k,'same');

imshowpair(img,alto,'montage');
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255])
pause(0.1)
k=ones(3)/9;
disp(k);
newimg = conv2(single(img),k,'same');
imshow(newimg,[0,255])
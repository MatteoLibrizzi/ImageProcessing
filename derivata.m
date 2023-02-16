pause('on')
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255]);

pause(1);

k = [-1,1];

dx = conv2(single(img),k,'same');
imshow(dx);

pause(1);
k = k';

dy = conv2(single(img),k,'same');
imshow(dy);
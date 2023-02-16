pause('on')
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255]);

pause(1);

k = [-1,-2,-1; 0,0,0; 1,2,1];

dx = conv2(single(img),k,'same');

dy = conv2(single(img),k','same');

m = sqrt(dx.^2+dy.^2);

a = atan2(dy,dx);

a = round(360*(a+pi)/(2*pi));
imshow(a,hsv(360));
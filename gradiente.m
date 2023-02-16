pause('on')
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255]);

pause(1);

k = [-1,-2,-1; 0,0,0; 1,2,1];

dx = conv2(single(img),k,'same');
%imshow(dx,[-255,255]);

pause(1);
dy = conv2(single(img),k','same');
%imshow(dy,[-1020,1020]);

%pause(1);
m = sqrt(dx.^2+dy.^2);
imshow(m,[]);

pause(1);

a = atan2(dy,dx);
imshow(a,[-pi,pi]);

pause(1);

a = round(360*(a+pi)/(2*pi));
imshow(a,hsv(360));      
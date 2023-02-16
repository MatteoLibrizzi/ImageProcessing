pause('on')
img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255]);

pause(2);

avg = fspecial('average');

newimg = single(img)+ 3*(single(img)-conv2(single(img),avg,'same'));
imshow(newimg,[0,255]);
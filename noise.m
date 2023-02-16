
pause('on')

img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255])
pause(2)

noisy = imnoise(img,'salt & pepper',0.1);%applying noise
imshow(noisy,[0,255])
pause(2)

k=ones(3)/9;
newimg = conv2(single(noisy),k,'same');%removing noise (not as good)
imshow(newimg,[0,255]);
pause(2)

removednoise=medfilt2(noisy);%removing noise very well
imshow(removednoise,[0,255]);
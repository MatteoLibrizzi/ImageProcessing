img = imread('./img/morfologia.png','png');
imshow(img,[0,255]);

se = strel('ball',20,20);
disp(se);

%dilation of normal image
dilated = imdilate(img,se);
eroded = imerode(img,se);

imshow(img);
pause(2);

imshowpair(eroded,dilated,'montage');
pause(2);

apertura = imdilate(eroded,se);
chiusura = imerode(dilated,se);

imshowpair(apertura,chiusura,'montage');
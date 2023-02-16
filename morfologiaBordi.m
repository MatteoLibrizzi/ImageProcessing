img = imread('./img/morfologia.png','png');
imshow(img,[0,255]);

se = strel('ball',2,2);
disp(se);

%dilation of normal image
dilated = imdilate(img,se);
eroded = imerode(img,se);

imshow(img);
pause(2);

imshowpair(dilated,eroded,'montage');

pause(2);

bordi = (dilated - eroded);

imshowpair(img,bordi,'montage');
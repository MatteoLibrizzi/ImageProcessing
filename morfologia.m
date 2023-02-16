img = imread('./img/morfologia.png','png');
imshow(img,[0,255]);


se = strel('ball',13,13);

disp(se);

eroded = imerode(img,se);

imshowpair(img,eroded,'montage');

pause(3);

dilated = imdilate(img,se);
imshowpair(img,dilated,'montage');
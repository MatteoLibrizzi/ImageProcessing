img = imread('./img/morfologia.png','png');
imshow(img,[0,255]);
com=imcomplement(img);

se = strel('ball',13,13);
disp(se);

%dilation of normal image
dilated = imdilate(img,se);
imshowpair(img,dilated,'montage');

pause(3);

erodedCom = imerode(com,se);
erodedCom = imcomplement(erodedCom);
imshowpair(com,erodedCom,'montage');
pause(10);

%erosion of normal image
eroded = imerode(img,se);
imshowpair(img,eroded,'montage');


pause(3);

%complement of dilation of complement
dilatedCom = imdilate(com,se);
dilatedCom =imcomplement(dilated);
imshowpair(com,dilatedCom,'montage');
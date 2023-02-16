    img = imread('./img/morfologia.png','png');
imshow(img,[0,255]);

se = strel('ball',20,20);
disp(se);

%dilation of normal image
dilated = imdilate(img,se);
eroded = imerode(img,se);

imshow(img);
%pause(2);

apertura = imdilate(eroded,se);
chiusura = imerode(dilated,se);

imshowpair(apertura,chiusura,'montage');

%pause(2);

tophat = img - apertura;
bh = chiusura-img;

imshowpair(tophat,bh,'montage');

pause(2);

%contrasto con th e bh
k = img + tophat + bh;
k=min(k,255);
k=max(k,0);
imshow(k);

pause(1);

%contrasto con apertura e chiusura direttamente
k = 3*img -apertura + chiusura;
imshow(k);
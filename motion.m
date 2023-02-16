img = imread('./img/bnw.tiff','tiff');
imshow(img,[0,255])

k9h = fspecial('motion');
disp(k);
newimg = conv2(single(img),k9h,'same');
imshow(newimg,[0,255])

k15v = fspecial('motion',15,90);
newimg = conv2(single(img),k15v,'same');
imshow(newimg,[0,255])
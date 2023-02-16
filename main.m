i = imread("img/image.jpg","jpg");
img = rgb2gray(i);

out=removeFrequencies(img,[1:5]);

imshowpair(img,out,'montage');
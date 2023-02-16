pause('on')

img = imread('./img/image.tiff','tiff');
gr = rgb2gray(img);
his=imhist(gr,256);
bar(his);
pause(1);
a=mystretch(gr);
imshowpair(a,gr,'montage');

function out=mystretch(img)
    ming = double(min(img(:)));
    maxg = double(max(img(:)));
    out = uint8((double(img) - double(ming)) / (double(maxg) - double(ming)) * 255);
end
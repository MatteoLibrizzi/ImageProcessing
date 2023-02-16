pause('on')

img = imread('./img/image.tiff','tiff');
img = rgb2gray(img);

equ=myeq(img);

imshowpair(equ,img,'montage');

function eq=myeq(img)
    s=numel(img)/255;
    lut = uint8(round(cumsum(imhist(uint8(img),256))/s));
    eq=lut(img+1);
end
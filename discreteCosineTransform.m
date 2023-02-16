function coeff = discreteCosineTransform(img,k)
    coeff = dct(single(img(:)));

    downSampleX = size(img,1)/k;
    downSampleY = size(img,2)/k;

    coeff(downSampleY*downSampleX:end) = 0;

    coeff = reshape(coeff, size(img,1),size(img,2));
end
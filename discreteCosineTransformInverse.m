function img = discreteCosineTransformInverse(coeff)
    img = round(idct(coeff(:)));

    img = reshape(img,size(coeff,1),size(coeff,2));
end
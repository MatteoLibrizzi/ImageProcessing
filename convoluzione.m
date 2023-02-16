function conv=convoluzione(mat,ker)

    ker = rot90(ker,2);
    [rowK, colK]=size(ker);

    centerRowK = round(rowK/2);
    centerColK = round(colK/2);

    padUp = centerRowK - 1;
    padDown = rowK - centerRowK;

    padLeft = centerColK - 1;
    padRight = colK - centerColK;

    [w,h] = size(mat);
    tmp = ones(h,w,'uint8');
    tmp = padarray(tmp,[padUp,padLeft],0,"pre");
    tmp = padarray(tmp,[padDown,padRight],0,"post");

    conv = tmp;

    offsets = zeros(colK,rowK);
    h = size(tmp,1);
    for i = 1 : rowK
        for j = 1 : colK
            offsets(i,j) = (i - centerRowK) + h * (j - centerColK);
        end
    end

    range = find(tmp==1);
    tmp(range) = mat;

    lut = (0:255)' * ker(:)';

    offsets = offsets(:);

    for i = range'
        t = 0;
        for k = 1 : rowK * colK
            t = t + lut(tmp(i+offsets(k))+1,k);
        end
        conv(i) = t;
    end
      
    conv = uint8(conv(padUp+1 : end - padDown, padLeft+1 : end - padRight));
end
function out = convv(img,ker)
    ker = rot90(ker,2);

    centerRowK = round(size(ker,1)/2);
    centerColK = round(size(ker,2)/2);

    padUp = centerRowK - 1;
    padLeft = centerColK - 1;

    padDown = size(ker,1) - centerRowK;
    padRight = size(ker,2) - centerColK;

    tmp = ones(size(img));
    tmp = padarray(tmp,[padUp,padLeft],0,"pre");
    tmp = padarray(tmp,[padDown,padRight],0,"post");
    out = tmp;

    range = find(tmp==1);
    tmp(range) = img;

    offsets = zeros(size(ker));
    h = size(tmp,1);

    for i = 1 : size(ker,1)
        for j = 1 : size(ker,2)
            offsets(i,j) = (i - centerRowK) + h * (j - centerColK);
        end
    end

    offsets = offsets(:);

    ker = ker(:);
    lut = (0:255)' * ker';

    for i = range'
        t = 0;
        for k = 1 : prod(size(ker))
            t = t + lut(tmp(offsets(k)+i)+1,k);
        end
        out(i) = t;
    end
    
    out = uint8(out(padUp+1:end-padDown,padLeft+1:end-padRight));
end
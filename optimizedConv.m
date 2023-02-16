function conv = optimizedConv(img,ker)
    [hk, wk] = size(ker);

    centerRow = round(hk/2);
    centerCol = round(wk/2);

    padUp = centerRow-1;
    padDown = hk - centerRow;

    padLeft = centerCol-1;
    padRight = wk - centerCol;

    tmp = ones(size(img));
    tmp = padarray(tmp,[padUp,padLeft],0,"pre");
    tmp = padarray(tmp,[padDown,padRight],0,"post");
    out = tmp;

    range = find(tmp==1);
    tmp(range) = img;

    %now linearize kernel to get the offsets
    h = size(tmp,1);
    offsets = zeros(hk,wk);

    for k = 1 : hk
        for j = 1 : wk
            offsets(k,j) = (k-centerRow) + h * (j-centerCol );
        end
    end

    ker=ker(:);

    %build ker lut
    ker = (0:255)'*ker';
    for i = range
        t = 0;

        for k = 1 : hk*wk
            t = t + ker(tmp(i+offsets(k))+1,k);
            % tmp(i+k) ci da il valore del pixel
            % k ci da il valore del kernel
            % in ker abbiamo i prodotti precalcolati
        end
        out(i) = t;
    end

    out = out (padUp + 1: end - padDown, padLeft+ 1 : end - padRight);
    conv = out;
end
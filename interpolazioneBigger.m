function out = interpolazioneBigger(img,k)
    [h,w] = size(img);

    out = zeros(h*k,w*k);


    for r = 1:h
        for c = 1:w
            out((r-1)*k + 1 : (r-1)*k + 1 + k  ,  (c-1)*k + 1 : (c-1)*k + 1 + k) = img(r, c);
        end
    end
end
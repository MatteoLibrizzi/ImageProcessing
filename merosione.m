function eroded = merosione(img,n)
    s = disc(n);

    centrox = round(size(s,1)/2);
    centroy = round(size(s,2)/2);

    padup = centroy - 1;
    paddown = size(s,1) - centroy;

    padleft = centrox - 1;
    padright = size(s,2) - centroy;

    tmp = ones(size(img));
    tmp = padarray(tmp,[paddown,padright],255,"post");
    tmp = padarray(tmp,[padup,padleft],255,"pre");
    eroded = tmp;

    nonZeros = find(tmp==1);
    tmp(nonZeros) = img;

    [xStr, yStr] = find(s);
    structLinear = (yStr - centroy) * size(tmp,1) + (xStr - centrox);
    
    for k = nonZeros'
        eroded(k) = min(tmp(k+structLinear+1));
    end

    eroded = uint8(eroded(1+padleft : end - padright, 1+padup : end - paddown));
end
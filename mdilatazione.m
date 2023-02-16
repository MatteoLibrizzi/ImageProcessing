function dilated = mdilatazione(img,n)
    s = disc(n);
    
    centerRow = floor(size(s,1)/2);
    centerCol = floor(size(s,2)/2); 


    padup = centerRow;
    paddown = size(s,1) - centerRow;

    padleft = centerCol;
    padright = size(s,2) - centerCol;

    tmp = ones(size(img));

    tmp = padarray(tmp,[padup,padleft],0,"pre");

    tmp = padarray(tmp,[paddown,padright],0,"post");

    dilated = tmp;
    
    range = find(tmp==1);
    tmp(range) = img;


    [rowDis, colDis] = find(s);

    offsets = (centerRow - rowDis + 1) + (centerCol - colDis + 1) * size(tmp,1);

    for k = range'
        dilated(k) = max(tmp(k+offsets));
    end

    dilated=dilated(1+padleft : end- padright,1+padup: end - paddown);

end
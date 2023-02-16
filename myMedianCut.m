function medCut = myMedianCut(img,n)
    global colors
global cubeBig
global indexedImage
global map
    if(size(img,3)~=3)
        return;
    end
    lvl = log2(n);
    if floor(lvl)~=lvl
        return
    end

    getColors(img)

end


function medianCutRec()

end

function getColors(img)
    global cubeBig
global colors


    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);

    r = r(:);
    g = g(:);
    b = b(:);

    colors = zeros(size(img,1)*size(img,2),3,'uint8');

    for i = 1 : size(r)
            colors(i,1)=r(i);
            colors(i,2)=g(i);
            colors(i,3)=b(i);
    end

    cubeBig = unique(colors,"rows");
end
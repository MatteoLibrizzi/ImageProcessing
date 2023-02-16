function th = tophat(img,n)
    ap = apertura(img,n);

    ap=uint8(ap);
    img=uint8(img);

    th = img - ap;
end
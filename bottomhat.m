function bh = bottomhat(img,n)
ap = chiusura(img,n);

    ap=uint8(ap);
    img=uint8(img);

    bh = img - ap;


end
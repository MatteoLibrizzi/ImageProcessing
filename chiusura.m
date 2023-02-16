function chiusuraOut = chiusura(img,n)
    dil = mdilatazione(img,n);

    chiusuraOut = merosione(dil,n);
end
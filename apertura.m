function aperturaOut = apertura(img,n)
    erd = merosione(img,n);

    aperturaOut = mdilatazione(erd,n);
end
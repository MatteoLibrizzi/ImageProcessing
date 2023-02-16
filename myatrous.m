function frequencies = myatrous(img, ker, k)
    img = single(img);
    frequencies = zeros(size(img,1),size(img,2),k+1,'single');
    nBuchi = size(ker,1) - 1;
    kerExp = ker;

    prvLvl = img;
    for i = 1 : k
        crntLvl = round(single(convoluzione(prvLvl,kerExp)));

        crntLvl(crntLvl>255) = 255;
        crntLvl(crntLvl<0) = 0;

        frequencies(:,:,i) = prvLvl - crntLvl;

        prvLvl = crntLvl;

        kerExp = zeros(nBuchi*i+size(ker,1));

        kerExp(1:i+1:end,1:i+1:end) = ker;

    end

    frequencies(:,:,i+1) = crntLvl;
end
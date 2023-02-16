function threshold = otsu(img)
    hist = imhist(img);
    N = prod(size(img));
    P = hist / N;
    max = 0;

    for k = 1 : 256
        pA = sum(P(1:k));
        pB = 1 - pA;
        mA = [0:k-1]*P(1:k)/pA;
        mB = [k:255]*P(k+1:end)/pB;
        sigma = pA * pB * ((mA - mB)^2);
        if max < sigma
            max = sigma;
            threshold = k;
        end
    end
end
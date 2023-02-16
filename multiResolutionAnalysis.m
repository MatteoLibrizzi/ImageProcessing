function out = multiResolutionAnalysis (img)
    [cA,cH,cV,cD] = dwt2(img,'haar'); % perform DWT256
    %cA = cA(128:end,128:end);
    %cH = cH(128:end,128:end);
    %cV = cV(128:end,128:end);
    %cD = cD(128:end,128:end);
    img_recon = idwt2(cA, cH,cV,cD, 'db1'); % reconstruct image
end
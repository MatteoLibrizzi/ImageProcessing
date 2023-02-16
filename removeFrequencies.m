function removed = removeFrequencies(img,k)
    ker = fspecial('gaussian');

    freq = myatrous(img,ker,max(k));
%{
    k = 4

    freq = myatrous(img,fspecial('gaussian'),k);

    for i = 1 : k+1
        if i ~= k+1
            subplot(1,k+1,i), imshow(freq(:,:,i),[0,1]); 
        else
            subplot(1,k+1,i), imshow(freq(:,:,i),[0,255]); 
        end
    end
    startImg = sum(freq,3);
%}
    removed = zeros(size(img));

    toTake = setdiff((1:max(k)),k);
    
    removed = removed + sum(freq(:,:,toTake),3);
    removed = removed + freq(:,:,end);

end
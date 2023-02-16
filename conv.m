function out=conv(img,ker)
    [hk,wk] = size(ker);
    
    i = round(hk/2); % find center
    j = round(wk/2);
    left = j-1; % padding sx
    right = wk-j; % padding dx
    up = i-1; % padding up
    bottom = hk-i; % padding bottom
    
    %management border problem
    tmp = ones(size(img),'single');
    tmp = padarray(tmp,[bottom,right],0,'post');
    tmp = padarray(tmp,[up,left],0,'pre');
    out = tmp;
 
    range = find(tmp);
    tmp(range) = img;
    
    %lut
    ind = find(ker);
    lut = ind - ind(3);
    if(size(ker,1)==1) %is a row
        lut = lut*size(tmp,1);
    end

    %convolution
    for i = range'
        t = 0;
        for k = 1:5 %kernel elements are always five
            t = t+tmp(i+lut(k))*ker(ind(k));
        end
        out(i) = t;
    end
   
    out = out(up+1:end-bottom,left+1:end-right);
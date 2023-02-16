function fileWrite(fileID,n,j)
    global v  k  l buffersize

    l = l - j;

    v(k) = v(k) + bitshift(n,l,'uint8');
    
    if (k == buffersize && l <= 0)
        fwrite(fileID,v);
        k = 0;
        v = zeros(buffersize,'uint8');
    end

    if l == 0
        l = 8;
        k = k + 1;
    end

    if l < 0
        l = l + 8;
        k = k + 1;
        v(k) = v(k) + bitshift(n,l,'uint8');
    end
end
function disc = disc(n)
    disc = zeros(2*n+1);

    for i = -n : n
        for j = -n : n
            
            if i*i + j*j <= n*n
                disc(i+n+1,j+n+1)=1;
            end
        end
    end


end
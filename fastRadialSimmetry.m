function [mul, out] = fastRadialSimmetry(img,v)
    [h,w] = size(img);

    mul = zeros(h,w,length(v)+1);

    k0 = fspecial('sobel');

    dx = single(conv2(single(img),k0,'same'));% derivata verticale
    dy = single(conv2(single(img),k0','same'));% derivata orizontale

    m = sqrt(dx.^2 + dy.^2);
    a = atan2(dx,dy); % forse vanno al contrario

    c = cos(a);
    s = sin(a);

    counter = 0;

    for r = reshape(v,1,length(v))
        M = zeros(h,w,'single');
        O = zeros(h,w,'single');

        pc = round(r*c);% componente orizontale
        ps = round(r*s);% componente verticale

        for y = r+1 : h-r% every row
            for x = r+1 : w-r% every col
                %dark
                O(y+ps(y,x), x+pc(y,x)) = O(y+ps(y,x), x+pc(y,x)) + 1;
                M(y+ps(y,x), x+pc(y,x)) = M(y+ps(y,x), x+pc(y,x)) + m(y,x);

                %light
                O(y-ps(y,x), x-pc(y,x)) = O(y-ps(y,x), x-pc(y,x)) - 1;
                M(y-ps(y,x), x-pc(y,x)) = M(y-ps(y,x), x-pc(y,x)) - m(y,x);
            end
        end
        k = 9.9;
        if r == 1
            k = 8;
        end
        
        fr = (M/k).*((min(O,k)/k).^2);

        counter = counter + 1;

        mul(:,:,counter) = conv2(fr, fspecial('gaussian',r,r*0.5), 'same');
    end
    mul(:,:,end) = mean(mul(:,:,1:end-1),3);
    out=mul(:,:,end);
end
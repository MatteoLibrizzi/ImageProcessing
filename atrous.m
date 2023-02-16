function out=atrous(img,n) %img is single and gray, n is the number of wavelet plane
    out = zeros(size(img,1),size(img,2),n+1,'single'); %out(:,:,n+1)=carrier(img)
    ker = [1;4;6;1;4]; %bicubic spline kernel
    %pay attention to the n parameter
    %the size of the kernel must not exceed that of the image
    ker2 = ker;
    for i=1:n 
        %tmp = conv2(img,1/16*ker2,'same'); 
        %tmp = conv2(tmp,1/16*ker2','same');
        tmp = conv(img,1/16*ker2); %more efficient
        tmp = conv(tmp,1/16*ker2'); %more efficient
        out(:,:,i) = img - tmp;
        img = tmp;

        %new kernel
        ker2 = zeros(5+4*i,1,'single'); 
        ker2(1:i+1:5+4*i) = ker;
    end
    out(:,:,n+1) = img; %carrier
    

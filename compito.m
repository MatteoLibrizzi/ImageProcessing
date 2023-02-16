img = imread("img/image.jpg","jpg");

img = single(rgb2gray(img));

c = (1/16)*[1,4,6,4,1]';
r = (1/16)*[1,4,6,4,1];

convI= convoluzioneArray(convI,c);
c2 = conv2(img,m);

disp(c2(45,43));
disp(convI(45,43));
pause(2);

m = c*r;
convI=img;
for count = 0: 10
    k = addZero(c,count);

    convI = convoluzioneArray(convI,k);
    imshow(convI,[0,255]);
    pause(1);
end



%prima vettore colonna poi vettore di riga

function newK = addZero(arr,n)%kernel 1x5
    h = size(arr,1);
    newK = zeros([h+(h-1)*n,1]);

    for i = 1 : h
        newK(1+(i-1)+(i-1)*n)=arr(i);
    end
end

function out = convoluzioneArray(img, arr)
    l=size(arr,1);% array is a column
    center = floor(l/2);%getting center (should be 2)

    img = padarray(img,[center,center],0,"both");
    
    [imgH,imgW]=size(img);

    out = img;

    %convoluzione con la colonna
    for j = 1 : imgW
        for i = center+1 : imgH - center
            t = 0;
            for k = -center:center
                t = t + img(j,i+k)*arr(k+center+1);
            end
            out(j,i) = t;
        end
    end

    arr = arr';

    %convoluzione con la riga
    for i = 1 : imgH
        for j = center+1 : imgW - center
            t=0;

            for k = -center : center
                t = t + out(j+k,i)*arr(k+center+1);
            end
            out(j,i)=t;
        end
    end

    out=out(center:size(out,1)-center,center:size(out,2)-center);
end
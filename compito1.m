I = imread("img/image.tiff","tiff");

R = zeros([256*6,1]);
B = zeros([256*6,1]);
j=0;

G = floor((1:256*6)/6)';

i = 1;
for c = 0 : 254
    R(i:i+2,1)=c;
    R(i+3:i+5,1)=c+1;

    i = i + 6;
end
i = 1;
for c = 0 : 253
    B(i:i+2) = [c,c+1,c+2];
    B(i+3:i+5) = [c,c+1,c+2];

    i = i + 6;
end



table = zeros([256*6,3]);
table(:,1)=R(:,1);
table(:,2)=G(:,1);
table(:,3)=B(:,1);

table=table(1:size(table,1)-12,:)

function translated = translate(img,table)
    cr = 0.212671;
    cg = 0.715160;
    cb = 0.072169;

    for i = 1 : size(img,1)
        for j = 1 : size(img,2)
            [r,g,b] = img(i,j);

            pix = cr * r + cg * g + cb * b;

            translated(i,j) = pix;
        end
    end
end
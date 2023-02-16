function houghTransform(img)
    cimg = img;
    img = img > 128;

    % Apply Hough Transform to find radial lines
    [H,theta,rho] = hough(img,'RhoResolution',0.5,'Theta',0:0.5:89);
    
    % Find peaks in Hough transform
    peaks = houghpeaks(H,50);
    
    % Find lines corresponding to peaks
    lines = houghlines(img,theta,rho,peaks);
    
    % Plot lines
    imshow(cimg), hold on
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    end
end
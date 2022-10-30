% Brandon Salazar
% 1. Set green channel to zero, and save as green.jpg
    % load image
        img1 = imread('01.jpg');
    % set green channel to zero
        G = img1;
        %img1(:,:,1); %red channel
        G(:,:,2) = 0; %green channel
        %img1(:,:,3); %blue channel
        
        figure, imshow(G);
    % save image
        imwrite(G, 'green.jpg');
        fprintf('Save green.jpg... \n');
        
% 2. Convert image from RGB to gray scale without using
%    built-in functions, and save as gray.jpg
    % load image
        img2 = imread('01.jpg');
    %converting to grayscale
        R = img2(:,:,1); %red channel
        G = img2(:,:,2); %green channel
        B = img2(:,:,3); %blue channel
        
        Y = 0.299 * R + 0.587 * G + 0.114 * B;
        figure, imshow(Y);
    % save image
        imwrite(Y, 'gray.jpg');
        fprintf('Save gray.jpg... \n');
        
% 3. Rotate 90 degrees, and save as rotate.jpg
    % load image
        img3 = imread('01.jpg');
    % rotate image 90DEGREES
        rightAngle = imrotate(img3, 90);
        figure, imshow(rightAngle);
    % save image
        imwrite(rightAngle, 'rotate.jpg');
        fprintf('Save rotate.jpg... \n');

% 4. Crop the image given the upper left point (30, 100) and
%    lower right point (270, 300), and save as crop.jpg
    % load imager
        img4 = imread('01.jpg');
    % rotate image 90DEGREES
        %TO CROP YOU NEED THE(x1, y1)(x2,y2); in this case it is [x1.y1,x2.y2]
       cropped = imcrop(img4,[30,100, 270, 300]);
       figure, imshow(cropped);
    % save image
        imwrite(cropped, 'crop.jpg');
        fprintf('Save crop.jpg... \n');
 
% 5. Horizontally flip the image, and save as flip.jpg
    % load image
        img5 = imread('01.jpg');
    % rotate image 90DEGREES
        didAFull180 = fliplr(img5);
        figure, imshow(didAFull180);
    % save image
        imwrite(didAFull180, 'flip.jpg');
        fprintf('Save flip.jpg... \n');

% 6. Combine 4 images (01.jpg ~ 04.jpg) into one matrix
%    with 2 x 2 grid and 10 pixels separations, and save as
%    combine.jpg
    %combining 4 images together; use zeros(Height, Width, 3, 'uint8')
    %zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
        img6 = imtile({'01.jpg', '02.jpg', '03.jpg', '04.jpg'},'BorderSize',[10 10]);
        figure, imshow(img6);
    %Saving image
        imwrite(img6, 'combine.jpg');
        fprintf('Saving combine.jpg... \n');

   
% 7. Convert images (05.jpg and 06.jpg) to vectors, average
%    them, and save as average.jpg
    %loading images
        img7 = imread('05.jpg');
        img8 = imread('06.jpg');
    %Utilizing a vector function
        img7 = img7(:);
        img8 = img8(:);
        img7 = reshape(img7, 375, 1242, 3);
        img8 = reshape(img8, 375, 1242, 3); 
    %For loop
        for k = 1:size(img7)
           avgImg = img7+img8; 
        end
    %Saving image
        figure, imshow(avgImg);
        imwrite(avgImg, 'average.jpg');
        fprintf('Saving average.jpg... \n');
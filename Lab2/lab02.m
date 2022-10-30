
%1. Rotate 01.jpg by 45 degrees using forward warping, and save as rotate_0.jpg
    %Loading images
        img1 = imread('01.jpg');
        img1(:);
    %Finding the center of the image in order to rotate
        [y_size,x_size,z_size]=size(img1);
        
     %Declaring an array
     I2 = zeros(y_size,x_size,z_size,'uint8');
     Q = 45;
     
     x0 = x_size/2;% y size
     y0 = y_size/2;%x-soze
     %Code forward warping pseudocode
            for y1 = 1 : y_size
                for x1 = 1 : x_size
                    x2 = cosd(Q)*(x1 - x0)+sind(Q)*(y1 - y0)+x0;
                    y2 = -sind(Q)*(x1 - x0)+cosd(Q)*(y1 - y0)+y0;
                                                                       
                    x2=round(x2);
                    y2=round(y2);
                    
                    if( 1 < y2 && y_size >=y2 && x_size >=x2 && 1 <= x2 )
                        I2(y2,x2,:) = img1(y1, x1,:);
                    end
                end
            end       
        
       
        figure, imshow(img1);
        figure, imshow(I2);
        imwrite(I2, 'rotate_0.jpg');
        fprintf('Saving rotate_0.jpg... \n');

%2. Rotate 01.jpg by 45 degrees using backward warping, and save as rotate_1.jpg
%Loading images
        img2 = imread('01.jpg');
        img2(:);
    %Finding the center of the image in order to rotate
        [y_size,x_size,z_size]=size(img2);
        
     %Declaring an array
     I3 = zeros(y_size,x_size,z_size,'uint8');
     Q = 45;
     
     x0 = x_size/2;% y size
     y0 = y_size/2;%x-soze
     %Code backwards warping pseudocode
            for y1 = 1 : y_size
                for x1 = 1 : x_size
                    x2 = cosd(Q)*(x1 - x0)-sind(Q)*(y1 - y0)+x0;
                    y2 = sind(Q)*(x1 - x0)+cosd(Q)*(y1 - y0)+y0;
                                                                       
                    x2=round(x2);
                    y2=round(y2);
                    
                    if( 1 < y2 && y_size >=y2 && x_size >=x2 && 1 <= x2 )
                        I3(y2,x2,:) = img2(y1, x1,:);
                    end
                end
            end       
        
       
        figure, imshow(img2);
        figure, imshow(I3);
        imwrite(I3, 'rotate_1.jpg');
        fprintf('Saving rotate_1.jpg... \n');


%3. Implement median_filter.m for lena_noisy.jpg, use patch size = 3 and save the image as median_0.jpg

%4. Use patch size = 5, and save the image as median_1.jpg
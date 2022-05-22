clear
clc
close all;

%reading, downsampling the image and converting it to grayscale
I = imread('TestIm1.png');
I = imresize(I,0.2);
I  = rgb2gray(I);

% Normalization to values [0,1]
I=double(I) / 255;



corners = myDetectHarrisFeatures(I);



[N1, N2] = size(corners);

%plotting the 5x5 red squares
for i=1:N1

    I = insertShape(I, 'rectangle', [corners(i,1) corners(i,2) 5 5], 'color', 'red');

end


imshow(I);



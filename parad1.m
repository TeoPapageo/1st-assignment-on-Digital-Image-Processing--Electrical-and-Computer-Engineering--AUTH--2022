clear
clc
close all;

% kanoume prota downsample thn eikona
RGB = imread('TestIm1.png');
RGB = imresize(RGB,0.2);

% tin peristrefoume kata 35 moires
I1 = myImgRotation(RGB,(35*pi/180));
figure;
imshow(I1);

% tin peristrefoume kata 222 moires
I2 = myImgRotation(RGB,(222*pi/180));
figure;
imshow(I2);
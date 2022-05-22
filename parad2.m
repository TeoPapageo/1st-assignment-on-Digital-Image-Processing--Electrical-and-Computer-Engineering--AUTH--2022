clc;
clear;

I = imread('TestIm1.png');
I  = rgb2gray(I);

%[100,100], initial image
d = myLocalDescriptor(I, [100 100],5,20,1,8);
disp('d(100,100) for the initial image is:');
disp(d');


%[100,100], 35 degrees rotation
I1 = myImgRotation(I,(35*pi/180));
d1 = myLocalDescriptor(I1, [729 140],5,20,1,8);
disp('d(100,100) for the theta1 rotated image is:');
disp(d1');

%[100,100], 222 degrees rotation
I2 = myImgRotation(I,(222*pi/180));
d2 = myLocalDescriptor(I2, [1600 913],5,20,1,8);
disp('d(100,100) for the theta2 rotated image is:');
disp(d2'); 

%[200,200], inital image
d3 = myLocalDescriptor(I, [200 200],5,20,1,8);
disp('d(200,200) for the initial image is:');
disp(d3');

%[202,202], inital image
d4 = myLocalDescriptor(I, [202 202],5,20,1,8);
disp('d(202,202) for the initial image is:');
disp(d4');

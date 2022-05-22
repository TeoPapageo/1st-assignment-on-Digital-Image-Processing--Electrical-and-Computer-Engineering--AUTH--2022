function [d] = myLocalDescriptor(I,p,rhom,rhoM,rhostep ,N)

I = im2double(I);  

tempX = 0;
tempY = 0;

%N sized vector which has the values of each concentral circle
vectX = zeros(N,1);

%index variable is so that the code does not get too complicated
index = 1;
d = zeros(((rhoM-rhom)/rhostep)+1,1);



%use of the for is pretty simple
%assing the coordinates on the circle to tempX, tempY
for r=rhom:rhostep:rhoM
    for i=1:N
    tempX = p(1) + r*cos(2*pi/i);

    tempY = p(2) + r*sin(2*pi/i);
    
    
    %use billinear interpolation to find the value of vectX
    vectX(i) = (I(ceil(tempX),ceil(tempY)) + I(floor(tempX),ceil(tempY)) + I(floor(tempX),floor(tempY)) + I(ceil(tempX),floor(tempY)))/4;
    
    end
    %assign the value which we calculated above to the corresponding index
    %of the vector d
    d(index) = mean(vectX);
    index = index+1;
end

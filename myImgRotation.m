function [rotImg] = myImgRotation(img, angle)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

img = im2double(img);

%vrisko to megethos kai ta channels tis eikonas
[height, width, chan] = size(img);

Channels = zeros(height,width,chan);
for i=1:chan
    Channels(:,:,i) = img(:,:,i);
end

%rotation matrix
M = [cos(angle) sin(angle) ; -sin(angle) cos(angle)];

%oi 4 gonies tis arxikis eikonas
top_left_corner = [1 1]';
top_right_corner = [width 1]';
bottom_left_corner = [1 height]';
bottom_right_corner = [width height]';

%oi 4 gonies tis rotated eikonas
top_left_rot = M * top_left_corner;
top_right_rot = M * top_right_corner;
bottom_left_rot = M * bottom_left_corner;
bottom_right_rot = M * bottom_right_corner;

x_axis = [top_left_rot(1),top_right_rot(1),bottom_left_rot(1),bottom_right_rot(1)];
y_axis = [top_left_rot(2),top_right_rot(2),bottom_left_rot(2),bottom_right_rot(2)];

x_min = min(x_axis);
x_max = max(x_axis);
y_min = min(y_axis);
y_max = max(y_axis);

% Shift stous x kai y aksones gia na exoume thetikes syntetagmenes
x_shift = 1-x_min;
y_shift = 1-y_min;

%ypologismos diastasewn gia na xoresoume tin rotated eikona
width_rot = ceil(x_max) - floor(x_min);
height_rot = ceil(y_max) - floor(y_min);

%arxikopoisi tis rotated eikonas
rotImg = zeros(height_rot,width_rot,chan);

%arxikopoihsh ton neon channels
Channels_rot = zeros(height_rot,width_rot,chan);
temp = zeros(chan,1);


%ypologizontas tis times fn ton neon pixels xrisimopoiontas bilinear interpolation
for y_rot = 1 : height_rot
     for x_rot = 1 : width_rot
         
        %ypologismos tou antistrofou pinaka gia na peristrepsoume ksana ta
        %nea pixel
        M_inv = [cos(-angle) sin(-angle) ; -sin(-angle) cos(-angle)];
        
        pixels_input= M_inv*[x_rot-x_shift;y_rot-y_shift];
        x_in = pixels_input(1);
        y_in = pixels_input(2);
                
        % Bilinear Interpolation
        x1 = floor(x_in);
        x2 = ceil(x_in);
        y1 = floor(y_in);
        y2 = ceil(y_in);
       
        % An ta (xin, yin) einai mesa stin eikona pou dinoume os eiosodo
        % tote ypologizoume tis times ton kanaliwn xrisimopoiontas bilinear
        % interpolation alliws dinoume timi 0

        if (x1 >= 1) && (x1 <= width) && (x2 >= 1) && (x2 <= width) && (y1 >= 1) && (y1 <= height)&& (y2 >= 1) && (y2 <= height)
            for i=1:chan
                temp(i) = (Channels(y1,x1,i) + Channels(y2,x1,i) + Channels(y1,x2,i) + Channels(y2,x2,i))/4;
            end
        else
            for i=1:chan
                temp(i) = 0;
            end            
        end
        % anatheto tis times ton pixel se kathe kanali
        for i=1:chan
            Channels_rot(y_rot, x_rot,i) = temp(i);
        end
    end
 end
 % anatheto ta kanalia stin teliki peristrammeni fotografia
for i=1:chan
    rotImg(:,:,i) = Channels_rot(:,:,i);
end


end


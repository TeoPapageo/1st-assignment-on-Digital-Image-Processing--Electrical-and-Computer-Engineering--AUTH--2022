function corners = myDetectHarrisFeatures(I)
[N1, N2] = size(I);
corners = [];


im = zeros(N1,N2);

%finding if a pixel is corner and then assigning the value of R to im
for i=1:N1
    for j = 1:N2
        [c,R] = isCorner(I,[i j],0.04,1);
        if c            
            im(i,j) = R;        
        end
    end
end

%using the dilation filter to find the local max of a group of pixels
filtering = im > imdilate(im,[1 1 1 ; 1 0 1 ; 1 1 1 ] );
[y1,x1] = find(filtering==true);

%shifting to the right positions
y1 = y1 - 2 * 3;
x1 = x1 - 2 * 3;


corners = [x1, y1];

end

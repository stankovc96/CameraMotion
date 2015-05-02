clc, clear

I = imread('0000000000.png');
Id = double(I)/255;


[m, n] = size(I);

w = 9;  % Window pixel width/height, always odd
wr = (w-1)/2;    %Range of pixels

x = 5;
y = 5;

Wx = [1, 0, -1; 2, 0, -2; 1, 0, -1];    % Derivative in x direction
Wy = [1, 2, 1; 0, 0, 0; -1, -2, -1];    % Derivative in y direction

% for x = 2

Ix = conv2(Id, Wx);
Iy = conv2(Id, Wy);



for x = wr+1:m-wr-1
    for y = wr+1:n-wr-1
        
%         Iw = I(x-wr:x+wr, y-wr:y+wr);   % Window image
        
        Ixw = Ix(x-wr:x+wr, y-wr:y+wr);   % Window image
        Iyw = Iy(x-wr:x+wr, y-wr:y+wr);   % Window image
        
        Ix2 = sum(sum(Ixw.^2));
        Ixy = sum(sum(Ixw.*Iyw));
        Iy2 = sum(sum(Iyw.^2));
        
        H = [Ix2, Ixy; Ixy, Iy2];
        C(x,y) = det(H) - trace(H);
        
    end
end

%%

ind = find(C < -100);


figure(1)
clf
imshow(Id)
hold on


for i = 1:length(ind)
   
   
   x = mod(ind(i), n);
   y = round(ind(i)/m)+1;
   plot(x,y, 'bo');
    
end

%%
clf
hold on
imshow(Id)

pos = [75, 90, 120, 12, 56, 98].^2;
x = mod(pos, n);
y = round(pos/n)+1;

% scatter(x,y)
% plot(x(1), y(1), 'bo');
% plot(x, y, 'bo');



% ind = x*width + y










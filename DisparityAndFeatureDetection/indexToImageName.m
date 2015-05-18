function name = indexToImageName(index)
%% Input the index of the image you want, 0-indexed

% '0000000000'
   

name = strcat('00000', num2str(index), '.png');

if index < 10
    name = strcat('00000', num2str(index), '.png');
elseif index >= 10 && index <= 99
    name = strcat('0000', num2str(index), '.png');
elseif index >= 100 && index <= 999
    name = strcat('000', num2str(index), '.png');
elseif index >= 1000 && index <= 9999
    name = strcat('00', num2str(index), '.png');
end





end
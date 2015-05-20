%% Loop through images and save Harris vectors to save time for later
clc, clear

I1 = imread(['../ImageData/LeftData/', indexToImageName(1)]);

mQ = 0.0001;
filt = 3;
ROI = [128 1 size(I1,2)-128*2 size(I1,1)];


for k = 1:100
    k
    IL1 = imread(['../ImageData/LeftData/', indexToImageName(k)]);
    IL2 = imread(['../ImageData/LeftData/', indexToImageName(k+1)]);

    IR1 = imread(['../ImageData/LeftData/', indexToImageName(k)]);
    IR2 = imread(['../ImageData/RightData/', indexToImageName(k+1)]);
    [~, ~, ~, ~, ~, ~, Lmp1, Lmp2] = returnHarrisVectors(IL1, IL2, mQ, filt, ROI);
    
    Left.matched1{k} = Lmp1;
    Left.matched2{k} = Lmp2;
    
    [~, ~, ~, ~, ~, ~, Rmp1, Rmp2] = returnHarrisVectors(IR1, IR2, mQ, filt, ROI);
    
    Right.matched1{k} = Rmp1;
    Right.matched2{k} = Rmp2;
    
end
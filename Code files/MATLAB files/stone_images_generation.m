for i=1:3274
    inputfile = "Stone/kidneystone (" + i + ").jpg";
    aimg=imread(inputfile);
    a=imcrop(aimg,[40,90,420,280]);
    %rgb to grayscale
    a1=rgb2gray(a);
    %median filtering
    x= medfilt2(a1);
    %power law transform
    y1= im2double(x);
    c=1;
    pl1=256*(c*(y1.^100));
    %morphological operation
    se1 = strel('disk',1,4);
    se2 = strel('disk',4,4)
    morphI = imopen(imerode(pl1,se1),se2);
    %thresholding
    T=30;
    res= imbinarize(morphI,T);
    %writing out results 
    file= "F:\College\Year3\Sem6\IPCV\Final Project\Dataset\tumor\processed-normal\res" + i + ".jpg"
    imwrite(morphI, file);
end
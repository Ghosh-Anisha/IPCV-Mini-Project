for i=1:848
    inputfile = "Stone/kidneystone (" + i + ").jpg";
    aimg=imread(inputfile);
    a=imcrop(aimg,[40,90,420,280]);
    %rgb to grayscale
    a1=rgb2gray(a);
    %median filtering
    x= medfilt2(a1);
    %power law transform with c=1, gamma=100
    y1= im2double(x);
    c=1;
    pl1=256*(c*(y1.^100));
    %morphological operation
    se1 = strel('disk',1,4);
    se2 = strel('disk',4,4)
    morphI = imopen(imerode(pl1,se1),se2);
    %thresholding value received by experimentation
    T=0.67;
    res= imbinarize(morphI,T);
    %writing out results 
    file= "F:\College\Year3\Sem6\IPCV\Final Project\Dataset\tumor\processed-stone\res" + i + ".jpg"
    imwrite(morphI, file);
end
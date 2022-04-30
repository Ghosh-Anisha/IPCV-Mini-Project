for i=1:1340
    inputfile = "Tumor/tumorkidney (" + i + ").jpg";
    aimg=imread(inputfile);
    a=imcrop(aimg,[10,75,500,380]);
    %rgb to grayscale
    a1=rgb2gray(a);
    x= medfilt2(a1);
    %morphological operations
    se1 = strel('disk',2,4);
    se2 = strel('disk',2,4);
    morphI = imdilate(x,se1);
    %thresholding
    T=0.67;
    res= imbinarize(morphI,T);
    LB = 1000;
    res = bwareaopen(res,LB);
    morphI = imerode(res,se2);
    %writing out results 
    file= "F:\College\Year3\Sem6\IPCV\Final Project\Dataset\tumor\processed-tumor\res" + i + ".jpg"
    imwrite(morphI, file);
end
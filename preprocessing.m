aimg=imread('F:/College/Year3/Sem6/IPCV/stone.jpg');
a=imcrop(aimg,[30,80,480,300]);
a1=rgb2gray(a);
x= medfilt2(a1);
y= histeq(x);
%figure(1); imshow(y)
y1= im2double(y);
c=1;
pl1=256*(c*(y1.^75.5));
%figure(2); imshow(uint8(pl1));
T= graythresh(pl1);
T=80.5
res= imbinarize(pl1,T);
imshowpair(aimg,res, 'montage');


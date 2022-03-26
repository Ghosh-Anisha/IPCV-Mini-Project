aimg=imread('F:/College/Year3/Sem6/IPCV/stone.jpg');
a=imcrop(aimg,[40,90,420,280]);
%imshowpair(aimg,a, 'montage');
a1=rgb2gray(a);
x= medfilt2(a1);
y= histeq(x);
y1= im2double(y);
c=1;
pl1=256*(c*(y1.^95.5));
figure(2); imshow(uint8(pl1));
T= graythresh(pl1);
T=70;
res= imbinarize(pl1,T);
imshow(res);
%imshowpair(aimg,res, 'montage');


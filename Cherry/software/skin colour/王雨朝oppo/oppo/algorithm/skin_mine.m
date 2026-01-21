function [ skin,mask ] = skin_mine( img )
% input parameter:
%     img - image matrix by [n*m*3];
% output parameter:
%     skin - average skin RGB by [1*3];
%     mask - index to mark the skin pixel position by [n*m].

img=double(img);
img_size=size(img);
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
r=R(:)/255;
g=G(:)/255;
b=B(:)/255;

maxR=max(r);
maxG=max(g);
maxB=max(b);
minR=min(r);
minG=min(g);
minB=min(b);

idx=r>90/255 & g>40/255 & b>20/255 & abs(r-g)>15/255 & r>g & r>b & (maxR - minR)>15/255 & (maxG - minG)>15/255 & (maxB - minB)>15/255;

skin=[mean(R(idx)),mean(G(idx)),mean(B(idx))];
bg=[mean(R(~idx)),mean(G(~idx)),mean(B(~idx))];
mask=reshape(idx,img_size(1:2));% value = 1, marks the skin


end
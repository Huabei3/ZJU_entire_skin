function [ skin,bg,temp ] = skin_det( I )
% [skin,bg,temp] = skin_det( I )
% detect and seperate the skin from the background
% skin=skin metrix; bg=bg metrix; temp=location metrix (skin=1,bg=0);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
R = double(R);
G = double(G);
B = double(B);

maxR = max(max(R));
minR = min(min(R));
maxG = max(max(G));
minG = min(min(G));
maxB = max(max(B));
minB = min(min(B));

%% new version
index=R>90 & G>40 & B>20 & ...
                 abs(R-G)>15 & R>G & R>B & ...
                 (maxR-minR)>15 & (maxG-minG)>15 & (maxB-minB)>15;
             
skin=cat(3,R,G,B).*cat(3,index,index,index);
bg=cat(3,R,G,B).*cat(3,~index,~index,~index);
temp=double(index);
end
for l=2
img=imread(strcat('./images/image use/',num2str(l),'.jpg'));
b1=size(img);
[skin,bg,temp]=skin_det(img);
skin1(:,:)=skin(:,:,1);
skin2(:,:)=skin(:,:,2);
skin3(:,:)=skin(:,:,3);

k=0; sum=0;
for i=1:1440
    for j=1:b1(2)      
        if skin1(i,j)==0
        else k=k+1;
            sum=sum+skin1(i,j);
        end
        end
end
a(l,1)=sum./k;
k=0; sum=0;
for i=1:1440
    for j=1:b1(2)
        if skin2(i,j)==0
        else k=k+1;
            sum=sum+skin2(i,j);
        end
        end
end
a(l,2)=sum./k;
k=0; sum=0;
for i=1:1440
    for j=1:b1(2)
        if skin3(i,j)==0
        else k=k+1;
            sum=sum+skin3(i,j);
        end
        end
end
a(l,3)=sum./k;
end
b=lut3d_rgb2xyz(a);
c=lut3d_rgb2xyz([255,255,255]);
d=xyz2lab(b,'user',c);
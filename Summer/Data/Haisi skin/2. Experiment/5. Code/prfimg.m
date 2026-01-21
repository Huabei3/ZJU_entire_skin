clear all
load('Ccd.mat');
cct=(mean(cct'))';
duv=(mean(duv'))';
for abc=1:8
pxyz(abc,:)=CCT2xyz(cct(abc,:),duv(abc,:));
img=imread(strcat('G:\工作\coding\Haisi\experiment\images\',num2str(abc),'.jpg'));
path_in=('G:\工作\coding\Haisi\experiment\images\new\');
rgb1=double(reshape(img,size(img,1)*size(img,2),3));
xyz=rgb2xyz(rgb1);
a=size(xyz,1);
for j=1:a
cat(j,:)=ciecat02_d(xyz(j,:),[96.8784150756302,100,112.116528078328] ,pxyz(abc,:),'CAT16',106,100,1);
end
rgb=xyz2rgb(cat);
img2=uint8(reshape(rgb,size(img,1),size(img,2),3));
imwrite(img2,[path_in,strcat('preferred',num2str(abc),'.jpg')],'JPG');
end
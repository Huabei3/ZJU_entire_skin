clear all
file_path =  'C:\Users\Administrator\Desktop\image\';% 图像文件夹路径
img_path_list = dir(strcat(file_path,'*.bmp'));%获取该文件夹中所有jpg格式的图像
img_num = length(img_path_list);%获取图像总数量
a=randperm(img_num);
name=input('obsever name?: ','s');
quest=input('question?: ','s');
light=input('light?: ','s');
save(['C:\Users\Administrator\Desktop\score\',name,'_',quest,'_',light],'a');

scrsz = get(0,'ScreenSize');
for j =1:img_num
    image_name = img_path_list(a(j)).name;% 图像名
    I = imread(strcat(file_path,image_name));
    if rem(j,5)==0;I(5:10,5:10,:)=zeros(6,6,3);end
    if rem(j,10)==0;I(15:20,15:20,:)=zeros(6,6,3);end
    disp([num2str(j),'-',num2str(a(j))]);% 显示正在处理的图像名
    figure('position',scrsz,'menubar','none','toolbar','none','color','black'),imshow(I,'InitialMagnification','fit');
    pause;
end
close all;

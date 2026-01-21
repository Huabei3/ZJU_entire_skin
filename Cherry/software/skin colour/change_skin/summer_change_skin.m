
clc;clear;close all;
addpath("utils");
%%
% mask1=imread("BK_F_bgMask.jpg");
% mask2=imread("GU_F_bgMask.jpg");
% figure(1);hold on; imshow(mask1);
% figure(2);hold on; imshow(mask2);
%%
group_labels = {'BK_F','BR_F', 'GU_F','YY_F'};
% group_labels = {'YY_F'};
save_folder="rendered\summer\srgb";
if ~exist(save_folder,"dir")
    mkdir(save_folder);
end

for i_ori=1:length(group_labels)
    ori_name=group_labels{i_ori};
    ori_pic=fullfile(strcat(ori_name,'.png'));
    if ~exist(ori_pic,"file")
        continue
    end
    I=double(imread(strcat(ori_name,'.png')));
    [ ~,~,temp ] = skin_det( I );
    idx=double(~temp);                               %%得到index
    
    [~,~,idx1]=imread(strcat(ori_name,'.png'));
    idx1(idx1>0)=1;
    [~,~,idx3]=imread(strcat(ori_name,'_Skin.png'));
    idx3(idx3>0)=1;
    idx0=idx1-idx3;  
    
    img=double(imread(strcat(ori_name,'.png')));
    height=size(img,1);
    weight=size(img,2);
    img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
    
    w=[255,255,255]; 
    xyzw = lut3d_rgb2xyz(w);
    xyz=lut3d_rgb2xyz(img);
    lab=xyz2lab(xyz,'user',xyzw);
    averageLab = lab;
    A=double(idx0(:)==0);
    averageLab(all(A==0,2),:)=[];
    mlab=mean(averageLab);
    clear("TargetLab");
    labNscore_folder="..\..\..\..\Summer\Data\Haisi skin\3. Test experiment\4. Model\res\original\fitRes";

    if strcmp(ori_name,'BK_F')
        labNscore_file=fullfile(labNscore_folder,"African.mat");
    elseif strcmp(ori_name,'BR_F')
        labNscore_file=fullfile(labNscore_folder,"South_Asian.mat");
    elseif ismember(ori_name,'GU_F')
        labNscore_file=fullfile(labNscore_folder,"Caucasian.mat");        
    elseif ismember(ori_name,'YY_F')
        labNscore_file=fullfile(labNscore_folder,"Oriental.mat");
    end
    load(labNscore_file,"labNcore"); 
    TargetLab=labNcore{1,1};

    
    for i=1:size(TargetLab,1)
        
        rlab=lab;
        tlab=TargetLab(i,:);
        dlab=tlab-mlab;                    %%目标值与平均值的差异
        rlab(idx(:)==0,1)=rlab(idx(:)==0,1)+dlab(1);
        rlab(idx(:)==0,2)=rlab(idx(:)==0,2)+dlab(2);
        rlab(idx(:)==0,3)=rlab(idx(:)==0,3)+dlab(3);        %%改变颜色
        
        rxyz=lab2xyz(rlab,'user',xyzw);
        rimg=img;
        %rgb(idx(:)==0,:)=newlut3d_xyz2rgb(rxyz(idx(:)==0,:));
        % rgb=lut3d_xyz2rgb(rxyz,height,weight);
        rgb=xyz2srgb(rxyz./xyzw(2).*100);
        rimg(idx(:)==0,:)=rgb(idx(:)==0,:);
        rimg=uint8(reshape(rimg,[size(idx),3]));
        imwrite(rimg,fullfile(save_folder,strcat(ori_name,num2str(i),'.png')));
    end
end
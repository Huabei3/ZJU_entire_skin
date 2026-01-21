
clc;clear;close all;
addpath("utils");
%%
group_labels = {'BK_F','BK_M','BR_F','BR_M','YY_F','YY_M',...
    'GU_F','GU_M','YO_F','YO_M'};
% group_labels = {'BK_M','YY_F'};
save_folder="rendered\srgb";
if ~exist(save_folder,"dir")
    mkdir(save_folder);
end
row_idx=1;
for i_ori=1:length(group_labels)
    ori_name=group_labels{i_ori};
    
    ori_pic=fullfile(strcat(ori_name,'.png'));    
    [~,~,idx1]=imread(ori_pic);
    idx1(idx1>0)=1;
    pic_mask=strcat(ori_name,'_MASK.png');
    [~,~,idx2]=imread(pic_mask);
    idx2(idx2>0)=1;
    idx=idx1-idx2;         
    %%??index
    pic_skin=strcat(ori_name,'_Skin.png');
    [~,~,idx3]=imread(pic_skin);
    idx3(idx3>0)=1;
    idx0=idx1-idx3;

    if ~exist(ori_pic,"file")||~exist(pic_mask,"file")||~exist(pic_skin,"file")
        continue
    end    
    
    img=double(imread(strcat(ori_name,'.png')));
    height=size(img,1);
    weight=size(img,2);
    img_ori=img;
    img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
    
    w=[255,255,255]; 
    xyzw = lut3d_rgb2xyz(w);
    xyz=lut3d_rgb2xyz(img);
    lab=xyz2lab(xyz,'user',xyzw);
    averageLab = lab;
    A=double(idx0(:)==0);
    averageLab(all(A==0,2),:)=[];

    % figure(1);
    % sz=size(img_ori);
    % bull=zeros([sz(1)*sz(2),sz(3)]);
    % bull(idx(:)==0,:)=1;
    % bull=reshape(bull,[sz(1),sz(2),sz(3)]);
    % imshow(bull);


    mlab=mean(averageLab);
    clear("TargetLab");
    if ismember(ori_name,['BK_F','BK_M'])
        load("TargetLab_African.mat",  "TargetLab"); 
    elseif ismember(ori_name,['BR_F','BR_M'])
        load("TargetLab_SouthAsian.mat",  "TargetLab"); 
    elseif ismember(ori_name,['GU_F','GU_M'])
        load("TargetLab_Caucasian.mat",  "TargetLab"); 
    elseif ismember(ori_name,['CY_F','CY_M','YO_F','YO_M','YY_F','YY_M'])
        load("TargetLab_Chinese.mat",  "TargetLab"); 
    end

    
    for i=1:49
        
        rlab=lab;
        tlab=TargetLab(i,:);
        dlab=tlab-mlab;     
        %%目标值与平均值的差异
        % lab_face=rlab(idx(:)==0,:);
        % lab_ave_face=mean(lab_face);
        % 
        % lab_face1=rlab(~all(A==0,2),:);
        % lab_ave_face1=mean(lab_face1);
        % 
        % deltaE2000(lab_ave_face,mlab)
        % deltaE2000(lab_ave_face,lab_ave_face1)

        % figure(2);
        % sz=size(img_ori);
        % bull=zeros([sz(1)*sz(2),sz(3)]);
        % bull(idx(:)==0,:)=1;
        % bull=reshape(bull,[sz(1),sz(2),sz(3)]);
        % imshow(bull);
        
        rlab(idx(:)==0,1)=rlab(idx(:)==0,1)+dlab(1);
        rlab(idx(:)==0,2)=rlab(idx(:)==0,2)+dlab(2);
        rlab(idx(:)==0,3)=rlab(idx(:)==0,3)+dlab(3);  

        % lab_face=rlab(idx(:)==0,:);
        % lab_ave_face=mean(lab_face);
        % % idx1=find(idx~=0);%%改变颜色
        % deltaE2000(lab_ave_face,tlab)
        % lab_face1=rlab(~all(A==0,2),:);
        % lab_ave_face1=mean(lab_face1);
        % deltaE2000(lab_ave_face1,tlab)
        




        rxyz=lab2xyz(rlab,'user',xyzw);
        rimg=img;
        %rgb(idx(:)==0,:)=newlut3d_xyz2rgb(rxyz(idx(:)==0,:));
        % rgb=lut3d_xyz2rgb(rxyz,height,weight);
        rgb=xyz2srgb(rxyz./xyzw(2).*100);
        rimg(idx(:)==0,:)=rgb(idx(:)==0,:);
        rimg=uint8(reshape(rimg,[size(idx),3]));
        imwrite(rimg,fullfile(save_folder,strcat(ori_name,num2str(i),'.png')));

        [dE,rlab,tlab]   = cal_dE_with_target (ori_name,i,save_folder,xyzw);
        dE

        deltaE_cell0{row_idx,1}=strcat(ori_name,num2str(i),".png");
        deltaE_cell0{row_idx,2}=dE;
        deltaE_cell0{row_idx,3}=rlab(1);
        deltaE_cell0{row_idx,4}=rlab(2);
        deltaE_cell0{row_idx,5}=rlab(3);
        deltaE_cell0{row_idx,6}=tlab(1);
        deltaE_cell0{row_idx,7}=tlab(2);
        deltaE_cell0{row_idx,8}=tlab(3);
        row_idx=row_idx+1;
    end
end


%% ???????

save_folder="rendered\srgb";
if ~exist(save_folder,"dir")
    mkdir(save_folder);
end
group_labels = {'BK_F','BK_M','BR_F','BR_M','CY_F','CY_M',...
    'GU_F','GU_M','YO_F','YO_M','YY_F','YY_M'};
% group_labels = {'BK_M','YY_F'};
w=[255,255,255];
xyzw = lut3d_rgb2xyz(w);
deltaE_cell = cell(length(group_labels)*49,8);
row_idx = 1;

for i_ori=1:length(group_labels)
    ori_name=group_labels{i_ori};
    clear("TargetLab");
    if ismember(ori_name,['BK_F','BK_M'])
        load("TargetLab_African.mat",  "TargetLab"); 
    elseif ismember(ori_name,['BR_F','BR_M'])
        load("TargetLab_SouthAsian.mat",  "TargetLab"); 
    elseif ismember(ori_name,['GU_F','GU_M'])
        load("TargetLab_Caucasian.mat",  "TargetLab"); 
    elseif ismember(ori_name,['CY_F','CY_M','YO_F','YO_M','YY_F','YY_M'])
        load("TargetLab_Chinese.mat",  "TargetLab"); 
    end
    

    for i=1:49
        file_img=fullfile(save_folder,strcat(ori_name,num2str(i),".png"));
        if ~exist(file_img,"file")
            continue
        end
        img=imread(file_img);
        % [ ~,~,temp ] = skin_det( double(img) );
        % skin_mask=temp>0;
        % skin_mask=skin_mask(:);

        ori_pic=fullfile(strcat(ori_name,'.png'));    
        [~,~,idx1]=imread(ori_pic);
        idx1(idx1>0)=1;
        pic_mask=strcat(ori_name,'_MASK.png');
        [~,~,idx2]=imread(pic_mask);
        idx2(idx2>0)=1;
        idx=idx1-idx2;         
        %%??index
        pic_skin=strcat(ori_name,'_Skin.png');
        [~,~,idx3]=imread(pic_skin);
        idx3(idx3>0)=1;
        idx0=idx1-idx3;
    
        if ~exist(ori_pic,"file")||~exist(pic_mask,"file")||~exist(pic_skin,"file")
            continue
        end    
        A=double(idx0(:)==0);


        rrgb=im2double(img);
        sz=size(img);
        rrgb_lin=reshape(rrgb,[sz(1)*sz(2),sz(3)]);

        rxyz=srgb2xyz(rrgb_lin.*255);
        if max(max(max(rxyz)))<=1
            rxyz=rxyz.*100;
        end

        rxyz=rxyz./100.*xyzw(2);
        rlab_all=xyz2lab(rxyz,'user',xyzw);

        % rlab=mean(rlab_all(skin_mask,:),1);
        rlab=mean(rlab_all(~all(A==0,2),:));

        tlab=TargetLab(i,:);
        dE=deltaE2000(rlab,tlab);
        dE
        deltaE_cell{row_idx,1}=strcat(ori_name,num2str(i),".png");
        deltaE_cell{row_idx,2}=dE;
        deltaE_cell{row_idx,3}=rlab(1);
        deltaE_cell{row_idx,4}=rlab(2);
        deltaE_cell{row_idx,5}=rlab(3);
        deltaE_cell{row_idx,6}=tlab(1);
        deltaE_cell{row_idx,7}=tlab(2);
        deltaE_cell{row_idx,8}=tlab(3);
        row_idx=row_idx+1;
    end
end

deltaE_cell=deltaE_cell(1:row_idx-1,:);

save(fullfile(save_folder,"check_lab.mat"),"deltaE_cell");

big1=find(cell2mat(deltaE_cell(:,2))>1);
big2=find(cell2mat(deltaE_cell(:,2))>2);
deltaE_cell1=deltaE_cell(big1,:);
deltaE_cell2=deltaE_cell(big2,:);
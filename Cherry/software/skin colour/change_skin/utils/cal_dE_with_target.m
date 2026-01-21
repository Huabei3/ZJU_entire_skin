function [dE,rlab,tlab]   = cal_dE_with_target (ori_name,i,save_folder,xyzw)
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

        file_img=fullfile(save_folder,strcat(ori_name,num2str(i),".png"));
        if ~exist(file_img,"file")
            return
        end
        img=imread(file_img);
        % [ ~,~,temp ] = skin_det( double(img) );
        % skin_mask=temp>0;
        % skin_mask=skin_mask(:);


        [~,~,idx1]=imread(strcat(ori_name,'.png'));
        idx1(idx1>0)=1;
        [~,~,idx2]=imread(strcat(ori_name,'_MASK.png'));
        idx2(idx2>0)=1;
        idx=idx1-idx2;                             
        [~,~,idx3]=imread(strcat(ori_name,'_Skin.png'));
        idx3(idx3>0)=1;
        idx0=idx1-idx3;
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
        
end
clc;clear;
load RGB.mat
load XYZ.mat
% display characterization model
R=1;G=R;B=R; %input data for the forward model
Option_mode=1;% 1 for GOG model and 2 for 1-D LUT model
% load r; load g; load b; load grey; %load the corresponding XYZ values
r=XYZ(1:18,:);g=XYZ(19:36,:);b=XYZ(37:54,:);grey=XYZ(55:72,:);
black=mean([r(1,:);g(1,:);b(1,:)]);%to find the ideal XYZ value for individual r,g,b channels
r=bsxfun(@minus, r, r(1,:));
g=bsxfun(@minus, g, g(1,:));
b=bsxfun(@minus, b, b(1,:));
% grey=bsxfun(@minus, grey, grey(1,:));
max_RGB=[r(end,:);g(end,:);b(end,:)]';
LR=r(:,1)/r(end,1);
LG=g(:,2)/g(end,2);
LB=b(:,3)/b(end,3);
        
switch Option_mode
    case 1  %GOG model
        xdata=[0:15:255]/255;
        coef_r=real(lsqcurvefit(@gog,[1 1 1],xdata',LR,-Inf,Inf));% coef_r=real(coef_r); %coef:kg,ko,gamma 
        coef_g=real(lsqcurvefit(@gog,[1 1 1],xdata',LG,-Inf,Inf));% coef_g=real(coef_g);%coef:kg,ko,gamma
        coef_b=real(lsqcurvefit(@gog,[1 1 1],xdata',LB,-Inf,Inf));% coef_b=real(coef_b);%coef:kg,ko,gamma
        Lr=real(gog(coef_r,xdata));Lr(Lr<0)=0;
        Lg=real(gog(coef_g,xdata));Lg(Lg<0)=0;
        Lb=real(gog(coef_b,xdata));Lb(Lb<0)=0;
        XYZ=bsxfun(@plus,max_RGB*[Lr;Lg;Lb],black');
        XYZ=XYZ';
%         load grey;
        lab1=xyz2lab(grey,'user',grey(end,:));
        lab2=xyz2lab(XYZ,'user',grey(end,:));
        result=cielabde(lab1,lab2);
        disp('Color difference for 18 grey channels:')
        mean(result)
        savefile='gog_pars.mat';
        save(savefile,'black','coef_r','coef_g','coef_b','max_RGB');

%XYZ2RGB:
        load('gog_pars.mat');
        XYZ_R=bsxfun(@minus,grey',black'); 
        L_RGB=inv(max_RGB)*XYZ_R;%scaled lightness for each channel
        rdata=gog_r(coef_r,L_RGB(1,:));%Scaled R data
        gdata=gog_r(coef_g,L_RGB(2,:));
        bdata=gog_r(coef_b,L_RGB(3,:));
        
%RGB2XYZ:
        load('gog_pars.mat');
        Lr=gog(coef_r,rdata);Lr(Lr<0)=0;
        Lg=gog(coef_g,gdata);Lg(Lg<0)=0;
        Lb=gog(coef_b,bdata);Lb(Lb<0)=0;
        XYZ=bsxfun(@plus,max_RGB*[Lr;Lg;Lb],black');
        
        XYZ=XYZ';
%        load grey;
        lab1=xyz2lab(grey,'user',grey(end,:));
        lab2=xyz2lab(XYZ,'user',grey(end,:));
        result=cielabde(lab1,lab2);
        disp('Color difference of quantum error:')
        mean(result)
        
        
        clear;
        load RGB.mat
        load XYZ.mat
        RGB_24=RGB(72:96,:);
        XYZ_24=display_f(RGB_24);
        XYZ_24_M=XYZ(72:96,:);
        lab1=xyz2lab(XYZ_24,'user',XYZ(72,:));
        lab2=xyz2lab(XYZ_24_M,'user',XYZ(72,:));
        result=cielabde(lab1,lab2);
        disp('Color difference for 24 color patches:')
        mean(result)
        
end
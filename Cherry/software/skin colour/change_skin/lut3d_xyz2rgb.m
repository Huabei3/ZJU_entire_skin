function RGB = lut3d_xyz2rgb(XYZ,height,weight)

load('xyzdatai_51.mat')

% LOGXYZ=log(XYZ);
% 
% logxyzw=log(XYZw);
% [a,b,c]=meshgrid(linspace(0,255,cubeL));
% logx=a./255.*logxyzw(1,1);
% logy=b./255.*logxyzw(1,2);
% logz=c./255.*logxyzw(1,3);
% logxyz=[logx(:),logy(:),logz(:)];
% lutR=reshape(rgblut(:,1),cubeL,cubeL,cubeL);
% lutG=reshape(rgblut(:,2),cubeL,cubeL,cubeL);
% lutB=reshape(rgblut(:,3),cubeL,cubeL,cubeL);
% rout=interp3(logx,logy,logz,lutR,LOGXYZ(:,1),LOGXYZ(:,2),LOGXYZ(:,3),method);
% gout=interp3(logx,logy,logz,lutG,LOGXYZ(:,1),LOGXYZ(:,2),LOGXYZ(:,3),method);
% bout=interp3(logx,logy,logz,lutB,LOGXYZ(:,1),LOGXYZ(:,2),LOGXYZ(:,3),method);

%%xyz方法
[x,y,z]=meshgrid(linspace(0,255,cubeL));
x=x./255.*XYZw(1,1);
y=y./255.*XYZw(1,2);
z=z./255.*XYZw(1,3);
xyz=[x(:),y(:),z(:)];

%%%lab方法
% LAB=xyz2lab(XYZ,'user',XYZw);
% [l,a,b]=meshgrid(linspace(0,255,cubeL));
% l=l./255.*maxlab(1,1);
% a=a./255.*maxlab(1,2);
% b=b./255.*maxlab(1,3);
% lab=[l(:),a(:),b(:)];

lutR=reshape(rgblut(:,1),cubeL,cubeL,cubeL);
lutG=reshape(rgblut(:,2),cubeL,cubeL,cubeL);
lutB=reshape(rgblut(:,3),cubeL,cubeL,cubeL);

rout=interp3(x,y,z,lutR,XYZ(:,1),XYZ(:,2),XYZ(:,3),method);
gout=interp3(x,y,z,lutG,XYZ(:,1),XYZ(:,2),XYZ(:,3),method);
bout=interp3(x,y,z,lutB,XYZ(:,1),XYZ(:,2),XYZ(:,3),method);

RGB=[rout gout bout];
[r,c,v]=find(RGB<=0|isnan(RGB)|isinf(RGB)|RGB>=255);
for i=1:length(r)
    a=mod(r(i),height);
    b=fix(r(i)/height);
    if a==0
        a=height;
        b=b-1;
    end
    rgb= ones(8,3);
    rgb(1,:)=RGB((b-1)*height+a-1,:);
    rgb(2,:)=RGB((b-1)*height+a,:);
    rgb(3,:)=RGB((b-1)*height+a+1,:);
    rgb(4,:)=RGB(b*height+a-1,:);
    rgb(5,:)=RGB(b*height+a+1,:);
    rgb(6,:)=RGB((b+1)*height+a-1,:);
    rgb(7,:)=RGB((b+1)*height+a,:);
    rgb(8,:)=RGB((b+1)*height+a+1,:);
    rgb(any(isnan(rgb)'),:) = [];
    RGB(r(i),:)=mean(rgb);
end
end

clear all;
% RGBdata is self shot 24 color board
load('Camera_model_0912.mat');
for j=1:4
for i=1:24
    
    x=xyz(i,1+j*3-3);
    y=xyz(i,2+j*3-3);
    z=xyz(i,3+j*3-3);
    
    r=rgb(i,1+j*3-3);
    g=rgb(i,2+j*3-3);
    b=rgb(i,3+j*3-3);
    
%     r=liR(i);
%     g=liG(i);
%     b=liB(i);
    
    h=[x,y,z];
    
    H(i,:)=h;
%     % =======3*11===========
     V=[r,g,b,r*g,r*b,g*b,r^2,g^2,b^2,r*g*b,1];
%     % =======3*9===========
%     V=[r,g,b,r*g,r*b,g*b,r^2,g^2,b^2];
%     % =======3*8===========
%     V=[r,g,b,r*g,r*b,g*b,r*g*b,1];
%     % =======3*7===========
%     V=[r,g,b,r*g,r*b,g*b,r*g*b];
%     % =======3*6===========
%     V=[r,g,b,r*g,r*b,g*b];
%     % =======3*3===========
%     V=[r,g,b];
    
    U(i,:)=V;
    

% M=inv(U'*U)*U'*H;
U1=U';
M=lsqcurvefit(@myfunction,zeros(1,3),U1,H(:,1)');
M2(1,:)=M;
M=lsqcurvefit(@myfunction,zeros(1,3),U1,H(:,2)');
M2(2,:)=M;
M=lsqcurvefit(@myfunction,zeros(1,3),U1,H(:,3)');
M2(3,:)=M;
XYZ(i,:)=V*M2';
end
lab1=xyz2lab(xyz(:,j*3-2:j*3),'user',xyz(24,j*3-2:j*3));
lab2=xyz2lab(XYZ,'user',xyz(24,j*3-2:j*3));
Dab(:,j)=cielabde(lab1,lab2);
D00(:,j)=deltaE2000(lab1,lab2);
end
dd(1:4)=mean(D00);dd(5:8)=mean(Dab);
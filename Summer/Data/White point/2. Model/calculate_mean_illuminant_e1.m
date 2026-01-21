 clear all
 cct=['3000';'4000';'5000';'6000';'7000';'dark';];
 p=['1','2','3','4'];
load('D:\coding\code\Xw_upvp_96.mat')
for j=1:4
load(strcat('D:\coding\code\p',p(j)));
weigh(j*24-23:j*24,:)=Xsum+2;
Xw_upvp_96((j*24-23):j*24,:)=Xw_upvp_24;
end
for i=1:6
a(:,1)=Xw_upvp_96(:,1).*weigh(:,i);
a(:,2)=Xw_upvp_96(:,2).*weigh(:,i);
a(:,3)=Xw_upvp_96(:,3).*weigh(:,i);
mean_Xw=sum(a(:,1:3))/sum(weigh(:,i));
mean_upvp=xyz2uvY(mean_Xw);
 [CCT,Duv]=CCTa(mean_Xw);
mean_Xw=[102.4343,100,98.8751];
mean_upvp=[0.2158,0.4739,100];
mean_lab=[100,12.6319,6.3256];
 Xw_upvp_96(:,7)=sqrt((Xw_upvp_96(:,4)-mean_upvp(:,1)).^2+(Xw_upvp_96(:,5)-mean_upvp(:,2)).^2);
 MCDMuv=mean(Xw_upvp_96(:,7));
 Xw_lab_96=xyz2lab(Xw_upvp_96(:,1:3),'d65_31');
 Xw_lab_96(:,4)=sqrt((Xw_lab_96(:,1)-100).^2+(Xw_lab_96(:,2)-12.6319).^2+(Xw_lab_96(:,3)-6.3256).^2);
 MCDMlab=mean(Xw_lab_96(:,4));
 b(1,j)=MCDMuv;
 b(2,j)=MCDMlab;
 c(:,j)= Xw_upvp_96(:,7);
 end
% end
%  sum_I1(16*i-15:16*i,1)=sum1(81:96,2);
%  
% load('Xw_upvp_80.mat')
% for i=1:80
%     a(i,1)=Xw_upvp_80(i,1)*sum_I1(i,1);
%     a(i,2)=Xw_upvp_80(i,2)*sum_I1(i,1);
%     a(i,3)=Xw_upvp_80(i,3)*sum_I1(i,1);
% end
% mean_Xw=sum(a(:,1:3))/sum(sum_I1(:,1));
% mean_upvp=xyz2uvY(mean_Xw);
% [CCT,Duv]=CCTa(mean_Xw);
% Xw_upvp_80(:,7)=sqrt((Xw_upvp_80(:,4)-mean_upvp(:,1)).^2+(Xw_upvp_80(:,5)-mean_upvp(:,2)).^2);
% MCDM=mean(Xw_upvp_80(:,7));

% observor=['1','2','3','4','5','6','7','8','9','10','11'];
%  Xsum=zeros(24,6);
% for i=1:9
%     load(strcat('F:\PhD\Graduation Project\Experiment\Zscore\',observor(i),'_p_4'));
%     Xsum=Xsum+X;
% end
%   load('F:\PhD\Graduation Project\Experiment\Zscore\10_p_4');
%     Xsum=Xsum+X;
%   load('F:\PhD\Graduation Project\Experiment\Zscore\11_p_4');
%     Xsum=Xsum+X;
% Xsum=Xsum/11;
% save p4 Xsum;
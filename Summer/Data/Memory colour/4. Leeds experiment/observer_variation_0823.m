% =======================喜好率重复率计算====================================
% clear all
% load('data_raw_0905.mat');
% n1=[2,10,15,19];n2=[25,26,27,28];
% for i=1:4 
%     nn1(i*49-48:i*49,:)=datan(n1(i).*49-48:n1(i).*49,:);
%     nn2(i*49-48:i*49,:)=datan(n2(i).*49-48:n2(i).*49,:);
%     np1(i*49-48:i*49,:)=datap(n1(i).*49-48:n1(i).*49,:);
%     np2(i*49-48:i*49,:)=datap(n2(i).*49-48:n2(i).*49,:);
% end
% nn1==nn2;nn=mean(double(ans))';
% np1==np2;np=mean(double(ans))';
% cn=mean(datan)';cp=mean(datap)';
% cc=[nn,np,cn,cp];
% % ============================MCDM计算=====================================
clear all 
load('data_raw_0905.mat');
load('data_28_compare_0905.mat')
n1=[2,10,15,19];n2=[25,26,27,28];
% 
% load('Leeds_AF_0905.mat');
% for i=1:11
%     for j=1:28
% ctp(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datap(49*j-48:49*j,i))./sum(datap(49.*j-48:49.*j,i));
% ctn(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datan(49*j-48:49*j,i))./sum(datan(49.*j-48:49.*j,i));
%     end
%     de(i,1)=mean(cielabde(ctn(:,3*i-2:3*i),b5));
%     de(i,3)=mean(cielabde(ctp(:,3*i-2:3*i),a5));
%     for k=1:4
%         den(i,k)=cielabde(ctn(n1(k),3*i-2:3*i),ctn(n2(k),3*i-2:3*i));
%         dep(i,k)=cielabde(ctp(n1(k),3*i-2:3*i),ctp(n2(k),3*i-2:3*i));
%     end
%     de(i,2)=mean(den(i,:)')';
%     de(i,4)=mean(dep(i,:)')';
% end

% load('Leeds_CH_0905.mat');
% for i=1:21
%     for j=1:28
% ctp(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datap(49*j-48:49*j,i+11))./sum(datap(49.*j-48:49.*j,i+11));
% ctn(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datan(49*j-48:49*j,i+11))./sum(datan(49.*j-48:49.*j,i+11));
%     end
%     de(i,1)=mean(cielabde(ctn(1:24,3*i-2:3*i),b1));
%     de(i,3)=mean(cielabde(ctp(1:24,3*i-2:3*i),a1));
%     for k=1:4
%         den(i,k)=cielabde(ctn(n1(k),3*i-2:3*i),ctn(n2(k),3*i-2:3*i));
%         dep(i,k)=cielabde(ctp(n1(k),3*i-2:3*i),ctp(n2(k),3*i-2:3*i));
%     end
%     de(i,2)=mean(den(i,:)')';
%     de(i,4)=mean(dep(i,:)')';
% end

load('Leeds_UK_0905.mat');
for i=1:21
    for j=1:28
ctp(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datap(49*j-48:49*j,i+32))./sum(datap(49.*j-48:49.*j,i+32));
ctn(j,3*i-2:3*i)=sum(b(:,j*3-2:j*3).*datan(49*j-48:49*j,i+32))./sum(datan(49.*j-48:49.*j,i+32));
    end
    de(i,1)=mean(cielabde(ctn(1:24,3*i-2:3*i),b3));
    de(i,3)=mean(cielabde(ctp(1:24,3*i-2:3*i),a3));
    for k=1:4
        den(i,k)=cielabde(ctn(n1(k),3*i-2:3*i),ctn(n2(k),3*i-2:3*i));
        dep(i,k)=cielabde(ctp(n1(k),3*i-2:3*i),ctp(n2(k),3*i-2:3*i));
    end
    de(i,2)=mean(den(i,:)')';
    de(i,4)=mean(dep(i,:)')';
end
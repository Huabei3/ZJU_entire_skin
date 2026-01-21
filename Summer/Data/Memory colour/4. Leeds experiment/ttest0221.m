load('ttest0221.mat')
for ii=1:5
a=reshape(n(:,ii),24,6);
b=reshape(p(:,ii),24,6);
    for k=1:6
T(k,ii)=ttest(a(:,k),b(:,k),0.05);
    end
end


% for ii=1:5
% a=reshape(n(:,ii),24,6);
% H=zeros(6,6);P=zeros(6,6);
% for i=1:5
%     j=i+1;
%     for k=j:6
% [H(i,k),P(i,k),ci]=ttest(a(:,i),a(:,k),0.05);
% 
% % [H(k,i),P(k,i),ci]=ttest(a(:,i),a(:,k),0.05);
%     end
% end
% T(:,ii*7-6:ii*7-1)=[H;P];
% end
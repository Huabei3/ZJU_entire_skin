load ellipsoidmodel;
load skylab;
load naturalness1;
p = par(1,:);
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;skylab((i-1)*49+1:(i-1)*49+16,:)];
    tempn = [tempn;naturalness1((i-1)*49+1:(i-1)*49+16,:)];
end
% de = p(1)*sqrt((templab(:,1)-p(5)).^2+p(2).*(templab(:,2)-p(6)).^2+p(3).*(templab(:,3)-p(7)).^2+p(4).*(templab(:,2)-p(6)).*(templab(:,3)-p(7)));
% scatter(de,tempn);
hold on
x = 0.2:0.1:7;
% plot(x,(1./(1+exp(x-p(8)))));

for i = 0.1:0.1:1
    idx = (tempn>=i-0.1 & tempn<=i);
    scatter(templab(idx,2),templab(idx,3),'MarkerFaceColor',[1-i 1-i 1-i],'MarkerEdgeColor',[1-i 1-i 1-i]);
    hold on
    f = @(a,b) (1./(1+exp(p(1)*sqrt(p(2)*(a-p(6))^2+p(3)*(b-p(7))^2+p(4)*(a-p(6))*(b-p(7)))-p(8)))-i);
%     ezplot('(1./(1+exp(',num2str(p(1)),'*sqrt(',num2str(p(2)),'*(x-',num2str(p(6)),')^2+',num2str(p(3)),'*(y-',num2str(p(7)),')^2+',num2str(p(4)),'*(x-',num2str(p(6)),')*(y-',num2str(p(7)),'))-',num2str(p(8)),')))=',num2str(i));
    fimplicit(f,'Color',[1-i 1-i 1-i]);

end
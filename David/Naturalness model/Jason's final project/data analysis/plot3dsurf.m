load ellipsoidmodel;
load skylab;
p = par(1,:);
f = @(a,b) (1./(1+exp(p(1)*sqrt(p(2)*(a-p(6))^2+p(3)*(b-p(7))^2+p(4)*(a-p(6))*(b-p(7)))-p(8))));

fsurf(f,[-20,40,-60,0])
hold on
for i = 1:10
    scatter3(skylab((i-1)*49+1:(i-1)*49+16,2),skylab((i-1)*49+1:(i-1)*49+16,3),naturalness1((i-1)*49+1:(i-1)*49+16,:));
end
% for i = 1:10
%     scatter(skylab((i-1)*10+1:(i-1)*10+16,3),naturalness1((i-1)*10+1:(i-1)*10+16,:));
% end

load naturalness;
load skylab;
load skinlab;
load grasslab;


for i = 1:10
    [par(i,:),r(i,:)] = ellipsoidfit4(skylab((i-1)*49+1:(i-1)*49+49,:),naturalness(0+(i-1)*49+1:0+(i-1)*49+49,:));
end
meanpar = mean(par);
k = 1:10;
m = MCDM(par(k,5:7));
%% 

for i = [1 2   5 6 7 ]
    
%     for j = 1:10
%         [R(i,j),D(i,j)] = ellipse_compare_20(par(i,:),par(j,:));
%     end
    
%     f = [num2str(par(i,1)),'*sqrt((x-',num2str(par(i,5)),')^2+',num2str(par(i,2)),'*(y-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(x-',num2str(par(i,5)),')*(y-',num2str(par(i,6)),'))=',num2str(par(i,4))];
    f = @(a,b) (1/(1+exp(par(i,1)*sqrt(par(i,2)*(a-par(i,6))^2+par(i,3)*(b-par(i,7))^2+par(i,4)*(a-par(i,6))*(b-par(i,7)))-par(i,8)))-0.5);
    h = fimplicit(f,'Color',display_r(lab2xyz(par(i,5:7),display_f([1 1 1]))));
    hold on
end
axis([-100,100,-100,100]);
% Rmean = mean(R);
% Dmean = mean(D);


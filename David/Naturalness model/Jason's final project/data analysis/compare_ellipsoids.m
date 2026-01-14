load naturalness1;
load skylab;
load skinlab;
load grasslab;

par = zeros(10,8);
r = zeros(10,1);
for i = 1:10
    [par(i,:),r(i,:)] = ellipsoidfit4(grasslab((i-1)*49+1:(i-1)*49+49,:),naturalness1(490+(i-1)*49+1:490+(i-1)*49+49,:));
end
shape = calculate_ellipse_shape(par);

h = ABtheta_plot_ellipse([shape(:,2:3),shape(:,1),par(:,6:7)],1,'r');
axis([-100,100,-100,100]);





% de = zeros(10,10);
% for i = 1:10
%     for j = 1:10
%         de(i,j) = cielabde(par(i,5:7),par(j,5:7));
%     end
% %     f = [num2str(par(i,1)),'*sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
%     
%     h = ABtheta_plot_ellipse([shape(i,2:3),shape(i,1),par(i,6:7))])
%     hold on
% end

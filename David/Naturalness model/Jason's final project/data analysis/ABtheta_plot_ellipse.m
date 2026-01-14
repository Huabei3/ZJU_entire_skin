function h = ABtheta_plot_ellipse(ABtheta,size_time,lab)
if nargin<3
    size_time=1;
end
for i=1:size(ABtheta,1)
    a=size_time*ABtheta(i,1);
    b=size_time*ABtheta(i,2);
    theta=ABtheta(i,3);
    x0 = ABtheta(i,4);
    y0 = ABtheta(i,5);
    angle=(0:3.6:360)-theta;
    x=x0+a*cosd(angle)*cosd(theta)-b*sind(angle)*sind(theta);
    y=y0+a*cosd(angle)*sind(theta)+b*sind(angle)*cosd(theta);
%     h(i)=plot(x,y,'.','color',rgb,'MarkerSize',3);
%     h(i)=plot(x,y,'color',rgb,'MarkerSize',3);
    rgb = display_r(lab2xyz(lab(i,:),display_f([1 1 1])));
    h(i)=plot(x,y,'color',rgb,'MarkerSize',3);
    hold on; 

end
end
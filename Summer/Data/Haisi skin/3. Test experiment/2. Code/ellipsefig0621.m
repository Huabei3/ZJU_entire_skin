function [h,V,aa,bb,cc] = ellipsefig0621(xc,P,r,tag,i)
% 画一般椭圆或椭球：(x-xc)'*P*(x-xc) = r
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
   
line1=["-","-","-","-","-",":",":",":","-"];

[V, D] = eig(P); 
 tag == 1
     aa = sqrt(r/D(1));
     bb = sqrt(r/D(4));

     t = linspace(0, 2*pi, 60);
     xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
     h = plot(xy(1,:)+xc(1),xy(2,:)+xc(2),line1(i),'Color',color(i,:),'linewidth', 1);
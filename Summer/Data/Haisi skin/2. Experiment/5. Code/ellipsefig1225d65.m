function [h,V,aa,bb,cc] = ellipsefig1225d65(xc,P,r,tag,i,j)
% 画一般椭圆或椭球：(x-xc)'*P*(x-xc) = r
color=[200,0,0;0,200,0;200,200,0;0,0,200;200,200,0;200,0,0;0,200,0;0,0,200;0,0,0];
     line1=["--","--","--","--","-","-","-","-","-","-"];
[V, D] = eig(P); 
 tag == 1
     aa = sqrt(r/D(1))*0.35;
     bb = sqrt(r/D(4))*8;
     t = linspace(0, 2*pi, 60);
     xy = V*[aa*cos(t);bb*sin(t)];   % 坐标旋转
     h = plot(xy(1,:)+xc(1),xy(2,:)+xc(2),line1(i-11+j*11), 'Color',color(i-11+j*11,:)./255,'linewidth', 1);
end
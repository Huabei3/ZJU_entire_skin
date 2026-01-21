imgname = 'Sheep';
img = imread(['C:\Users\SweetHome\Desktop\我的坚果云\Gong''s model\choi''s_data\imgs\',imgname,'\','CIS','.tif']);
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = importdata(['C:\Users\SweetHome\Desktop\我的坚果云\Gong''s model\choi''s_data\data\',imgname,'\','Ori','XYZ.mat']);
lab0 = xyz2lab(xyz0 , [96.61,100,140.22]*174/100);
scatter(lab0(: , 2) , lab0(: , 3) , 20 , img0);
hold on
 
% skin
% r = 30;
% x0 = 10.86  ;
% y0 = 14.00;
% 
% aplha = 0 : pi / 40 : 2 * pi;
% x = r * cos(aplha) + x0;
% y = r * sin(aplha) + y0;
% plot(x , y , '-');
% axis equal

% r = 30;
% x0 = 11.96;
% y0 = 28.11;
% 
% aplha = 0 : pi / 40 : 2 * pi;
% x = r * cos(aplha) + x0;
% y = r * sin(aplha) + y0;
% plot(x , y , '-');
% axis equal
% 
% r = 30;
% x0 = 12.70;
% y0 = 18.98;
% 
% aplha = 0 : pi / 40 : 2 * pi;
% x = r * cos(aplha) + x0;
% y = r * sin(aplha) + y0;
% plot(x , y , '-');
% axis equal


% sky
% r = 15;
% x0 = -7.74  ;
% y0 = -25.5;
% 
% aplha = 0 : pi / 40 : 2 * pi;
% x = r * cos(aplha) + x0;
% y = r * sin(aplha) + y0;
% plot(x , y , '-');
% axis equal


% grass
r = 45;
x0 = -42  ;
y0 = 33;

aplha = 0 : pi / 40 : 2 * pi;
x = r * cos(aplha) + x0;
y = r * sin(aplha) + y0;
plot(x , y , '-');
axis equal
function draw_arrow(start_point, end_point)
% 从start_point到end_point画一箭头  
K = 0.05; %箭头比例系数  
theta = pi / 8; %箭头角度  
A1 = [cos(theta), -sin(theta);  sin(theta), cos(theta)]; %旋转矩阵  
theta = -theta;  
A2 = [cos(theta), -sin(theta);  sin(theta), cos(theta)]; %旋转矩阵  
arrow = start_point' - end_point';  arrow_1 = A1 * arrow; %旋转  
arrow_2 = A2 * arrow;  arrow_1 = K * arrow_1 + end_point'; %缩放加平移  
arrow_2 = K * arrow_2 + end_point';  
hold on;  
grid on;  
axis equal;  
plot([start_point(1), end_point(1)], [start_point(2), end_point(2)], 'k');  
plot([arrow_1(1), end_point(1)], [arrow_1(2), end_point(2)], 'k');  
plot([arrow_2(1), end_point(1)], [arrow_2(2), end_point(2)], 'k');
hold off
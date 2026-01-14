load naturalness1;
load skylab;
load skinlab;
load grasslab;

% for i = 1:10
%     temp = o_naturalness_autunmgrass((i-1)*50+1:(i-1)*50+50,:);
%     naturalness = [naturalness; temp(1:49,:)];
% end



% par = zeros(10,8);
% r = zeros(10,1);
% for i = 1:10
%     [par(i,:),r(i,:)] = ellipsoidfit4(skinlab((i-1)*49+1:(i-1)*49+49,:),naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:));
% end



templab = [];
tempn = [];
% spring grass
% for i = [2 3 4 6 8 9 10]
% skin
% for i = [2 3 4 5 6 8 9]
% sky
% for i = 1:10
% autumn grass
for i = 1:10
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(1470+(i-1)*49+1:1470+(i-1)*49+49,:)];
    
end

[par,r] = ellipsoidfit4(templab,tempn);
LCh = [par(:,5),sqrt(par(:,6).^2+par(:,7).^2),hue_angle_degree(par(:,6),par(:,7))] ;
shape = calculate_ellipse_shape(par);
save n_ag_3d par
% skycenter = par(:,5:7);
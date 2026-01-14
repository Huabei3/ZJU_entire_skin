load naturalness1;
load skylab;
load skinlab;
load grasslab;
% sky
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;skylab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1((i-1)*49+1:(i-1)*49+49,:)];
    
end
templch = [templab(:,1),sqrt(templab(:,2).^2+templab(:,3).^2),hue_angle(templab(:,2),templab(:,3))];
[par(1,:),r(1,:)] = ellipsoidfitlch(templch,tempn,[59.5,43.8,-80/360*2*pi]);
% LCh(1,:) = [par(1,1),sqrt(par(1,2).^2+par(1,3).^2),hue_angle_degree(par(1,2),par(1,3))] ;
% shape(1,:) = calculate_ellipse_shape(par(1,:));


% spring grass
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(490+(i-1)*49+1:490+(i-1)*49+49,:)];
    
end
templch = [templab(:,1),sqrt(templab(:,2).^2+templab(:,3).^2),hue_angle(templab(:,2),templab(:,3))];
[par(2,:),r(2,:)] = ellipsoidfitlch(templch,tempn,[39.8,56.2,123/360*2*pi]);
% LCh(2,:) = [par(2,1),sqrt(par(2,2).^2+par(2,3).^2),hue_angle_degree(par(2,2),par(2,3))] ;
% shape(2,:) = calculate_ellipse_shape(par(2,:));

% autumn grass
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(1470+(i-1)*49+1:1470+(i-1)*49+49,:)];
    
end
templch = [templab(:,1),sqrt(templab(:,2).^2+templab(:,3).^2),hue_angle(templab(:,2),templab(:,3))];
[par(3,:),r(3,:)] = ellipsoidfitlch(templch,tempn,[48.6,41.4,90.4/360*2*pi]);
% LCh(3,:) = [par(3,1),sqrt(par(3,2).^2+par(3,3).^2),hue_angle_degree(par(3,2),par(3,3))] ;
% shape(3,:) = calculate_ellipse_shape(par(3,:));


% asian skin
templab = [];
tempn = [];

for i = [1 5 7 9 10]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    
end
templch = [templab(:,1),sqrt(templab(:,2).^2+templab(:,3).^2),hue_angle(templab(:,2),templab(:,3))];
[par(4,:),r(4,:)] = ellipsoidfitlch(templch,tempn,[65.7,26.9,42.2/360*2*pi]);
% LCh(4,:) = [par(4,1),sqrt(par(4,2).^2+par(4,3).^2),hue_angle_degree(par(4,2),par(4,3))] ;
% shape(4,:) = calculate_ellipse_shape(par(4,:));

% caucasian skin
templab = [];
tempn = [];

for i = [2 3 4 6 8]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    
end
templch = [templab(:,1),sqrt(templab(:,2).^2+templab(:,3).^2),hue_angle(templab(:,2),templab(:,3))];
[par(5,:),r(5,:)] = ellipsoidfitlch(templch,tempn,[65.2,32,47.9/360*2*pi]);
% LCh(5,:) = [par(5,1),sqrt(par(5,2).^2+par(5,3).^2),hue_angle_degree(par(5,2),par(5,3))] ;
% shape(5,:) = calculate_ellipse_shape(par(5,:));





% ellipse_atr = [LCh,shape,r];

% save ellipsoidmodel par;
% save ellipse_atr ellipse_atr;
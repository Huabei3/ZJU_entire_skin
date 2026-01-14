load naturalness1;
load skylab;
load skinlab;
load grasslab;
addpath("utils\")
% A=load("skinlab");

output_folder=fullfile("res\separate_skin");
if ~exist(output_folder,"dir")
    mkdir(output_folder);
end
fitRes_folder=fullfile(output_folder,"fitRes");
if ~exist(fitRes_folder,"dir")
    mkdir(fitRes_folder);
end



% asian skin
templab = [];
tempn = [];
par_all=[];
ellipse_atr_all=[];
curr=1;
for i = [1 5 7 9 10]
    templab = skinlab((i-1)*49+1:(i-1)*49+49,:);
    tempn = naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:);

    [par_mean,r_mean]= calculate_weighted_or_simple_mean(tempn,templab);
    mean_cen=par_mean;
    [par,r,y] = my_ellipsoidfit_4(templab,tempn,colorcenter);
    % [par,r, y]=my_ellipsoidfit_fixed(templab, tempn,mean_cen);
    % [par,r] = my_ellipsoidfit_fdQst(templab,tempn,mean_cen);
    % [par,r] = ellipsoidfit4(templab,tempn,mean_cen);
    LCh = [par(1,5),sqrt(par(1,6).^2+par(1,7).^2),hue_angle_degree(par(1,6),par(1,7))] ;
    shape = calculate_ellipse_shape(par);
    ellipse_atr = [LCh,shape,r];


    par_all=[par_all;par];
    ellipse_atr_all=[ellipse_atr_all;ellipse_atr];
    labNscore{curr,1}=templab;
    labNscore{curr,2}=tempn;
    labNscore{curr,3}="asian skin";
    labNscore{curr,4}=sprintf("skin_%d",i);

    curr=curr+1;

    figure();hold on;
    pre_draw_folder = fullfile(output_folder, 'pre_draw');
    if ~exist(pre_draw_folder, 'dir')
        mkdir(pre_draw_folder);
    end
    plot_contour_with_scatter3D_fixedValue(par, templab,tempn, ...
        pre_draw_folder, sprintf("skin_%d",i), '4')
    % plot_contour_with_scatter3Ddavid(par, templab,tempn,...
    % pre_draw_folder,sprintf("skin_%d",i))
    title(sprintf("skin_%d",i));
    exportgraphics(gcf, fullfile(pre_draw_folder, ...
        strcat(sprintf("skin_%d",i), '.jpg')),"resolution",150);
    close(gcf);

    figure();hold on;
    surface_folder = fullfile(output_folder, 'surface');
    if ~exist(surface_folder, 'dir')
        mkdir(surface_folder);
    end
    plot_y_surface_and_scatter3D(par, templab, tempn, "fixed");
    title(sprintf("skin_%d",i));
    exportgraphics(gcf, fullfile(surface_folder, ...
    strcat(sprintf("skin_%d",i), '.jpg')),"resolution",150);
    close(gcf);
end
save(fullfile(fitRes_folder,"asian_skin.mat"),"par","ellipse_atr_all","labNscore");




% caucasian skin
templab = [];
tempn = [];
par_all=[];
ellipse_atr_all=[];
curr=1;
for i = [2 3 4 6 8]
    templab = skinlab((i-1)*49+1:(i-1)*49+49,:);
    tempn = naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:);
    [par,r] = ellipsoidfit4(templab,tempn,[65.21,21.43,23.75]);
    LCh = [par(1,5),sqrt(par(1,6).^2+par(1,7).^2),hue_angle_degree(par(1,6),par(1,7))] ;
    shape = calculate_ellipse_shape(par);
    ellipse_atr = [LCh,shape,r];



    par_all=[par_all;par];
    ellipse_atr_all=[ellipse_atr_all;ellipse_atr];
    labNscore{curr,1}=templab;
    labNscore{curr,2}=tempn;
    labNscore{curr,3}="caucasian skin";
    labNscore{curr,4}=sprintf("skin_%d",i);

    curr=curr+1;
end
save(fullfile(fitRes_folder,"caucasian_skin.mat"),"par","ellipse_atr_all","labNscore");










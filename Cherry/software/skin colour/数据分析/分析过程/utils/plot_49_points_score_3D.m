function plot_49_points_score_3D(lab_group, MSV_group,save_folder,label)
    % 绘制等高线
        % 绘制等高线
    %--------------------a-b---------------------

    figure(1);hold on;
    
    hold on;

    % 绘制散点图
    scatter(lab_group(:, 2), lab_group(:, 3), 40, MSV_group, 'filled');
    hold on;

       % 添加坐标轴和参考线
    lim_max = max(max(lab_group(:, 2)), max(lab_group(:, 3))) + 10;
    lim_min = min(min(lab_group(:, 2)), min(lab_group(:, 3))) - 10;
    line([0, 0], [lim_min, lim_max], 'Color', 'k', 'LineStyle', '--'); % x=0
    line([lim_min, lim_max], [0, 0], 'Color', 'k', 'LineStyle', '--'); % y=0
    refline(1, 0); % 45 度线

    % 设置图形属性
    axis equal;
    xlim([lim_min, lim_max]);
    ylim([lim_min, lim_max]);
    xlabel('{\ita*}');
    ylabel('{\itb*}');
    title('Contour Plot with Scatter');
    hold off;
    output_folder=fullfile(save_folder,"a_b");
    if ~exist(output_folder,"dir")
        mkdir(output_folder);
    end
    exportgraphics(gcf,fullfile(output_folder,strcat(label,"a_b.jpg")),"Resolution",150);
    close(gcf)
    %---------------------------L-a--------------------------------

    figure();hold on;
    hold on;

    % 绘制散点图
    scatter(lab_group(:, 2), lab_group(:, 1), 40, MSV_group, 'filled');
    hold on;


    % 计算 x 轴上下限 (第一列数据)
    x_max = max(lab_group(:, 2)) + 10;
    x_min = min(lab_group(:, 2)) - 10;
    
    y_max = max(lab_group(:, 1)) + 10;
    y_min = min(lab_group(:, 1)) - 10;

    % 设置图形属性
    axis equal;
    xlim([x_min, x_max]);
    ylim([y_min, y_max]);
    xlabel('{\ita*}');
    ylabel('{\itL*}');
    title('Contour Plot with Scatter');
    hold off;
    output_folder=fullfile(save_folder,"L_a");
    if ~exist(output_folder,"dir")
        mkdir(output_folder);
    end
    exportgraphics(gcf,fullfile(output_folder,strcat(label,"L_a.jpg")),"Resolution",150);
    close(gcf)
    %-----------------------------------------------------------
end
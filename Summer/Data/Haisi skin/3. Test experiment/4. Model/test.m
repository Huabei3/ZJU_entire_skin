% 设置源文件夹和目标文件夹路径
sourceDir = 'D:\work\ZJU_entire_skin\Res\A_images\Summer\rendered_imgs';
targetDir = 'D:\work\ZJU_entire_skin\Res\A_images\Summer\original_imgs';

% 确保目标文件夹存在
if ~exist(targetDir, 'dir')
    mkdir(targetDir);
end

% 查找所有文件
files = dir(fullfile(sourceDir, '*.jpg'));
movedCount = 0;

% 遍历并移动匹配 skin_数字.jpg 格式的文件
for i = 1:length(files)

        
    % 移动文件
    if length(files(i).name(1:end-4))==1
        sourceFile=fullfile(sourceDir,files(i).name);
        targetFile=fullfile(targetDir,files(i).name);
        [status, message] = movefile(sourceFile, targetFile);
        disp(files(i).name)
    end
        

end




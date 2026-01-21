load newimgname2343;
% chromaratio_gbd = zeros(length(newimgname),1);
% lightnessratio_gbd = zeros(length(newimgname),1);
% vividnessratio_gbd = zeros(length(newimgname),1);
% depthratio_gbd = zeros(length(newimgname),1);
% clarityratio_gbd = zeros(length(newimgname),1);
% for i = 1:length(newimgname)
%     imgname = char(newimgname(i,:));
%     [chromaratio_gbd(i,:),lightnessratio_gbd(i,:),vividnessratio_gbd(i,:),depthratio_gbd(i,:),clarityratio_gbd(i,:)]= calculate_allratio_gbd(imgname,'srgb');
% end
% save chromaratio_gbd chromaratio_gbd
% save lightnessratio_gbd lightnessratio_gbd
% save vividnessratio_gbd vividnessratio_gbd
% save depthratio_gbd depthratio_gbd
% save clarityratio_gbd clarityratio_gbd


% globalcontrast = zeros(length(newimgname),1);
% localcontrast = zeros(length(newimgname),1);
% sharpness = zeros(length(newimgname),1);
%  for i = 1:length(newimgname)
%     imgname = char(newimgname(i,:));
%     [globalcontrast(i,:),localcontrast(i,:),sharpness(i,:)]= calculate_contrasts(imgname);
% end
% save globalcontrast globalcontrast
% save localcontrast localcontrast
% save sharpness sharpness

for i = 1:length(newimgname2343)
    imgname = char(newimgname2343(i,:));
    naturalness2343(i,1)= calculate_naturalness(imgname);
end
save naturalness2343 naturalness2343

% for i = 1:length(newimgname2343)
%     imgname = char(newimgname2343(i,:));
%     natural_class(i,1)= find_naturalness_class(imgname);
% end
% save natural_class natural_class
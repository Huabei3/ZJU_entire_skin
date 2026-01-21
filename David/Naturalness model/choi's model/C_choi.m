function C = C_choi(cam)
C = mean(sqrt(cam(:,2).^2+cam(:,3).^2));
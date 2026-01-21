%  
% for i=1:16
%  imgg=zeros(300,300,3);
%  imgg(:, :, 1) = b(i,1);
%  imgg(:, :, 2) = b(i,2);
%  imgg(:, :, 3) = b(i,3);
%  imwrite(uint8(imgg), strcat('patch16_',num2str(i),'.png'));
% end
 for i=1:16
     for j=1:9
 imgg=zeros(300,300,3);
 hh=newlut3d_xyz2rgb(h(j,(i*3-2):i*3));
 imgg(:, :, 1)=hh(1);
 imgg(:, :, 2)=hh(2);
 imgg(:, :, 3)=hh(3);
 imwrite(uint8(imgg), strcat('patch_',num2str(j),'_',num2str(i),'.png'));
     end
 end
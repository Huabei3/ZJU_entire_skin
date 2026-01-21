     for i=1:8
     for j=1:25
 imgg=zeros(300,300,3);
 h(j,(i*3-2):(i*3))=lab2xyz(c(j,(i*3-2):(i*3)),'user',[433.800000000000,475,566.400000000000]);
 hh=newlut3d_xyz2rgb(h(j,(i*3-2):i*3));
 imgg(:, :, 1)=hh(1);
 imgg(:, :, 2)=hh(2);
 imgg(:, :, 3)=hh(3);
 imwrite(uint8(imgg), strcat(num2str(i),'_patch_',num2str(j),'.png'));
     end
 end

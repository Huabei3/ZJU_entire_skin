for j=29
    for i=1:48
img=imread(strcat('./image_effect2/image_',num2str(j),'_',num2str(i),'.png'));
imwrite(img,strcat('./image_effect2/image_',num2str(j+6),'_',num2str(i),'.png'));
    end
end
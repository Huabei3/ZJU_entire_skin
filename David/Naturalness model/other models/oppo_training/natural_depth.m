depth = zeros(50,3);
rendername=["VV","DP","CL","L","C","S"];
imgnum = [1 2];
count = 1;
for j = 2
    for i = 1 : 5
    
        for k = 1 : 5
            imgname = [char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k)];


        imgname = [imgname,'.jpg'];
        img = double(imread(imgname));
        sz = size(img);
        img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
        xyz0 = display_f(img0);
        labt = xyz2lab(xyz0 , display_f([1 1 1]));
        try
            index1 = importdata([int2str(imgnum(j)),'_skin1.mat']);
            index2 = importdata([int2str(imgnum(j)),'_skin2.mat']);
            index3 = importdata([int2str(imgnum(j)),'_skin3.mat']);

            id = unique([index1,index2,index3]);
%                     l = labt(id,1);
%         c = sqrt(labt(id,2).^2 + labt(id,3).^2);
%         depth(count,1) = mean(sqrt((100-l).^2+c.^2));
        lab0(count,:) = mean(labt(id,:));
        catch
        end
        
%         try
%             id = importdata([int2str(imgnum(j)),'_grass.mat']);
%                                 l = labt(id,1);
%         c = sqrt(labt(id,2).^2 + labt(id,3).^2);
%         depth(count,2) = mean(sqrt((100-l).^2+c.^2));
%         catch
%         end
%         try
%             id = importdata([int2str(imgnum(j)),'_sky.mat']);
%             
%                                 l = labt(id,1);
%         c = sqrt(labt(id,2).^2 + labt(id,3).^2);
%         depth(count,3) = mean(sqrt((100-l).^2+c.^2));
%             
%         catch
%         end
        
        
        
%         [idx,center] = kmeans(lab0,10);
% 
%         for class = 1:10
%             area(class,:) = size(find(idx == class));
%         end
% 
%         maxarea = find(area(:,1) == max(area(:,1)));
% 
%         id = find(idx == maxarea);



        count = count + 1;
        end
    end
end
sz = size(depth);
for i = 1:sz(1)
    depthm(i,:) = sum(depth(i,:))/length(find(depth(i,:) ~= 0));
    
end






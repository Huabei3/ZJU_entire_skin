function lc = calculate_localcontrast(imgname)


    img = double(imread(imgname));
    img = imresize(img,[512,512]);
    sz = size(img);
    img0 = double(reshape(img,sz(1)*sz(2),3))/255;
    xyz0 = display_f(img0);
    lab0 = xyz2lab(xyz0,display_f([1 1 1]));
    lab0 = reshape(lab0,sz(1),sz(2),3);
    l0 = lab0(:,:,1);
    center = l0(1+2:sz(1)-2,1+2:sz(2)-2);
    for i = 1:5
        for j = 1:5
            DJ(:,:,(i-1)*5+j) = (l0(i:sz(1)-5+i,j:sz(2)-5+j)-center).^2;
        end
    end
    DJ = sqrt(mean(DJ,3));
        
    
%     dJ = zeros(sz(1) - 4,sz(2) - 4);
%     for m = 1 : sz(1) - 4
%         for n = 1 : sz(2) - 4
%             tempmat = l0(m : m + 4 , n : n + 4 );
%             dJ(m ,n) = sum(sum(tempmat - l0(m + 2 , n + 2))) / 25;
%         end
%     end



    lc = mean(mean(DJ));

    
end


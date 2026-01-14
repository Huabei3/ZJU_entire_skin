load naturalness;
load skylab;
load skinlab;
load grasslab;


% grass
% for i = [1 2 3 5 6 7 9 10]
% skin

% for i = 1:9
%     templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
%     tempn = [tempn;naturalness(980+(i-1)*49+1:980+(i-1)*49+49,:)];
%     
% end
% [par,r] = ellipsoidfit5(templab,tempn);
r = zeros(9,10);
skinimgs = 1:10;
for i = 1:9
    maxr = 0;

    for j = 1:length(skinimgs)
        templab = [];
        tempn = [];
        temp = skinimgs;
        temp(j) = [];
        for k = temp
            templab = [templab;skinlab((k-1)*49+1:(k-1)*49+49,:)];
            tempn = [tempn;naturalness(980+(k-1)*49+1:980+(k-1)*49+49,:)];
        end
        [par,r(i,j)] = ellipsoidfit5(templab,tempn);
        if r(i,j) >= maxr
            finalj = j;
            maxr = r(i,j);
        end
    end
    reduced_img(i) = skinimgs(finalj);
    skinimgs(finalj) = [];
    
end
            
        
        
        
        
        
        
        
        
        
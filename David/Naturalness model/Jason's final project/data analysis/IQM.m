load cl;
load chroma_index;
load predictedn;
load image_quality;
% r1 = corr(predictedn,image_quality);
% r2 = corr(chroma(1:490,:),image_quality(1:490,:));

idx = randperm(1960);
for i = 1:5
    testid = idx((i-1)*392+1:(i-1)*392+392);
    trainid = setdiff(1:1960,testid);
    x = [predictedn(trainid,:),chroma_index(trainid,:)];
    y = image_quality(trainid,:);

    options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
    f = @(a,x)a(1)*x(:,1) + a(2)*x(:,2) + a(3);
    [a,r] = lsqcurvefit(f,[1,1,1],x,y,[],[],options);

    y0 = a(1)*x(:,1) + a(2)*x(:,2) + a(3);

%     scatter(y0, y);
    trainc(i,:) = corr(y0, y);
    
    x = [predictedn(testid,:),chroma_index(testid,:)];
    y = image_quality(testid,:);
    y0 = a(1)*x(:,1) + a(2)*x(:,2) + a(3);
    testc(i,:) = corr(y0, y);
end
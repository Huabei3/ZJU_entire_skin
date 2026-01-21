
load depth;

load naturalness_natural;

% for i = 1 : 150
%     imgn1(i,:) = string(imgname(i,:));
%     
% end
% zscore0 = [];
% for i = 1 : 50
%     imgn2 = string(imgname_natural_nosh(i,:));
%     zscore0 = [zscore0 ; zscore(find(imgn1 == imgn2))];
% end

cmax = 0;

for j = 1:100
    
    y0 = zeros(50,3);

    x1 = depth(1:25,3);
    y1 = zscore(1:25,1);
    options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',100000);
    f = @(a,x)a(1)*(x(:,1)-a(2)).^2 + a(3);
%     p0 = unifrnd(-100,100,1,3);
    p0 = [-0.0017,57,1];
% p0 = [0.1,-6.5,70];
    % [a1,r] = lsqcurvefit(@fun4,[0.1,0.1,0.1,0.1,0.1,0.1],x,y,[],[],options);
    [a1,r] = lsqcurvefit(f,p0,x1,y1,[],[],options);
%     [a1,r] = lsqcurvefit(@symetry_power,p0,x1,y1,[0,-inf,60],[],options);
    y0(1:25,3) = f(a1,x1);

    x2 = depth(1:25,2);
    y2 = zscore(1:25,1);
    options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',100000);
    f = @(a,x)a(1)*(x(:,1)-a(2)).^2 + a(3);
%     p0 = unifrnd(-100,100,1,3);
% p0 = [0.1,-6.5,70];
    p0 = [-0.0017,80,1];
    [a2,r] = lsqcurvefit(f,p0,x2,y2,[],[],options);
%     [a2,r] = lsqcurvefit(@symetry_power,p0,x2,y2,[0,-inf,60],[],options);
    y0(1:25,2) = f(a2,x2);
    
    x3 = depth(25:50,1);
    y3 = zscore(25:50,1);
    options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',100000);
    f = @(a,x)a(1)*(x(:,1)-a(2)).^2 + a(3);
%     p0 = unifrnd(-100,100,1,3);
% p0 = [0.1,-6.5,70];
    p0 = [-0.0017,55,1];
    [a3,r] = lsqcurvefit(f,p0,x3,y3,[],[],options);
%     [a3,r] = lsqcurvefit(@symetry_power,p0,x3,y3,[0,-inf,60],[],options);
    y0(25:50,1) = f(a3,x3);

    sz = size(y0);
    for i = 1:sz(1)
        y0m(i,:) = sum(y0(i,:))/length(find(y0(i,:) ~= 0));
    end
    c =  corrcoef(y0m, zscore);
    if c>= cmax
        cmax = c;
        p1 = a1;
        p2 = a2;
        p3 = a3;
        ybest = y0m;
    end
end
scatter(ybest,zscore)


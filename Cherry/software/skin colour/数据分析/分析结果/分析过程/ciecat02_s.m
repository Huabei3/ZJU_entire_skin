function [xyzr]= ciecat02_s(xyzt, xyzwt,xyzwr)

% disp('%%%%%%% Muhammad Safdar;  msafdar87@hotmail.com %%%%%%%%%%%%%')
%%% xyzt is test XYZ [1x3]
%%% xyzwt is test white  [1x3]
%%% xyzwr is reference white [1x3]
%%% La is adaptive luminance
%%% xyzr is the computed xyz under reference source

F=1;

M_CAT02 = [0.7328 0.4296 -0.1624; -0.7036 1.6975 0.0061; 0.003 0.0136 0.9834];
Inv_M_CAT02 = [1.096124	-0.278869 0.182745; 0.454369 0.473533 0.072098; -0.009628 -0.005698	1.015326];

% step 1
rgbt  = M_CAT02*xyzt';
rgbwt = M_CAT02*xyzwt';
rgbwr = M_CAT02*xyzwr';
% step 2
D = 1;
% D_pre =  F * (1- (1/3.6)*exp((-La-42)/92));
% if D_pre<0
%     D = 0;
% elseif D_pre>1
%     D = 1;
% else
%     D = D_pre;
% end 
% step 3
rgbtc(1,:) = (D*(rgbwr(1)/rgbwt(1)) + 1 - D)*rgbt(1,:);
rgbtc(2,:) = (D*(rgbwr(2)/rgbwt(2)) + 1 - D)*rgbt(2,:);
rgbtc(3,:) = (D*(rgbwr(3)/rgbwt(3)) + 1 - D)*rgbt(3,:);

% step 4
xyzr = Inv_M_CAT02*rgbtc;
xyzr=xyzr';
end
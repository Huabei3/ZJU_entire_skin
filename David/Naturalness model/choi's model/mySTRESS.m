function [pf,fcv] = mySTRESS(de,dv,fcv)

% function [pf,fcv] = STRESS(de,dv,f)
% computes performance factor between two datasets: de and dv
% de and dv are the data vectors tested, for example,
% computed colour difference and visual difference
% can set fcv=1 when needed, 
% fcv is calculated as fcv=sum(de.*dv)/sum(de.*de) by default

if nargin==2
    fcv=sum(de.*dv)/sum(de.*de);
end
dim1 = size(de);
dim2 = size(dv);
if (dim1(1) ~= dim2(1)) | (dim1(2) ~= dim2(2))
   disp('the two vectors are not in same size');
   return;
end
    
pf = sqrt(sum((fcv*de-dv).^2)/sum(dv.*dv))*100;

%RMSE=sqrt(mean((y-y1).^2))
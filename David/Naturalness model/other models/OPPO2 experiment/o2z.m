function Zout=o2z(mat_o)

% This function converts the original experiment data to Z-Scores data
% The original data is a by b matrix where a represents the subjectives(e.g. image1, image2 and so on) and b the grades (e.g. 1-6 scales, where 1 is perferct match and 7 totally dismatch.)
%Accmulated matrix
M=cumsum(mat_o,2); %to calculate cumulative sum for the row data for a certain observeration
if max(M(:,end))~=min(M(:,end))  %the last column should be just one number
    disp('input data wrong. Pls check')
end

N=max(M(:,end));   %number of obervers
size(mat_o)

%PMAT
pmat = M./N;

display(N)

%LGMAT
lgmat=log((M+0.5)./(N-M+0.5));
ind = pmat~=0 & pmat~=1;
x = lgmat(ind);    %row data is prior to column data
y = norminv(pmat(ind), 0, 1);
p=polyfit(x,y,1);

t=poly2sym(p);           %to show the linear equation
f=@(x)eval(t);  
vpa(t,4)

%ZMAT
%%%%%%%%%%%%%%%%%%这里有个小疑问，反算的值是只对0,1还是说所有
zmat = zeros(size(M));
zmat(ind) = norminv(pmat(ind), 0, 1);
zmat(~ind) = f(lgmat(~ind));


%DMAT
dmat = diff(zmat,1, 2);

%mean
dmean=mean(dmat);

%Boundary
Boundary = cumsum([0,dmean])

%Scale value
smat = bsxfun(@minus, Boundary, zmat);
smat(:,end)=[];

%Z-scores for all conditions
Zout = mean(smat,2);
% stem(Zout)
%%

end

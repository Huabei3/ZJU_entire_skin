%T=1000:1000:10000;
%S=blackbodySPD(T);
function Sr=blackbodySPD(T)
lambda =(250:5:1000)';
c1 = 3.74183e-16;
c2 =  1.4388*10^-2;
n=1.000;
Sr_fcn = @(T,lambda) (1/pi).*c1.*((repmat(lambda,1,numel(T)).*1e-9).^(-5)).*(n.^(-2)).*(exp(c2.*((n.*repmat(lambda,1,numel(T)).*1e-9.*repmat(T,numel(lambda),1)).^(-1)))-1).^(-1);
Sr_fcn2= @(T,lambda) Sr_fcn(T,lambda)./repmat(Sr_fcn(T,560),numel(lambda),1);;
Sr = [lambda,Sr_fcn2(T,lambda)];
end

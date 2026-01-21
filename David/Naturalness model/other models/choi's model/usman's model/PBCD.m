function [DE] = PBCD( Jab , ws)

ws = ws+1;
[m,n,o]=size(Jab); %#ok<ASGLU>
s = ((ws)/2)-0.5;
s_str = .5*ws + .5;
% C = sqrt(Jab(:,:,2).^2 + Jab(:,:,3).^2);

% Del_E = zeros(m,n); Del_L = zeros(m,n); Del_C = zeros(m,n);
% tic
[Del_E_median] = CDEq(Jab , s_str , s , ws);
% toc
% ED = Del_E_mean(s_str:m-s , s_str:n-s);
% DE(1) = mean(ED(:));
ED2 = Del_E_median(s_str:m-s , s_str:n-s);
DE(1) = mean(ED2(:));
% ED3 = Del_E_mode(s_str:m-s , s_str:n-s);
% DE(3) = mean(ED3(:));
% ED4 = Del_E_max(s_str:m-s , s_str:n-s);
% DE(4) = mean(ED4(:));
% ED5 = Del_E_perc95(s_str:m-s , s_str:n-s);
% DE(5) = mean(ED5(:));
% ED6 = Del_E_perc75(s_str:m-s , s_str:n-s);
% DE(6) = mean(ED6(:));
% ED7 = Del_E_perc50(s_str:m-s , s_str:n-s);
% DE(7) = mean(ED7(:));
% LD = Del_L(s_str:m-s , s_str:n-s);
% DE(2) = mean(LD(:));
% CD = Del_C(s_str:m-s , s_str:n-s);
% DE(3) = mean(CD(:));

end
% 
function [Del_E_median] = CDEq(Jab , s_str , s , ws)
[m,n,o]=size(Jab);

for i=s_str:m-s
    for j=s_str:n-s
        
        wJt = Jab(i+(-s:s),j+(-s:s),1);
        wat = Jab(i+(-s:s),j+(-s:s),2);
        wbt = Jab(i+(-s:s),j+(-s:s),3);
%         WC  = C(i+(-s:s),j+(-s:s));

        J = wJt(s_str,s_str) + zeros(ws,ws);
        a = wat(s_str,s_str) + zeros(ws,ws);
        b = wbt(s_str,s_str) + zeros(ws,ws);
%         c = WC(s_str,s_str) + zeros(ws,ws);
        
        Del_J1 = (abs(J(:)-wJt(:))); Del_J = [Del_J1(1:4,1) ; Del_J1(6:9,1)];
        Del_a1 = (abs(a(:)-wat(:))); Del_a = [Del_a1(1:4,1) ; Del_a1(6:9,1)];
        Del_b1 = (abs(b(:)-wbt(:))); Del_b = [Del_b1(1:4,1) ; Del_b1(6:9,1)];
%         Del_c1 = (abs(c(:)-WC(:)));  Del_c = [Del_c1(1:4,1) ; Del_c1(6:9,1)];
        
        Del_E1 = sqrt( Del_J.^2 + Del_a.^2 + Del_b.^2 );
        
%         Del_E_mean(i,j,1) = mean(Del_E1);           % Mean
        Del_E_median(i,j,1) = median(Del_E1);       % Median
%         Del_E_mode(i,j,1) = mode(Del_E1(Del_E1>0)); % Mode
%         Del_E_max(i,j,1) = max(Del_E1);             % Max
%         Del_E_perc95(i,j,1) = prctile(Del_E1,95);   % 95% Percentile
%         Del_E_perc75(i,j,1) = prctile(Del_E1,75);   % 75% Percentile
%         Del_E_perc50(i,j,1) = 0;%prctile(Del_E1,50);   % 50% Percentile
       
%         Del_L(i,j,1) = sum(Del_J)./(length(J(:))-1); 
%         Del_C(i,j,1) = sum(Del_c)./(length(J(:))-1); 
        
    end
end

end
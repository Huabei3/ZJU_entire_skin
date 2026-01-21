function [IPBCD] = PBCDChoi(Jab)

rsz = [ 1 1/2 1/2 1/2];
for i=1:4
    Jab = imresize(Jab , rsz(i));
%     [DE] = PBCD( Jab , 4);
%     IPBCD(1,i) = DE;
    [DE] = PBCD( Jab , 2);
    IPBCD(:,i) = DE';
end

end
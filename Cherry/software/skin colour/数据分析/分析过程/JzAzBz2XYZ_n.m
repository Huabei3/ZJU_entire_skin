% *** function XYZ_D65 = JzAzBz2XYZ(JzAzBz)
% *** Computes XYZ_D65 from JzAzBz
% *** JzAzBz is an n by 3 matrix

function XYZ_D65 = JzAzBz2XYZ_n(JzAzBz)
JzAzBz(:,1)=JzAzBz(:,1)+1.6295499532821566e-11;
d = -0.56; 
Iz = JzAzBz(:,1)./(1+d-d*JzAzBz(:,1));
IzAzBz = [Iz JzAzBz(:,2) JzAzBz(:,3)];
M1inv = inv([0.41478972 0.579999 0.014648;-0.20151 1.120649 0.0531008; -0.0166008 0.2648 0.6684799]);
M2inv = inv([0.5 0.5 0; 3.524000  -4.066708 +0.542708; 0.199076 +1.096799  -1.295875]);
n = 2610/2^14; p = (1.7)*2523/2^5;  
c1 = 3424/2^12; c2 = 2413/2^7; c3 = 2392/2^7;
PQinv = @(x)10000*((c1-x.^(1/p))./(c3*x.^(1/p)-c2)).^(1/n);
IzAzBz_2_XYZ = @(x)PQinv(x * M2inv') * M1inv';
XYZ_D65 = IzAzBz_2_XYZ(IzAzBz);
b=1.15; g=0.66;
XYZ_D65(:,1)= (XYZ_D65(:,1)+ (b-1)*XYZ_D65(:,3))./b;
XYZ_D65(:,2)= (XYZ_D65(:,2)+ (g-1)*XYZ_D65(:,1))./g;
end
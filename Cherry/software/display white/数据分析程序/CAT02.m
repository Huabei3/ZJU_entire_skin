function [outputXYZ, D1, D2, La0] = CAT02 (inputXYZ,XYZ1w,XYZ2w,XYZ0w,Dtype,Mtype,Ttype,Ddata,Mdata)
%   multiCAT version.2015-Nov-23
%   by Kevin Smet and Qiyan Zhai
%   calculates corresponding colours XYZc using Ms and D-functions from CAT02£¨chromatic adaptation transforms)                                                                                  
%   XYZ1 = 1 by 3, input tristimulus values (0~1  or cd/m2)
%   XYZ2 = 1 by 3, output tristimulus values (0~1  or cd/m2)
%   XYZ1w = 1 by 3, adapting white point of input source (0~1 or cd/m2)
%   XYZ2w = 1 by 3, adapting white point of output source (0~1 or cd/m2)
%   XYZ0w = 1 by 3, adapting white point of the source with original full adaptation of human eyes (0~1 or cd/m2)
%        or 'eew'([1,1,1]) or '0=2'(defult:XYZ0w=XYZ2w) 
%   Dtype: Type of D or D-function:          	
%   Mtype: Type of Mcat:                       
%   Ttype: Type of the transfer (RGB1 to RGB2): 
%   Ddata: 1 by n, input of D or D-function: [La1,La2,F1,F2]  (only when Dtype is 'CAT02')
%                                               La: Luminance of adapting filed (cd/m2);  F: 0~1;  D: 0~1
%   Mdata: 3 by 3, input of Mcat(only when Dtype is 'user')

%% =================== nargin ====================
if nargin<4
    XYZ0w='0=2';
end
if nargin<8
    Dtype='user'; Ddata=[100,100,1,1];
    Mtype='VonKries';
    Ttype='VonKries';
end
% -------------------------------------------------------

%% =============== get XYZ0w & La0 ================
La1=Ddata(1);
La2=Ddata(2);

if ischar(XYZ0w)
    switch XYZ0w
        case 'eew'
            XYZ0w = [1,1,1];
            La0=(La1*La2)^(1/2);
        case '0=2'
            XYZ0w = XYZ2w;
            La0=La2;
        otherwise
            XYZ0w = XYZ2w;                    %defult:XYZ0w=XYZ2w
            La0=La2;
    end
elseif all(size(XYZ0w)==[1 3]) && isnumeric(XYZ0w) && all(XYZ0w ~= XYZ2w)
    La0=(La1*La2)^(1/2);
else
    XYZ0w = XYZ2w;                            %defult:XYZ0w=XYZ2w
    La0=La2;
end
% --------------------------------------------------------

%% =============== get D1 & D2 ==============
%case 'CAT02'
        F1=Ddata(3);
        F2=Ddata(4);
        D1=F1*(1-(1/3.6)*exp((-La1-42)/92));
        D2=F2*(1-(1/3.6)*exp((-La2-42)/92));
% ----------------------------------------------- 

%% =============== get MCAT =================
% case 'CAT02'
        MCAT=[0.7328, 0.4296, -0.1624;
             -0.7036, 1.6975,  0.0061;
              0.0030, 0.0136,  0.9834];       
% -----------------------------------------------

%% ================ transfer (Dt)=================
RGBw1=(MCAT*XYZ1w');Rw1=RGBw1(1);Gw1=RGBw1(2);Bw1=RGBw1(3);
RGBw0=(MCAT*XYZ0w');Rw0=RGBw0(1);Gw0=RGBw0(2);Bw0=RGBw0(3);
RGBw2=(MCAT*XYZ2w');Rw2=RGBw2(1);Gw2=RGBw2(2);Bw2=RGBw2(3);

DecFlag=0;
     Dt =     ((La1/La0)*D1*(RGBw0./RGBw1)+1-D1) ...
               ./((La2/La0)*D2*(RGBw0./RGBw2)+1-D2); 
a=size(inputXYZ,1);
b=size(inputXYZ,2);

for m=1:a
    for n=1:b
       XYZheng=inputXYZ(m,n,:);
       XYZ1=reshape(XYZheng,1,3);
       RGB1=(MCAT*XYZ1');
       if DecFlag
           RGB2=RGB1+Dt;
       else
           RGB2=RGB1.*Dt;
       end
       XYZ2=(MCAT\RGB2)';
       XYZ2(XYZ2<0)=0;
       outputXYZ(m,n,:)=XYZ2;
    end
end

% ----------------------------------------------------
% M=[0.732800000000000	0.429600000000000	-0.162400000000000
% -0.703600000000000	1.69750000000000	0.00610000000000000
% 0.00300000000000000	0.0136000000000000	0.983400000000000]
%% END Ref
end           
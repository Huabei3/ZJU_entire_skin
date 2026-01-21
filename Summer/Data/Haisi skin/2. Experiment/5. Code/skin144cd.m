load('skin8xyz');
load('Wcd');
cct=(mean(cct'))';
duv=(mean(duv'))';
bb=lut3d_rgb2xyz([255,255,255]);
for i=1
for j=1:16
    if j<9
    xyz0=c(j,:);
    else
        xyz0=c((j-8),:);
    end
    xyz1=[96.8784150756302,100,112.116528078328];
    xyz2=CCT2xyz(cct(j,i),duv(j,i));
    cat=ciecat02_d(xyz0,xyz1,xyz2,'CAT16',106,100,1);
    lab=xyz2lab(cat,'user',bb);
    lab1(j,(4*i-3):(4*i-1))=lab;
    lab1(j,4*i)=sqrt((lab1(j,(4*i-2))).^2+(lab1(j,(4*i-1))).^2);
end
end

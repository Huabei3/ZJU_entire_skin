 load('cam16ucsinput.mat')
for i=1:11
Jab(:,(3*i-2):(3*i))=XYZ2CAM16UCS_summer(xyz,a(i,1:3)./a(i,2).*100,a(i,4),a(i,5),a(i,6),a(i,7),b(i,:));
end

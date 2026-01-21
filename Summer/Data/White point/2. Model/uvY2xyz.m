function XYZ=uvY2xyz(uvY)
%transform from CIE1976 u', v', Y to xyz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=9*uvY(:,1)./(12-16*uvY(:,2)+6*uvY(:,1));
y=4*uvY(:,2)./(12-16*uvY(:,2)+6*uvY(:,1));
Y=uvY(:,3);
X=(x./y).*Y;
Z=((1-x-y)./y).*Y;
XYZ=[X,Y,Z];
end


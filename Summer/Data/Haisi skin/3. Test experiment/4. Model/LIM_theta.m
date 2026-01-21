for i=1:6
A=1;
B=par(i+6*j-6,3);
C=par(i+6*j-6,2);
D=-2*par(i+6*j-6,5)-par(i+6*j-6,3).*par(i+6*j-6,6);
E=-2*par(i+6*j-6,6)-par(i+6*j-6,3).*par(i+6*j-6,5);
F=par(i+6*j-6,5).^2+par(i+6*j-6,2).*par(i+6*j-6,6).^2+par(i+6*j-6,3).*par(i+6*j-6,5).*par(i+6*j-6,6);
A=A./F;B=B./F;C=C./F;D=D./F;E=E./F;
X=(B.*E-2*C.*D)./(4*A.*C-B.^2);
Y=(B.*D-2*C.*D)./(4*A.*C-B.^2);
theta=0.5*atan(B./(A-C))./(2*pi).*360;
aa=2*(A.*X.^2+C.*Y.^2+B.*X.*Y-1)./(A+C+sqrt((A-C).^2+B.^2));
bb=2*(A.*X.^2+C.*Y.^2+B.*X.*Y-1)./(A+C-sqrt((A-C).^2+B.^2));
ab=bb./aa;
par2(i+6*j-6,:)=[par(i+6*j-6,:),theta,bb,ab];
end
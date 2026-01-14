function [R,D] = ellipse_compare_20(par1,par2)

D = sqrt((par1(5)-par2(5))^2+(par1(6)-par2(6))^2);
syms x y;
for i = 1:20
    theta = pi/20*(i-1);
    if theta == pi/2
        line1 = x-par1(5)==0;
        line2 = x-par2(5)==0;
    else
        k = tan(theta);
        line1 = y-par1(6)==k*(x-par1(5));
        line2 = y-par2(6)==k*(x-par2(5));
    end
    eqns1 = [line1,0.5 == (1/(1+exp(par1(1)*sqrt((x-par1(5))^2+par1(2)*(y-par1(6))^2+par1(3)*(x-par1(5))*(y-par1(6)))-par1(4))))];
    vars1 = [x,y];
    [solx1,soly1] = solve(eqns1,vars1);
    radius1(i,:) = double(sqrt((par1(5)-solx1(1))^2+(par1(6)-soly1(1))^2));
    eqns2 = [line2,0.5 == (1/(1+exp(par2(1)*sqrt((x-par2(5))^2+par2(2)*(y-par2(6))^2+par2(3)*(x-par2(5))*(y-par2(6)))-par2(4))))];
    vars2 = [x,y];
    [solx2,soly2] = solve(eqns2,vars2);
    radius2(i,:) = double(sqrt((par2(5)-solx2(1))^2+(par2(6)-soly2(1))^2));
end
R = corr(radius1,radius2);
end
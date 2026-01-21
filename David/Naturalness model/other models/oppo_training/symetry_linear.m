function f = symetry_linear(par,x)
    for i = 1:size(x)
        if x(i,1)<=par(3)
            f(i,1) = par(1)*x(i,1) + par(2);
        else
            f(i,1) = -par(1)*(x(i,1)-2*par(3)) + par(2);
        end
    end
end
function result=poly(x,xdata)
%xdata=[0:15:255]/255;
result=x(1)*xdata+x(2)*xdata.^2+x(3)*xdata.^3+x(4)*xdata.^4;
result=result+x(5);
end
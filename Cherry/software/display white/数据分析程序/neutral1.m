function yy=neutral1(g,x) 

a=[1473.19546967561,-6265.23762109730];
a1=a(1);
a2=a(2);
yy =g(1).*(a1.*log(x)+a2);
end
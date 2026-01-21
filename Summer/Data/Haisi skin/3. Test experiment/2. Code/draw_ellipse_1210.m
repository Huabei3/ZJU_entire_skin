al=0:0.01:2*pi;
th=-28./180.*pi;
px=cos(al)*14.7;
py=sin(al)*26.9;
x=18.7+px*cos(th)-py*sin(th);
y=19.6+px*sin(th)+py*cos(th);
plot(x,y,'Color',[0.5,0.2,0.8],'LineWidth',3);hold on;
plot(18.7,19.6,'o','Color',[0.5,0.2,0.8],'MarkerFaceColor',[0.5,0.2,0.8],'MarkerSize',10);hold on;

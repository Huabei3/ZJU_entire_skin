fig=figure();
set(fig,'Position', [100 100 500 500]);
axis equal;
hold on
% === 4 race,obj,ir ("Caucasian","Oriental","South Asian","African")
% === 4 lighings,color,il (3000K 4000K，5000K，6500K)
% === 2 image luminance,lin,ig (1000lux,500lux)
str=["Caucasian","Oriental","South Asian","African"];
color=[255,29,0;255,185,0;0,205,0;15,74,155]./255;
lin=["-","--"];
obj=["o","s","^","p"];
for ir=1:4
  for ig=1:2
    for il=1:4
scatter(a(ig*4-4+il,ir*4-4+2),a(ig*4-4+il,ir*4-4+3),80,obj(ir),'MarkerEdgeColor',color(il,:),'MarkerFaceColor',color(il,:)); hold on;   
    end
plot(a((ig*4-3):(ig*4),ir*4-4+2),a((ig*4-3):(ig*4),ir*4-4+3),lin(ig),'Color',[0.5,0.5,0.5],'linewidth', 2);hold on;
  end
end

axis([14 22 14 22]);hold on
title('Oriental visual result under 1000 lux lightings','FontSize',20)
set(gca,'XTick',[14:1:22]);%设置要显示坐标刻度
set(gca,'YTick',[14:1:22]);%设置要显示坐标刻度
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);

grid on
for i=1:33
h=bar(i,par(i));hold on;
set(h,'FaceColor',r1(i,:)./255);
end
% tick={'Pork''Rose''Stewberry''Tamato''Caucasian''South Asian''Oriental''African''Carrot''Orange''Pumpkin''Corn''Lemon''Banana''Kiwi''GreenApple''GreenPepper''SummerGrass''Pine','Broccoli''Smurf''Blue?Sky''Pepsi''Lavender''Aubergine''Blueberry''PurpleCabbage''PurpleGrape''PlaceRed''China''ChineseRed''TempleYellow''PlaceYellow'};
% settick('re_shu',tick);
% ÉèÖÃºá×ø±ê
axis([0 34 0.4 1]);hold on;
% set(gca,'XTickLabel',tick);
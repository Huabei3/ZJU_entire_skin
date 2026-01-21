load newimgname2343;
load naturalness2343;
load data2343;
load natural_class;

% zju4
% class 3 skin = [7 8 -18 -29 -33 -40 50 51 54 65 -67 -77];
% class 2 sky = [2 4 -6 -11 -13 -14 -27 44 52 57 -58 63 -68 74];
% class 1 grass = [1 16 20 21 49 62 75 76];



tempn = [];
tempiq = [];
% for i = 1:743
% skin
% for i = [31:40,504:534,560:574,680:684]
% grass
for i = [1:5,105:115,149:170,490:503,665:669,729:738]
% sky
% for i = [6:10,16:20,422:434,535:547,603:616,670:674,724:728]

    tempn = [tempn;naturalness2343(i,:)];
    tempiq = [tempiq;cell2mat(data2343(i,2))];


    
end
scatter(tempn,tempiq);
stress = mySTRESS(tempn,tempiq)
co = corr(tempn,tempiq)
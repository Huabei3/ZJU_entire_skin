load naturalness1;
load skylab;
load skinlab;
load grasslab;

skyn = naturalness_model(skylab,'sky');
sgn = naturalness_model(grasslab,'springgrass');
skinn = [];
for i = 1:10
    if any(i==[1 5 7 9 10])
        skinn = [skinn;naturalness_model(skinlab((i-1)*49+1:(i-1)*49+49,:),'asianskin');];
    else
        skinn = [skinn;naturalness_model(skinlab((i-1)*49+1:(i-1)*49+49,:),'caucasianskin');];
    end
end
agn = naturalness_model(grasslab,'autumngrass');
predictedn = [skyn;sgn;skinn;agn];
scatter(predictedn,naturalness1);

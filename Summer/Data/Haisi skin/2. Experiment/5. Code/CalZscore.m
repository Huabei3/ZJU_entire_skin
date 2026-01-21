function [z, avg] = CalZscore(M, cat)
% M: raw results [n, m] matrix, n experiment condtion, m observer number.
% cat: categrical score, for instance [1, 2, 3, 4, 5], or [-3, -2, -1, 1, 2,
% 3]

avg = mean(M, 2);
[n, m] = size(M);
i = length(cat);
cmat = zeros(n, i);
cfmat = zeros(n, i);
dmat = zeros(n, i-1);
bd = zeros(1, i);

for con = 1:n
    for obs = 1:m
        tmp = cmat(con, cat==M(con, obs));
        cmat(con, cat==M(con, obs)) = tmp+1;
    end
end
cfmat(:, 1) = cmat(:, 1);
for ind = 2:i
    cfmat(:, ind) = cfmat(:, ind-1)+cmat(:, ind);
end
cpmat = cfmat./m;
zmat_norm = norminv(cpmat);

lg = log((cfmat+0.5)./(m-cfmat+0.5));
index = cpmat~=0 & cpmat~=1;
p = polyfit(lg(index), zmat_norm(index), 1);
zmat = polyval(p, lg);

for ind = 1:i-1
    dmat(:, ind) = zmat(:, ind+1)-zmat(:, ind);
end

md = mean(dmat);
bd(1) = 0;
for ind=2:i
    bd(ind) = bd(ind-1)+md(ind-1);
end
tmp = ones(n, 1)*bd-zmat;
z = mean(tmp(:, 1:i-1), 2);

end
function cv = cv(a,b)

if size(a) ~= size(b)
    disp('two dataset should be in same size!');
end

m = (a + b) / 2;
cv = sum(sqrt((a - m) .^2 + (b - m) .^2) ./ m);
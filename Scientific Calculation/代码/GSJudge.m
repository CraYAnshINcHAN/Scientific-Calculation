function x = GSJudge(A)

D = diag(diag(A));
d1 = eig(A);
flag = all(d1>0);
if flag == 1
    disp("GS迭代收敛");
else
    disp("GS迭代不收敛");
end
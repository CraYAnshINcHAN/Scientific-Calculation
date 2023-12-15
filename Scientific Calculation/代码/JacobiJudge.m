function flag = JacobiJudge(A)
D = diag(diag(A));
d1 = eig(A);
d2 = eig(2*D - A);
flag = all(d1>0)&&all(d2>0);
if flag == 1
    disp("Jacobi迭代收敛");
else
    disp("Jacobi迭代不收敛");
end
function x = Jacobi(A,b)

n = length(A);
D = diag(diag(A));
L = -(tril(A)-D);
U = -(triu(A)-D);
x0 = diag(zeros(n));
flag = true;
n(1) = 0;
err(1) = 0;
i = 0;

while flag
    x = x0;
    x1 = inv(D)*((L+U)*x0+b);
    x0 = x1;
    i = i+1;
    n(i) = i;
    err(i) = norm(x-x0);
    if norm(x-x0)<1e-5
        flag = false;
    end
end
plot(n,err);


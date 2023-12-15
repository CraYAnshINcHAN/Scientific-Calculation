function L = Cholesky(A,n)
L = zeros(n);
for j = 1:n
    sum = 0;
    for k = 1:j-1
        sum = sum+L(j,k)^2;
    end
    L(j,j) = (A(j,j)-sum)^0.5;
    for i = j+1:n
        sum2 = 0;
        for k = 1:j-1
            sum2 = sum2+L(i,k)*L(j,k);
        end
        L(i,j) = 1/L(j,j)*(A(i,j)-sum2);
    end
end


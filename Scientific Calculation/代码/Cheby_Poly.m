function x = Cheby_Poly(n)
syms t;
f0 = 1;
f1 = t;
x = zeros(1,n);
for i=2:n
    temp = f1;
    f1=2*t*f1 - f0;
    f0 = temp;
end
x = solve(f1,t);


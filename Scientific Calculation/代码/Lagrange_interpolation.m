function l=Lagrange_interpolation(n,x,y)
%拉格朗日插值
syms t;
l=0;
for k=1:(n+1)
    p=1;
    p=p*y(k);
    for i=1:(n+1)
        if i ~= k
            p=p*(t-x(i))/(x(k)-x(i));
        end
    end
    l=l+p;
end

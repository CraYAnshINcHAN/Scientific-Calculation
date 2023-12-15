function h=TimetestLagrange(f,xmin,xmax,nmax)
for n = 3:nmax
[x,y] = Equal_divide(xmin,xmax,f,n);
tic
l1=Lagrange_interpolation(n,x,y);
h(n-2) = toc
end
n=3:1:nmax;
plot(n,h);
title(['Lagrange多项式插值所需时间与插值节点个数关系']);
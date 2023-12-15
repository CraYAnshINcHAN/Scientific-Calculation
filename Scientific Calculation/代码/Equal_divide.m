function [x,y] = Equal_divide(xmin,xmax,f,n)
x=zeros(1,n+1);
y=zeros(1,n+1);
for i=1:(n+1)
    x(i)=xmin+(xmax-xmin)*(i-1)/n;
    y(i)=f(x(i));
end

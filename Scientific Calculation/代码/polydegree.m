function [s1,n]=polydegree(p,x)
init=0;
p0=p;
while ~isreal(p)|p~=0
p=diff(p,x);
init=init+1;
end
init=init-1;
s=sym([]);
for i=1:1:init
s(i)=diff(p0,x,init-i+1)/(factorial(init-i+1));
p0=p0-s(i)*x^(init-i+1);
end
s1=[s p0];
s1=collect(s1,x);
n=length(s1)-1;
end

function [A,b] = Cubic_interpolation(n,x,y)
syms t;
h = zeros(1,n);
m = zeros(n+1,1);
m(1) = 1;
m(n+1) = -1;
for i = 1:n
    h(i) = x(i+1) - x(i);
end
lam = zeros(1,n);
miu = zeros(1,n);
diff = zeros(1,n);
lam(1) = 0.5;
for i = 2:n
    lam(i) = (h(i)/(h(i-1)+h(i)));
    miu(i) = 1 - lam(i);
end
miu(1) = 1 - lam(1);
for i = 1:n
    diff(i) = (y(i+1)-y(i))/h(i);
end
g = zeros(1,n);
for i = 2:n
    g(i) = 3*miu(i)*diff(i) + 3*lam(i)*diff(i-1);
end
A = zeros(n-1,n-1);
for i = 1: n-1
    A(i,i) = 2;
    if i ~= n-1
        A(i,i+1) = miu(i+1);
        A(i+1,i) = lam(i+1);
    end
end
b = zeros(n-1,1);
b(1) = g(2) - lam(2)*m(1);
b(n-1) = g(n) - lam(n)*m(n+1);
for i = 2: n-2
    b(i) = g(i+1);
end
q = zeros(n-1,1);
q = A\b;
for i = 2:n
    m(i)=q(i-1);
end

for k = 1:(10/0.01+1)
    t(k) = -5 + (k-1)*0.01;
    for i = 1:n
        if((t(k)>=x(i)) && (t(k)<=x(i+1)))
            alpha = (1+2*(t(k)-x(i))/h(i))*((t(k)-x(i+1))/h(i))^2;
            alpha2 = (1+2*(-t(k)+x(i+1))/h(i))*((t(k)-x(i))/h(i))^2;
            beta = (t(k)-x(i))*((t(k)-x(i+1))/h(i))^2;
            beta2 = (t(k)-x(i+1))*((t(k)-x(i))/h(i))^2;
            l(k) = y(i)*alpha + y(i+1)*alpha2 +m(i)*beta+m(i+1)*beta2;
        end
    end
    y2(k) = eval(1/((t(k))^2+1));
    e(k) = l(k) - y2(k);
end
plot(t,l);
 title('n = 30的情况下，三次样条插值插值结果与原函数比较');
hold on
plot(t,y2);

% plot(t,e);
% title('n=30的情况下，三次样条函数的误差');

% for i = 1:n
%     o = ['在',num2str(x(i)),num2str(x(i+1)),'之间，函数表达式为：'];
%     alpha = (1+2*(t-x(i))/h(i))*((t-x(i+1))/h(i))^2;
%     alpha2 = (1+2*(-t+x(i+1))/h(i))*((t-x(i))/h(i))^2;
%     beta = (t-x(i))*((t-x(i+1))/h(i))^2;
%     beta2 = (t-x(i+1))*((t-x(i))/h(i))^2;
%     l = y(i)*alpha + y(i+1)*alpha2 +m(i)*beta+m(i+1)*beta2;
%     disp(o);
%     l
% end









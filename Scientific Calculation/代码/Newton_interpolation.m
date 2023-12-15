function p=Newton_interpolation(x,xi,yi)
%牛顿插值
% syms t;
% x=x(:);
% p=zeros(n+1,n+2);
% p(:,1)=x;p(:,2)=y(:);
% for k=3:n+2
%     p(k-1:n+1,k)=(p(k-1:n+1,k-1)-p(k-2:n,k-1))./(x(k-1:n+1)-x(k-2:n));
% end
% l=0;
% for k=1:n+1
%     q=1;
%     q=q*p(k,k+1);
%     for i=1:k-1
%         q=q*(t-x(i));
%     end
%     l=l+q;
% end


n=length(xi);
f=zeros(n,n);

% 对差商表第一列赋值
for k=1:n      
    f(k)=yi(k);
end
% 求差商表
for i=2:n       % 差商表从0阶开始；但是矩阵是从1维开始存储！！！！！！
    for k=i:n
        f(k,i)=(f(k,i-1)-f(k-1,i-1))/(xi(k)-xi(k+1-i));  
    end
end
% disp('差商表如下：');
% disp(f);

%求插值多项式
p=0;          
for k=2:n
    t=1;
    for j=1:k-1
        t=t*(x-xi(j));
%         disp(t);
    end
    p=f(k,k)*t+p;
%     disp(p)
end
p=f(1,1)+p;

end

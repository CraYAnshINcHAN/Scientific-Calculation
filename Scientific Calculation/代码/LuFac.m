function x = LuFac(A,b)

n = length(A);
[L1,U1] = lu(A);
L2 = U1';
U2 = L1';
y = zeros(1,n);
x = zeros(1,n);
% y(1) = b(1)/L2(1,1);
% for i = 2:n
%     y(i) = (b(i) - L2(i,i-1)*y(i-1))/((L2(i,i-1)*U2(i-1,i)+L2(i,i))-L2(i,i-1)*U2(i-1,i));
% end
% 
% x(n) = y(n);
% for i = n-1:1
%     x(i) = (y(i) - U2(i,i+1)*x(i+1));
% end
y = L2\b;
x = U2\y;

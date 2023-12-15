% 1、利用[-5,5]内的等分点，，作为插值结点，形成1/(1+x^2)的n次多项式插值
% 1）Lagrange插值法
% 2）Newton插值法
% 2、利用相同的等分点，构造三次样条函数插值
% 3、利用同样次数的切比雪夫多项式的根，作插值结点，构造插值多项式；
% 4、利用同样次数的勒让德多项式的根，作插值结点，构造插值多项式

%第一部分
n=30;
xmin=-5;xmax=5;
syms t;
f(t)=1/(1+t^2);
%划等分点函数（包括端点）
[x,y] = Equal_divide(xmin,xmax,f,n);


%Lagrange插值法
% l1=Lagrange_interpolation(n,x,y);
% [l1s,l1n] = polydegree(l1,t);

%画图像
% t = -5:0.1:5;
% y1 = eval(l1);
% y2 = eval(f(t));
% y3 = y1 - y2;
% limits = [-1 1];
% plot(t,y1);
% ylim(limits);
% title(['n = 30的情况下，多项式插值结果与原函数比较']);
% hold on
% plot(t,y2);


%性能分析
% TimetestLagrange(f,xmin,xmax,n);


%误差分析
% plot(t,y3);
% ylim(limits);
% title(['n = 30的情况下，多项式插值结果与原函数的误差']);


%Newton插值
% l2=Newton_interpolation(t,x,y);
% [l2s,l2n] = polydegree(l2,t);


%算函数
% t = -5:0.1:5;
% y1 = eval(l2);
% y2 = eval(f(t));
% y3 = y1 - y2;
% limits = [-1 1];


%画图像
% plot(t,y1);
% ylim(limits);
% title(['n = 30的情况下，Newton多项式插值结果与原函数比较']);
% hold on
% plot(t,y2);

%性能分析
% TimetestNewton(f,xmin,xmax,n);


%误差分析
%  plot(t,y3);
%  ylim(limits);
%  title(['n = 30的情况下，多项式插值结果与原函数的误差']);



% %三次样条插值
% [A,b] = Cubic_interpolation(n,x,y);



%构造Cheybyshev多项式并求根
% x3 =  5*cos((2*(0:n)+1)*pi/(2*(n+1)));
% y3 = zeros(1,n+1);


%求y3的值
% for i=1:n+1
%     y3(i)=f(x3(i));
% end


% %插值
% l3=Newton_interpolation(t,x3,y3);


% %画图像
% figure( 1 )
% t = -5:0.1:5;
% y1 = eval(l3);
% y2 = eval(f(t));
% y4 = y1 - y2;
% limits = [-1 1];
% plot(t,y1);
% ylim(limits);
% title('n = 30的情况下，使用切比雪夫多项式的解作插值节点的插值结果与原函数比较');
% hold on
% plot(t,y2);


%性能分析
% TimetestLagrange(f,xmin,xmax,n);


%误差分析
% figure( 3 )
% plot(t,y4);
% ylim(limits);
% title('n = 30的情况下，使用切比雪夫多项式的解作插值节点的插值结果与原函数的误差');




%构造Legendre多项式并求根
% x4 = 5*double(solve(legendreP(n+1,t),t));
% x4 = x4';
% y4 = zeros(1,n+1);
%求y4的值
% for i=1:n+1
%     y4(i)=f(x4(i));
% end
%插值
% l4=Newton_interpolation(t,x4,y4);


% %画图像
% figure( 1 )
% t = -5:0.1:5;
% y1 = eval(l4);
% y2 = eval(f(t));
% y4 = y1 - y2;
% limits = [-1 1];
% plot(t,y1);
% ylim(limits);
% title('n = 30的情况下，使用勒德让多项式的解作插值节点的插值结果与原函数比较');
% hold on
% plot(t,y2);


%性能分析
% TimetestLagrange(f,xmin,xmax,n);


%误差分析
% figure( 3 )
% plot(t,y4);
% ylim(limits);
% title('n = 30的情况下，使用勒德让多项式的解作插值节点的插值结果与原函数的误差');




%第二部分
%Cholesky分解
% L = Cholesky(A,length(A));
% 两种LU分解（L是单位下三角，U是上三角；L是下三角，U是单位下三角）
% [L1,U1] = lu(A);
% L2 = U1';
% U2 = L1';
%利用书中的追赶法进行求解
x = LuFac(A,b);
%系数矩阵（无穷范数，1-范数，2-范数下的）条件数
cond1 = cond(A,1);
cond2 = cond(A,2);
condInf = cond(A,"inf");
%判断Jacobi迭代是否收敛；编写Jacobi迭代的程序，画出残差随迭代步数下降的曲线；
JacobiJudge(A);
Jacobi(A,b);
% 判断Gauss-Seidel迭代是否收敛；编写Gauss-Seidel迭代的程序，画出残差随迭代步数下降的曲线
GSJudge(A);
GS2(A,b);





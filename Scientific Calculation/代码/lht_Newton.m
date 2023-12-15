% 1、利用[-5,5]内的等分点，，作为插值结点，形成1/(1+x^2)的n次多项式插值
% 1）Lagrange插值法
% 2）Newton插值法
% 2、利用相同的等分点，构造三次样条函数插值
% 3、利用同样次数的切比雪夫多项式的根，作插值结点，构造插值多项式；
% 4、利用同样次数的勒让德多项式的根，作插值结点，构造插值多项式
clc
clear
%第一部分
n=10;
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
 l2=Newton_interpolation(t,x,y);
% [l2s,l2n] = polydegree(l2,t);


%算函数
 t = -5:0.01:5;
 y1 = eval(l2);
 y2 = eval(f(t));
% y3 = y1 - y2;
%  limits = [-1 1];


%画图像
 plot(x,y,'o',t,y1,'b');
%  ylim(limits);
 title(['n = 10的情况下，Newton多项式插值结果与原函数比较']);
 hold on
 plot(t,y2);

%性能分析
% TimetestNewton(f,xmin,xmax,n);


%误差分析
%  plot(t,y3);
%  ylim(limits);
%  title(['n = 30的情况下，多项式插值结果与原函数的误差']);
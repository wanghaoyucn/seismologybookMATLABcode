function [shear,sigma]=shearnormal(S,n)
%根据应力张量表达求解应力张量S在法向为n的面上的剪应力shear和正应力sigma的程序
%S为应力张量，是对角线对称的3*3的矩阵，n为3*1的矩阵，表示三维向量
%输出shear表示剪切应力，sigma表示正应力
t=S*n;   %根据面法向量和应力张量得到该面上的应力矢量
sigma=n'*t;  %根据(2-1-15)得到正应力
shear=sqrt(sum(t.^2)-sigma^2);   %根据(2-1-16)得到剪切应力，sum函数是将所有的元素累加起来,” .^2”表示矩阵的每个元素的平方
return

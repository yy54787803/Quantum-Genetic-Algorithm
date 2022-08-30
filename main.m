
clc
clear
close all

%% 设定量子遗传算法参数
popsize =20;   
lenchrom = [20, 20];
Step = 200;

%% 

tic;% 开始计时

QGA(popsize, lenchrom, Step);  % 0表示不保存IMF，1，导出IMF并保存
toc;% 结束计时

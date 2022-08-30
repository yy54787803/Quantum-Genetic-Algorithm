%将二进制种群转化为实数种群，并计算个体适应值
function [fitness, X] = FitnessFunction(binary, lenchrom)
popsize = size(binary, 1);
fitness = zeros(1, popsize);  %存储适应度值
num = size(lenchrom, 2);   %参数个数
X = zeros(popsize, num);   %存储实数种群
bound = [-2.048, 2.048; -2.048, 2.048];  %参数取值范围
for i =1:popsize
    x = zeros(1, num);  %存储二进制对应的实数
    n = 1;  %控制染色体截段
    for m=1:num
        for j = lenchrom(m)-1:-1:0
            x(m) = x(m) + binary(i, n)*2^j;
            n = n+1;
        end
    end
    X(i, :) = bound(:, 1)' + x./ (2 .^lenchrom-1) .*(bound(:, 2) - bound(:, 1))' ;  %边界约束
    fitness(i) = 100*(X(i, 1)^2 - X(i, 2))^2 + (1-X(i, 1))^2;
end
end



















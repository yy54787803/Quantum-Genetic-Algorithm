%由量子门旋转进化产生最优解
%popsize为种群规模， lenchrom为每个参数的量子比特位数，Step为迭代次数
%输出最优解与最优值
function [bestX, bestY] = QGA(popsize, lenchrom, Step)
trace = zeros(Step, 2);                                                                %存储每代的最优值
best = struct('fitness', 0, 'X', [], 'binary', [], 'chrom', []);            %结构数组
chrom = ones(popsize, sum(lenchrom), 2)/sqrt(2);                  %初始种群
binary = collapse(chrom);                                                         %测量算子
[fitness, X] = FitnessFunction(binary, lenchrom);                    %计算种群适应值
[best.fitness, bestindex] = max(fitness);                                   %记录最优个体
best.binary = binary(bestindex, :);                                           %最优二进制个体
best.chrom = chrom(bestindex, :, :);                                        %最优量子个体
best.X = X(bestindex, :);                                                        %最优实数个体
trace(1, :) = [best.fitness, mean(fitness)];                                %最优适应值
for step = 2:Step
    chrom = Qgate(chrom, fitness, binary, best);                      %量子门旋转更新
    binary = collapse(chrom);
    [fitness, X] = FitnessFunction(binary, lenchrom);
    [newbestfitness, newbestindex] = max(fitness);                  %确定更新后种群
    if newbestfitness>best.fitness                                              %最优个体更新
        best.fitness = newbestfitness;
        best.binary = binary(newbestindex, :);
        best.chrom = chrom(bestindex, :, :);
        best.X = X(bestindex, :);
    end
    trace(step, :) = [best.fitness, mean(fitness)];
end
BestX = best.X;
BestY = best.fitness;
plot(1:Step, trace);
title('进化过程');
xlabel('进化代数');
ylabel('每代的最佳适应度');
end










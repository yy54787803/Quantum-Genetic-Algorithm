%通过旋转角选择策略计算量子种群的跃迁方向
%输入量子种群、适应度、二进制种群和最优个体
%输出新的量子种群
function chrom = Qgate(chrom, fitness, binary, best)
popsize = size(chrom, 1);
N = size(binary, 2);
for i = 1:popsize
    for j = 1:N
        alpha = chrom(i, j, 1);   %当前解的比特振幅
        beta = chrom(i, j, 2);
        x = binary(i, j);          %当前解对应的二进制数值
        b = best.binary(j);     %最优解的二进制数值
        if ((x==0)&&(b==0)) || ((x==1)&&(b==1))   %旋转方向
            delta = 0;
            s = 0;
        elseif ((x==0)&&(b==1)) || (fitness(i)<best.fitness)
            delta = 0.01*pi;
            if alpha*beta>0
                s = 1;
            elseif alpha*beta<0
                s = -1;
            elseif alpha == 0
                s = 0;
            elseif beta == 0
                s = sign(randn);
            end
        elseif((x==0)&&(b==1)) || (fitness(i)>=best.fitness)
            delta = 0.01*pi;
            if alpha*beta>0
                s = -1;
            elseif alpha*beta<0
                s = 1;
            elseif alpha == 0
                s = sign(randn);
            elseif beta == 0
                s = 0;
            end
            elseif ((x==1)&&(b==0)) || (fitness(i)<best.fitness)
            delta = 0.01*pi;
            if alpha*beta>0
                s = -1;
            elseif alpha*beta<0
                s = 1;
            elseif alpha == 0
                s = sign(randn);
            elseif beta == 0
                s = 0;
            end
            elseif ((x==1)&&(b==0)) || (fitness(i)>=best.fitness)
            delta = 0.01*pi;
            if alpha*beta>0
                s = 1;
            elseif alpha*beta<0
                s = -1;
            elseif alpha == 0
                s = 0;
            elseif beta == 0
                s = sign(randn);
            end
        end
        e = s*delta;   %旋转角度
        U = [cos(e), -sin(e); sin(e), cos(e)];  %薛定谔矩阵
        y = U*[alpha;beta]; %量子门更新
        chrom(i, j, :) = y;   %新的比特振幅
    end
end
end
































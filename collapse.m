%将比特种群转换为0-1种群
function binary = collapse(chrom)
popsize = size(chrom, 1);  %种群规模
N = size(chrom, 2);%染色体长度
binary = zeros(popsize, N);%记录二进制种群
for i = 1:popsize
    for j = 1:N
        pick = rand;%当随机数大于alpha时取， 否则为0
        if pick>(chrom(i, j, 1)^2)
            binary(i, j)=1;
        else
            binary(i, j) = 0;
        end
    end
end
end





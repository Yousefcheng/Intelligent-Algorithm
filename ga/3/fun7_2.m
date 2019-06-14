NIND=80;  %种群中个体数目（染色体）：80
MAXGEN=500;  %最大遗传代数为：500
NVAR=20;  %变量维数为20
PRECI=20;  %变量的二进制位数为：20
GGAP=0.9;  %使用代沟为：0.9
trace=zeros(MAXGEN,2);  %寻优结果的初值
FieldD=[repmat(PRECI,[1,NVAR]);...
    repmat([-512;512],[1,NVAR]);...
    repmat([1;0;1;1],[1,NVAR])];  %区域描述器
Chrom=crtbp(NIND,NVAR*PRECI);  %初始种群
gen=0;  %代计数器
variable=bs2rv(Chrom,FieldD);  %计算初始种群的十进制转换
ObjV=objfun1(variable);  %objfun1为De Jong函数
while gen<MAXGEN
    FitnV=ranking(ObjV);  %分配适应度值
    SelCh=select('sus',Chrom,FitnV,GGAP);  %选择
    SelCh=recombin('xovsp',SelCh,0.7);  %重组，交叉
    SelCh=mut(SelCh);%变异 
    variable=bs2rv(SelCh,FieldD);  %子代个体的十进制转换
    ObjVSel=objfun1(variable);  %计算子代的目标函数值
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);  %重插入子代的新种群
    gen=gen+1;  %代计数器增加 
%     X=bs2rv(Chrom(I,:),FieldD);
    trace(gen,1)=min(ObjV);  %遗传算法性能追踪
    trace(gen,2)=sum(ObjV)/length(ObjV);
%     disp([gen,Y,trace(2,gen)]);  %显示中间过程
end
figure(1)
plot(trace(:,1),'-bo');grid;
figure(2)
plot(trace(:,2)','-.');
legend('解的变化','种群均值的变化');grid;

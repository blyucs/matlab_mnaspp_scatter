clear;clc;
%rng('default'); %使rand函数每次运行都输出相同结果

%创建第三象限的单位圆数据data
data=rand([500,2]);
s=size(data);
for i=1:s(1)
    if (data(i,1)^2+data(i,2)^2)>1
data(i,:)=[0 0];
    end
end
data=-data;
plot(data(:,1),data(:,2),'.')%观察原始数据分布

%利用gamultiobj多目标优化算法内置的绘图函数来提取pareto前沿数据
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto,'PopulationSize',s(1),'InitialScores',data,'Generations',1);
[x,fval,exitflag,output,population,scores] = gamultiobj(@(x) x,2,[],[],[],[],[],[],options);
%fval即为pareto前沿数据

%利用fval数据重新绘制图形灵活度更高
clf;
% plot(x(:,1),x(:,2),'rp','MarkerSize',9)
plot(fval(:,1),fval(:,2),'rp','MarkerSize',9)
axis([-1,-0,-1,0])
set(gca,'XTick',-1:0.1:0,'YTick',-1:0.1:0)
xlabel('x');ylabel('y')
title('Patero Front')
set(gca,'Fontname','times new Roman','FontSize',12);
grid on

%将pareto前沿与原始数据绘制在同一张图上
hold on
plot(data(:,1),data(:,2),'k.')

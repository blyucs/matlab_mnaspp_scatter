clear
close all
%二维散点图
% 82 baseline
% pkt_dir ='Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1320\' 
% 82 para-0.6
% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1522\'
% 19 para-0.3
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1550\'

%82 flops =-0.6
% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200803T2355\'

%19 delay =-0.6
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200803T1612\'

%19 flops add drop =-0.6
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200804T2242\'

%82 flops add drop =-0.3  (terninate by me , and continue to train from 549)
% pkt_dir =  'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200805T1327\'
% pkt_dir =  'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200806T0718\'

%19 delay=-0.3

%19 para  + flops + delay 

% 19 baseline
pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200806T0717\'


data=xlsread([pkt_dir,'genotypes.csv'])
o_reward = data(1:1000,1);
reward = data(1:1000,2)
epoch = data(1:1000,3)
params = data(1:1000,4)
delay = data(1:1000,5)
flops = data(1:1000,6)
mo_params_coe = data(1:1000,7)
mo_delay_coe = data(1:1000,8)
mo_flops_coe = data(1:1000,9)

S = 60; %坐标点的大小/尺寸
% 创建 figure

% scatte
figure1 = figure('WindowState','maximized');
createfigure(o_reward ,params, S, epoch, length(o_reward), figure1, 'Params', [0,0.8], [0.2,1.2])

% pareto_data = [params, o_reward]
% s=size(pareto_data);
% %利用gamultiobj多目标优化算法内置的绘图函数来提取pareto前沿数据
% options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto,'PopulationSize',s(1),'InitialScores',pareto_data,'Generations',1);
% [x,fval,exitflag,output,population,scores] = gamultiobj(@(x) x,2,[],[],[],[],[],[],options);

% % figure6 = figure('WindowState','maximized');
% pareto_data = [o_reward(700:800), params(700:800)]
% s=size(pareto_data);
% %利用gamultiobj多目标优化算法内置的绘图函数来提取pareto前沿数据
% options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto,'PopulationSize',s(1),'InitialScores',pareto_data,'Generations',1);
% % fitnessfcn = @(x)[-x]
% fun1 = @(x) x(1)^4-10*x(1)^2+x(1)*x(2)+x(2)^4-x(1)^2*x(2)^2;  %min f1(x1,x2)
% fun2 = @(x) x(2)^4-x(1)^2*x(2)^2+x(1)^4+x(1)*x(2);  %min f2(x1,x2) 
% fun1and2 = @(x) [fun1(x) fun2(x)];
% [x,fval,exitflag,output,population,scores] = gamultiobj(fun1and2,2,[],[],[],[],[],[],options);
% %fval即为pareto前沿数据

% scatter
figure2 = figure('WindowState','maximized');
createfigure(o_reward,flops , S, epoch, length(o_reward), figure2, 'Flops', [0,0.8], [0,15])
% scatter
figure3 = figure('WindowState','maximized');
createfigure(o_reward, delay , S, epoch, length(o_reward), figure3, 'Delay', [0,0.8], [0,3])


figure4 = figure('WindowState','maximized');
createfigure3d(params, flops, o_reward, 200, epoch, figure4)

% boxplot
figure5 = figure('WindowState','maximized');
% box_gap=40
box_num=40
len = 1000 %length(data)
% box_num=floor(len/box_gap)
box_gap = floor(len/box_num)

o_reward_box=  reshape(o_reward(1:box_num * box_gap),box_gap,box_num)
subplot(2,3,1)
boxplot(o_reward_box)
% 创建 ylabel
ylabel('original_reward');
% 创建 xlabel
xlabel('iterations');

reward_box=  reshape(reward(1:box_num * box_gap),box_gap,box_num)
subplot(2,3,2)
boxplot(reward_box)
% 创建 ylabel
ylabel('reward');
% 创建 xlabel
xlabel('iterations');

paras_box= reshape(params(1:box_num * box_gap),box_gap,box_num)
subplot(2,3,3)
boxplot(paras_box)
% 创建 ylabel
ylabel('paras');
% 创建 xlabel
xlabel('iterations');

flops_box=  reshape(flops(1:box_num * box_gap),box_gap,box_num)
subplot(2,3,4)
boxplot(flops_box)
% 创建 ylabel
ylabel('flops');
% 创建 xlabel
xlabel('iterations');

delay_box=  reshape(delay(1:box_num * box_gap),box_gap,box_num)
subplot(2,3,5)
boxplot(delay_box)
% 创建 ylabel
ylabel('delay');
% 创建 xlabel
xlabel('iterations');


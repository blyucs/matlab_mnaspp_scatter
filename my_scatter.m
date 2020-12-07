clear
close all
%二维散点图
% 82 baseline
% pkt_dir ='Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1320\' 
pareto_para = []
pareto_flops = []
pareto_delay = []

% 82 para-0.6
% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1522\'
% pareto_para = [802,789,989,883,737,981,860,972,626,950,196]
% 972： para： 0.29  f1-score: 94.5

% 19 para-0.3
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1550\'
% pareto_para = [866,703,456,56]
% 456  -- 0.28  -- f1-score  94.7

%82 flops =-0.6 without drop
% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200803T2355\'
% pareto_flops = [416,551,599,579,928,46]

%19 flops add drop =-0.6
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200804T2242\'
% pareto_flops = [908,778,976,829,950,810,762,805,653]
% 653 flops:1.48G   
% 805 flops: 1.18G 

%82 flops add drop =-0.3  (terninate by me , and continue to train from 549)
% pkt_dir =  'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200805T1327\'
% pareto_flops = [820,685,895,775,938,625]
% pkt_dir =  'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200806T0718\'

%19 delay =-0.6
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200803T1612\'
% pareto_delay = [525,873,592,818,919,980,924,826]
% 980 delay: 
% 924 delay: 

%19 delay=-0.3
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200807T2235\'
% pareto_delay = [273,148,7,322,345,252,585,366,983]

%19 para  + flops + delay 


% 19 baseline
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200806T0717\'
% pareto_para = [118,342,326,399,250,162,457,461,641,585,173]
% pareto_flops = [50,192,326,106,60,150,457,461,173]
% pareto_delay = [242,7,551,139,990,150,903,173]


%82 baseline reinforce
% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200808T0933\'

%19 para+flops+delay  -0.3
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200809T2002\'

%19 para+flops+delay  -0.6
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200811T2057\'


data_num = 1000
data=xlsread([pkt_dir,'genotypes.csv'])
o_reward = data(1:data_num,1);
reward = data(1:data_num,2)
epoch = data(1:data_num,3)
params = data(1:data_num,4)
delay = data(1:data_num,5)
flops = data(1:data_num,6)
mo_params_coe = data(1:data_num,7)
mo_delay_coe = data(1:data_num,8)
mo_flops_coe = data(1:data_num,9)

S = 150; %坐标点的大小/尺寸
% 创建 figure

% scatte
figure1 = figure('WindowState','maximized');
createfigure(o_reward ,params, S, epoch, length(o_reward), figure1, 'Params(M)', [0,0.74], [0.2,1.2],pareto_para)

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
createfigure(o_reward,flops , S, epoch, length(o_reward), figure2, 'FLOPs(G)', [0,0.75], [0,17],pareto_flops)
% scatter
figure3 = figure('WindowState','maximized');
createfigure(o_reward, delay , S, epoch, length(o_reward), figure3, 'Inference latency(s)', [0,0.75], [0,3],pareto_delay)


figure4 = figure('WindowState','maximized');
createfigure3d(params, flops, o_reward, 200, epoch, figure4)

% boxplot
figure5 = figure('WindowState','maximized');
% box_gap=40
box_num=40
% len = 1000 %length(data)
% box_num=floor(len/box_gap)
box_gap = floor(data_num/box_num)

o_reward_box=  reshape(o_reward(1:box_num * box_gap),box_gap,box_num)
subplot(2,2,1)
boxplot(o_reward_box)
% 创建 ylabel
ylabel('Accuracy', 'FontSize',20);
% 创建 xlabel
xlabel('Order of every bunch of 12 iterations', 'FontSize',20);
% set(axes1,'XTickLabelRotation',70)
set(gca,'XTickLabelRotation',70,'FontSize',12)

reward_box=  reshape(reward(1:box_num * box_gap),box_gap,box_num)
subplot(2,2,2)
boxplot(reward_box)
% 创建 ylabel
ylabel('reward');
% 创建 xlabel
xlabel('iterations');

paras_box= reshape(params(1:box_num * box_gap),box_gap,box_num)
subplot(2,2,3)
boxplot(paras_box)
% 创建 ylabel
ylabel('paras');
% 创建 xlabel
xlabel('iterations');

flops_box=  reshape(flops(1:box_num * box_gap),box_gap,box_num)
subplot(2,2,4)
boxplot(flops_box)
% 创建 ylabel
ylabel('flops');
% 创建 xlabel
xlabel('iterations');

% delay_box=  reshape(delay(1:box_num * box_gap),box_gap,box_num)
% subplot(2,3,5)
% boxplot(delay_box)
% % 创建 ylabel
% ylabel('delay');
% % 创建 xlabel
% xlabel('iterations');


clear;clc
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
o_reward = data(:,1);
reward = data(:,2)
epoch = data(:,3)
params = data(:,4)
delay = data(:,5)
flops = data(:,6)
mo_params_coe = data(:,7)
mo_delay_coe = data(:,8)
mo_flops_coe = data(:,9)

S = 60; %坐标点的大小/尺寸
% 创建 figure

% scatte
% figure1 = figure('WindowState','maximized');
% createfigure(o_reward,params , S, epoch, length(o_reward), figure1, 'Params', [0,0.8], [0.2,1.2])

% figure6 = figure('WindowState','maximized');
pareto_data = [o_reward(700:800), params(700:800)]
s=size(pareto_data);
%利用gamultiobj多目标优化算法内置的绘图函数来提取pareto前沿数据
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto,'PopulationSize',s(1),'InitialScores',pareto_data,'Generations',1);
[x,fval,exitflag,output,population,scores] = gamultiobj(@(x) x,2,[],[],[],[],[],[],options);
%fval即为pareto前沿数据

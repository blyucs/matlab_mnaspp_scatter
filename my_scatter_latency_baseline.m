clear
close all
%二维散点图
% 82 baseline
% pkt_dir ='Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1320\' 
pareto_para = []
pareto_flops = []
pareto_delay = []

%19 para  + flops + delay 

% 19 baseline
pkt_dir = 'D:\00_code\Multi-objective-NAS-for-efficient-PP\19_ckpt\ckpt\ckpt\_search_celebA_search_20200806T0717\'
pareto_para = [118,342,326,399,250,162,457,461,641,585,173]
pareto_flops = [50,192,326,106,60,150,457,461,173]
pareto_delay = [242,7,551,139,990,150,903,173]

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

% scatter
figure3 = figure('WindowState','maximized');
createfigure(o_reward, delay , S, epoch, length(o_reward), figure3, '推理时延', [0,0.75], [0,3],pareto_delay)

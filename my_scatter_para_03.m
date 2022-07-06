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
% pkt_dir = 'D:\00_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\ckpt\_search_celebA_search_20200731T1522\'
% pareto_para = [802,789,989,883,737,981,860,972,626,950,196]
% 972： para： 0.29  f1-score: 94.5

% 19 para-0.3
% pkt_dir = 'X:\00_lvbo_dir\01_code\Multi-objective-NAS-for-efficient-PP\src\ckpt\_search_celebA_search_20200731T1550\'
pkt_dir = 'D:\00_code\Multi-objective-NAS-for-efficient-PP\19_ckpt\ckpt\ckpt\_search_celebA_search_20200731T1550\'
pareto_para = [866,703,456,56]
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
createfigure(o_reward ,params, S, epoch, length(o_reward), figure1, '参数量（M）', [0,0.74], [0.2,1.2],pareto_para)


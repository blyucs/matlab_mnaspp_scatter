clear
close all

% pkt_dir = 'Y:\lvbo_dir\Multi-objective-NAS-for-efficient-PP\src\ckpt\batch_trainingcelebA_search_20200825T1035\'
% data=xlsread([pkt_dir,'genotypes.csv'])
% num = data(:,2);
% o_reward = data(:,3);
% reward = data(:,4)


data=xlsread(['./','ablation_compare_scatter.csv'])
num = data(:,1);
o_reward = data(:,2);
full_training_reward = data(:,3)
two_stage_with_kd = data(:,4)
two_stage_without_kd = data(:,5)
one_stage_from_scratch = data(:,6)

figure0 = figure('WindowState','maximized');
% 创建 axes
axes0 = axes('Parent',figure0);
hold(axes0,'on');
S= 200
% 创建 scatter
h = scatter(o_reward,full_training_reward,S,'DisplayName','Architectures','MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);
% 创建 ylabel
xlabel('Original evaluation of the architectures(Search stage)', 'FontSize',30);
set(gca,'xtick',0.2:0.05:0.7)
% 创建 xlabel
ylabel('Full training accuracy', 'FontSize',30);
grid(axes0,'on');
set(axes0,'GridAlpha',0.35,'FontSize',30);
% 创建 legend
legend0 = legend(axes0,'show');
set(legend0,...
    'Position',[0.146006946555442 0.838444215101622 0.136458330058182 0.0509355495414714]);


figure1 = figure('WindowState','maximized'); % no use
% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
S= 200
% 创建 scatter
h = scatter(num,o_reward,S,'DisplayName','Direct training from scratch','MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0],'Marker','square');
hold on
g = scatter(num,full_training_reward,S,'DisplayName','Two-stage training with pre-computing','MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);
% 创建 ylabel
xlabel('Original evaluation of the architectures');

% 创建 xlabel
ylabel('Full training accuracy');
grid(axes1,'on');
set(axes1,'FontSize',30);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.179340281503068 0.80647955840029 0.244791660162931 0.0691268172060874]);


figure2 = figure('WindowState','maximized');
% 创建 axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');
S= 200
plot(num,two_stage_with_kd,'linestyle','-', 'color', 'r', 'linewidth',3)
plot(num,two_stage_without_kd,'linestyle','--', 'color', 'b', 'linewidth',3)
% 创建 scatter
h2 = scatter(num,two_stage_with_kd,S,'MarkerFaceColor','flat','MarkerEdgeColor',[1 0 0],'Marker','square');
% hold on
g2 = scatter(num,two_stage_without_kd,S,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 1]);

% 创建 ylabel
xlabel('Architectures');
% 创建 xlabel
ylabel('Accuracy(Reward)');

grid(axes2,'on');
set(axes2,'GridAlpha',0.35,'FontSize',30);
set(gca,'xtick',1:1:30)
% 创建 legend
legend2 = legend('    Two-stage training with KD','    Two-stage training without KD'); 
set(legend2,...
    'Position',[0.179340281503068 0.80647955840029 0.244791660162931 0.0691268172060874]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure3 = figure('WindowState','maximized');
% 创建 axes
axes3 = axes('Parent',figure3);
hold(axes3,'on');
S= 200
plot(num,two_stage_without_kd,'linestyle','-', 'color', 'r', 'linewidth',3)
plot(num,one_stage_from_scratch,'linestyle','--', 'color', 'b', 'linewidth',3)
% 创建 scatter
h3 = scatter(num,two_stage_without_kd,S,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0],'Marker','square');
hold on
g3 = scatter(num,one_stage_from_scratch,S,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);
% 创建 ylabel
xlabel('Architectures');
% 创建 xlabel
ylabel('Accuracy(Reward)');
ylim(axes3,[0,0.7])
grid(axes3,'on');
set(axes3,'GridAlpha',0.35,'FontSize',30);
set(gca,'xtick',1:1:30)
% 创建 legend
legend3 = legend('    Two-stage training without KD','    One-stage training from scratch'); 
set(legend3,...
    'Position',[0.179340281503068 0.80647955840029 0.244791660162931 0.0691268172060874]);



% % 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,x_lim);
% 取消以下行的注释以保留坐标区的 Y 范
%     ylim(axes1,[0.2 1.2]);
% ylim(axes1,y_lim)


% figure  ACCURACY SCATTER OF EG1800 
% FLOPs = [0.51, 14.5, 13.4, 0.73]
% Params = [2.1, 12.8, 2.1, 2.03 ]
% ACC = [96.6, 95.55, 94.6, 96.7]
% NAME = ['   pp';'   xx';'   xx';'   ww']

% figure2 = figure('WindowState','maximized');
% % 创建 axes
% axes1 = axes('Parent',figure2);
% hold(axes1,'on');
% S= 100
% % 创建 scatter
% h1 = scatter(FLOPs,ACC,S,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);
% for i=1:length(FLOPs)
%    text(FLOPs(i),ACC(i),num2str(NAME(i,:))) 
% end

% figure3 = figure('WindowState','maximized');
% % 创建 axes
% axes1 = axes('Parent',figure3);
% hold(axes1,'on');
% S= 100
% % 创建 scatter
% h1 = scatter(Params,ACC,S,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);
% for i=1:length(Params)
%    text(Params(i),ACC(i),num2str(NAME(i,:))) 
% end

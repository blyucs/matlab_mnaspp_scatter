function createfigure3d(X1, Y1, Z1, S1, C1, figure1)
%CREATEFIGURE1(X1, Y1, Z1, S1, C1)
%  X1:  scatter3 x
%  Y1:  scatter3 y
%  Z1:  scatter3 z
%  S1:  scatter3 s
%  C1:  scatter3 c

%  �� MATLAB �� 01-Aug-2020 11:35:14 �Զ�����

% ���� figure

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� scatter3
scatter3(X1,Y1,Z1,S1,C1,'Marker','.');

% ���� zlabel
zlabel('o_reward');

% ���� ylabel
ylabel('flops');

% ���� xlabel
xlabel('paras');

view(axes1,[-37.5 30]);
grid(axes1,'on');
% ���� colorbar
colorbar('peer',axes1);


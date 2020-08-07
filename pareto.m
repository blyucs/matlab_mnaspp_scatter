clear;clc;
%rng('default'); %ʹrand����ÿ�����ж������ͬ���

%�����������޵ĵ�λԲ����data
data=rand([500,2]);
s=size(data);
for i=1:s(1)
    if (data(i,1)^2+data(i,2)^2)>1
data(i,:)=[0 0];
    end
end
data=-data;
plot(data(:,1),data(:,2),'.')%�۲�ԭʼ���ݷֲ�

%����gamultiobj��Ŀ���Ż��㷨���õĻ�ͼ��������ȡparetoǰ������
options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto,'PopulationSize',s(1),'InitialScores',data,'Generations',1);
[x,fval,exitflag,output,population,scores] = gamultiobj(@(x) x,2,[],[],[],[],[],[],options);
%fval��Ϊparetoǰ������

%����fval�������»���ͼ�����ȸ���
clf;
% plot(x(:,1),x(:,2),'rp','MarkerSize',9)
plot(fval(:,1),fval(:,2),'rp','MarkerSize',9)
axis([-1,-0,-1,0])
set(gca,'XTick',-1:0.1:0,'YTick',-1:0.1:0)
xlabel('x');ylabel('y')
title('Patero Front')
set(gca,'Fontname','times new Roman','FontSize',12);
grid on

%��paretoǰ����ԭʼ���ݻ�����ͬһ��ͼ��
hold on
plot(data(:,1),data(:,2),'k.')

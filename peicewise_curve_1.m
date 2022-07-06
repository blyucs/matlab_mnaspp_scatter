clear
close all  
% para=0.3:0.01:1;
% r = 0.3:0.01:0.8;
% P = 0.5
% R=r*power(para/P,-0.3);
% surf(r,para,R);
figure1 = figure('PaperOrientation','landscape','PaperType','<custom>',...
    'PaperSize',[30.5 17.5],...
    'WindowState','maximized');
para=linspace(0,1,30);
r=linspace(0,0.8,30);
P=0.5

x=linspace(0,1,30); %para
y = linspace(0,0.8,30); % r
[xx,yy] = meshgrid(x,y);
z1 = yy.*power(xx./P,0);
z2 = yy.*power(xx./P,-0.6);
mask1 = (xx < 0.6) &(yy<0.25);
mask2 = (xx >= 0.6) | (yy>=0.25);
z1(~mask1)=NaN;
z2(~mask2)=NaN;
%subplot(1,2,2)
surf(xx,yy,z1);hold on;surf(xx,yy,z2);
xlabel('FLOPs(G)','FontSize',30,'Rotation',15);ylabel('Ô­Ê¼½±Àø','FontSize',30,'Rotation',-15);zlabel('½±Àø','FontSize',30);

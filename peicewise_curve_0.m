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
[x,y]=meshgrid(para,r);
z=y.*power(x./P,-0.6);
% z=x.^2+2*y.^2;
%subplot(1,2,1)
surf(x,y,z)
xlabel('FLOPs(G)','FontSize',30,'Rotation',15);ylabel('Ô­Ê¼½±Àø','FontSize',30,'Rotation',-15);zlabel('½±Àø','FontSize',30);
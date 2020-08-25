clear
close all  
% para=0.3:0.01:1;
% r = 0.3:0.01:0.8;
% P = 0.5
% R=r*power(para/P,-0.3);
% surf(r,para,R);
figure(1)
para=linspace(0,1,30);
r=linspace(0,0.8,30);
P=0.5
[x,y]=meshgrid(para,r);
z=y.*power(x./P,-0.6);
% z=x.^2+2*y.^2;
subplot(1,2,1)
surf(x,y,z)
xlabel('Parameters(M)','FontSize',20,'Rotation',25);ylabel('Original reward','FontSize',20,'Rotation',-40);zlabel('Reward','FontSize',20);

x=linspace(0,1,30); %para
y = linspace(0,0.8,30); % r
[xx,yy] = meshgrid(x,y);
z1 = yy.*power(xx./P,0);
z2 = yy.*power(xx./P,-0.6);
mask1 = (xx < 0.2) &(yy<0.3);
mask2 = (xx >= 0.2) | (yy>=0.3);
z1(~mask1)=NaN;
z2(~mask2)=NaN;
subplot(1,2,2)
surf(xx,yy,z1);hold on;surf(xx,yy,z2);
xlabel('Parameters(M)','FontSize',20,'Rotation',25);ylabel('Original reward','FontSize',20,'Rotation',-40);zlabel('Reward','FontSize',20);

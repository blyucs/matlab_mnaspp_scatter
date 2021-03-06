clear
X4058_300=[
0.6010 0.6847 0.6798 0.6700 0.6059 0.6749 0.6453 0.6502 0.6847 0.6700 0.5813 0.6404 0.6749 0.6749 0.6650 0.6502 0.6749 0.6305 0.6355 0.7143; 
0.6207 0.6650 0.6847 0.6749 0.5961 0.6601 0.6404 0.6700 0.6946 0.6897 0.6059 0.6749 0.6650 0.6749 0.6453 0.6502 0.6700 0.6256 0.6256 0.6995 ;
0.6601 0.6700 0.7340 0.7044 0.6355 0.7241 0.6798 0.6897 0.7094 0.6946 0.6256 0.6798 0.7044 0.7389 0.6700 0.6749 0.7143 0.6650 0.6059 0.6502; 
0.7291 0.6108 0.7192 0.7537 0.5862 0.6355 0.6010 0.7143 0.6946 0.6897 0.6453 0.7685 0.7635 0.6404 0.7094 0.7143 0.6108 0.6552 0.7389 0.6897;
0.7044 0.7044 0.7044 0.6847 0.7143 0.6700 0.6650 0.7438 0.7143 0.7143 0.6601 0.6502 0.6995 0.7586 0.7488 0.6897 0.6700 0.6946 0.6897 0.6897; 
0.6355 0.6847 0.7291 0.7143 0.6700 0.7438 0.6700 0.6650 0.7192 0.7044 0.6355 0.6847 0.6749 0.7094 0.6798 0.6453 0.7241 0.6946 0.6108 0.6700 ]
 
  
 
X4058_400 =[
0.5922 0.6408 0.6408 0.5825 0.6505 0.6796 0.6214 0.6796 0.6311 0.6505 0.5825 0.6699 0.6602 0.6602 0.7282 0.6602 0.6699 0.7087 0.6505 0.6505 ;
0.6117 0.6311 0.6602 0.6117 0.6505 0.6796 0.6214 0.6990 0.6990 0.6311 0.5922 0.6796 0.6699 0.6408 0.7184 0.6505 0.6602 0.7087 0.6214 0.6796; 
0.6311 0.7184 0.7573 0.6893 0.6311 0.6990 0.6408 0.7087 0.7379 0.6990 0.6699 0.7184 0.6699 0.6699 0.7184 0.6893 0.6699 0.6990 0.6214 0.6990; 
0.6602 0.6311 0.7379 0.6408 0.5922 0.7282 0.5728 0.7087 0.7379 0.7379 0.5728 0.7767 0.7476 0.6214 0.7476 0.6214 0.7379 0.6893 0.6019 0.6699 ;
0.6214 0.7476 0.6311 0.6699 0.6699 0.6311 0.6214 0.6699 0.6796 0.6505 0.5922 0.6796 0.7184 0.6893 0.8058 0.6699 0.6602 0.7184 0.6796 0.6796 ;
0.6117 0.6893 0.7282 0.6602 0.7573 0.7379 0.6408 0.7184 0.7087 0.7087 0.6990 0.6796 0.6214 0.6311 0.7573 0.6602 0.7379 0.6796 0.6796 0.7282 ;]
 
%load BoxPlotData
 
x01=X4058_300;
x02=X4058_400;
 
x1 = [x01(1,:);x02(1,:)]';
x2 = [x01(2,:);x02(2,:)]';
x3 = [x01(3,:);x02(3,:)]';
x4 = [x01(4,:);x02(4,:)]';
x5 = [x01(5,:);x02(5,:)]';
x6 = [x01(6,:);x02(6,:)]';
f=figure(1)
x = [x1;x2;x3;x4;x5;x6]; x = x(:);
g1 = [ones(size(x1)); 2*ones(size(x2)); 3*ones(size(x3));4*ones(size(x4));...
    5*ones(size(x5));6*ones(size(x6));]; g1 = g1(:);
g2 = repmat(1:2,120,1); g2 = g2(:);
positions = [[1:6],[7:12]];
bh=boxplot(x, {g2,g1},'notch','on','whisker',1,'colorgroup',g1, 'factorgap',[8 1],'symbol','.','outliersize',4,'widths',0.6,'positions',positions)
xlabel('Training data size');
ylabel('Mean zero-one error')
grid on
set(gca,'YLim',[0.45,0.85],'gridLineStyle', '-.');
 
set(bh,'linewidth',1.2);
 
color = ['c', 'y', 'g', 'b','o', 'b','c', 'y', 'g', 'b','o', 'b'];
h = findobj(gca,'Tag','Box');
mk=findobj(gca,'tag','Outliers'); % Get handles for outlier lines.
set(mk,'Marker','o'); % Change symbols for all the groups.
 for j=1:length(h)/2
    patch(get(h(j),'XData'),get(h(j),'YData'),color(4),'FaceAlpha',0.01*j);
 end
  for j=(length(h)/2+1):length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),color(4),'FaceAlpha',0.01*(j-length(h)/2));
 end
 
set(gca,'xtick',[7.5])
% set(gca,'xtick',[]);
set(gca,'XTickLabel',{' '})
  
% Create textbox
annotation(f,'textbox',...
    [0.3 0.075 0.035 0.075],...
    'String',{'300'},...
    'FitBoxToText','off',...
    'EdgeColor','none');
 
% Create textbox
annotation(f,'textbox',...
    [0.7 0.075 0.035 0.075],...
    'String','400',...
    'FitBoxToText','off',...
    'EdgeColor','none');
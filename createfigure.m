function createfigure(X1, Y1, S1, C1, point_num, figure1, type, x_lim,  y_lim)
%CREATEFIGURE1(X1, Y1, S1, C1)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c

%  �� MATLAB �� 23-Jul-2020 14:39:22 �Զ�����

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� scatter
h = scatter(X1,Y1,S1,C1,'MarkerFaceColor','flat','MarkerEdgeColor',[0 0 0]);

% ���� ylabel
xlabel(type,'FontSize',20);

% ���� xlabel
ylabel('Accuracy','FontSize',20);

% % ȡ�������е�ע���Ա����������� X ��Χ
xlim(axes1,x_lim);
% ȡ�������е�ע���Ա����������� Y ��
%     ylim(axes1,[0.2 1.2]);
ylim(axes1,y_lim)

grid(axes1,'on');
% ������������������
set(axes1,'CLim',[0 point_num],'Colormap',...
    [0.941176474094391 0.941176474094391 0.941176474094391;0.926237165927887 0.926237165927887 0.926237165927887;0.911297857761383 0.911297857761383 0.911297857761383;0.896358549594879 0.896358549594879 0.896358549594879;0.881419241428375 0.881419241428375 0.881419241428375;0.866479933261871 0.866479933261871 0.866479933261871;0.851540625095367 0.851540625095367 0.851540625095367;0.836601316928864 0.836601316928864 0.836601316928864;0.82166200876236 0.82166200876236 0.82166200876236;0.806722700595856 0.806722700595856 0.806722700595856;0.791783392429352 0.791783392429352 0.791783392429352;0.776844084262848 0.776844084262848 0.776844084262848;0.761904776096344 0.761904776096344 0.761904776096344;0.74696546792984 0.74696546792984 0.74696546792984;0.732026159763336 0.732026159763336 0.732026159763336;0.717086851596832 0.717086851596832 0.717086851596832;0.702147543430328 0.702147543430328 0.702147543430328;0.687208235263824 0.687208235263824 0.687208235263824;0.672268927097321 0.672268927097321 0.672268927097321;0.657329618930817 0.657329618930817 0.657329618930817;0.642390310764313 0.642390310764313 0.642390310764313;0.627451002597809 0.627451002597809 0.627451002597809;0.612511694431305 0.612511694431305 0.612511694431305;0.597572386264801 0.597572386264801 0.597572386264801;0.582633078098297 0.582633078098297 0.582633078098297;0.567693769931793 0.567693769931793 0.567693769931793;0.552754461765289 0.552754461765289 0.552754461765289;0.537815153598785 0.537815153598785 0.537815153598785;0.522875845432281 0.522875845432281 0.522875845432281;0.507936537265778 0.507936537265778 0.507936537265778;0.492997199296951 0.492997199296951 0.492997199296951;0.478057891130447 0.478057891130447 0.478057891130447;0.463118582963943 0.463118582963943 0.463118582963943;0.44817927479744 0.44817927479744 0.44817927479744;0.433239966630936 0.433239966630936 0.433239966630936;0.418300658464432 0.418300658464432 0.418300658464432;0.403361350297928 0.403361350297928 0.403361350297928;0.388422042131424 0.388422042131424 0.388422042131424;0.37348273396492 0.37348273396492 0.37348273396492;0.358543425798416 0.358543425798416 0.358543425798416;0.343604117631912 0.343604117631912 0.343604117631912;0.328664809465408 0.328664809465408 0.328664809465408;0.313725501298904 0.313725501298904 0.313725501298904;0.298786193132401 0.298786193132401 0.298786193132401;0.283846884965897 0.283846884965897 0.283846884965897;0.268907576799393 0.268907576799393 0.268907576799393;0.253968268632889 0.253968268632889 0.253968268632889;0.239028945565224 0.239028945565224 0.239028945565224;0.22408963739872 0.22408963739872 0.22408963739872;0.209150329232216 0.209150329232216 0.209150329232216;0.194211021065712 0.194211021065712 0.194211021065712;0.179271712899208 0.179271712899208 0.179271712899208;0.164332404732704 0.164332404732704 0.164332404732704;0.1493930965662 0.1493930965662 0.1493930965662;0.134453788399696 0.134453788399696 0.134453788399696;0.119514472782612 0.119514472782612 0.119514472782612;0.104575164616108 0.104575164616108 0.104575164616108;0.089635856449604 0.089635856449604 0.089635856449604;0.0746965482831001 0.0746965482831001 0.0746965482831001;0.0597572363913059 0.0597572363913059 0.0597572363913059;0.044817928224802 0.044817928224802 0.044817928224802;0.029878618195653 0.029878618195653 0.029878618195653;0.0149393090978265 0.0149393090978265 0.0149393090978265;0 0 0]);
% ���� colorbar
colorbar('peer',axes1);

% ���������α�ѡȡģʽ���α�Ļص���������Ϊ�Զ����fun_NewCallbackForScatter3
hd = datacursormode;
hd.UpdateFcn = @(obj,event_obj) NewCallBackFunc(obj,event_obj);
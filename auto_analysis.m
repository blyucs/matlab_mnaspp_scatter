clear
data=xlsread('static.xlsx','Sheet7');
box_gap=25
len = length(data)
box_num=len/box_gap
o_reward=  reshape(data(1:box_gap*box_num,1),box_gap,len/box_gap)
subplot(2,4,1)
boxplot(o_reward)
paras=  reshape(data(1:box_gap*box_num,7),box_gap,len/box_gap)
subplot(2,4,2)
boxplot(paras)
    
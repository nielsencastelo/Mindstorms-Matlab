clear;clc;close all;
p = 4;
t = 2;
net = newff(p,[1 4 1],{'tansig' 'tansig' 'purelin'},'trainlm');
net.trainParam.show = 5;
net.trainParam.epochs = 1000;% Máximo nº épocas: 10000
net.trainParam.goal = 1e-6; % limite para o erro.
net.trainParam.lr = 0.05; %define a taxa de aprendizagem
net.trainParam.momentum = 0.9;

net = train(net,p,t);

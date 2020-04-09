% Visão Lego NXT
clear; clc; close all;
% Treinamento da base de dados
load base;

gtop    = rgb2gray(um(:,:,1:3));
segtop = edge(gtop, 'sobel');

gbotton  = rgb2gray(dois(:,:,1:3));
segbotton= edge(gbotton, 'sobel');
% left   = im2bw(esquerda);
% right  = im2bw(direita);

% Modifica as imagens para uma matriz (nxd)
[i j] = size(segbotton);
p1 = reshape(segtop,i*j,1);
p1 = abs(fft2(p1));
p1 = p1/norm(p1);
p2 = reshape(segbotton,i*j,1);
p2 = abs(fft2(p2));
p2 = p2/norm(p2);
% p3 = reshape(left,i*j,1);
% p4 = reshape(right,i*j,1);
p = [p1 p2];

% matriz identidade 2x2 é o desejado
t = eye(2);

% Parametros da RNA Backpropagation
net = newff(p,t,[35 10],{'tansig' 'logsig'},'traingd');
net.trainParam.epochs = 40;  % Número de épocas
net.trainParam.goal = 1e-45;   % Erro final desejado
net.trainParam.lr = 0.001;     % Taxa de aprendizado
net.trainParam.show = 25;     % Atualização na tela (epoca)
net.trainParam.mc = 0.9;      % Taxa de momento

% Treinamento
net = train(net, p, t);

% Parametros do NXT
% COM_CloseNXT('all');
% hNXT = COM_OpenNXT('bluetooth.ini');
% COM_SetDefaultNXT(hNXT);
% 
% frente = NXTMotor('BC');
% frente.Power = 30;
% frente.TachoLimit = 360;
% frente.SmoothStart        = true;   
% 
% esquerda = NXTMotor('B');
% esquerda.Power = 30;
% esquerda.TachoLimit = 540;
% esquerda.SmoothStart        = true;    
% 
% direita = NXTMotor('C');
% direita.Power = 30;
% direita.TachoLimit = 540;
% direita.SmoothStart        = true;   
% 
% tras = NXTMotor('BC'); % ajusta motor B C para ir pra frente
% tras.Power = -30;
% tras.TachoLimit = 360;
% tras.SmoothStart        = true;

% Parametros do video
vid = videoinput('winvideo',1,'YUY2_320x240');
set(vid,'TriggerRepeat',Inf);
set(vid, 'ReturnedColorSpace', 'rgb');
vid.FrameGrabInterval = 5;
start(vid);

% Classificação e ação do NXT
while(1)
    IM = getdata(vid,2);
    I = IM(:,:,:,1);
    IGray = rgb2gray(IM(:,:,1:3));
    ISeg = edge(IGray,'sobel');
    
    teste = reshape(ISeg,i*j,1);
    teste = abs(fft2(teste));
    y = sim(net,p2);
    yr = round(y);
    if (yr == t(:,1))
        disp('reconheceu');
        %tras.SendToNXT;
        %tras.WaitFor;
        break;
    end
    pause(0.05);
    subplot(2,2,1);imshow(I(:,:,:,1));title('Entrada Video-Imagem');
    subplot(2,2,2);imshow(ISeg);title('Imagem segmentada');
    subplot(2,2,3);imshow(segtop);title('Treinada segmentada');
    subplot(2,2,4);imshow(segbotton);title('Treinada segmentada');
    disp(yr);
end
stop(vid);
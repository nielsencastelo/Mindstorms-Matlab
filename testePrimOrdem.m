% Testa planta linear
clear;clc;close all;
k = 1;
INDEX =[ ];
% Entrada inicial
u = 1;
% Saida inicial
N = 50;
y = 0;
y_ind = [];
ref = 5;
refk = [];
while(k < N)
    y = planta(y,u,0.4,0.6);
    unt = u;
    [B1,B2,W1,W2] = RNA(y,u,1,10);
    y = simula(y,B1,B2,W1,W2);
    u = controlador(u,ref,y,W2*W1);
    
    % Visualiza os resultados
    refk = [refk ref];
    INDEX = [INDEX k];
    y_ind = [y_ind y];
    plot(INDEX,refk,INDEX,y_ind);
    pause(0.05);
    disp(k);
    k = k + 1;
end
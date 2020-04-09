% A seguinte função simula uma Rede Neural Backpropagation
%
% Entrada:  teste é os sinais de entrada (nxd)
%           B1 Bias da camada de entrada
%           B2 Bias da camada oculta
%           W1 peso da camada escondida
%           W2 peso da camada de saída
%
% Saída: 	y são sinais estimados (nxd)
%
%
%
% Author:   Nielsen C. Damasceno
% Date:     01.05.2011
function y = simula(teste,B1,B2,W1,W2)
    N = length(teste);
    t1 = repmat(B1,[N 1]);
    %H = logsig(entrada * W1 + t1);
    H = teste * W1 + t1;
    t2 = repmat(B2,[N 1]);
    y = H * W2 + t2; 
end
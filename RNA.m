% A seguinte função implementa uma RNA
% Entrada:  desejado,entrada
%           nhi é o número de neuronios da camada oculta
%           epoca é o número de iterações
% Saída: 	O BIAS e os Peso
%           
%
%
% Autor:   Nielsen C. Damasceno
% Data:     01.05.2011

function [B1 B2 W1 W2] = RNA(desejado,entrada,nhi,epoca)
        
    N = length(entrada);
    % Parametros da RNA
    nin = size(entrada,2);   % Número de neuronios na camada entrada
    nout = size(desejado,2); % Número de neurônios na camada de saída
    SSE =[ ];  INDEX=[ ];
    H = zeros(N,nhi);
    W1 = rand(nin,nhi);
    W2 = rand(nhi,1);
    B1 = rand; 
    B2 = rand;

    eta = 0.000001; % Taxa de aprendizagem
    for i = 1 : epoca
         for j = 1:N
            H = funcao(entrada * W1 + B1); 
            saida = H * W2 + B2;
            ERR_HO = desejado - saida; 
            ERR_IH = (H.*(1-H))'.*(sum(ERR_HO')'); 
            W2 = W2 + ERR_HO * H * eta; 
            W1 = W1 + ERR_IH * entrada * eta; 
            
            B1 = B1 + ERR_IH * eta; 
            B2 = B2 + ERR_HO * eta;            
         end
         INDEX = [INDEX i]; 
         SSE = [SSE sum(sum(ERR_HO.^2))];
    end
end
% Backpropagation
 NC_MAX = 6;   % Numero Maximo de Camadas
 NPTR_MAX = 6; % Numero Maximo de pontos de treinamento
 NN_MAX = 200; % Numero de Neuronios na Camada
 nn = 1:NC_MAX;% Numero de Neuronios na Camada
 w = 0;
 no = 0;
 dwanterior = 0;
 d = 0;
 sdw = 0;
 nptr = 0;
 eta = 0;
 alpha = 0;
 er_total = 0;
 threshold = -1;
 
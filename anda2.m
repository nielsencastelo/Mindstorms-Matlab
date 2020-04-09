% O robo dirige utilizando o sensor ultrasonic
% detecta obstáculo em aproximadamente 20 cm, ai para, da um beep, vira pra
% direita, e continua  o movimento. O robo repete 5 vezes

% clc;close all;clear;
% COM_CloseNXT('all');
% 
% hNXT = COM_OpenNXT('bluetooth.ini'); % Ajusta conexão
% COM_SetDefaultNXT(hNXT);
h = ConfigNXT('blu');

OpenUltrasonic(SENSOR_4); % Configura o sensor

frente = NXTMotor('BC'); % ajusta motor B C para ir pra frente
frente.Power = -30;
frente.TachoLimit = 0;

direita = NXTMotor('B'); % ajusta motor B para ir pra direita
direita.Power = 30;
direita.TachoLimit = 760;

esquerda = NXTMotor('C'); % ajusta motor C para ir pra esquerda
esquerda.Power = 30;
esquerda.TachoLimit = 760;
for i = 1:5
    while GetUltrasonic(SENSOR_4) > 20
        frente.SendToNXT(); % enviar o comando pra ir pra frente
                             % TachoLimit=0; não ha necessidade de delcarar o WaitFor()
    end
    frente.Stop('brake'); % robo para de andar pra frente
    NXT_PlayTone(400,300); % toca uma nota
    
    if rand > 0.5  % Escolhe aleatóriamente se vai pra esquerda ou direita        
        direita.SendToNXT;   % envia o comando de virar pra direita
        direita.WaitFor;     % TachoLimit não é zero; utiliza WaitFor()
    else
        esquerda.SendToNXT;  % envia o comando de virar pra esquerda
        esquerda.WaitFor;
    end
end
direita.Stop('off');   % desliga motores
frente.Stop('off');
CloseSensor(SENSOR_4); % desliga sensores
%COM_CloseNXT(hNXT);    % desliga configurações de handle
% O robo dirige utilizando o sensor ultrasonic
% detecta obstáculo em aproximadamente 20 cm, ai para, da um beep, vira pra
% direita, e continua  o movimento. O robo repete 5 vezes

clc;close all;clear;
COM_CloseNXT('all');
hNXT = COM_OpenNXT('bluetooth.ini'); % Ajusta conexão
COM_SetDefaultNXT(hNXT);

OpenUltrasonic(SENSOR_4); % Configura o sensor

frente = NXTMotor('B'); % ajusta motor B C para ir pra frente
frente.Power = 30;
frente.TachoLimit = 0;
frente.SmoothStart        = true;    % inicio suave

parking = NXTMotor('B');
parking.Power = 20;
parking.TachoLimit = 1000;
%parking.SmoothStart        = true;    % inicio suave
parking.ActionAtTachoLimit = 'coast'; % we want very smooth "braking", too :-)

while(1)
    while GetUltrasonic(SENSOR_4) > 15
        frente.SendToNXT(); % enviar o comando pra ir pra frente
                            % TachoLimit=0; não ha necessidade de delcarar o WaitFor()
    end
    frente.Stop('brake');
    pause(2);
    NXT_PlayTone(400,300); % toca uma nota
    parking.ResetPosition; % Reseta posição para calcular o tamanho do estacionamento
    parking.SendToNXT;
    parking.WaitFor;
    break;
end
frente.Stop('off');
parking.Stop('off');
tm = parking.ReadFromNXT;
cm = tm.Position/20;
disp(cm);
% Gira pra direita
direita = NXTMotor('A');
direita.Power = 20;
direita.TachoLimit = 40;
direita.SendToNXT;
direita.WaitFor;

% Marcha ré
tras = NXTMotor('B');
tras.Power = -20;
tras.TachoLimit = 560;
tras.SmoothStart        = true;    % inicio suave
tras.SendToNXT;
tras.WaitFor;

% Volante normal
normal = NXTMotor('A');
normal.Power = -20;
normal.TachoLimit = 40;
normal.SendToNXT
normal.WaitFor;

% Gira novamente para esquerda
normal = NXTMotor('A');
normal.Power = -20;
normal.TachoLimit = 40;
normal.SendToNXT
normal.WaitFor;

% Da marça ré novamente
tras = NXTMotor('B'); % 
tras.Power = -20;
tras.TachoLimit = 400;
tras.SmoothStart        = true;    % inicio suave
tras.SendToNXT;
tras.WaitFor;

normal = NXTMotor('A');
normal.Power = 20;
normal.TachoLimit = 40;
normal.SendToNXT;

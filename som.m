% Ester programa controla a rotação do motor de acordo com o som emitido
% no microfone do NXT
% clear;clc;close all;
% COM_CloseNXT('all');
% hNXT = COM_OpenNXT('bluetooth.ini'); % ajusta conexão
% COM_SetDefaultNXT(hNXT);

% configura motores
anda = NXTMotor('BC');
anda.Power = 0;
anda.TachoLimit = 0;
anda.SmoothStart = true;

% configura sensores
OpenSwitch(SENSOR_1);
OpenSound(SENSOR_2, 'DB');
while(1)
    status = GetSwitch(SENSOR_1); % Verifica se é 1
    if status % Desliga motores, sensores e sai do laço
        break
    end
    val = GetSound(SENSOR_2);
    val = floor(val/10.23);
    disp(val);
    anda.Power = val;
    anda.SendToNXT;
    
end
CloseSensor(SENSOR_2);
CloseSensor(SENSOR_1);
anda.Stop('off');

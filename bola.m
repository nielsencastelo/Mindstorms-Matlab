% O robô se move até para encontrar a bola zul
% Pega a bola e para
COM_CloseNXT all
% close all
% clear all
% 
h = ConfigNXT('blu');

% Configura Motores
b = NXTMotor(MOTOR_B);
b.ResetPosition();
b.Power = -30;
b.TachoLimit = 0;

c = NXTMotor(MOTOR_C);
c.ResetPosition();
c.Power = 30;
c.TachoLimit = 0;

b.SendToNXT();
c.SendToNXT();

% Ativa os sensores
OpenSwitch(SENSOR_1);
d = 0;
l = 0;

while true
    % Verifica de Swith é precionado para para o robô
    if GetSwitch( SENSOR_1 )
        break;
    end
    
    d = distancia;
    disp(d);
    
    if d <= 30
        posb = b.ReadFromNXT;
        posc = c.ReadFromNXT;
        b.Stop('brake');
        c.Stop('brake');
        NXT_PlayTone(400,300); % toca uma nota
        b.SendToNXT();
        c.SendToNXT();
        break;
    end
    
%     l = luz;
%     l = l/100;
%     
%     if l==2.22
%         disp('Bola azul')
%         break;
%     end
%     if l==4.54
%         disp('Bola vermelha');
%         break;
%     end
end

stb = b.ReadFromNXT;
stc = c.ReadFromNXT;
movb = abs(stb.TachoCount) - abs(posb.TachoCount);
movc = abs(stc.TachoCount) - abs(posc.TachoCount);

CloseSensor(SENSOR_1);
b.Stop('off');
c.Stop('off');
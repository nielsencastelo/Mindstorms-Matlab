% Constroi um objeto motor na porta B com potencia 60, e dasabilita 
% spead regulation, um TachoLimit de 360 e envia a configuração para o NXT

% clc;close all;clear;
% COM_CloseNXT('all');
% hNXT = COM_OpenNXT('bluetooth.ini'); % Ajusta conexão
% COM_SetDefaultNXT(hNXT);

motorB = NXTMotor('B', 'Power', 60);
motorB.SpeedRegulation     = false;
motorB.TachoLimit          = 360;
motorB.ActionAtTachoLimit  = 'Brake'; % this is the default anyway
motorB.SmoothStart         = true;
% enough setting up params, let's go!
motorB.SendToNXT();
motorB.WaitFor();
% Play tone when motor is ready to be used again
NXT_PlayTone(400,500);

% let's use a driving robot
%NXT_SetBrickName('NIESEN', hNXT);
m = NXTMotor('B', 'Power', 60);
m.TachoLimit         = 100;
m.SmoothStart        = true;    % inicio suave
m.ActionAtTachoLimit = 'coast'; % we want very smooth "braking", too :-)
m.SendToNXT();                  % go!
m.WaitFor();                    % are we there yet?
% we're here, motors are still moving / coasting, so give the bot time!
pause(3);
% you can still hear the synchronization (high noisy beeping)
% before we go back, we have to disable the synchronization quickly
m.Stop();
% reverse direction
m.Power = -m.Power;
m.SendToNXT();
m.WaitFor();
pause(3);
m.Stop();
NXT_PlayTone(500, 100); % all done
clear;close all; clc;

% Fecha e abre conexão

COM_CloseNXT('all');
h = ConfigNXT('usb'); % Utiliza bluetooth

TableLength      = 100;      % in degrees
pt = 80;
direto     = pt;
reverso    = -pt;

motorB                   = NXTMotor('B', 'Power',  pt, 'ActionAtTachoLimit', 'HoldBrake');
motorB.SpeedRegulation   = false;  % not for sync mode
motorB.Power             = direto;
motorB.TachoLimit        = TableLength;
motorB.ActionAtTachoLimit= 'Brake';
motorB.SmoothStart       = true;

motorC                   = NXTMotor('C', 'Power',  pt, 'ActionAtTachoLimit', 'HoldBrake');
motorC.SpeedRegulation   = false;  % not for sync mode
motorC.Power             = direto;
motorC.TachoLimit        = TableLength;
motorC.ActionAtTachoLimit= 'Brake';
motorC.SmoothStart       = true;

motorD                   = NXTMotor('C', 'Power',  pt, 'ActionAtTachoLimit', 'HoldBrake');
motorD.SpeedRegulation   = false;  % not for sync mode
motorD.Power             = direto;
motorD.TachoLimit        = TableLength;
motorD.ActionAtTachoLimit= 'Brake';
motorD.SmoothStart       = true;


motorA                   = NXTMotor('A');
motorA.SpeedRegulation   = false;  % not for sync mode
motorA.Power             = direto;
motorA.TachoLimit        = TableLength;
motorA.ActionAtTachoLimit= 'Brake';
motorA.SmoothStart       = true;


%for j = 1 : 4 % anda 4 vezes
    
    motorB.Power = direto;
    motorB.SendToNXT();
    %motorB.WaitFor();
    %motorB.Stop('brake');
    
    
    motorC.Power = direto;
    motorC.SendToNXT();
    %motorC.WaitFor();
    %motorC.Stop('brake');
    
    motorA.Power = direto;
    motorA.SendToNXT();
    %motorA.WaitFor();
    %motorA.Stop('brake');
    
    NXT_PlayTone(400,500);
    
%     motorB.Power = reverso;
%     motorB.SendToNXT();
%     motorB.WaitFor();
%     
%     motorC.Power = reverso;
%     motorC.SendToNXT();
%     motorC.WaitFor();
%     
%     motorA.Power = reverso;
%     motorA.SendToNXT();
%     motorA.WaitFor();
%end


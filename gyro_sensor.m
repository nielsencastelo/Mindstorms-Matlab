% Autor: Nielsen Castelo Damasceno
% test gyro sensor
clear;clc;close all;
h = ConfigNXT('usb');

porta = SENSOR_1;               % Escolhe a porta
OpenGyro(porta, h);             % Configura sensor
CalibrateGyro(porta, 'AUTO');   % Calibra sensor automaticamente

while true
    speed  = GetGyro(porta);
    disp(speed);
    pause(0.5);
end

CloseSensor(porta);
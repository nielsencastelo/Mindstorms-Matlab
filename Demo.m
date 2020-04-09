%% Init
close all; clear all; clc
path(path, 'TUDarmstadtNXT');   % Path to toolbox, relative or absolut
%path(path, 'RWTHMindstorms');
COM_CloseNXT('all');            % Close all zombie connections
nxtHandle = COM_OpenNXT();      % Open new connection
COM_SetDefaultNXT(nxtHandle);   % Set default connection
NXT_PlayTone(440,10);


%% Open sensors
OpenSwitch(SENSOR_1);
OpenUltrasonic(SENSOR_3);
OpenNXT2Color(SENSOR_4, 'FULL'); 

% Read
GetSwitch(SENSOR_1);
GetUltrasonic(SENSOR_3);
GetNXT2Color(SENSOR_4);


%% Motorfunction

% Open grabber
motorB = NXTMotor('B', 'Power', 50, 'TachoLimit', 70);
motorB.SendToNXT();
motorB.WaitFor();

% Forward
motorAC = NXTMotor('AC'); 
motorAC.Power      = 100;
motorAC.TachoLimit = 420;
motorAC.SendToNXT();
motorAC.WaitFor();

% Close grabber
motorB = NXTMotor('B', 'Power', -50, 'TachoLimit', 70);
motorB.SendToNXT();
motorB.WaitFor();

% Backward and forward again
motorAC = NXTMotor('AC', 'Power', -100, 'TachoLimit', 180); 
motorAC.SendToNXT();
motorAC.WaitFor();
motorAC = NXTMotor('AC', 'Power', 100, 'TachoLimit', 270); 
motorAC.SendToNXT();
motorAC.WaitFor();

% Rotate 90°
motorA = NXTMotor('A', 'Power', 100, 'TachoLimit', round(396)); 
motorC = NXTMotor('C', 'Power', -100, 'TachoLimit', round(396)); 
motorA.SendToNXT();
motorC.SendToNXT();
motorA.WaitFor();
motorC.WaitFor();

% Motor anhalten
motorAC.Stop()      % Ohne Bremse
motorAC.Stop('Off') % Ohne Bremse
motorAC.Stop('On')  % Mit Bremse

%% Close sensors
CloseSensor(SENSOR_1);
CloseSensor(SENSOR_3);
CloseSensor(SENSOR_4);
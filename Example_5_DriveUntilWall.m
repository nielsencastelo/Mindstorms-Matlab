%% Example 4: Drive Until Wall
% Nesta pequena demonstração nosso robô se movimenta
% para frente até que ele detecta uma parede.
%
% Signature
%   Author: Linus Atorf, Alexander Behrens
%   Date: 2009/07/17
%   RWTH - Mindstorms NXT Toolbox: http://www.mindstorms.rwth-aachen.de

%% Clean up
% Close previous handles (if existing)
% COM_CloseNXT all
% clear all
% close all


%% Constants
MaxDriveTime = 30; % in seconds, stop after this time...
USPort       = SENSOR_4;


%% Initialize NXT connection (Bluetooth)
% handle = COM_OpenNXT('bluetooth.ini');
% COM_SetDefaultNXT(handle);


%% Reset Motor / remember start position
ResetMotorAngle(MOTOR_B);
ResetMotorAngle(MOTOR_C);
StartPos = GetMotorSettings(MOTOR_B);


%% Prepare sensor
OpenUltrasonic(USPort)


%% And GO!

SetMotor(MOTOR_B);
    SyncToMotor(MOTOR_C);
    SetPower(60);
    SetAngleLimit(0);
    SetTurnRatio(0);
    SetRampMode ('off');
SendMotorSettings();


%% Detect wall (sensor loop)
time(1) = tic; 
while(toc(time(1)) < MaxDriveTime)
   if GetUltrasonic(USPort) < 30
       break
   end%if
end%while


%% Immediately stop all motors!
StopMotor('all', 'off');
% but where are we now?
CurPos = GetMotorSettings(MOTOR_B);


%% Signal
NXT_PlayTone(440, 1000);


%% Drive back home!
% To try to understand what exactly the different rotation count values
% mean, we compare them just for fun
TotalAbsDist = StartPos.TachoCount - CurPos.TachoCount;
Dist         = CurPos.Angle;

SetMotor(MOTOR_B);
    SyncToMotor(MOTOR_C);
    SetPower(-60);
    SetAngleLimit(abs(Dist));
SendMotorSettings();


%% Wait until there
WaitForMotor(1, MaxDriveTime);

% brake
StopMotor('all', 'brake');

pause(1);

%% clean up
CloseSensor(SENSOR_4)
StopMotor ('all', 'off');


%% Close NXT connection
COM_CloseNXT(handle);

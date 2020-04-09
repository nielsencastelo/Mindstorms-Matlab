%% Example 7: Drive Around Table (Motor Class)
% This example equals demo 3, but uses the motor class and an advanced motor control.
%
% Note: For using the advanced motor control the MotorControl program has to be downloaded onto your
% NXT. The MotorControl program is located at /tools/MotorControl.
%
% Signature
%   Author: Linus Atorf, Alexander Behrens
%   Date: 2009/07/17
%   RWTH - Mindstorms NXT Toolbox: http://www.mindstorms.rwth-aachen.de

%% Clear and close
% COM_CloseNXT all
% clear all
% close all


%% Constants and so on
TableLength      = 1000;     % in degrees of motor rotations :-)
QuarterTurnTicks = 217;      % in motor degrees, how much is a 90° turn of the bot?
Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel
DrivingSpeed     = 50;
TurningSpeed     = 30;


%% Open Bluetooth connetion
% h = COM_OpenNXT('bluetooth.ini');
% COM_SetDefaultNXT(h);


%% Initialize motor-objects:

mStraight                   = NXTMotor(Ports);
% next command since we are driving in SYNC-mode. This should not be
% necessary with correct default values, but at the moment, I have to set
% it manually,
mStraight.SpeedRegulation   = false;  % not for sync mode
mStraight.Power             = DrivingSpeed;
mStraight.TachoLimit        = TableLength;
mStraight.BrakeAtTachoLimit = true;


mTurn1                      = NXTMotor(Ports(2)); % ports swapped because it's nicer
mTurn1.SpeedRegulation      = true;  
mTurn1.Power                = TurningSpeed;
mTurn1.TachoLimit           = QuarterTurnTicks;
mTurn1.BrakeAtTachoLimit    = true;


mTurn2          = mTurn1;
mTurn2.Port     = Ports(1);   % ports swapped again...
mTurn2.Power    = - mTurn1.Power;



%% Initialize Motors...
% we send this in case they should still be spinning or something...
mStraight.Stop('off');


%% Start the engines, main loop begins (repeated 4 times)

% 4 times because we got 4 equal sides of the table :-)
for j = 1 : 4

%% Drive

    mStraight.SendToNXT();
    
    
%% Check for the end end of table
   	mStraight.WaitFor();
    
%% Now please turn 

    mTurn1.SendToNXT();
    mTurn1.WaitFor();
    
    mTurn2.SendToNXT();
    mTurn2.WaitFor();
    
    
%% Thats it. Repeat 4 times....
end%for



% Hey! End of a hard day's work
% Just to show good style, we close down our motors again:
mStraight.Stop('off');


%% Close Bluetooth connection
COM_CloseNXT(h);

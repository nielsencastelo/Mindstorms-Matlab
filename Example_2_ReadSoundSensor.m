%% Example 2: Read Sound Sensor
% Example to read the sound sensor value in db:
%
% Signature
%   Author: Linus Atorf, Alexander Behrens
%   Date: 2009/07/17
%   RWTH - Mindstorms NXT Toolbox: http://www.mindstorms.rwth-aachen.de

% Close previous handles (if existing)
COM_CloseNXT all
% Prepare workspace by cleaning all old settings to be on the safe side. 
clear all
close all

% Open new NXT Bluetooth connection according to the previous generated configuration file.
handle = COM_OpenNXT('bluetooth.ini');

% Set current NXT handle as default for subsequent toolbox function calls
COM_SetDefaultNXT(handle);

% Initialize the sound sensor by setting the sound sensor mode and input port. 
OpenSound(SENSOR_2, 'DB');

% Get the current sound sensor value in dB. 
value = GetSound(SENSOR_2)

% Close the sound sensor. 
CloseSensor(SENSOR_2);

% Close Bluetooth connection. 
COM_CloseNXT(handle);
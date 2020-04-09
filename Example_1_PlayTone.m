%% Example 1: Play Tone and Get Battery Level
% Example to play a specific tone with the NXT Brick and retrieve the current battery level: 
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

% Open new NXT connection 
%  - Tries to open a connection via USB. The first NXT device that is found will be used.
%  - Device drivers (Fantom on Windows, libusb on Linux) have to be already installed for USB to work.
%  - For using Bluetooth a previous configuration file has to be generated COM_MakeBTConfigFile)
h = COM_OpenNXT();

% Play tone with frequency 800Hz and duration of 500ms. 
NXT_PlayTone(800,500, h);

% Get current battery level. 
voltage = NXT_GetBatteryLevel(h)

% Close NXT connection. 
COM_CloseNXT(handle);
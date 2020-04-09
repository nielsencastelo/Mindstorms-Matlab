%% ShinyRadar
% Essa função fornece um radar ultra-som em movimento
%
%   Autor: Nielsen C. Damsceno
%   Data: 31/12/12

function Example_7_ShinyRadar


%COM_CloseNXT all

clear all 
close all
format compact


%% Set up ports & vars
parametro = 90;
portMotor   = MOTOR_A;
portUS      = SENSOR_4;
GearFactor  = 4;
MotorRange  = parametro * GearFactor;
MotorSpeed  = 25;
dmax = 20;
dmin = 1;

%% Initialize GFX
figure('Name', 'Radar'); %, 'Position', [50 60 1200 500]);
axis equal
axis([-(dmax+20) (dmax+20) 0 (dmax+20)]); 
set(gca, 'Color', 'white');
hold on

hScanLine = ResetFigure(false);


%h = COM_OpenNXT('bluetooth.ini');
h = ConfigNXT('blu');
%COM_SetDefaultNXT(h);


%% Reset Motor, open sensor
%StopMotor all off
%NXT_ResetMotorPosition(portMotor, false);
%NXT_ResetMotorPosition(portMotor, true);

OpenUltrasonic(portUS);

%% Vire à direita para a posição inicial
SetMotor(portMotor)
SetPower(20)
SetAngleLimit(MotorRange/2 - 20)
SendMotorSettings
WaitForMotor(portMotor)
pause(0.5)
StopMotor(portMotor, 'off');


%% Primeiramento o motor gira
tmp = GetMotorSettings(portMotor);
StartPos = tmp.TachoCount;

SetMotor(portMotor);
SetPower(-MotorSpeed);
SpeedRegulation on
SetAngleLimit(MotorRange);
SendMotorSettings


%% Main
while(true)
    
    % get current pos
    tmp = GetMotorSettings(portMotor);
    CurPos = tmp.TachoCount;
    phi = pi - ((CurPos - (StartPos - MotorRange)) / MotorRange) * pi;
    %alpha = phi * 180 / pi
    %x = cos(phi)
    %y = sin(phi)
    
    % get ultrasonic
    distUS = GetUltrasonic(portUS);

    
    % plot where we are
    set(hScanLine, 'XData', [0; cos(phi) * 150])
    set(hScanLine, 'YData', [0; sin(phi) * 150]);
    
    % plota os pontos do radar
    if (distUS > dmin) && (distUS < dmax)
        plot(cos(phi) * distUS, sin(phi) * distUS, 'd','LineWidth',4);
    end
    
    
    drawnow
    
    % direção reversa de necessário
    if CurPos < (StartPos - MotorRange)
        StopMotor(portMotor, 'off')
        NXT_ResetMotorPosition(portMotor, false);
        NXT_ResetMotorPosition(portMotor, true);

        SetMotor(portMotor)
        SetPower(MotorSpeed)
        SetAngleLimit(MotorRange)
        SendMotorSettings
        
        hScanLine = ResetFigure(true);
    end
    
    % direção reversa se necessário
    if CurPos > StartPos
        StopMotor(portMotor, 'off')
        NXT_ResetMotorPosition(portMotor, false);
        NXT_ResetMotorPosition(portMotor, true);
        SetMotor(portMotor)
        SetPower(-MotorSpeed)
        SetAngleLimit(MotorRange)
        SendMotorSettings
        
        hScanLine = ResetFigure(false);
    end
    
    

end% fim while



%% Clean up
StopMotor all off
CloseSensor(portUS);

%COM_CloseNXT(h)


end
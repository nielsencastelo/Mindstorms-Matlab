% Faz o robo andar e desvia de obstaculo por 2 vezes

clear;clc;
COM_CloseNXT all
COM_MakeBTConfigFile();
h = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(h);

OpenUltrasonic(SENSOR_4);
forward = NXTMotor('BC');
forward.Power = -30;
forward.TachoLimit = 0;
turnRight = NXTMotor('C');
turnRight.Power = -30;
turnRight.TachoLimit = 460;
for i= 1:2forward = NXTMotor('BC');
forward.Power = -30;
forward.TachoLimit = 0;
turnRight = NXTMotor('C');
turnRight.Power = -30;
    while GetUltrasonic(SENSOR_4) > 30
        forward.SendToNXT(); %sends command for robot to move forward
        %TachoLimit=0; no need for a WaitFor() statement
    end
    forward.Stop('brake'); 
    NXT_PlayTone(400,300);
    turnRight.SendToNXT; 
    turnRight.WaitFor; %TachoLimit is not 0; WaitFor() statement required
end
turnRight.Stop('off'); 
forward.Stop('off');
CloseSensor(SENSOR_4); 
COM_CloseNXT(h); 
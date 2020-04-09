% Self balance usando pid usando gyro sensor
% 
COM_CloseNXT('all');
h = ConfigNXT('blu');

porta = SENSOR_2;               % Escolhe a porta
OpenGyro(porta, h);             % Configura sensor
CalibrateGyro(porta, 'AUTO');   % Calibra sensor automaticamente

gMax = -100 ; 
gMin = 100 ;

pause(3);
NXT_PlayTone(1000,500);

% potência do motor
motor = NXTMotor('BC'); % ajusta motor B C para ir pra frente
motor.Power = 0;
motor.TachoLimit = 0;


kp = 30;       % proporcional
ki = 35;     % integral
kd = 5;    % derivativo

setpoint = 0;  % Set Point 

integral = 0;   % o lugar onde vamos guardar o nosso integrante
defivativo = 0;
lasterro = 0;

while(1)
    
   speed  = GetGyro(porta);
   fprintf('Speed: %f\n', speed);
   erro = speed - setpoint;     % calcula o erro e subtrai do setpoint
   integral = integral + erro;  % nosso novo termo integrante
   derivativo = erro - lasterro;% erro derivativo
   
   turn = kp * erro + ki * integral + kd * derivativo;
      
   if (turn > gMax)
       turn = gMax;
   end
   if (turn < gMin)
       turn = gMin;
   end
   
   motor.Power = floor(turn);
   motor.SendToNXT();
   
   lasterro = erro;
    
   
   fprintf('Turn: %f\n', turn);
   
   pause(0.3);
end

% Desliga sensores
CloseSensor(SENSOR_1);

% Desliga motores
left.Stop('off');
righ.Stop('off');
% Autor: Nielsen C. Damasceno
% Programa simples que segue a linha preta
% também conhecido como Line Follow (PID)

% Fecha e abre conexão
COM_CloseNXT('all');
h = ConfigNXT('blu'); % Utiliza bluetooth

% potência do motor
tp = 20;

% configura motor B
righ = NXTMotor('B');
righ.Power = tp;
righ.SendToNXT;

% configura motor C
left = NXTMotor('C');
left.Power = tp;
left.SendToNXT;

% Ativa sensor de luz e swith
OpenLight(SENSOR_2,'ACTIVE');
OpenSwitch(SENSOR_1); % usado para parar o robo

kp = 30;        % proporcional
ki = 10;        % integral
kd = 60;        % derivativo

setpoint = 55;  % Set Point do iluminancia
integral = 0;   % o lugar onde vamos guardar o nosso integrante
defivativo = 0;
lasterro = 0;

while(1)
   status = GetSwitch(SENSOR_1); % Verifica se foi pressionado
   
   if status                     % Caso seja verdadeiro
       break                     % e sai do laço 
   end
      
   luz = GetLight(SENSOR_2);
   luz = luz/10;
   
   erro = luz - setpoint;       % calcula o erro e subtrai do setpoint
   integral = integral + erro;  % nosso novo termo integrante
   derivativo = erro - lasterro;% erro derivativo
   
   turn = kp * erro + ki * integral + kd * derivativo;
   turn = turn / 100;
   
   lasterro = erro;
   
   powerC = floor(tp + turn);
   powerB = floor(tp - turn);
   
   if powerC > 0
       left.Power = powerC;
       left.SendToNXT;
       left.WaitFor;
   else
       powerC = powerC * (-1);
       left.Power = powerC;
       left.SendToNXT;
       left.WaitFor;
   end
   
   righ.Power = powerB;
   righ.SendToNXT;
   righ.WaitFor;
  
   fprintf('luz: %f\n', luz);
end

% Desliga sensores
CloseSensor(SENSOR_2);
CloseSensor(SENSOR_1);

% Desliga motores
left.Stop('off');
righ.Stop('off');
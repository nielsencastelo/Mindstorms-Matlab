% Programa simples que segue a linha preta
righ = NXTMotor('B');
righ.Power = 30;
righ.TachoLimit = 0;
righ.SmoothStart        = true;    % inicio suave
righ.SendToNXT;

left = NXTMotor('C');
left.Power = 30;
left.TachoLimit = 0;
left.SmoothStart        = true;
left.SendToNXT;

OpenLight(SENSOR_3,'ACTIVE');
OpenSwitch(SENSOR_1);
delta = 20;
lightReading = 65;
model = svmtrain(delta,lightReading,'-s 8 -g 0 -b 1 -e 0.1 -q');
while(1)
   status = GetSwitch(SENSOR_1); % Verifica se é 1
   if status % Desliga motores, sensores e sai do laço
       break
   end
   luz = GetLight(SENSOR_3);
   luz = luz/10;
   disp(luz);
   
   if luz > 65
       righ.Stop('brake');
       left.SendToNXT;
       disp(luz);
   else
       left.Stop('brake');
       righ.SendToNXT;
       disp(luz);
   end
   
end

CloseSensor(SENSOR_3);
CloseSensor(SENSOR_1);
left.Stop('off');
righ.Stop('off');
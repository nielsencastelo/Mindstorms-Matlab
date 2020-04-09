% Usa NXTMotor para girar 360 graus o robô no seu eixo

%ConfigNXT;

b = NXTMotor( MOTOR_B );
c = NXTMotor( MOTOR_C );
  
b.Power = -30;
c.Power = 30;
 
b.TachoLimit = 750;
c.TachoLimit = 750;
  
b.SendToNXT()
c.SendToNXT()
  
b.WaitFor()
c.WaitFor()

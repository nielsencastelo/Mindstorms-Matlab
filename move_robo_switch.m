% O rob� se move at� que o bot�o seja pressionado

%h = ConfigNXT('blu');

m = NXTMotor( [MOTOR_B; MOTOR_C] );
m.SmoothStart = true;
m.Power = 40;
  
OpenSwitch( SENSOR_1 );
  
m.SendToNXT()
  
while true
    if GetSwitch( SENSOR_1 )
        m.Stop('off');
        break;
    end
    pause( 0.1 )
end
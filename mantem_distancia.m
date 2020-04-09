% Usa o sensor ultra-s�nico para manter uma determinada dist�ncia 
% de uma superf�cie

target = 20;
m = NXTMotor( [MOTOR_B; MOTOR_C] );
m.SmoothStart = true;

% Receba as leituras dos sensores e ajustar os motores
  while true
    if toque
        break
    end
    d = distancia;
    power = floor( ( d - target ) * 10 );
    %m.Power = power;
    m.Power = max( -100, min( 100, power ) );
    disp( m.Power )
    m.SendToNXT()
    pause( 0.1 )
  end

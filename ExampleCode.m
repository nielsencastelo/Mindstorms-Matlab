%% Lab 2 Part A (1)
% Usa NXTMotor para mover o robô para a frente, parar e retroceder a sua
% posição original
function lab2_a_1

  %% Move forward
  m = NXTMotor( [MOTOR_B; MOTOR_C] );
  m.Power = 30;
  m.TachoLimit = 1080;
  m.SendToNXT()
  m.WaitFor()
  
  %% Move backward
  m.Power = -30;
  m.SendToNXT()
  m.WaitFor()

end



%% Lab 4 Part A (1)
% Obtém uma leitura do sensor de cor no modo de cor
function lab4_a_1

  %% Get color sensor reading
  OpenNXT2Color( SENSOR_1, 'COLOR' )
  pause( 0.1 )
  c = GetNXT2Color( SENSOR_1 );
  disp( c )
  CloseSensor( SENSOR_1 )

end

% ======================================================
% ======================================================


%% Lab 4 Part A (2)
% Obtém uma leitura do sensor de cor no modo de luz
function lab4_a_2

  %% Get light sensor reading
  OpenNXT2Color( SENSOR_1, 'LIGHT' )
  pause( 0.1 )
  c = GetNXT2Color( SENSOR_1 );
  pause( 0.1 )
  disp( c )
  CloseSensor( SENSOR_1 )

end

% ======================================================
% ======================================================


%% Lab 4 Part B
% Usa o sensor de cor no modo de cor para seguir uma linha
function lab4_b

  %% NXTMotor
  l_wheel = NXTMotor( MOTOR_B );
  r_wheel = NXTMotor( MOTOR_C );
  
  l_wheel.SmoothStart = true;
  r_wheel.SmoothStart = true;
  
  %% Open color sensor
  OpenNXT2Color( SENSOR_1, 'COLOR' )
  pause( 0.1 )
  
  %% Start right wheel
  r_wheel.Power = 20;
  r_wheel.SendToNXT()
  
  %% Follow line
  while true
    
    %% Right turn
    l_wheel.Power = 10;
    l_wheel.SendToNXT()
    % Wait until robot is over white area
    while ~strcmp( GetNXT2Color( SENSOR_1 ), 'WHITE' )
      pause( 0.01 )
    end
      
    %% Left turn
    l_wheel.Power = 40;
    l_wheel.SendToNXT()
    % Wait until robot is over black line
    while ~strcmp( GetNXT2Color( SENSOR_1 ), 'BLACK' )
      pause( 0.01 )
    end

  end

% ======================================================
% ======================================================


%% Lab 4 Part C
% Usa o sensor de cor no modo de luz para seguir uma linha
function lab4_c

  %% NXTMotor
  l_wheel = NXTMotor( MOTOR_B );
  r_wheel = NXTMotor( MOTOR_C );
  
  l_wheel.SmoothStart = true;
  r_wheel.SmoothStart = true;
  
  %% Start color sensor
  OpenNXT2Color( SENSOR_1, 'LIGHT' )
  pause( 0.1 )
  
  %% Start right wheel
  r_wheel.Power = 20;
  r_wheel.SendToNXT()
  
  %% Follow line
  while true
    
    %% Set target reading
    target = 45;
    
    %% Adjust left wheel's speed based on sensor reading
    diff = target - GetNXT2Color( SENSOR_1 );
    % Floor is necessary because Power must be an integer
    l_wheel.Power = 20 - floor(diff);
    l_wheel.SendToNXT()
    pause( 0.01 )

  end

% ======================================================
% ======================================================


%% Lab 5 Part A (1)
% Coletar leituras do sensor de ultra-som em modo contínuo
function lab5_a_1
  
  %% Get ultrasonic sensor readings
  OpenUltrasonic( SENSOR_1 )
  pause( 0.1 )
  
  for i=1:10
    disp( GetUltrasonic( SENSOR_1 ) )
    pause( 0.5 )
  end

end
% Use o NXT_GetOutput para monitorar o estado da rota��o do motor B
function b = status_motorb
  b = NXT_GetOutputState( MOTOR_B );
end
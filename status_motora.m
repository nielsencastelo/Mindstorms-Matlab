% Use o NXT_GetOutput para monitorar o estado da rota��o do motor A
function a = status_motora()
  a = NXT_GetOutputState( MOTOR_A );
end
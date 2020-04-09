% Use o NXT_GetOutput para monitorar o estado da rotação do motor A
function a = status_motora()
  a = NXT_GetOutputState( MOTOR_A );
end
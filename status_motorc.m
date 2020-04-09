% Use o NXT_GetOutput para monitorar o estado da rotação do motor C
function c = status_motorc
  c = NXT_GetOutputState( MOTOR_C );
end
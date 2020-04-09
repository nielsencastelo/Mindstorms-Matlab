% Obt�m leitura do sensor de toque
%
% Sa�da: 	status pode ser 1( se houve contato ou 0, caso contr�rio)
%
% Autor:   Nielsen C. Damasceno
function status = toque()
    OpenSwitch( SENSOR_1 );
    status = GetSwitch( SENSOR_1 );
    CloseSensor( SENSOR_1 );
end
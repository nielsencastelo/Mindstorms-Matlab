% Obt�m a dist�ncia de um objeto
%
% Sa�da: 	d � a dist�ncia
%
% Autor:   Nielsen C. Damasceno
function d = distancia()
    OpenUltrasonic(SENSOR_4,'SNAPSHOT');
    d = GetUltrasonic(SENSOR_4);
    %d = USGetSnapshotResults( SENSOR_4 );
    CloseSensor(SENSOR_4);
end
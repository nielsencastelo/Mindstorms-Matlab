% Obtém a distância de um objeto
%
% Saída: 	d é a distância
%
% Autor:   Nielsen C. Damasceno
function d = distancia()
    OpenUltrasonic(SENSOR_4,'SNAPSHOT');
    d = GetUltrasonic(SENSOR_4);
    %d = USGetSnapshotResults( SENSOR_4 );
    CloseSensor(SENSOR_4);
end
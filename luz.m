% Obt�m a cor do objeto utilizado o sensor Light 
%
% Sa�da: 	l � a intensidade
%
% Autor:   Nielsen C. Damasceno
function l = luz()
    OpenLight(SENSOR_3,'ACTIVE');
    l = GetLight(SENSOR_3);
    CloseSensor(SENSOR_3);
end
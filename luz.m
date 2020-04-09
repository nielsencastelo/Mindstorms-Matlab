% Obtém a cor do objeto utilizado o sensor Light 
%
% Saída: 	l é a intensidade
%
% Autor:   Nielsen C. Damasceno
function l = luz()
    OpenLight(SENSOR_3,'ACTIVE');
    l = GetLight(SENSOR_3);
    CloseSensor(SENSOR_3);
end
% Análise da Luz

% Liga sensores
OpenSwitch( SENSOR_1 );
OpenLight(SENSOR_2,'ACTIVE');

while true
    % Verifica de Swith é precionado para para o robô
    if GetSwitch( SENSOR_1 )
        break;
    end
    
    L = GetLight(SENSOR_2);
    L = L/100;
    disp(L);
    
    if L==2.22
        disp('Bola azul')
    end
    if L==4.54
        disp('Bola vermelha');
    end
end
CloseSensor(SENSOR_2);
CloseSensor(SENSOR_1);
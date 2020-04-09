% Toca musica de acordo com uma determinada distância de uma superfície

%h = ConfigNXT('usb');

% configura motores
anda = NXTMotor('BC');
anda.Power = 0;
anda.TachoLimit = 0;
anda.SmoothStart = true;
cont = 0;
while cont < 10
    if toque
        break
    end
    d = floor(distancia);
    disp(d);
    
    if d < 70
        pw = 70-d;
        anda.Power = -pw;
        anda.SendToNXT;
    end
    pause( 0.1 );
    cont = cont + 1;
end
anda.Stop('off');

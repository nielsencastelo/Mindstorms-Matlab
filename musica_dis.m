% Toca musica de acordo com uma determinada dist�ncia de uma superf�cie

while true
    if toque
        break
    end
    d = floor(distancia);
    tone = d * 10;
    if tone > 14000
        tone = 14000;
    end
    if tone < 200
        tone = 200;
    end
    % toca nota com valor de tone Hz e dura��o de 500ms. 
    NXT_PlayTone(tone,500, h);
    disp(tone);
    pause( 0.1 )
end

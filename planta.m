% A seguinte fun��o implementa uma planta discreta de 1� ordem
%   G(z) = 0.4/z - 0.6
% Entrada:  y � a sa�da da plata y(k)
%           u � a entrada da planta u(k) 
%           num � o numerado da fun��o G(z)
%           de � o denominador da fun��o G(z)
%
% Sa�da: 	yy � a sa�da da planta y(k+1)
%
%
%
% Autor:   Nielsen C. Damasceno
% Data:     01.05.2011
function yy = planta(y,u,num,de)
    yy = (num * y) + (de * u);
end
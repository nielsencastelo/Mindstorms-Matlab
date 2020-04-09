% A seguinte função implementa uma planta discreta de 1ª ordem
%   G(z) = 0.4/z - 0.6
% Entrada:  y é a saída da plata y(k)
%           u é a entrada da planta u(k) 
%           num é o numerado da função G(z)
%           de é o denominador da função G(z)
%
% Saída: 	yy é a saída da planta y(k+1)
%
%
%
% Autor:   Nielsen C. Damasceno
% Data:     01.05.2011
function yy = planta(y,u,num,de)
    yy = (num * y) + (de * u);
end
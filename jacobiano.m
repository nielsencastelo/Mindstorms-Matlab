% A seguinte função implementa o jacobiano da planta
%
% Entrada:  u é o sinal de entrada da planta u(k)
%           ref é o setpoint
%           saidaRNA é a saida simulada da RNA 
%           w é o peso da RNA
%
% Saída: 	uu é o sinal estimado u(k+1)
%
%
%
% Author:   Nielsen C. Damasceno
% Date:     01.05.2011
function uu = jacobiano(u,y_ref,saidaRNA,w)
    uu = u + ((y_ref - saidaRNA)/w);
end
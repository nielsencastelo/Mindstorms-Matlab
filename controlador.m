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
% Autor:   Nielsen C. Damasceno
% Date:     01.05.2011
function uu = controlador(u,ref,saidaRNA,w)
    uu = u + ((ref - saidaRNA)/w);
end
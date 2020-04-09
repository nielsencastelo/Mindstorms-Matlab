% A seguinte fun��o implementa o jacobiano da planta
%
% Entrada:  u � o sinal de entrada da planta u(k)
%           ref � o setpoint
%           saidaRNA � a saida simulada da RNA 
%           w � o peso da RNA
%
% Sa�da: 	uu � o sinal estimado u(k+1)
%
%
%
% Author:   Nielsen C. Damasceno
% Date:     01.05.2011
function uu = jacobiano(u,y_ref,saidaRNA,w)
    uu = u + ((y_ref - saidaRNA)/w);
end
function [sys, x0, str, ts] = pid_pos (t, x, u, flag, ts, kc, Ti, Td)  
persistent s ek_1                                                          
if flag == 0                  %inicialização
    sys = [0 0 1 1 0 1 1]; 
    x0 = [ ];                                              
    str = [ ]; 
    ts = [-2 0];              %tempo de amostragem variável
    s=0;                                                     
elseif flag == 4              %Calcula próximo instante de amostragem
      ns = t / ts;                              %ns nº de amostras
      sys = (1 + floor(ns + 1e-13*(1+ns)))*ts;  %momento próxima amostra
elseif flag == 3                                             
    if t==0 ek_1=u(1); end; 
    kp=kc; ki=kc*ts/Ti; kd=kc*Td/ts;          %Converte parametros
    ek=u(1);  
    s = s + ek; 
    m=kp*ek+ki*s+kd*(ek-ek_1); 
    ek_1=u(1); 
    sys = m;                                              
else                          %por defeito não retorna nada
      sys = [ ];                                             
end 
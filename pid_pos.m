function [sys, x0, str, ts] = pid_pos (t, x, u, flag, ts, kc, Ti, Td)  
persistent s ek_1                                                          
if flag == 0                  %inicializa��o
    sys = [0 0 1 1 0 1 1]; 
    x0 = [ ];                                              
    str = [ ]; 
    ts = [-2 0];              %tempo de amostragem vari�vel
    s=0;                                                     
elseif flag == 4              %Calcula pr�ximo instante de amostragem
      ns = t / ts;                              %ns n� de amostras
      sys = (1 + floor(ns + 1e-13*(1+ns)))*ts;  %momento pr�xima amostra
elseif flag == 3                                             
    if t==0 ek_1=u(1); end; 
    kp=kc; ki=kc*ts/Ti; kd=kc*Td/ts;          %Converte parametros
    ek=u(1);  
    s = s + ek; 
    m=kp*ek+ki*s+kd*(ek-ek_1); 
    ek_1=u(1); 
    sys = m;                                              
else                          %por defeito n�o retorna nada
      sys = [ ];                                             
end 
function dectectarClaps()
%     COM_CloseNXT all
%     h = COM_OpenNXT('bluetooth.ini');
%     COM_SetDefaultNXT(h);
    OpenSound(SENSOR_2,'DB');
    values  =  zeros(1000,  1);
    for  n  =  1:1:1000
        s  =  GetSound(SENSOR_2);
        values  =  [values(2:end);  s];   
        pause(0.01);
        plot(values);
    end
end
function h = ConfigNXT(conf)
    switch lower(conf)
        case 'blu'
            COM_CloseNXT all;
            h = COM_OpenNXT('bluetooth.ini');
            COM_SetDefaultNXT(h);
            disp('Bluetooth Ativado');
            NXT_PlayTone(800,500, h);
        case 'usb'
            COM_CloseNXT all;
            h = COM_OpenNXT();
            COM_SetDefaultNXT(h);
            disp('USB Ativado');
            NXT_PlayTone(800,500, h);
        otherwise
            disp('Método de conexão indefinido');
    end
    
end
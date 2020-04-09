function volt = getVoltagem()
    % Retorna a voltagem em milivolts
    volt = NXT_GetBatteryLevel;
    volt = volt / 1000;
end
function direita()
    mA.TachoLimit = 360;
    mA = NXTMotor('C', 'Power', 40);
    mA.SendToNXT();
    pause(1);
    mA.Stop('brake');
end
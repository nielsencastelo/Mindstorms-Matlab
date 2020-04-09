function esquerda()
    mA.TachoLimit = 360;
    mA = NXTMotor('B', 'Power', 40);
    mA.SendToNXT();
    pause(1);
    mA.Stop('brake');
end
function para()
    
    StopMotor(MOTOR_B, 'off');
    StopMotor(MOTOR_C, 'off');
    StopMotor(MOTOR_A, 'off');
    NXT_ResetMotorPosition(MOTOR_B, true);
    NXT_ResetMotorPosition(MOTOR_C, true);
    NXT_ResetMotorPosition(MOTOR_A, true);
end
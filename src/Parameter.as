
abstract class Parameter
{
    string m_name;
    string m_units;
    array<float> m_data(MAX_DATA_POINTS, 0.0f);

    void CaptureFrame(CSmScriptPlayer@ player, int index) {}
}

class CurrentLapNumber : Parameter
{
    CurrentLapNumber()
    {
        m_name = "CurrentLapNumber";
        m_units = "count";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.CurrentLapNumber);
    }
}

class CurrentRaceTime : Parameter
{
    CurrentRaceTime()
    {
        m_name = "CurrentRaceTime";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.CurrentRaceTime);
    }
}

class CurrentLapTime : Parameter
{
    CurrentLapTime()
    {
        m_name = "CurrentLapTime";
        m_units = "count";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.CurrentLapTime);
    }
}

class LapStartTime : Parameter
{
    LapStartTime()
    {
        m_name = "LapStartTime";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.LapStartTime);
    }
}

class IdleDuration : Parameter
{
    IdleDuration()
    {
        m_name = "IdleDuration";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.IdleDuration);
    }
}

class Position_x : Parameter
{
    Position_x()
    {
        m_name = "Position_x";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Position.x);
    }
}

class Position_y : Parameter
{
    Position_y()
    {
        m_name = "Position_y";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Position.y);
    }
}

class Position_z : Parameter
{
    Position_z()
    {
        m_name = "Position_z";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Position.z);
    }
}

class AimYaw : Parameter
{
    AimYaw()
    {
        m_name = "AimYaw";
        m_units = "deg";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(Math::ToDeg(player.AimYaw));
    }
}

class AimPitch : Parameter
{
    AimPitch()
    {
        m_name = "AimPitch";
        m_units = "deg";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(Math::ToDeg(player.AimPitch));
    }
}

class AimRoll : Parameter
{
    AimRoll()
    {
        m_name = "AimRoll";
        m_units = "deg";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(Math::ToDeg(player.AimRoll));
    }
}

class AimDirection_x : Parameter
{
    AimDirection_x()
    {
        m_name = "AimDirection_x";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.AimDirection.x);
    }
}

class AimDirection_y : Parameter
{
    AimDirection_y()
    {
        m_name = "AimDirection_y";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.AimDirection.y);
    }
}

class AimDirection_z : Parameter
{
    AimDirection_z()
    {
        m_name = "AimDirection_z";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.AimDirection.z);
    }
}

class UpDirection_x : Parameter
{
    UpDirection_x()
    {
        m_name = "UpDirection_x";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.UpDirection.x);
    }
}

class UpDirection_y : Parameter
{
    UpDirection_y()
    {
        m_name = "UpDirection_y";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.UpDirection.y);
    }
}

class UpDirection_z : Parameter
{
    UpDirection_z()
    {
        m_name = "UpDirection_z";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.UpDirection.z);
    }
}

class LeftDirection_x : Parameter
{
    LeftDirection_x()
    {
        m_name = "LeftDirection_x";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.LeftDirection.x);
    }
}

class LeftDirection_y : Parameter
{
    LeftDirection_y()
    {
        m_name = "LeftDirection_y";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.LeftDirection.y);
    }
}

class LeftDirection_z : Parameter
{
    LeftDirection_z()
    {
        m_name = "LeftDirection_z";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.LeftDirection.z);
    }
}

class Velocity_x : Parameter
{
    Velocity_x()
    {
        m_name = "Velocity_x";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Velocity.x);
    }
}

class Velocity_y : Parameter
{
    Velocity_y()
    {
        m_name = "Velocity_y";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Velocity.y);
    }
}

class Velocity_z : Parameter
{
    Velocity_z()
    {
        m_name = "Velocity_z";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Velocity.z);
    }
}

class Speed : Parameter
{
    Speed()
    {
        m_name = "Speed";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Speed);
    }
}

class Upwardness : Parameter
{
    Upwardness()
    {
        m_name = "Upwardness";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Upwardness);
    }
}

class Distance : Parameter
{
    Distance()
    {
        m_name = "Distance";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.Distance);
    }
}

class DisplaySpeed : Parameter
{
    DisplaySpeed()
    {
        m_name = "DisplaySpeed";
        m_units = "km/hr";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.DisplaySpeed);
    }
}

class InputSteer : Parameter
{
    InputSteer()
    {
        m_name = "InputSteer";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.InputSteer);
    }
}

class InputGasPedal : Parameter
{
    InputGasPedal()
    {
        m_name = "InputGasPedal";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.InputGasPedal);
    }
}

class InputIsBraking : Parameter
{
    InputIsBraking()
    {
        m_name = "InputIsBreaking";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.InputIsBraking ? 1.0 : 0.0);
    }
}

class EngineRpm : Parameter
{
    EngineRpm()
    {
        m_name = "EngineRpm";
        m_units = "rev/min";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.EngineRpm);
    }
}

class EngineCurGear : Parameter
{
    EngineCurGear()
    {
        m_name = "EngineCurGear";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.EngineCurGear);
    }
}

class EngineTurboRatio : Parameter
{
    EngineTurboRatio()
    {
        m_name = "EngineTurboRatio";
        m_units = "unknown";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.EngineTurboRatio);
    }
}

class WheelsContactCount : Parameter
{
    WheelsContactCount()
    {
        m_name = "WheelsContactCount";
        m_units = "Wheels";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.WheelsContactCount);
    }
}

class WheelsSkiddingCount : Parameter
{
    WheelsSkiddingCount()
    {
        m_name = "WheelsSkiddingCount";
        m_units = "Wheels";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.WheelsSkiddingCount);
    }
}

class FlyingDuration : Parameter
{
    FlyingDuration()
    {
        m_name = "FlyingDuration";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.FlyingDuration);
    }
}

class SkiddingDuration : Parameter
{
    SkiddingDuration()
    {
        m_name = "SkiddingDuration";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.SkiddingDuration);
    }
}

class SkiddingDistance : Parameter
{
    SkiddingDistance()
    {
        m_name = "SkiddingDistance";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.SkiddingDistance);
    }
}

class FlyingDistance : Parameter
{
    FlyingDistance()
    {
        m_name = "FlyingDistance";
        m_units = "m";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.FlyingDistance);
    }
}

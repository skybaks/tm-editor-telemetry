
class Parameter
{
    string m_name;
    string m_units;
    array<float> m_data(2000, 0.0f);

    void CaptureFrame(CSmScriptPlayer@ player, int index)
    {
    }
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

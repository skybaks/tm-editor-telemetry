
const int MAX_DATA_POINTS = 10000;

class Telemetry
{
    array<float> m_time(MAX_DATA_POINTS, 0.0f);
    uint m_dataLength = 0;
    array<Parameter> m_params = {
          CurrentLapNumber()
        , CurrentRaceTime()
        , CurrentLapTime()
        , LapStartTime()
        , IdleDuration()
        , Position_x()
        , Position_y()
        , Position_z()
        , AimYaw()
        , AimPitch()
        , AimRoll()
        , AimDirection_x()
        , AimDirection_y()
        , AimDirection_z()
        , UpDirection_x()
        , UpDirection_y()
        , UpDirection_z()
        , LeftDirection_x()
        , LeftDirection_y()
        , LeftDirection_z()
        , Velocity_x()
        , Velocity_y()
        , Velocity_z()
        , Speed()
        , Upwardness()
        , Distance()
        , DisplaySpeed()
        , InputSteer()
        , InputGasPedal()
        , InputIsBraking()
        , EngineRpm()
        , EngineCurGear()
        , EngineTurboRatio()
        , WheelsContactCount()
        , WheelsSkiddingCount()
        , FlyingDuration()
        , SkiddingDuration()
        , SkiddingDistance()
        , FlyingDistance()
        , FlightPathAngle()
    };

    void Reset()
    {
        trace("Reset telemetry");
        m_dataLength = 0;
    }

    void CaptureFrame(CSmArenaClient@ playground, const float&in timeSec)
    {
        CSmScriptPlayer@ player = null;
        if (playground !is null
            && playground.Players.Length == 1)
        {
            @player = cast<CSmScriptPlayer>(cast<CSmPlayer>(playground.Players[0]).ScriptAPI);
        }

        if (player !is null && m_dataLength < m_time.Length)
        {
            m_time[m_dataLength] = timeSec;

            for (uint i = 0; i < m_params.Length; ++i)
            {
                if (m_dataLength > 0)
                {
                    m_params[i].Calculate(player, m_time[m_dataLength], m_time[m_dataLength-1]);
                }
                m_params[i].CaptureFrame(player, m_dataLength);
            }

            ++m_dataLength;
        }
    }

    Parameter@ GetParameter(const string&in name)
    {
        Parameter@ param = null;
        for (uint i = 0; i < m_params.Length; ++i)
        {
            if (m_params[i].m_name == name)
            {
                @param = m_params[i];
                break;
            }
        }
        return param;
    }
}

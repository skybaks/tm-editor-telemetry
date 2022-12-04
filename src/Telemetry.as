
class Telemetry
{
    array<float> m_time(2000, 0.0f);
    uint m_dataLength = 0;
    array<Parameter> m_params = {
        CurrentRaceTime()
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

        if (player !is null)
        {
            m_time[m_dataLength] = timeSec;

            for (uint i = 0; i < m_params.Length; ++i)
            {
                m_params[i].CaptureFrame(player, m_dataLength);
            }

            ++m_dataLength;
        }
    }
}

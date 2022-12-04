
class Parameter
{
    string m_name;
    string m_units;
    array<float> m_data(2000, 0.0f);

    void Reset()
    {
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index)
    {
    }
}

class CurrentRaceTime : Parameter
{
    CurrentRaceTime()
    {
        m_name = "Current Race Time";
        m_units = "ms";
    }

    void CaptureFrame(CSmScriptPlayer@ player, int index) override
    {
        m_data[index] = float(player.CurrentRaceTime);
    }
}

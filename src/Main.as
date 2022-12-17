
Telemetry@ g_Telemetry = null;

bool get_IsMapEditor()
{
    return cast<CGameCtnEditorFree>(GetApp().Editor) !is null;
}

bool get_IsMapTesting()
{
    return GetApp().CurrentPlayground !is null;
}

void Main()
{
    @g_Telemetry = Telemetry();

    int timePrev = Time::Now;
    while (true)
    {
        sleep(10);
        timePrev = Time::Now;

        if (IsMapEditor && IsMapTesting)
        {
            g_Telemetry.CaptureFrame(cast<CSmArenaClient>(GetApp().CurrentPlayground));
        }
    }
}

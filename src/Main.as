
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
    bool prevIsMapTesting = false;
    float captureTime = 0.0f;

    int timePrev = Time::Now;
    while (true)
    {
        sleep(10);
        captureTime += (Time::Now - timePrev) * 0.001f;
        timePrev = Time::Now;

        if (IsMapEditor && IsMapTesting)
        {
            if (!prevIsMapTesting)
            {
                g_Telemetry.Reset();
                captureTime = 0.0f;
            }
            g_Telemetry.CaptureFrame(cast<CSmArenaClient>(GetApp().CurrentPlayground), captureTime);
        }
        prevIsMapTesting = IsMapTesting;
    }
}

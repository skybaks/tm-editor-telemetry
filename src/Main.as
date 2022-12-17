
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

    while (true)
    {
        sleep(10);

        if (IsMapEditor && IsMapTesting)
        {
            g_Telemetry.CaptureFrame(cast<CSmArenaClient>(GetApp().CurrentPlayground));
        }
    }
}

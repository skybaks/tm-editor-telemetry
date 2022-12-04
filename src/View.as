
void RenderInterface()
{
    UI::SetNextWindowSize(600, 400, UI::Cond::FirstUseEver);
    UI::Begin(Icons::BarChart + " Editor Telemetry");

    if (g_Telemetry.m_dataLength > 0)
    {
        array<float> temp(g_Telemetry.m_dataLength);

        Parameter@ aimPitch = g_Telemetry.GetParameter("AimPitch");
        for (uint i = 0; i < temp.Length; ++i) { temp[i] = aimPitch.m_data[i]; }
        UI::PlotLines(aimPitch.m_name, temp, 0, 200.0f);

        Parameter@ pos_y = g_Telemetry.GetParameter("Position_y");
        for (uint i = 0; i < temp.Length; ++i) { temp[i] = pos_y.m_data[i]; }
        UI::PlotLines(pos_y.m_name, temp, 0, 200.0f);

        /*
        Parameter@ pos_x = g_Telemetry.GetParameter("Position_x");
        for (uint i = 0; i < temp.Length; ++i) { temp[i] = pos_x.m_data[i]; }
        UI::PlotLines("##" + pos_x.m_name, temp, 0, 200.0f);
        */

        Parameter@ pos_z = g_Telemetry.GetParameter("Position_z");
        for (uint i = 0; i < temp.Length; ++i) { temp[i] = pos_z.m_data[i]; }
        UI::PlotLines(pos_z.m_name, temp, 0, 200.0f);
    }

    UI::End();
}

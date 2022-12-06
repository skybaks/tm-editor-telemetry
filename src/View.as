
array<float> g_temp(1);

void Plot(Parameter@ parameter)
{
    for (uint i = 0; i < g_temp.Length; ++i) { g_temp[i] = parameter.m_data[i]; }
    UI::PlotLines(parameter.m_name + " (" + parameter.m_units + ")", g_temp, 0, 200.0f);
}

void RenderInterface()
{
    UI::SetNextWindowSize(600, 400, UI::Cond::FirstUseEver);
    UI::Begin(Icons::BarChart + " Editor Telemetry");

    if (g_Telemetry.m_dataLength > 0)
    {
        g_temp.Resize(g_Telemetry.m_dataLength);

        Plot(g_Telemetry.GetParameter("AimPitch"));
        Plot(g_Telemetry.GetParameter("FlightPathAngle"));
        Plot(g_Telemetry.GetParameter("Position_y"));
        Plot(g_Telemetry.GetParameter("FlyingDistance"));
    }

    UI::End();
}

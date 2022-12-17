
const int MAX_DISPLAY_POINTS = 500;
array<float> g_temp(1);
int g_seekOffset = 0;

void Plot(Parameter@ parameter, int parameterOffset)
{
    for (uint i = 0; i < g_temp.Length; ++i) { g_temp[i] = parameter.m_data[i+uint(parameterOffset)]; }
    UI::PlotLines(parameter.m_name + " (" + parameter.m_units + ")", g_temp, 0, 200.0f);
}

void RenderInterface()
{
    UI::SetNextWindowSize(600, 400, UI::Cond::FirstUseEver);
    UI::Begin(Icons::BarChart + " Editor Telemetry");

    if (g_Telemetry.m_dataLength > 0)
    {
        g_temp.Resize(Math::Min(MAX_DISPLAY_POINTS, g_Telemetry.m_dataLength));
        int sliderMax = Math::Max(0, int(g_Telemetry.m_dataLength)-MAX_DISPLAY_POINTS);
        UI::BeginDisabled(sliderMax == 0);
        g_seekOffset = UI::SliderInt("Seek", g_seekOffset, 0, sliderMax);
        UI::EndDisabled();

        Parameter@ param1 = g_Telemetry.GetParameter("AimPitch");
        Parameter@ param2 = g_Telemetry.GetParameter("FlightPathAngle");
        Plot(param1, g_seekOffset);
        Plot(param2, g_seekOffset);
        //Plot(g_Telemetry.GetParameter("Position_y"), g_seekOffset);
        //Plot(g_Telemetry.GetParameter("FlyingDistance"), g_seekOffset);

        if (UI::BeginTable("ParameterMonitor", 3 /*columns*/))
        {
            UI::TableSetupColumn("Time (s)");
            UI::TableSetupColumn(param1.m_name + " (" + param1.m_units + ")");
            UI::TableSetupColumn(param2.m_name + " (" + param2.m_units + ")");
            UI::TableHeadersRow();

            for (uint i = 0; i < MAX_DISPLAY_POINTS; ++i)
            {
                uint dataIndex = i + uint(g_seekOffset);
                if (dataIndex > g_Telemetry.m_dataLength)
                {
                    break;
                }

                UI::TableNextRow();
                UI::TableNextColumn();
                UI::Text(tostring(g_Telemetry.m_time[dataIndex]));

                UI::TableNextColumn();
                UI::Text(tostring(param1.m_data[dataIndex]));

                UI::TableNextColumn();
                UI::Text(tostring(param2.m_data[dataIndex]));
            }

            UI::EndTable();
        }
    }
    else
    {
        g_seekOffset = 0;
    }

    UI::End();
}


const int MAX_DISPLAY_POINTS = 500;
array<float> g_temp(1);
int g_seekOffset = 0;
array<string> g_paramsPlot = { "AimPitch", "FlightPathAngle" };
array<string> g_paramsTable = { "AimPitch", "FlightPathAngle", "Position_y", "FlyingDistance" };

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

        for (uint plotIndex = 0; plotIndex < g_paramsPlot.Length; ++plotIndex)
        {
            Parameter@ param = g_Telemetry.GetParameter(g_paramsPlot[plotIndex]);
            if (param !is null)
            {
                Plot(param, g_seekOffset);
            }
        }

        if (UI::BeginTable("ParameterMonitor", g_paramsTable.Length + 1 /*columns*/))
        {
            UI::TableSetupColumn("Time (s)");
            for (uint tableIndex = 0; tableIndex < g_paramsTable.Length; ++tableIndex)
            {
                Parameter@ param = g_Telemetry.GetParameter(g_paramsTable[tableIndex]);
                if (param !is null)
                {
                    UI::TableSetupColumn(param.m_name + " (" + param.m_units + ")");
                }
            }
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

                for (uint tableIndex = 0; tableIndex < g_paramsTable.Length; ++tableIndex)
                {
                    Parameter@ param = g_Telemetry.GetParameter(g_paramsTable[tableIndex]);
                    if (param !is null)
                    {
                        UI::TableNextColumn();
                        UI::Text(tostring(param.m_data[dataIndex]));
                    }
                }
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
